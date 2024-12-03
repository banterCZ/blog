---
layout: post
title:  "Vybrané kapitoly z Groovy"
date:   2016-02-17
categories: [software development]
disqusId: 172
tags: [Groovy]
---
<img src="/assets/2016-02-17/20160217-java-groovy1.png" style="float: left; margin: 0 1em 1em 0; text-align: center;" />Na začátek jeden vtip.

> Špatní fotografové se baví o objektivech, dobří o fotografiích a ti slavní o ženských.

Dalo by se to vztáhnout i na programátory, že ti špatní se baví o programovacích jazycích. Největším <a href="/item/168">dnešním úskalím softwarového inženýrství</a> rozhodně není zdrojový kód, přesto věnuji tento příspěvek jazyku Groovy. Java mě živí, ale Groovy mě baví víc, je to příjemné zpestření. Dočetl jsem druhé vydání knihy <a href="http://amzn.to/1PM5Ego">Groovy in Action</a> (čekali jsme na druhé vydání této bible dlouhých 6 let). Udělal jsem si pár poznámek, které by se mohly hodit i vám, ať už s Groovy začínáte nebo ho už nějakou chvilku používáte.
<!--more-->

Groovy je stále aktuální i přesto, že už vyšla Java 8. Používám Groovy v Gradle, na <a href="/item/167">mockování webových služeb v Soap UI</a> a nejčastěji při psaní testů. Napíšu tak mnohem méně kódu. A není to cvičení pro cvičení, ale znamená to menší pravděpodobnost, že uděláte chybu, a méně kódu na čtení. Přičemž netrpí čitelnost, ba právě naopak. Jako příklad uveďme inicializaci objektů či práci s kolekcemi.

Dynamický jazyk
------

Trocha teorie nikoho nezabije, malé opakování spíše prospěje všem. Groovy je dynamický jazyk, ale co to znamená? Připomeňme si, že typování můžeme dělit na slabé a silné, či statické (typ proměnných se specifikuje v době kompilace) a dynamické. Silně a staticky je typovaná třeba Java. Slabě a dynamicky například JavaScript (piš, co chceš). Oproti tomu jazyk C je sice staticky typovaný, takže vás kompilátor klepne přes prsty, pokud byste chtěli používat API, které typu nepřísluší, ale na druhou stranu už vás nic neomezuje v tom, přetypovat proměnnou na úplně jiný typ. Dynamický jazyk neznamená slabě typovaný, jak si možná mnozí myslí. Groovy je dynamicky a přesto silně typovaný jazyk. Kompilátor vám tedy ledacos dovolí, ale běhové prostředí vás případně zastaví.<br/>

![](/assets/2016-02-17/20160217-typing_groovy.png)

Z knihy jsem si vypůjčil příklad, jak jsou v Groovy a v Javě dispatchované  metody (hrozný termín, ale překlad nemám).

{% gist banterCZ/f647dd892e22103472e7 %}

Protože Groovy dispachuje podle typu za běhu, je v druhém případě použita implementace <code>oracle(String)</code>. Použijete-li v Javě statický typ <em>Object</em>, ztrácíte sílu statického typování.
> Pokud jste ve své kariéře zatím neviděli moc dynamického programování, můžete se ptát, k čemu to je, když jste se bez toho doposud očividně obešli.

Statické typování
------

<blockquote>Mnoho programátorů žije v domění, že dynamické jazyky jsou vždy pomalejší než ty staticky kompilované. To není vždy pravda. Groovy je obecně téměř stejně rychlé jako Java. Ovšem jsou situace, kdy se cena za dynamický výběr metody stane relevantní jako při optimalizaci výkonu <a href="https://en.wiktionary.org/wiki/tight_loop">tight loop</a> na kritické cestě.</blockquote>Anotace <a href="http://docs.groovy-lang.org/latest/html/gapi/groovy/transform/TypeChecked.html">@TypeChecked</a> zapíná typovou kontrolu při kompilaci. Jednoduše <a href="http://octodecillion.com/blog/use-type-checked-or-compile-static-for-groovy-scripts/">vysvětleno třeba zde</a>. Nicméně přijdete tak o dost dynamických vychytávek a možnost přidávat metody za běhu díky <em>metaclass</em>, viz přiložený příklad převodu jednotek.

    Number.metaClass {
        getMm = { delegate }
        getCm = { delegate * 10.mm }
        getM = { delegate * 100.cm }
    }
    assert 1.m + 20.cm - 8.mm == 1.192.m

Oproti tomu anotace <a href="http://docs.groovy-lang.org/latest/html/gapi/groovy/transform/CompileStatic.html">@CompileStatic</a> zajistí, že kód bude staticky zkompilovaný téměř do stejného byte code jako Java. Bohužel se budete muset vzdát síly Groovy <em>meta object protokolu</em>.
Doporučuji podrobnější <a href="http://www.infoq.com/articles/new-groovy-20">vysvětlení na InfoQ</a>.

API
------

Když v práci narazíte na něco nízkoúrovňového jako třeba výrobu <a href="/item/170">biometrických cestovních pasů</a>, oceníte, že Groovy má slušné API na konverzi z/do <a href="http://mrhaki.blogspot.de/2014/04/groovy-goodness-converting-byte-array.html">hex</a> či <a href="http://mrhaki.blogspot.de/2009/11/groovy-goodness-base64-encoding.html">base64</a> kódování.

