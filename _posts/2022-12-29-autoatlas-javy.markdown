---
layout: post
title:  "Autoatlas Javy"
date:   2022-12-29
categories: [software development]
disqusId: 254
image: "/assets/2022-12-29/rc24-duke-java-mascot.jpg"
tags: [Java]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2022-12-29/rc24-duke-java-mascot.jpg" /></div>

Programovací jazyk jako takový dost možná důležitý vůbec není, protože si nevybíráte pouze jazyk, ale především celý ekosystém, na který se podíváme.
Nečekejte tu popis syntaxe ale spíš přehled pojmů, abyste se hned na začátku své cesty neztratili.

Díky Honzovi Javorkovi, autorovi [Příručky o hledání první práce v IT](/software%20development/2020/09/21/prirucka-o-hledani-prvni-prace-v-it.html),
že mě ukecal, abych připravil přednášku pro jeho [klub](http://junior.guru/club).
Ten je sice placený, ale první dva týdny jsou zdarma a můžete se tak dostat nejen k [videozáznamu mém přednášky](https://junior.guru/events/#2022-12-06T18-00-00).

Tento příspěvek je částečný textový přepis přednášky.

<div style="clear:both"></div>
<!--more-->


## Úvod

Snažím se zachovávat si mysl začátečníka.
Ze svých pokusů s [hraním na hudební nástroje](/obecn%C3%A9/2022/07/30/jak-zacit-hrat-na-hudebni-nastroj.html) vidím,
že začátky v žádném oboru nejsou snadné.
Člověk je zavalen informacemi a není jasné, jak si je roztřídit dle důležitosti, když důležité se zdá téměř vše.
Zpětným pohledem mi přijde, že jsem to měl v některých ohledech snazší, protože kognitivní zátěž kladená na dnešní začátečníky je enormní.
Připomíná mi to můj zážitek s orientačním během,
kdy jsem prostě [měřítko mapy 1:4000](https://obrozvoj.cz/Mapy/VyukoveMapy/Nahledy/OSN_21_Cihelnak.jpg) neměl v oku a byl zavalen detaily.
Tutoriály a články na internetu mi právě připadají jako ony podrobné mapy, přitom byste možná bývali potřebovali širší kontext.
Tento článek je pokus o autoatlas řekněme v měřítku 1:500&nbsp;000, abyste si cestu k podrobným mapám časem našli.


## Historie

Jako důkaz, že se vůbec bavíme o relevantní technologii, si beru letošní průzkum Stack Overflow.
Java je v [kategorii milovaná / děsivá](https://survey.stackoverflow.co/2022/#section-most-loved-dreaded-and-wanted-programming-scripting-and-markup-languages) někde půl na půl.
A stále ještě není, jak se někdy tropí žerty, [ohodnocená s příplatkem jako Cobol](https://survey.stackoverflow.co/2022/#section-top-paying-technologies-top-paying-technologies).

Java patří do rodiny jazyků _C like_, to znamená, že umíte-li C, tak Python či Java by vám měly být povědomé (na rozdíl od Lispu nebo Haskelu).
Povědomost byl jeden z principů při návrhu jazyka Java.

Pro mladším čtenáře je Java možná hlavně Minecraft.
Ovšem vznikla už v roce 1995.
Hlavní tvůrce James Gosling.
V DNA (opravdu doslovně přímo v balíčcích) je vepsaná firma Sun Microsystems, která pozdější akvizicí přešla pod Oracle.

Já se k Javě dostal v kroužku programování v roce 2003, to [úvodní stránka Seznamu vypadala takhle](https://web.archive.org/web/20030218152446/http://www.seznam.cz/).
To dobou se verze Javy lámala z 1.3 na 1.4.
Na školách se učil Pascal ([Delphi stále žije, dnes ve verzi 11](https://cs.wikipedia.org/wiki/Delphi)).

Dalším z principů při návrhu jazyka byla jednoduchost.
Chyběly pointery a přetěžování operátorů.
Dále chyběly generiky a enumy, ale ty se do syntaxe dostaly s verzí 1.5 (respektive už číslované jako 5) v roce 2004.
Verze 6 a 7 nepřinesly nic převratného.
S verzí 8 to bylo čekání na Godota.
V té době jsem byl malověrný a koketoval s myšlenou, že se na Javu vykašlu a dám se třeba na cestu Ruby on Rails.
Píše se rok 2013 a já předkládám článek [Paula Grahama Přebal Javy](/software%20development/2013/05/23/prebal-javy.html) z roku 2001.
Koukejte se tedy prosím na článek i překlad optikou doby, kdy vznikaly. 
Naštěstí jsem se já i Paul Graham očividně mýlili.

Ukázalo se, že má-li se jazyk nějak rozumně vyvíjet, musí verze vycházet častěji, přičemž budou některé verze označeny za verze s delší podporou,
tzv. Long-Term-Support (LTS), číselně konkrétně 8 (dnes už jen placená podpora), 11, 17 a budoucí 21.

Pojďme si vysvětlit zkratku JDK, Java Development Kit, která obsahuje kompilátor (příkaz `javac`) a další nástroje.
Dále běhové prostředí JRE, Java Runtime Environment.

Následuje **velké zjednodušení bez právních záruk**:
Jednou začal Oracle bláznit ohledně licencování (a pak zase v něčem ustoupil) což naštěstí dalo vzniknout více JDK vycházející z OpenJDK
(to až se budete divit, že máte více možností, co nainstalovat).
Doporučuji například podrobný článek [Which JDK Version and Vendor Should You Use on Your Project?](https://tomgregory.com/which-jdk-version-and-vendor/),
kde mimo jiné najdete užitečný kalendář s datem končící podpory jednotlivých verzí.
Obecně vzato Java byla, je a bude zdarma, ale v produkci je potřeba dávat bacha na licence, ale to nechte na právníky a technické ředitele.

Jedna z námitek Paula Grahama byla, že Java není standard, tedy ISO ani ANSI.
> Pokud se nakonec ukáže, že jde přesto o dobrý jazyk, bude to první případ v historii, kdy komise navrhla dobrý jazyk.

Jedná se o Java Community Process, kde se [podávají návrhy Java Specification Requests (JSR) a o těch se hlasuje](https://jcp.org/en/jsr/results?id=5871). 

Dalším principem návrhu jazyka Java byla platformní nezávislost.
Lze pomocí ní psát webové stránky, applety (mrtvé rozšíření internetového prohlížeče), portlety (de facto mrtvé portálové řešení),
mobilní aplikace ještě před Androidem, aplikace pro Android (od [roku 2008, kdy vznikl T-Mobile G1](https://cs.wikipedia.org/wiki/T-Mobile_G1)),
desktopové aplikace nebo čipové karty jako třeba [biometrické pasy](/software%20development/2015/12/15/jak-funguje-biometricky-pas.html).


## Syntaxe

Syntaxi jsem se původně nechtěl vůbec věnovat, nicméně alespoň dvě témata.


### Equals a hashCode

Java nemá [pointery ale reference](https://softwareengineering.stackexchange.com/questions/141834/how-is-a-java-reference-different-from-a-c-pointer).
Operátor `==` porovnává, zda reference ukazují na stejné místo v paměti, což jsem v praxi použil velmi zřídka.
K porovnání ekvivalence objektů se používá metoda `equals`.
V souladu s chováním metody `equals` musí být pro správnou funkčnost kolekcí implementovaná i metoda `hashCode` dle definovaného kontraktu.
Viz [Java equals() and hashCode() Contracts](https://www.baeldung.com/java-equals-hashcode-contracts).
Je to jedno z témat, na kterém bych na přijímacím pohovoru třídil juniory.
Existují zrádné situace, kdy `equals` a `==` nevrací stejné výsledky.


### Kolekce

[Programování není vázaná živnost. Otázka, jak dlouho taková konstelace vydrží.](/software%20development/2016/03/07/uvod-do-profese.html)
Do oboru můžou vstoupit i lidé bez formálního _Computer Science_ vzdělání.
O mnoha definicích tak nejspíš neslyšeli, ale je nutné, aby si je doplnili alespoň na takové úrovni, aby dokázali vybrat vhodnou datovou strukturu,
nejen s ohledem na časovou a paměťovou náročnosti, ale i ve vztahu k metodám `equals` a `hashCode`, 
viz [Choosing the Right Java Collection](https://www.baeldung.com/java-choose-list-set-queue-map).


## Knihy

K samostudiu bych rád doporučil tři následující knihy.
Neříkám, že jsou jediné, ale můžu se za jejich kvalitu a srozumitelnost zaručit.

[Pavel Herout napsal knihu Učebnice jazyka Java](https://ucebnice.heureka.cz/ucebnice-jazyka-java-5-v-pavel-herout/#prehled/).
Kniha vyšla zdánlivě dávno (pro verzi 1.5), ale popisuje klíčové principy platné dodnes.
Neopovrhujte ani starším vydáním pro Javu 1.4

Novější syntaxi si doplníte četbou knihy [Java 8 in Action](https://www.manning.com/books/java-8-in-action).

S pokročilejšími znalostmi doceníte knihu [Effective Java, Joshua Bloch](https://www.oreilly.com/library/view/effective-java-3rd/9780134686097/).
Jedná se už o třetí vydání.
Četl jsem všechny a měl bych se k poslednímu vrátit.


## Certifikace

Oracle na základě výsledků zkoušky vydává certifikace o znalostech.
Nemůžu zaručit, že na to náboráři dbají, mě osobně to přinutilo se daná témata systematicky učit.
Řekl bych, že začátečníkům bez praxe by to teoreticky mohlo v životopise pomoc.
Jsem ale zaujatý, protože jsem několik certifikací úspěšně absolvoval.
Cena bývala kolem 200 dolarů.
Viz [Java Certification Paths](https://education.oracle.com/oracle-certification-path/pFamily_48).


## OOP

Dalším požadavkem při návrhu jazyka bylo, aby byl objektově orientovaný (OOP).
Java splňuje část paradigmatu jako objekty, dědičnost, zapouzdření či polymorfismus.

Jedna z hlavních přidaných hodnost OOP je [message passing](https://en.wikipedia.org/wiki/Message_passing), což ale v Javě nenajdete.
Museli byste se poohlédnout například po Objective C nebo „dětském kostičkovém“ Scratch.

Jak napsal [Joe Armstrong v článku Proč stojí objektové programování za starou belu](/software%20development/2017/06/26/proc-objektove-programovani-stoji-za-starou-belu.html):
> Kolem OOP byl humbuk. Domnívali jsem se, že znovupoužitelnost kódu bude snazší.

Na kategorie dědičnosti se dívejte skrze [HAS-A, IS-A](https://stackoverflow.com/a/2218970/204950).
- Dům je budova (inheritance, dědičnost)
- Dům má místnost (composition, kompozice)
- Dům má obyvatele (aggregation, agregace)

[Dávejte přednost duplicitě před nesprávnou abstrakcí](/software%20development/2020/12/08/nespravna-abstrakce.html) a neřešte duplicitu dědičností!


## JVM

Má-li Java nějakou super schopnost, tak je to virtuální mašina (JVM).

Dalším požadavkem při návrhu jazyka byla automatická správa paměti, _garbage collection_, a aby byl jazyk interpretovaný.
Dnešním pohledem není ani jedno nijak převratné, ale oproti jazyku C to byla zásadní změna.
Existuje více garbage collectorů a lze je různě konfigurovat, viz [Java Garbage Collection Types and Settings in Jelastic PaaS](https://www.virtuozzo.com/company/blog/garbage-collection/).

Java měla být nezávislá na architektuře a přenositelná.
To zaručovalo, že jazyk je interpretovaný.
Máme lidsky čitelný soubor `*.java`, který kompilátor `javac` převede do bajtkódu `*.class`.
Ten předhodíme achitektonicky specifické JVM, která bajtkód načte a interpretuje do konkrétního strojového kódu.
Viz [What Does a Modern JVM Look Like, And How Does It Work?](https://foojay.io/today/what-does-a-modern-jvm-look-like-and-how-does-it-work/),
kde najdete i názorný obrázek. 
Běh sleduje JIT (just in time) kompilátor, který dokáže optimalizovat.
Nevýhodou je, že se po startu potřebujete trochu zahřát, než dokážete podat plné výkony.
Něco jako když si jdete zaběhat.

Dnes už je možné něco, čemu se říká [ahead-of-time kompilace, nebo třeba native image](https://www.graalvm.org/latest/reference-manual/native-image/),
tedy opuštění interpretace ve prospěch kompilace přímo pro konkrétní architekturu.

Už neplatí, že [Java je pomalá](https://stackoverflow.com/questions/2163411/is-java-really-slow).
Nanejvýš to, že potřebuje víc paměti než C, ale to lze říct obecně o vyšších programovacích jazycích.

V JVM lze spouštět i programy napsané v jiném programovacím jazyce.
Není to hra s nulovým součtem, že co jiné jazyky získají, Java ztratí.
Naopak to vytváří pozitivní tlak na rozvoj Javy.


### Kotlin

Kotlin v roce 2011 vytvořila firma JetBrains.
O roku 2017 oficiální jazyk pro Android.
Uživatelé básní třeba o [coroutine](https://kotlinlang.org/docs/coroutines-basics.html).
Java má celkem low-level API pro práci s vlákny, což by se mohlo změnit s [Virtual Threads](https://www.infoq.com/articles/java-virtual-threads/).


### Groovy

Groovy je moje srdeční záležitost, byť [nemá šanci se dostat do hlavního proudu](/software%20development/2014/04/07/zahada-jmenem-groovy.html).
Jedná se [dynamický, staticky typovaný jazyk](/software%20development/2016/02/17/vybrane-kapitoly-z-groovy).
Dnes se s Groovy můžete setkat v konfiguraci Gradle nebo Jenkins, případně testovacím frameworku [Spock](https://spockframework.org/).


### Scala

Ač mám dlouho na seznamu kurz [Functional Programming Principles in Scala](https://www.coursera.org/learn/scala-functional-programming),
za který stojí sám autor Scaly Martin Odersky,
tak [vůči jazyku jsem zaujatý](/software%20development/2014/08/04/nechapu-proc-je-scala-tak-popularni.html).
Přináší funkcionální programování pro Java programátory, ale syntaxe se zdá trochu těžkopádná.
Scalu můžete potkat v [Gatling](https://gatling.io/), nástroji pro výkonnostní testování.
Běží na něm i šachový server [Lichess](https://lichess.org/@/thibault/blog/lichess--scala-3/y1sbYzJX).


### Clojure

Je libo dialekt Lispu?


## Dokumentace

Dokumentace v podobě Javadoc je přirozenou součástí Java světa.
Neříkám, že to někdy neflákáme, ale od standardních knihoven nebo frameworků se to automaticky očekává.
Alespoň pro mě je kvalita dokumentace jedním z kritérií při výběru technologie.
Javadoc vidíte přímo v kódu.
V případě binárních závislostí lze javadoc publikovat samostatně a IDE si ho dotáhne.
Zároveň lze vygenerovat do HTML, koukněte na příklad s třídou [ArrayList](https://docs.oracle.com/en/java/javase/17/docs/api/index.html).


## API

Následující obrázek je z prezentace [Just enough app server](https://www.slideshare.net/agoncal/just-enough-app-server)
a vybral jsem ho proto, že názorně zobrazuje hromadu zkratek.
Nelekejte se.
Jedná se o jednotlivá API, na kterými se Java komunita shodla (viz výše) a ke kterým existují různé implementace.
Nebudeme tu probírát všechny.
Namátkou JCA, Java Cryptography Architecture, s implementacemi [Java Cryptography Extension](https://en.wikipedia.org/wiki/Java_Cryptography_Extension)
a [Bouncy Castle](https://www.bouncycastle.org/).

![](/assets/2022-12-29/api.png)

Rozeberme víc příklad [JPA](https://cs.wikipedia.org/wiki/Java_Persistence_API), Java Persistence API, na obrázku z [Hibernate dokumentace](https://docs.jboss.org/hibernate/orm/6.1/userguide/html_single/Hibernate_User_Guide.html). 

![](/assets/2022-12-29/data_access_layers.svg)

Kdysi byla perzistence v Javě příšerná.
Vznikl a ujal se framework Hibernate.
Komunita inspirovaná Hibernate se shodla na specifikaci API v podobě JPA (dnes už ve verzi 3.1).
Hibernate JPA implementuje, ale můžete ho volat i přes jeho nativní API.
Samotný Hibernate pak volá [JDBC](https://cs.wikipedia.org/wiki/Java_Database_Connectivity), Java Database Connectivity, další API, ke kterému existují implementace pro konkrétní relační databáze jako PostgreSQL, Oracle...
JPA implementaci můžete vyměnit třeba za [EclipseLink](https://www.eclipse.org/eclipselink/).

JPA, potažmo Hibernate, jsou ORM, objektově relační mapování.
Není to jediný způsob, jak přistupovat k databázi.
Můžete si skládat vlastní SQL dotazy přes JDBC nebo zapojit nějakou mezivrstvu, která vám bude dotazy skládat jako například [jOOQ](https://www.jooq.org/).
Při té příležitosti chci připomenout článek [The Vietnam of Computer Science](https://web.archive.org/web/20220823105749/http://blogs.tedneward.com/post/the-vietnam-of-computer-science/) (jehož překlad dlužím server Zdroják).


## IDE

Můžete programovat v textovém editoru, ale pravděpodobně sáhnete po IDE, Integrated Development Environment, vývojovém prostředí.
Je to mocný nástroj s nespočtem vychytávek pro krokování, refaktorování, doplňováním kódu, integrací na verzovací systémy a mnohé další.
Všechny vypadají podobně.
Vybírejte podle toho, jak jsou rozšířené mezi kolegy v práci nebo kamarády, abyste měli někoho, kdo vám poradí.


### NetBeans

[NetBeans](https://netbeans.apache.org/) uvádím proto, že za vznikem stojí Čech Jaroslav Tulach
(pro mě [důležitý hlavně kvůli svému psaní o návrhu API](http://wiki.apidesign.org/wiki/User:JaroslavTulach)).
NetBeans používá slavný bloger [Adam Bien](https://adam-bien.com/).


### Eclipse

Léta jsem používal [Eclipse](https://www.eclipse.org/ide/).
Jeho hlavní výhodou a zároveň i nevýhodou je, že je zdarma.


### IntelliJ IDEA

Když jsem začal koketovat s Groovy, tak v Eclipse byla tehdy podpora příšerná.
Přešel jsem na [IntelliJ IDEA](https://www.jetbrains.com/idea/) od firmy JetBrains a už bych nechtěl nikdy zpátky.
Existuje i ve verzi zdarma, ale patří mezi licence, za které s radostí platím.  


## Build

V odstavci o JVM jsme si řekli něco o kompilátoru, ale sestavení moderního software je trochu komplikovanější než jen kompilace.
Proto máme buildovací nástroje.

### Ant

[Ant](https://ant.apache.org/) už je pro mě prehistorie.
Jako začátečníkům bych asi radil se inzerátům, které ho zmiňují, vyhnout.
Jedná se o deklarativní nástroje, který popisuje **jak** se kroky mají dělat.
Neřešil správu závislostí, dependency management.


### Maven

[Maven](https://maven.apache.org/) je dnes stále hojně rozšířený.
Narozdíl od Antu konfiguruje, **co** se má dělat.
Podstatně hůř se ladí detaily **jak** se to má dělat.
Zavádí správu závislostí, dependency management.
Jako velkou nevýhodu vidím v tom, že se od začátku nepočítalo s podporou paralelního běhu, který stále [zůstává v experimentálním módu](https://cwiki.apache.org/confluence/display/MAVEN/Parallel+builds+in+Maven+3).
Nedokáže tak na plno využít možností dnešního hardwaru.


### Gradle

[Gradle](https://gradle.org) stojí na ramenou svých předků a kombinuje výhody Ant a Maven dohromady. Využívá repositáře závislostí Mavenu.
Konfiguruje se v Groovy nebo Kotlinu.
Od začátku byl navrhován pro podporu paralelní buildů.
Prsí se, že v některých případech jsou až [100 krát rychlejší než Maven](https://gradle.org/gradle-vs-maven-performance/).


## Frontend

V Javě lze psát jak webové tak desktopové GUI. 


### Web

Na počátku stály [JSP](https://en.wikipedia.org/wiki/Jakarta_Server_Pages), JavaServer Pages.
Na statické stránky stačily.
Měl jsem je rád a dokázal si v nich udržet pořádek.

S Web 2.0 začal být tlak na dynamické stránky.
Přišly [JSF](https://en.wikipedia.org/wiki/Jakarta_Server_Faces), Java Server Faces.
Je to další Java API, které například implementují [PrimeFaces](https://www.primefaces.org/).
Osobně jsem této technologii nepřišel na chuť.
Podle mě tato abstrakce až příliš nešikovně odstiňuje od webových technologií.
Ale nezkoumal jsem novější verze.
Zvídavým čtenářům doporučuji k prozkoumání [What are the main disadvantages of Java Server Faces 2.0?](https://stackoverflow.com/a/3646940/204950)

Tehdy mi jako lepší technologie přišel například [Wicket](https://wicket.apache.org/).
Osobně bych si vybral spíš [Vaadin](https://vaadin.com/).

Další možností je pomocí Javy vystavovat jen REST a frontend psát v JavaScriptu.
Na to však potřebujete Java programátory, kteří JavaScript umí (což já nejsem), nebo dedikovaný frontendový tým.


### Desktop

V Javě lze psát i desktopové aplikace.

Jako první tu byl [AWT](https://en.wikipedia.org/wiki/Abstract_Window_Toolkit), Abstract Window Toolkit,
ale byl závislý na platformě, porušoval tedy jeden ze zakládajících principů jazyka.

Eclipse šel tou dobou vlastní cestou, [RCP](https://wiki.eclipse.org/Rich_Client_Platform)

[Swing](https://cs.wikipedia.org/wiki/Swing_(Java)) přišel s vlastním vykreslováním, které by všude mělo vypadat stejně.
Oproti nativnímu AWT to však kladlo značně vyšší nároky na hardware.
Odtud může pramenit povědomí, že Java je pomalá, protože tehdy to opravdu pomalé bylo. 


## Enterprise

Slovo _legacy_, odkaz či dědictví, má v IT negativní konotaci.
Přijde mi, že jiné obory s tím dokážou pracovat lépe, a minulost oslavovat.

{% twitter https://twitter.com/ArmadaCR/status/1578281345130037248 %}

Jeden z hlavních použití Javy je psaní enterprise aplikací.
Píše se rok 2004, existují [EJB](https://en.wikipedia.org/wiki/Jakarta_Enterprise_Beans), Enterprise JavaBeans, ale použití je strašlivé.
Rod Johnson napsal knihu [J2EE Development without EJB](https://www.amazon.com/Expert-One-One-Development-without/dp/0764558315) a 
vznikl framework [Spring](https://spring.io/projects/spring-framework).
Nesporně to byl úspěch, protože dnes už je ve verzi 6.
Obsahuje mnoho modulů.
Ve svých aplikací samozřejmě nemusíte použít všechny.
V [dokumentaci verze 3](https://docs.spring.io/spring-framework/docs/3.0.0.RELEASE/spring-framework-reference/html/overview.html) jsem našel pěkný diagram.

![](/assets/2022-12-29/spring-overview.png)

V roce 2014 vznik [Spring Boot](https://spring.io/projects/spring-boot).
Pro mě to je Spring plus tři věci.
1. Autokonfigurace
2. Sadu závislostí a jejich verzí
3. Standalone aplikace

Aby to nevypadalo, že protežuju Spring, tak samozřejmě existují i alternativy jako [Quarkus](https://quarkus.io/) nebo [Micronaut](https://micronaut.io/). 

### Servery

Webové aplikace je potřeba někde spouštět.
Jedna z cest byly aplikační servery (familiárně _aplikáče_) jako Payara, JBoss, Weblogic či Websphere.
V myšlenkách se opět vracíme k API, kdy aplikační servery měly mít vyladěnou sadu implementací.
Zní to dobře, ale přijde mi to značně neflexibilní, protože aplikáčům trvalo nezanedbatelnou dobu než reflektovaly nové verze API nebo Java JDK.
Aplikáče bývají dostupné ve verzi zdarma nebo s komerční, ne úplně levnou, podporou.
U velkých zákazníků se s nimi můžete stále setkat.
Nebudu nic skrývat, nemám je rád.
Tomáš Piňos sepsal [Srovnání Java aplikačních serverů](https://profinit.eu/blog/srovnani-java-aplikacnich-serveru/).

Odlehčenější cestou jsou servlet kontejnery jako [Tomcat](https://tomcat.apache.org/) nebo [Jetty](https://www.eclipse.org/jetty/).
Obsahují minimum implementací, třeba servlet API pro servírování webového obsahu, ale ostatní věci jako 
[JTA](https://en.wikipedia.org/wiki/Jakarta_Transactions), Java Transaction API, si musíte obstarat sami. 

### Návrhové vzory

V enterprise Javě se to hemží návrhovými vzory jako factory.
Neříkám, abyste šli studovat původní [Gang of Four (GoF)](https://en.wikipedia.org/wiki/Design_Patterns),
ale pokročilých programátorů se u pohovoru klidně zeptám na [Java proxy](/software%20development/2021/01/28/java-proxy-od-psa-k-transakcnimu-psovi.html).
Na Zdroják.cz doporučuji pěkný seriál [Principy objektově orientovaného návrhu](https://zdrojak.cz/serialy/principy-objektove-orientovaneho-navrhu/).


## Testování

Testování je v Java světě obvyklé stejně jako dokumentace a stejně jako tu můžete i testy někdy zanedbávat.
Máme k dispozici nástroje jako knihovnu [JUnit](https://junit.org/junit5/) (už ve verzi 5), kterou připravil Kent Beck,
rovněž autor knihy [Test driven development](https://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530). 
Máme i nástroje pro mockování jako [Mockito](https://site.mockito.org/) či [EasyMock](https://easymock.org/). 


## Logování

Dalším návykem Java programátorů je logování, byť já svou ideální cestu stále hledám.
Minimálně máme k dispozici nástroje.
Správné postupy asi ještě prověří léta praxe.

Existuje přehršle logovacích knihoven jako
[Logback](https://logback.qos.ch/),
[Log4j](https://logging.apache.org/log4j/2.x/),
[Commons Logging](https://commons.apache.org/proper/commons-logging/)
a jiné.

Máme k dispozici fasádu [Slf4j](https://www.slf4j.org), která nám umožňuje logovací knihovny vyměnit a nebo delegovat na logovací modul daného aplikáče.

Podívejte se na diagram v článku [Log4j vs SLF4J](https://www.javatpoint.com/log4j-vs-slf4j).


## Lombok

K projektu [Lombok](https://projectlombok.org/) mám ambivalentní vztah.
Ano, používám ho, ale jeden myšlenkový směr říká, že nepotřebujete syntaktický cukr pro generování [getterů a setterů, že je nepotřebujete vůbec](https://www.yegor256.com/2014/09/16/getters-and-setters-are-evil.html).
Generovaný `toString` může být nebezpečný, protože na první pohled nevidíte, které _fieldy_ jsou zahrnuté.


## Česká komunita

Chcete-li se zapojit do české komunity, můžete sledovat českou [Java User Group](https://www.jug.cz/).
Dříve to býval agregátor blog postů, ale lidi nějak přestali psát.
Najdete tam alespoň pozvánky na přednášky.

Pěknou práci odvádějí v [Google Developer Group Jihlava](https://gdg.community.dev/gdg-jihlava/), kde jsem měl šanci přednášet. 

Přemýšlím, zda jsou přednášky dostatečně nízkoprahové i pro začátečníky.
Každopádně se nenechte odradit a dorazte.


## Závěr

Komunita + nástroje + JVM = ❤️


## Související

- [Don’t call it a comeback: Why Java is still champ](https://github.com/readme/featured/java-programming-language)
- [What Does a Modern JVM Look Like, And How Does It Work?](https://foojay.io/today/what-does-a-modern-jvm-look-like-and-how-does-it-work/)
- [Java proxy: Od psa k transakčnímu psovi](/software%20development/2021/01/28/java-proxy-od-psa-k-transakcnimu-psovi.html)
- [Paul Graham - Přebal javy](/software%20development/2013/05/23/prebal-javy.html)
- [Joe Armstrong - Proč stojí objektové programování za starou belu](/software%20development/2017/06/26/proc-objektove-programovani-stoji-za-starou-belu.html)
- [Andrew Binstock - Záhada jménem Groovy](/software%20development/2014/04/07/zahada-jmenem-groovy.html)
- [Nesprávná abstrakce](/software%20development/2020/12/08/nespravna-abstrakce.html)
