---
layout: post
title:  "Bus faktor v praxi"
date:   2016-11-22
categories: [software development]
item: 183
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://www.flickr.com/photos/dhendrix/6906652333/"><img src="https://c2.staticflickr.com/8/7209/6906652333_84b9e8bfda_q.jpg" /></a><br/><a href="https://www.flickr.com/photos/dhendrix/">dhendrix73</a> (<a href="https://creativecommons.org/licenses/by-nd/2.0/">CC BY-ND 2.0</a>)</div><a href="https://en.wikipedia.org/wiki/Bus_factor">Bus faktor</a> je číslo, které říká, kolik lidí by muselo odejít, aby to vážně ohrozilo projekt. Nejhorší číslo je 1. Z pohledu manažerů, by bylo skvělé, kdyby lidé byli snadno zaměnitelní jako součástky stroje. My si někdy můžeme nafoukaně myslet, že jsme takřka nepostradatelní (i když jako manažer, bych se snažil takových lidí zbavit). Pravdou je, že každý je nahraditelný. Otázkou je, za jakou cenu.

Slyšel jsem příběh, u kterého jsem osobně nebyl, ale byla by škoda ho neposlat dál. Nejspíš jde o <a href="https://cs.wikipedia.org/wiki/M%C4%9Bstsk%C3%A1_legenda">urban legend</a>, takže jakákoliv podobnost s vaší firmou je čistě náhodná.
<!--more-->

Byla jednou jedna firma, kde pracoval databázový administrátor, který všechno věděl a na kterého se všichni obraceli. Problém na produkci? Zavoláte, sáhne do živých dat. Sice nevíte, co opravil, ale problém je vyřešen. Vedení si uvědomovalo nebezpečí, že klíčové znalosti má jediný člověk. Sice se snažili najmout někoho, kdo by ho stínoval, ale to se nepovedlo. Kandidáti nezvládali a utíkali nebo byli vyhozeni ve zkušební době. Mohlo se zdát, že je to složitostí domény či obskurní databází. Avšak později se ukázalo, že hledali jednoho člověka, zatímco stávající systémový administrátor zastal práci za dva.

Ovšem jednoho dne neočekávaně nepřišel do práce. Na první pohled zdravý muž, ale už v letech, dostal infarkt, kterému podlehl. Firma přepnula do nouzového režimu. Takřka na rok se zastavil veškerý nový vývoj. Všichni analytici zkoumali, co onen člověk dělal a věděl.  Ohromě slavili, když se jim podařilo udělat první měsíční účetní uzávěrku.

Nakonec všechno dobře dopadlo, firma nezkrachovala. Jaké si z toho odnesete ponaučení? Pro sebe jsem si to shrnul do následujících bodů:

* Dokumentovat znalosti i procesy
* Vizualizovat architekturu
* Sdílet znalosti a snažit se o zástupnost
* Automatizovat

Související
------

Podobný, nikoliv tak tragický, příběh s bus faktorem 1 (a návodem jak ho řešit) naleznete jako epizodu v knize <a href="https://www.goodreads.com/book/show/17255186-the-phoenix-project">The Phoenix Project</a>. 