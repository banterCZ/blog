---
layout: post
title:  "Aby test neselhal na první­ assert (JUnit 5)"
date:   2016-12-11
categories: [software development]
disqusId: 184
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2016-12-11/20161211-junit5-logo_small.png"/></div>Už jsem psal o 
tom, <a href="/item/148">jak v JUnit 4 dosáhnout toho, aby test neselhal na první assert</a>. JUnit 5 již dosáhl milestone 2 (podrobnosti v článku <a href="https://www.sitepoint.com/junit-5-state-of-the-union">JUnit 5 State Of The Union</a>), tak je potřeba se podívat, jak s novou verzí API dosáhnout téhož.

Jsem zastáncem toho, aby jednotlivé testy byly co nejkratší a samozřejmě na sobě nezávislé. Raději napíšu deset testovacích metod s jedním assertem, než jednu metodu s deseti asserty. Výhodu spatřuji v tom, že při jediném běhu testu vidíte na jediný pohled všechny vadné případy. A ne že opravíte první assert, spustíte test a padne vám hned druhý assert v pořadí. 

Jiné je to v případě integračních testů, například Selenium (WebDriver). Samotná příprava dat je náročná, takže je vhodné asserty sdružovat do větších celků. Ale jak z jediného běhu získat co nejvíce informací, aniž byste museli test znovu a znovu opakovat?
<!--more-->

V JUnit 4 existuje rozhraní TestRule, v podobě <a href="http://junit.org/javadoc/4.9/org/junit/rules/ErrorCollector.html">ErrorCollector</a>. V JUnit 5 už rozhraní Rule nejsou, nicméně tento případ vyřeší <a href="http://junit.org/junit5/docs/current/api/org/junit/jupiter/api/Assertions.html#assertAll-java.lang.String-org.junit.jupiter.api.function.Executable...-">assertAll</a>.

    assertAll("address",
        () -> assertEquals("John", address.getFirstName()),
        () -> assertEquals("User", address.getLastName())
    );

Ukázka
------
Následuje ukázka Selenium testu, který ověřuje, zda mají povinná pole formuláře kolem sebe rámeček určité barvy. Jistě nechcete test ukončit po zjištěné nesrovnalosti hned na prvním poli. Zaměřte svou pozornost na řádky číslo 27 až 30.

{% gist banterCZ/acfa969df0bdda4e67c80446474b747c %}

JUnit 5 ještě neexistuje jako oficiální release, zatím jen milestone 2. Přesto je dobré vědět, na co se připravit. JUnit tým připravil Maven Surefire provider a Gradle plugin, ale jde zatím jen o proof of concept. Co se IDE týče, zkoušel jsem IntelliJ Idea, která JUnit 5 už umí.

![](/assets/2016-12-11/20161211-IntelliJIdeaJUnit5.png)
_Výpis v IntelliJ IDEA_

Související
------

* <a href="/item/148">Aby test neselhal na první assert (JUnit 4)</a>
* <a href="https://www.sitepoint.com/junit-5-state-of-the-union">JUnit 5 State Of The Union</a>