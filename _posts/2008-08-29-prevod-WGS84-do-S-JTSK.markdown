---
layout: post
title:  "Převod WGS 84 do S-JTSK"
date:   2008-08-29
categories: [software development]
disqusId: 88
---
Co se týče zeměpisných souřadnic, běžný smrtelník ví, že existuje nějaká **GPSka**. Programátor pracující na českých projektech, které 
vyžadují 
práci se zeměpisnými souřadnicemi se určitě setkal se dvěma standardy a to [WGS 84](http://cs.wikipedia.org/wiki/World_Geodetic_System) a 
[S-JTSK](http://cs.wikipedia.org/wiki/JTSK). Proto některé služby jako například [Webdispečink](http://www.webdispecink.cz/) 
poskytují data v obou standardech. Nicméně někdy potřebujete mezi sebou souřadnice převést.
<!--more-->

Je za tím spoustu matematiky různých projekcí atd., čemuž nehodlám porozumět. Převod z __S-JTSK__ do __WGS 84__ není sranda, ale existuje na to 
knihovna [PROJ.4](http://trac.osgeo.org/proj/) (zvládá více světových systémů). Návod pro český systém naleznete [wiki ČVUT](http://web.archive.org/web/20100708183403/http://grass.fsv.cvut.cz/wiki/index.php/S-JTSK-Grid).

Převod z __WGS 84__ do __S-JTSK__ je výpočetně jednodušší. Reverse engineeringem jsem z javascriptu na stránce [http://pecina.cz/krovak.html]
(http://pecina.cz/krovak.html) 
vytvořil následujíc java kód.

{% gist banterCZ/fb7f5a6ef40d3b0f57ddd350f4a8aa4a %}