---
layout: post
title:  "Konflikt tranzitivních závislostí"
date:   2015-04-29
categories: [software development]
disqusId: 161
---
<img src="/assets/2015-04-29/20150429-pinguin builder.png" align="left" style="margin: 0px 15px 15px 
0px" />Pochopitelně není možné znát do hloubky všechny nástroje a frameworky, se kterými denně přicházíme do styku. Na druhou stranu, pragmatický programátor se snaží pochopit alespoň principy, obzvláště u klíčových technologií. Tentokrát bych chtěl vysvětlit konflikt tranzitivních závislostí v Mavenu (ukážu i alternativu v Gradlu).
<!--more-->

<div style="clear: both"></div>

Zadání
------

Máme projekt s hromadou závislostí a ty s sebou nesou další tranzitivní závislosti. Ale co se stane, zavlečeme-li si do projektu stejný artefakt jiné verze?

![](/assets/2015-04-29/20150429-Dependencies.png)

Maven
------

Co na to Maven? Projekt možná nakrásně zkompilujete, ale za běhu se můžou dít věci... najednou na vás vyskočí <em>ClassNotFoundException</em> či <em>NoSuchMethodError</em>, ačkoliv tam patřičnou třídu přeci máte, ne? Nejspíš máte, ale třeba binárně nekompatibilní. Problém je v tom, že při konfliktu tranzitivních závislostí Maven nekřičí, ani nevezme nejvyšší verzi (jak byste nejspíš čekali), ale zvolí tu nejbližší ve stromě závislostí. Více v dokumentaci <a href="http://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html">Introduction to the Dependency Mechanism</a>.

Pojďme si to ukázat na následujícím příkladu. Jistě, v takto jednoduchém případě byste měli vybrat stejné verze Springu, ale v komplikovanějším projektu se vám závislosti zavlečou, ani nevíte odkud.

{% gist banterCZ/3b540202d3045e9040f5 %}

Nechme si vypsat seznam závislostí pomocí příkazu <em>mvn dependency:list</em>

![](/assets/2015-04-29/20150429-Maven list highlighted.png)

Hm, vidíme <em>spring-aop 3.0.7</em>, zkontrolujme &quot;proč&quot; a to pomocí příkazu <em>mvn dependency:tree -Dverbose</em>

![](/assets/2015-04-29/20150429-Maven tree highlighted.png)

Teď, když už víme proč, můžeme danou závislost exludovat, případně explicitně definovat, čímž verzi přebijeme.

Všimněte si, že <em>spring-web</em> se vybral ve vyšší verzi, ovšem nikoliv proto, že je novější, ani proto, že je v tranzitivní závislosti blíž. V tranzitivní závislosti je ve stejné vzdálenosti, ale je v <em>pomu</em> definovaný dříve.

Gradle
------

Koluje takový vtip:

<blockquote>Jaký je rozdíl mezi autory Mavenu a Antu?
Autoři Antu už se omluvili.</blockquote>
A co na to Gradle? Mějme ekvivalentní konfiguraci předchozímu maven příkladu.

{% gist banterCZ/da681d8842f2f8e848e2 %}

Nechme si vypsat závislosti pomocí příkazu <em>gradle dependencies</em>

![](/assets/2015-04-29/20150429-Gradle dependencies highlighted.png)

Všimněte si, že jsou všude použity nejvyšší verze, což je výchozí chování Gradlu. Můžete být ovšem přísnější a v případě konfliktu nechat build selhat, čehož docílíte použitím <em>failOnVersionConflict()</em> (odkomentujte TODO ve skriptu výše).

![](/assets/2015-04-29/20150429-Gradle failed.png)

V tom případě musíte verzi vynutit pomocí <em>force</em>. Více v dokumentaci <a href="https://gradle.org/docs/current/userguide/dependency_management.html#sub:version_conflicts">Resolve version conflicts</a> a v javadocu <a href="http://gradle.org/docs/current/javadoc/org/gradle/api/artifacts/ResolutionStrategy.html">ResolutionStrategy</a>.

Související
------

* <a href="/item/99">Nedrájte konfiguráky do warka</a>
* <a href="/item/159">Pořádek v multi-module buildu</a>