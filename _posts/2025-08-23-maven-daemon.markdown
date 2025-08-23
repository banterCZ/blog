---
layout: post
title:  "Maven Daemon"
date:   2025-08-23
categories: [software development]
disqusId: 279
image: "/assets/2025-08-23/maven-logo-black-on-white.png"
tags: [Maven]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2025-08-23/maven-logo-black-on-white.png" /></div>

Abych udržel tempo publikací na blogu, tak každý článek nemůže přinášet zásadní téma.
Zůstaňme tedy při zemi, u něčeho staršího.
Ač jsem někdy [Maven haněl](/software%20development/2015/04/29/konflikt-tranzitivnich-zavislosti.html), tak tentokrát bych se ho rád zastal.
Doporučuji paralelní build a použití [démona](https://cs.wikipedia.org/wiki/D%C3%A9mon_(software)), který (dle mého pozorování) není tak rozšířený, jak by býval mohl být.

<!--more-->
<div style="clear: both"></div>


## Přehled buildovacích nástrojů

Doporučuji k přečtení článek [My final take on Gradle (vs. Maven)](https://blog.frankel.ch/final-take-gradle/).
Nechci papouškovat celý, ale stručné shrnutí.


### Ant

Ant taky pamatuju, takže můžu potvrdit, že neřešil závislosti a chyběla konzistence mezi projekty.


### Maven

Maven přináší závislosti a konvence.
Dnes už se jedná o běžný přístup konvence před konfigurací (_convention over configuration_, není nutné explicitně konfigurovat, máte implicitní smysluplné nastavení).
Pro specifické úpravy si můžete napsat vlastní plugin, což není zase tak snadné.
Nemá podporu paralelního build a i [ve verzi 3 stále označen jako experimentální](https://cwiki.apache.org/confluence/display/maven/parallel+builds+in+maven+3).
Očekávané zrychlení paralelního buildu je 20 až 50 %.

Nicolas Fränkel v odkazovaném článku tvrdí, a já s ním souhlasím, že málo flexibility není bug ale žádoucí vlastnost.


### Gradle

Gradle využívá Maven závislosti a přidává flexibilitu, které se až vymyká z rukou.
Od začátku myslí na rychlost buildu a systém cachování.
Prsí se, že oproti Mavenu jsou [v některých případech až 100 krát rychlejší](https://gradle.org/gradle-and-maven-performance/).


## Maven Daemon

[Maven Daemon](https://github.com/apache/maven-mvnd) je dlouhodobý proces běžící na pozadí.
Start JVM není úplně zanedbatelná operace.
S démonem tedy ušetříte start JVM při každém buildu a hlavně nepřijdete o JIT (Just-In-Time) optimalizace.
V neposlední řadě dostaneme vylepšený výstup paralelního build na konzoli.


### Vlastní pozorování

V současné době mimo jiné přispívám do open source projektu [PowerAuth](https://github.com/wultra/powerauth-server).
Níže naleznete dobu buildu na MacBook Pro s M1 procesorem.
`mvnd` je příkaz pro build pomocí Maven Daemon.

| Příkaz                    | Čas buildu | Poznámka                                               |
|---------------------------|------------|--------------------------------------------------------|
| `mvn clean package`       | 46,6 s     |                                                        |
| `mvn package`             | 30,6 s     |                                                        |
| `mvn clean package -T 1C` | 40 s       | Paralelní běh, 1 thread na dostupný core.              |
| `mvn package -T 1C`       | 28,6       | Paralelní běh, 1 thread na dostupný core.              |
| `mvnd clean package`      | 37,9 s     | Démon, paralelně spouští _by default_.                 |
| `mvnd package`            | 26,4 s     | Démon, paralelně spouští _by default_, **první běh**.  |
| `mvnd package`            | 22,8 s     | Démon, paralelně spouští _by default_, **po zahřátí**. |

<br/>

### Úskalí paralelního buildu

Jak jsme si již řekli, paralelní build v Mavenu stále není plně podporován.
Kromě problémových pluginů můžete narazit i na problémy ve svém kód, který třeba nezvládne paralelní běh integrační testů, takže si budete muset zamést i před svým prahem.


## Závěr

Ač zrychlení paralelního buildu v Mavenu nedosahuje hodnot, jaké reklamuje Gradle, tak přesto by byla škoda toho nevyužít.
Když už se dáte cestu paralelního buildu v Mavenu, doporučuji využít Maven Daemon.
Při práci ve větších týmech a v situaci, kdy programátoři přechází mezi projekty, dávám přednost předvídatelnosti před rychlostí.


## Související

- [Konflikt tranzitivních závislostí](/software%20development/2015/04/29/konflikt-tranzitivnich-zavislosti.html)
