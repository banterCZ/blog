---
layout: post
title:  "Selenium remote control – testování AJAXu a další finty"
date:   2009-11-29
categories: [software development]
disqusId: 90
---
Na posledním projektu jsem dělal větší část práce na GUI a nehodlal jsem stále dokola klikat jak cvičená opice a raději jsem si dal trochu práce s nasazením <b>Selenium</b> remote control. Nešlo ani tak o jednotkové testy jako spíš o integrační a regresní testování. Zvolil jsem remote control a ne plugin do firefoxu (Selenium IDE), protože takto jsem měl k dispozici servisní vrstvu a mohl kontrolovat zápis do databáze. Potřeboval jsem ale pokročilejší postupy než ty, které naleznete v getting started, a o ty bych se s vámi rád podělil.
<!--more-->

Firefox 3
------

Přečtěte si návod <a href="http://notetodogself.blogspot.com/2008/10/use-selenium-rc-in-firefox-3.html">jak zprovoznit selenium remote control s firefox 3</a>

AJAX
------

Pro testování <b>AJAX</b>u můžete využít vlastní aktivní čekání nebo elegantněji použít metodu <a href="http://release.seleniumhq.org/selenium-remote-control/1.0-beta-2/doc/java/com/thoughtworks/selenium/Selenium.html#waitForCondition(java.lang.String,%20java.lang.String)">waitForCondition</a> a nastavit i timeout čekání.

Například chcete testovat, zda se po kliknutí na link <i>add hoo</i> přidá nějaký DOM element identifikovaný id <i>hoo-1</i>

    selenium.click( "link=add hoo" );
    selenium.waitForCondition( "selenium.browserbot.getCurrentWindow().document.getElementById('hoo-1')", MAX_WAIT_TIME_IN_MS ); 

Analogicky mazání, všimněte si zejména podmínky <b>=== null</b>

    selenium.click( "link=remove hoo" );
    selenium.waitForCondition( "selenium.browserbot.getCurrentWindow().document.getElementById('hoo-1') <b>=== null</b>", MAX_WAIT_TIME_IN_MS );

Dynamicky generované DOM id
------

I dynamicky generované DOM id je snadné testovat. Potřebujete-li například znát id nově přidaného elementu hoo, zjistíte si nejprve pomocí XPath počet těch stávajících.

    int nextHooIndex = selenium.getXpathCount( "//div[contains(@id,'hoo-')]" ).intValue();

Rychlost klikání
------

Výchozí nastavení je, že selenim kliká jak zběsilé bez jakéhokoliv prodlení a to se pak dějí věci. Doporučuji nastavit nějaké rozumné zpoždění, třeba vteřinu, alespoň můžete vizuálně kontrolovat, co se děje.

    selenium.setSpeed( "1000" );

Psaní teček
------

<a href="http://jira.openqa.org/browse/SEL-519">Bug&nbsp;SEL-519</a> jsem vyřešil podle <a href="http://stackoverflow.com/questions/803830/selenium-typekeys-strips-out-dot-from-the-string-being-typed">návodu na stackoverfow.com</a>

Prostě nemůžete do formuláře napsat tečku, takže musíte string podle teček splitnout a napsat po částech. Tečka se napíše následovně.

    selenium.getEval("window.document.getElementById('fooId').value += '.'");

Simulace psaní a test našeptávače
------

Past je ve vyplňování formulářů,  selenium.<a href="http://release.seleniumhq.org/selenium-remote-control/1.0-beta-2/doc/java/com/thoughtworks/selenium/Selenium.html#type(java.lang.String,%20java.lang.String)">type</a> zajistí zapsání stringu do DOMu, ale potřebujete-li testovat třeba našeptávač, použijte selenium.<a href="http://release.seleniumhq.org/selenium-remote-control/1.0-beta-2/doc/java/com/thoughtworks/selenium/Selenium.html#typeKeys(java.lang.String,%20java.lang.String)">typeKeys</a> ale ještě předtím potřebujete na prvek získat <a href="http://release.seleniumhq.org/selenium-remote-control/1.0-beta-2/doc/java/com/thoughtworks/selenium/Selenium.html#focus(java.lang.String)">focus</a>

Nabízenou možnosti z našeptávače potvrdíte entrem následovně
    
    selenium.keyDown( "//input[@id='myInput']", "\\13" );

Confirm dialog
------

Otevření a potvrzení confirm dialogu provedete následovně

    assertEquals("Are you sure to delete foo?", selenium.getConfirmation())

XPath
------

Pro efektivní práci se seleniem budete potřebovat znalost XPath, můžete začít třeba na <a href="http://www.w3schools.com/XPath/xpath_syntax.asp">w3school.com</a>  Hodí se i plugin do firefoxu - <a href="https://addons.mozilla.org/en-US/firefox/addon/1192">XPather</a>

Závěr
------

Psaní testů vyžaduje čas a u selenium testů to platí dvojnásob. A právě čas bývá nejčastější výmluva, proč testy nepsat. Snad vás nemusím přesvědčovat, že selenium vám v důsledku spoustu času ušetří. Navíc je to tak pohodlné pustit selenium testy a mezitím chvilku vydechnou a místo usilovného a soustředěného klikání, do kterého se vám už po sté nechce, si vychutnat kafe.