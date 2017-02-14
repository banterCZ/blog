---
layout: post
title:  "Nedrátujte konfiguráky do warka"
date:   2012-05-22
categories: [software development]
disqusId: 99
---
Programátoři bezpochyby trpí syndromem: „Kód, který napsal někdo jiný, stojí za starou belu.“ Nejlepší na učení je sice přečíst tuny lepšího 
kódu, jenže jako konzultant se spíše utvrzuji v tom, že jedinou [metrikou kvality kódu je WTF za minutu](http://commadot.com/wtf-per-minute/). SQL dotazy v JSP? To nic není, co 
teprv SQL Injection na druhou – klientský JavaScript vykonávající libovolný databázový dotaz na serveru. Věřím, že mezi čtenáři nejsou autoři oněch řádků. Přesto jsou i menší prohřešky, kterých by stálo za to se zbavit: Zadrátování konfigurace!
<!--more-->

Temnota
------

Konfigurace je zadrátovaná. Build děláte z workspace, nejčastěji zakomentováním a odkomentováním řádků. Baví vás to ještě? Kdy se vám naposledy povedl release napoprvé?

Prozření
------

Konfigurace je vytažená do samostatného souboru (nebo více souborů), např. property file. Bohužel konfigurační soubory jsou součástí waru, což znamená, že pro různá prostředí děláte nový build. Nebo snad editujete již hotové warko?

Osvícení
------

Konfigurační soubory jsou vytažené mimo war, existuje jediný build pro všechna prostředí. Ctíte princip _configuration by convention_ – rozumné
 výchozí nastavení, které je možné překrýt.

Jak na to
------

Zmíněné vývojové stupně konfigurace se mohou vzájemně překrývat. Používate-li Spring, tak máte k dispozici elegantní řešení.

{% gist banterCZ/2765108 property-placeholder.xml %}

Nebo kratší zápis s použitím namespace context.

{% gist banterCZ/2765108 context:property-placeholder.xml %}

A co že jste to vlastně nakonfigurovali? Proměné v následujícím tvaru budou nahrazeny hodnotami z property souboru _myApp.properties_.

    ${my.variable}
    
Mód [SYSTEM_PROPERTIES_MODE_OVERRIDE](http://static.springsource.org/spring/docs/3.1.x/javadoc-api/org/springframework/beans/factory/config/PropertyPlaceholderConfigurer.html#SYSTEM_PROPERTIES_MODE_OVERRIDE) značí, že se nejprve 
 prohledají systémové properties před soubory. Soubor _myApp.properties_ se nachází v adresáře (nebo i na síti) specifikovaném jako systémová 
 property. Pro potřeby vývoje je za dvojtečkou uvedena výchozí hodnota, v našem případě claspath.
 
    -DmyApp.config.location=...

Na classpath je soubor je pro potřeby workspace. Je umístěn mimo strukturu mavenu, např. adresář _/etc/conf_, který si v IDE přidáme na 
classpath. Konfigurák tak není součástí warka, jak jsme si přáli, ale potřebujeme ho spolu s warkem distribuovat. Pomůže vám třeba [Maven 
Assembly Plugin](http://maven.apache.org/plugins/maven-assembly-plugin/), který vám do jednoho zip souboru zabalí kromě warka a konfiguráků třeba inicializační skripty a další věci, co uznáte za 
vhodné.

To tolik nebolí, nemyslíte?

Anketa
------
<script type="text/javascript" charset="utf-8" src="https://static.polldaddy.com/p/6248386.js"></script>
<noscript><a href="http://polldaddy.com/poll/6248386/">Co vy a konfiguráky</a></noscript>