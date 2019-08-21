---
layout: post
title:  "Aby JUnit test neselhal na první assert"
date:   2014-03-14
categories: [software development]
disqusId: 148
tags: [JUnit]
image: "/assets/2014-03-14/1267371838.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2014-03-14/1267371838.png" /></div>Chtěl bych navázat na článek <a href="/item/146">Parametrizovaný JUnit test</a> a pokračovat tak v představování vlastností JUnit, o kterých dost programátoru neví, nebo je alespoň denně nepoužívají.

Jsem zastáncem toho, aby jednotlivé testy byly co nejkratší a samozřejmě na sobě nezávislé. Raději napíšu deset testovacích metod s jedním assertem, než jednu metodu s deseti asserty (viz kritizovaný <a href="/item/113">test validátoru rodných čísel</a>). Výhodu spatřuji v tom, že při jediném běhu testu vidíte na jediný pohled všechny vadné případy. A ne že opravíte první assert, spustíte test a padne vám hned druhý assert v pořadí. 

Jiné je to v případě integračních testů, například Selenium (WebDriver). Samotná příprava dat je náročná, takže je vhodné asserty sdružovat do větších celků. Ale jak z jediného běhu získat co nejvíce informací, aniž byste museli test znovu a znovu opakovat?

Existuje šikovná implementace rozhraní TestRule, v podobě <a href="http://junit.org/javadoc/4.9/org/junit/rules/ErrorCollector.html">ErrorCollector</a>, který sbírá vzniklé chyby, ale reportuje je až nakonec.
<!--more-->

Ukázka
------

Následuje ukázka Selenium testu (v Groovy), který ověřuje, zda mají povinná pole formuláře kolem sebe rámeček určité barvy. Jiste nechcete test ukončit po zjištěné nesrovnalosti hned na prvním poli. Zaměřte svou pozornost na řádek číslo 35, kde byste psali jako obvykle nějaký assert, ale tentokrát použijete <a href="http://junit.org/javadoc/4.9/org/junit/rules/ErrorCollector.html#checkThat(T, org.hamcrest.Matcher)">ErrorCollectorl#checkThat</a>. Díky anotaci <a href="http://docs.groovy-lang.org/next/html/gapi/groovy/lang/Delegate.html">@Delegate</a> můžete vynechat referenci na <i>errorCollector</i> a psát pouze <i>checkThat</i>.

{% gist banterCZ/9189930 %}

![](/assets/2014-03-14/20140314-errorCollector.png)
_A takhle nějak může vypadat výpis v IntelliJ IDEA_

Související
------

* <a href="/item/184">Aby test neselhal na první assert (JUnit 5)</a>