Líbí se mi anotace <a href="http://docs.groovy-lang.org/next/html/gapi/groovy/lang/Delegate.html">@Delegate</a>, díky které jsem zjednodušil práci s <a href="/item/148">errorCollectorem v JUnit</a> (i když s <a href="http://blog.so-geht-software.de/2016/02/whats-new-in-junit-5/">JUnit 5</a> to už bude jinak).

Potřebujete-li iterovat přes všechny prvky kolekce a znát i index, použijte metodu <em>eachWithIndex</em>
<code>['Petr', 'Aleš', 'Václav'].eachWithIndex{ item, index -> println &quot;$index: $item&quot; } </code>

Stackoverflow chybu můžete při rekurzi dostat i když máte dobře 
napsanou ukončovací podmínku, prostě jste potřeboval příliš mnoho paměti. Pokud máte <em>tail-recursive</em> funkci, to jest takovou, která posledním řádkem volá sama sebe a už nedělá nic jiného, mohli byste zásobník uvolnit. JVM takovou podporu bohužel nemá, proto je tu anotace <a href="http://docs.groovy-lang.org/latest/html/gapi/groovy/transform/TailRecursive.html">TailRecursive</a>, která funkci převede na iterativní volání. Koukněte na <a href="https://dzone.com/articles/groovy-goodness-more-efficient">příklad</a>. Ověřit můžete v <em>GroovyConsole</em>, kde stiskem vyvoláte <em>ctrl + t</em> AST (Abstract Syntax Tree) browser.

![](/assets/2016-02-17/20160217-Groovy AST Browser.PNG)

Při psaní <a href="/item/146">parametrizovaných testů</a> jsem potřeboval převést list listů na list polí <code>foo.collect{ it as Object[] }</code> Zjistil jsem, že to lze udělat ještě jinak a to <code>foo*.toArray()</code>

V GStringu zvládnete i <em>lazy evaluation</em>.

    def x = 1
    def y = "$x"
    def z = "${ -> x}"//lazy evaluation
    x = 2
    assert y == "1"
    assert z == "2"

Potřebujete-li synchronizovat metodu pro čtení, sáhněte po anotaci <a href="http://docs.groovy-lang.org/latest/html/gapi/groovy/transform/WithReadLock.html">@WithReadLock</a>. Pod pokličkou se používá <a href="http://docs.oracle.com/javase/7/docs/api/java/util/concurrent/locks/ReentrantReadWriteLock.html">ReentrantReadWriteLock</a> z <em>java.util.concurrent</em>, ale nepotřebujete psát ten balast okolo.

Groovy frameworky
------

<blockquote>Naučit se syntaxi je otázka dní, naučit se idiomy nového jazyka možná vyžaduje pár týdnů, ale pracovat s novou knihovnou může lehce zabrat několik měsíců.</blockquote>Asi není potřeba vyzdvihovat Gradle a Grails, ale existuje spoustu další frameworků postavených na Groovy, které stojí za povšimnutí. Zatím jsem nepoužil, tak si poznamenávám i pro sebe, kdyby se mi to v budoucnu hodilo.

Desktopové aplikace nemusíte psát v čistém Swingu, od toho je to <a href="http://griffon-framework.org/">Griffon</a>, který se inspiroval u Grails.

Není nutné se učit .NET, abyste mohli vytvářet ActiveX nebo COM Windows komponenty, mrkněte na <a href="https://github.com/groovy/Scriptom/wiki">Scriptom</a> 

Mám klidné spaní, jelikož nepíšu paralelní zpracování. Nicméně, pokud bych musel, sáhl bych po vyšší míře abstrakce, než jsou vlákna, třeba aktory a knihovnu <a href="http://www.gpars.org/">GPars</a>. Mimochodem na jeho vzniku se podílel <a href="https://twitter.com/vaclav_pech">Václav Pech</a>.

<a href="http://www.gebish.org">Gebish</a> spojuje sílu WebDriveru (Selenium) s dotazovacími schopnostmi jQuery, robustností návrhového vzoru <em>Page Object</em> a možnostmi jazyka Groovy. 

<a href="http://www.pillarone.org/">PillarOne</a> by měl být nástroj na modelování risku v pojišťovnictví.

Je možné psát Android aplikace v Groovy, ale vyžaduje to speciální verzi kompilátoru. Groovy poskytuje <em>jar</em> soubory s klasifikátorem <a href="http://docs.groovy-lang.org/latest/html/documentation/tools-groovyc.html#section-android">grooid</a>.

Pustíte-li se více do Groovy, Gradle... budete potřebovat rozumnější zprávu instalací. Od toho tu je užitečný nástroj <a href="http://sdkman.io/">SDKMAN!</a>, dříve GVM (Groovy enVironment Manager), inspirovaný RVM (Ruby). Milovníci Windows mají bohužel smůlu.

Související
------

* <a href="http://www.aspectworks.com/2011/02/proc-psat-javovske-testy-v-groovy-i">Proč psát Javovské testy v Groovy I</a> - Tomáš Piňos ukazuje třeba implementaci mapou
* <a href="/item/150">Záhada jménem Groovy</a> aneb proč není Groovy populárnější
* <a href="/item/167">Mock Web Service v Soap UI a Groovy</a>
* <a href="/item/146">Parametrizovaný JUnit test</a>
* <a href="/item/148">Aby JUnit test neselhal na první assert</a> (s <a href="http://blog.so-geht-software.de/2016/02/whats-new-in-junit-5/">JUnit 5</a> to už bude jinak)
* <a href="/item/161">Konflikt tranzitivních závislostí<a/> (Gradle a Maven)
* <a href="/item/152">Akumulátor test a Java 8</a>
* <a href="/item/162">Nebezpečí Java škol</a>