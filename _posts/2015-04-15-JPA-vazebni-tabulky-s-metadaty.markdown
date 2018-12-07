---
layout: post
title:  "JPA - Vazební tabulky s metadaty"
date:   2015-04-15
categories: [software development]
disqusId: 160
tags: [JPA]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://openclipart.org/detail/94723/database-symbol-by-rg1024"><img src="https://openclipart.org/image/150px/svg_to_png/94723/db.png" /></a></div>Nějakou dobu jsem zanedbával certifikace. Říkal jsem si, že bych mohl konečně dotáhnout JPA a v rámci přípravy jsem narazil na pár zajímavostí. Přitom jsem si zoufal, že jsem mohl předchozí projekty napsat výrazně lépe, ale utěšuje mě myšlenka, že <a href="/item/130">byste měli být nespokojení se svým kódem, který jste napsali před rokem</a>. Konkrétně chci psát o vazebních tabulkách <em>legacy</em> databází, které nejsou triviální, tj. neobsahují jen klíče ale i nějaká metadata.
<!--more-->

<div style="clear: both"></div>

Databáze
------

Je dána databáze, nad kterou stavíte aplikaci s JPA.

![](/assets/2015-04-15/20150415-jpa - diagram.png)

Naivní řešení
------

Jako první vás jistě napadne řešení, které jsem sám doposud používal, vytvořit entitu <em>EmployeeProject</em>. Funguje to, ale předpokládejme že nejčastěji vás bude zajímat přistup z entity <em>Employee</em> na <em>Project</em>, ale přitom musíte jít přes entity <em>EmployeeProject</em>.

![](/assets/2015-04-15/20150415-jpa - typical.png)

Elegantní řešení
------

Existuje ovšem elegantnější řešení, jak se z <em>Employee</em> dostat přímo k entitám <em>Project</em> a zároveň mít případně k dispozici i metadata v <em>embeddable</em> objektu <em>ProjectAllocation</em>. (V anglické terminologii <em>Relationship State</em> či <em>Association class</em>)

![](/assets/2015-04-15/20150415-jpa-association class.png)

{% gist banterCZ/3a45bf50906053b0ecc5 %}

Související
------

* <a href="/item/137">Jak lépe na abstract entity v JPA</a>