---
layout: post
title:  "JPA a asynchronní logování"
date:   2018-09-21
categories: [software development]
disqusId: 206
image: "https://openclipart.org/image/150px/svg_to_png/94723/db.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://openclipart.org/detail/94723/database-symbol-by-rg1024"><img src="https://openclipart.org/image/150px/svg_to_png/94723/db.png" /></a></div> JPA, metoda `toString()` a asynchronní logování dokázaly vykouzlit situaci, která nám dala chvilku zabrat.

[Nathaniel Schutta v knize Thinking Architecturally píše](https://www.goodreads.com/review/show/2430023537?book_show_action=false&from_review_page=1), že software je nevyzrálé odvětví. Vzpomněl si na [pád mostu I-35W na řece Mississippi z roku 2007](https://en.wikipedia.org/wiki/I-35W_Mississippi_River_bridge). Inženýři a studenti z celého světa tu tragédii zkoumali. Když úřad vydal o neštěstí zprávu, tak si ji přečetli. Pojďme zkoumat i naše přešlapy.

<div style="clear:both"></div>
<!--more-->

## Jak jsme hledali

Jeden tým nám ohlásil zvláštní chybu, že binárka, která se chová na vývojářském i testovací prostředí korektně, vykazuje divné chování na posledním předprodukčním prostředí, tudíž ji nemůžou nasadit. Určitý *use-case* se choval nevypočitatelně, jednou prošel, jindy ne.

První stopou byla chyba v logu.

> ERROR AbstractEntityManagerImpl [ ] [] - HHH000337: Unable to mark for rollback on PersistenceException:
  java.lang.UnsupportedOperationException: null
  at org.hibernate.engine.transaction.jta.platform.internal.WebSphereExtendedJtaPlatform$TransactionManagerAdapter.setRollbackOnly(WebSphereExtendedJtaPlatform.java:121) ~[hibernate-core-5.1.3.Final.jar:5.1.3.Final]

Vzhledem k tomu, že to na jiných prostředích fungovalo, podezříval jsem především nastavení aplikačního serveru, WebSphere, zejména classloading. Nicméně tento log je očekávaná chyba, je to až důsledek rollbacku, nikoliv samotná příčina chyby.

Když *use-case* selhal, byla v logu chyba o zavřené session. Kdo ji ovšem zavíral a proč?

> org.hibernate.SessionException:Session is closed
>  [WebContainer : 2] ERROR SqlExceptionHelper [ ] [] - DSRA9110E: Connection is closed.

Mezitím jsme zjistili, že jediná známá věc, v čem se prostředí liší, je to, že na tom chybném je nastavené asynchronní logování `org.apache.logging.log4j.core.async.AsyncLogger`. Překontroloval jsem verzi *disruptoru*, ale byla tam ta poslední.

Přepnuli jsme logování na *trace* a hledali dál. Narazili jsme na to, že vlákna *webcontainer 14* a *webcontainer 10* si navzájem drží databázové spojení. Jedno vlákno zavře spojení dřív, než to druhé stihne operaci dokončit.

> Shared Connection information (shared partitions 640)
      com.ibm.ws.tx.jta.TransactionImpl@b48d7d16#tid=693629156  MCWrapper id bc22050d  Managed connection WSRdbManagedConnectionImpl@7aacd30  State:STATE_TRAN_WRAPPER_INUSE Thread Id: 00000212 Thread Name: WebContainer : 10 Used with transaction com.ibm.ws.tx.jta.TransactionImpl@b48d7d16#tid=693629156
      com.ibm.ws.tx.jta.TransactionImpl@989170fe#tid=693629148  MCWrapper id 25370d4f  Managed connection WSRdbManagedConnectionImpl@1eb0f574  State:STATE_TRAN_WRAPPER_INUSE Thread Id: 00000241 Thread Name: WebContainer : 14 Connections being held 1 Used with transaction com.ibm.ws.tx.jta.TransactionImpl@989170fe#tid=693629148
    Total number of connection in shared pool: 2

Rovněž vyšlo najevo, že s databázovým spojením něco dělají i log4j asynchronní vlákna.

> [Log4j2-TF-4-AsyncLoggerConfig-4] WARN  SqlExceptionHelper [ ] [] - SQL Error: 0, SQLState: null
> [Log4j2-TF-4-AsyncLoggerConfig-4] ERROR SqlExceptionHelper [ ] [] - DSRA9110E: Connection is closed.
>
> ...
>
> 000000d1 WSJdbcPrepare >  <init> Entry
                                   oracle.jdbc.driver.OraclePreparedStatementWrapper@a4336cd7
                                   com.ibm.ws.rsadapter.jdbc.WSJdbcConnection@91e507f6
                                   DEFAULT CURSOR HOLDABILITY VALUE (0)
                                   PSTMT: select...

## Kde se stala chyba

JPA entita vystupovala i ve vyšších vrstvách než *DAO* a každý, kdo uznal za vhodné, si ji mohl třeba zalogovat. Při logování se zavolá metoda `toString()`. A v tom je kámen úrazu. Když *use-case* a jeho transakce doběhly dřív, než se stačilo zalogovat, tak byl *use-case* úspěšný, ale v logu se objevila `LazyInitializationException`. Pokud *use-case* trval delší dobu, tak nějaký log ze začátku se stačil zapsat dřív, než se commitla transakce, tudíž došlo k výše popsanému chování. Vlákna loggeru neměly transakci, takže běžely v auto-commit módu, který zavíral databázové spojení.

## Jak jsme to vyřešili

Jako jedno řešení se nabízí nikdy nedat entitu z *DAO* a vždy vracet nějaký *DTO* objekt. To se mi na první pohled jednak nelíbilo a jednak vyžadovalo velký refaktor, který jsme si v danou chvíli nemohli dovolit. Navíc se někde spoléháme na dirty checking.

Další možností bylo opravit všechny `toString()` metody, aby nikdy nevypisovaly to, co může způsobit `LazyInitializationException`. To se mi zdálo jako příliš křehké a do budoucna naprosto neuhlídatelné.

Říkáte ideální použití pro aspekt, který metodu obalí? Máme nastavený *compile weaving* pro AspectJ. Hibernate tvoří proxy až nad výsledkem AspectJ. Chvilku jsme přemýšleli, jak to zkombinovat s Hibernate *build-time bytecode enhancement*, který bychom navázali na výsledek AspectJ. To jsme nedokázali v rozumném čase vyřešit (je-li to vůbec možné).

Nakonec nás zachránila vlastní implementace `ToStringStyle` z Apache Commons. Tady je ta nejdůležitější část.

```java
private Object getSafeValueToAppend(final Object value) {
    // handle uninitialized Hibernate proxy or persistent class
    final Object newValue;
    if (Hibernate.isInitialized(value)) {
        newValue = value;
    } else {
        if (value instanceof HibernateProxy) {
            newValue = getHibernateProxyIdentityString((HibernateProxy) value);
        } else {
            final Class entityClass = HibernateProxyHelper.getClassWithoutInitializingProxy(value);
            // probably a PersistentCollection, but we cant identify it anyway, so let's use the identity hash code
            newValue = getShortClassName(entityClass) + '@' + System.identityHashCode(value);
        }
    }
    return newValue;
}

private Object getHibernateProxyIdentityString(final HibernateProxy proxy) {
    final Serializable identifier = proxy.getHibernateLazyInitializer().getIdentifier();
    final Object safeIdentifier = getSafeValueToAppend(identifier);
    final Class entityClass = HibernateProxyHelper.getClassWithoutInitializingProxy(proxy);

    return getShortClassName(entityClass) + '[' + safeIdentifier + ']';
}
```

Metoda `getSafeValueToAppend` se volá pro každý *field*. Když je proxy inicializovaná, může se vypsat celý objekt. Pokud je to neinicializovaná proxy, tak se vypíše alespoň název třídy a identifikátor. Pokud se nejedná o Hibernate proxy, tak vypíšeme název třídy a hashCode.

## Zhodnocení

Dalo by se říci, že máme špatný design, ale až doposud fungoval. Proč se tedy chyba objevila až teď? S největší pravděpodobností do oné chvíle asynchronní logování nefungovalo správně. Opravilo to až povýšení logovacích knihoven. Začalo se logovat skutečně asynchronně a chyba se náhle mohla projevit. Identifikace nám zabrala téměř týden (byť ne nepřetržité práce), navíc něco pro samotnou opravu. Určitě kvůli tomu nehodím objektově-relační mapování za hlavu, ale opět jsem si uvědomil jeho slabiny. Zároveň jsme se procvičili v hledání příčin problémů. Toho není nikdy dost.

## Související

* [Asynchronous Loggers for Low-Latency Logging](https://logging.apache.org/log4j/2.x/manual/async.html)
* [Vlad Mihalcea - How to implement equals and hashCode using the JPA entity identifier (Primary Key)](https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/)
* [The Vietnam of Computer Science](http://blogs.tedneward.com/post/the-vietnam-of-computer-science/)
* [Jak lépe na abstract entity v JPA](/item/137)
* [JPA - Vazební tabulky s metadaty](https://blog.zvestov.cz/software%20development/2015/04/15/jpa-vazebni-tabulky-s-metadaty)
