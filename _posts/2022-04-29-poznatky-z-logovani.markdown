---
layout: post
title:  "Poznatky z logování"
date:   2022-04-29
categories: [software development]
disqusId: 246
image: "/assets/2022-04-29/333910.png"
tags: [logování]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2022-04-29/333910.png" /></div>

Nejen [pro produktovou firmu je důležité logování](https://blog.zvestov.cz/software%20development/2020/05/30/uskali-produktove-firmy. html#logov%C3%A1n%C3%AD-a-podpora).
Bez kvalitní dokumentace a logů padá na [úroveň podpory](https://en.wikipedia.org/wiki/Technical_support#Multi-tiered_technical_support) L3 příliš mnoho věcí.
Neříkám, že vím, jak logovat správně, ale pár průšvihů, třeba s [JPA a asynchronním logováním](https://blog.zvestov.cz/software%20development/2018/09/21/jpa-a-asynchronni-logovani.html), už jsem zažil.
Chtěl bych sepsat, k čemu jsem dospěl, protože podobné otázky u nejednoho _code review_ (zejména při změnách ve složení týmu) opakovaně diskutujeme.
<div style="clear:both"></div>
<!--more-->


## Úvod

Popis API jednotlivých knihoven naleznete v dokumentaci.
Možná mám jen dlouhé vedení, protože mi trvalo roky, než jsem se dopracoval k těmto poznámkám.
Nebo se jedná o neuvědomělou znalost, kterou nelze postihnout pouze slovy, jak se píše v článku [Why Tacit Knowledge is More Important Than Deliberate Practice](https://commoncog. com/blog/tacit-knowledge-is-a-real-thing).
Hezky to přirovnávají k jízdě na kole.


## Kontext

Svatým grálem logování je vědět co logovat, aby toho nebylo ani málo ani moc.
Když se daný problém nevyskytuje pravidelně, z nedostatečného logu to těžko vykoukáte.
Přílišné logování zase nezaručí dostatečný [odstup signálu od šumu](https://cs.wikipedia.org/wiki/Pom%C4%9Br_sign%C3%A1lu_a_%C5%A1umu). 
S tím vám bohužel univerzálně neporadím.
Co jsem se ale naučil a na čem trvám, je kontext.
Udělejte si z logu příběh.

Co vám řekne tato zpráva?

> User has been deleted

A tahle?

> User(id=1) has been deleted

Daný kontext, v tomto případě `User(id=1)`, se snažím držet pro všechny logovácí hlášky, které se týkají konkrétního *use-casu*.
Někdo může namítat, že je to zbytečné. Nestačilo by si zprávy pospojovat přes korelační id nebo identifikátor vlákna?
Vlákna se můžou v logu různě míchat, takže pro mě je čtení náročnější.
Mnohdy jsem dostal z logu jen úryvek a mohl jsem se jen domnívat, co se dělo před tím.

## SLF4J

[Často kladené otázky SLF4J](https://www.slf4j.org/faq.html) jsou asi jedna z mnou nejnavštěvovanějších stránek.
SLF4J je logovací fasáda, pod kterou si můžete dát, co je libo a následně to i snadno vyměnit.
Ať už se bude jednat o [Log4j](https://logging.apache.org/log4j/2.x/), [Logback](https://logback.qos.ch/), [Commons Logging](https://commons.apache.org/proper/commons-logging/) nebo samotnout SLF4J implementaci.

[Používejte parametrizované zprávy](https://www.slf4j.org/faq.html#logging_performance)

```java
logger.debug("The new entry is {}", entry);
```

a nemusíte ([zpravidla](https://www.slf4j.org/faq.html#string_contents)) testovat úroveň logování.

```java
if (logger.isDebugEnabled()) {
    //...
}
```

Posledním parametrem logovací hlášky může být výjimka a nemusíte pro ni mít zástupku.
```java
String s = "Hello world";
try {
  Integer i = Integer.valueOf(s);
} catch (NumberFormatException e) {
  logger.error("Failed to format {}", s, e);
}
```

Staří pardálové pamatují, že [v historických verzích s tím byl problém](https://www.slf4j.org/faq.html#paramException) a možná na novější zápis ještě nepřešli.

Můžete se bát, že netrefíte počet zástupek ku počtu parametrů. Dřív nám to chytalo až [pravidlo Sonaru](https://rules.sonarsource. com/java/RSPEC-2275), ale už nějaký pátek to umí zobrazovat IntelliJ Idea jako varování.


### Lombok

Neustálé psaní následujícího idiomu může někomu přijít otravné.
```java
private static final Logger logger = LoggerFactory.getLogger(Foo.class);
```

Lombok má anotaci `@Slf4j`, která však ve výchozím nastavení vytváří logger jménem `log`. To [lze v konfiguraci změnit](https://projectlombok. org/features/configuration) pomocí klíče `lombok.log.fieldName`. 


## Úrovně logování

Logovat můžete pod různými úrovněmi.
Zpětně viděno jsem to trefoval spíš od boku. 
Nakonec jsem si to pro sebe kategorizoval následovně (může se to samozřejmě lišit dle projektu, týmu...).

- **ERROR** chyba, vyžaduje zásah admina
- **WARN** aplikace se nehroutí, ale admin by tomu měl věnovat pozornost (například ponechané výchozí nastavení, které vede na ne zcela bezpečné prostředí)
- **INFO** běžný provoz, úroveň v produkci zapnutá, může obsahovat i očekávané negativní scénáře
- **DEBUG** v produkci tuto úroveň neočekávám, leda dočasně zapnuto po dobu nějaké krize. Naopak očekávané na _staging_, _test_ a vývojářském prostředí; citlivé údaje pro jistotu nevypisuji
- **TRACE** super podrobné logování určené k dohledání záludných chyb či prvních krůčků integrace systémů; může obsahovat citlivé údaje


## Výjimky

Na jednom projektu jsme to možná přehnali s tím, že se velká část byznys logiky řídila výjimkami.
Naučilo nás to ovšem lepší práci s logováním výjimek.
Tedy prvotní problém byl v tom, že pro negativní scénáře (z pohledu byznysu; aplikace jinak fungovala, jak má), byl log plný _stacktrace_.
Zatáhli jsme za ruční brzdu a výjimky logovat přestali, ale pak jsme nebyli schopní vyřešit příčiny třeba chybné konfigurace.
Došli jsme k tomu, že je dobré logovat alespoň `e.getMessage()` a na podrobnější úroveň celý _stracktrace_.

```java
logger.info("Unable to delete User(id={}) - {}", id, e.getMessage());
logger.debug("Unable to delete User(id={})", id, e);
```

V neposlední řadě mi vadí vícenásobé logování výjimky.
Následující kód v dobré víře umístíte do nižší vrstvy.
Slušně vychovaná vyšší vrstva _stacktrace_ zaloguje, což ale vede na to, že ho máte zalogovaný dvakrát.

```java
} catch (MySpecialException e) {
    logger.error("Problem to delete User(id={})", id, e);
    throw e;
}
```

Osobně preferuji nechat logování na nejvyšší vrstvy, abych měl _stacktrace_ v logu právě jednou.
Případně si v nižších vrstvách logovat jen `e.getMessage()` a nějaký vysvětlující kontext.

```java
} catch (MySpecialException e) {
    logger.error("Unexpected exception while deleting User(id={}) - {}", id, e.getMessage());
    throw e;
}
```

Ono to nakonec vede na to, že se lze takovému logování vyhnout a místo toho si držet *cause* výjimku a požadovaný kontext vložit jako `message` do výjimky.

```java
} catch (RuntimeExeption e) {
    throw new MySpecialException("Unexpected exception while deleting User(id=%d)".format(id), e);
}
```

Někdo bere Sonar pravidla jako šikanu, ale já mám tenhle nástroj v oblibě.
Naučil mě o něco lépe programovat.
Kdo mě znáte, tak víte, že pravidla mám rád.
[Tomuhle pravidlu osobně říkám „sežraná výjimka“](https://rules.sonarsource.com/java/tag/error-handling/RSPEC-1166).


## Citlivé údaje

Asi úmyslně nebudete logovat heslo.
Může se vám však omylem dostat do `toString`.
Tak jistě, stejně byste měli mít heslo jako `byte[]` i kvůli string _poolingu_, ale ne vždycky to klapne.
Dejme tomu, že si na to někdo při generování metody `toString` dá pozor, ale může to později někdo přegenerovat z dobře na špatně.
Proto jsme pro citlivé objekty vyžadovali triviální test.

```java
User user = new User();
user.setPassword("top secret");

String result = tested.toString();

assertFalse(result.contains("top secret"));
assertTrue(result.contains("password=*****"));
```

Pak jsou údaje, které běžně logujete, do té doby než vstoupíte na trh do země, kde je situace zcela odlišná.
Představte si, že v USA je číslo účtu citlivý údaj.
Věděl jsem o potížích s číslem sociálního zabezpečení, ale i tak mě to překvapilo.
Žádný div, že tam uspěl PayPal.
Ale protože se vám nechce všechno předělávat a v zemích, kde to jde, chcete logování zachovat, sáhnete po filtrování a maskování.
Tady například [popis, jak maskovat citlivá data v logbacku](https://www.baeldung.com/logback-mask-sensitive-data).


## Závěr

Nehodlám si nárokovat patent na rozum.
Možná někomu ulehčím začátky s logováním.
Zároveň uvítám ohlasy, jak by to šlo dělat lépe a v čem jsou případně moje úvahy mimo.

Když to shrnu, tak dávejte do logu kontext, rozmyslete si úrovně logování a nežerte výjimky.


## Související

- [Úskalí produktové firmy](https://blog.zvestov.cz/software%20development/2020/05/30/uskali-produktove-firmy.html)
- [JPA a asynchronní logování](https://blog.zvestov.cz/software%20development/2018/09/21/jpa-a-asynchronni-logovani.html)
