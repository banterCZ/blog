---
layout: post
title:  "Jak jsem debuggoval kotel"
date:   2024-07-29
categories: [bydlení]
disqusId: 270
image: "/assets/2024-07-29/308888.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2024-07-29/308888.png" /></div>

Jako programátor mám jisté tendence myšlenkových pochodů i v běžné životě, zkrátka analytický přístup nemůžu potlačit.
Poslední sezónu nám nefungovalo podlahové topení.
Jak jsem na to přišel, jak hledal příčinu a jak se to vyřešilo?

<div style="clear:both"></div>
<!--more-->


## Úvod

V předsíni jsme měli pocitově chladno.
Hlavně nám neschnuly boty.

Dal jsem tedy termostat v místnosti na maximum, pár dní to pozoroval a nic.

Dobrá, máme ještě krb, v obýváku hlavní prostorový termostat, podle kterého mohla jednotka kotle vyhodnotit, že je přetopeno a podlahovku stáhnout.
Zvýším tedy teplotu na hlavním termostatu a jdu změnit [průtoky jednotlivých okruhů v rozdělovači podlahového topení](https://www.youtube.com/watch?v=G87lnuv8qek) (obývák ubrat, předsíň přidat).
Ale co nevidím?
Jedno servo je zaseklé (připisuju na nákupní seznam).
Hlavně však průtok všude nula.

To bude jistě oběhové čerpadlo.
Po deseti letech má nárok na to se zaseknout.
Jdu ho tedy [odseknout](https://www.youtube.com/watch?v=WspRGg40Ekw).
Jenže zatuhlé nebylo a vůbec nespíná (napětí nula).

![](/assets/2024-07-29/IMG_6086.jpeg){:.center}

Ještě aby tak čerpadlo shořelo, to je výměna za několik tisíc a hlavně práce se šroubením.
Rozeberu tedy elektroinstalaci čerpadla, natvrdo propojím spínací obvod a připojím na 230 voltů ze zásuvky, ne z rozvodů kotle.
[Kvůli jednomu šroubku rozebrat celý traktor.](http://milujipraci.cz/)
Čerpadlo točí, ukazatele průtoku ukazují.
Hurá!
Tedy vlastně ne.
Když to není čepadlem, tak to bude řídící jednotka kotle.
Sakra.
V záruce nám tehdy [měnili celou základovou desku](/bydlení/2017/08/31/energeticka-narocnost-rodinneho-domu.html).


## Zavolejte odborníka

Volám našemu servisnímu technikovi.
Všechno mu popíšu.
Kdyby mi uživatelé psali podobný _bug report_, tak jsem šťastný jako prase a ušetří mi to spoustu práce.
Odbude to se slovy, že je to jasné, že jsme přetopili dům krbem, nehledě k tomu, že je venku zrovna teplo, což má výrazný vliv na vyhodnocení dle ekvitermní křivky.
Navíc je to kolem Vánoc, tak se mu to pochopitelně nechce moc řešit.
Dobrá, nezmrzneme, máme krb.
Přijede prý po novém roce.

Přijel, prošel v podstatě tím samým, plus dokáže z kotle v administraci vyčíst víc než já.
Plus má v počítači diagnostický software.
Alespoň jsme zjistili, že nedovírá trojcestný ventil.
Ohřev teplé užitkové vody funguje, ale plýtváme.
Ventil na místě vymění, ale hlavní příčina to není.

![](/assets/2024-07-29/IMG_6167.jpeg){:.center}

Ještě by to mohla být spínací jednotka.
Technik díl nemá a odjíždí na měsíc na dovolenou.
Nevadí, pošle mi součástku kurýrem a vyměním si sám.

![](/assets/2024-07-29/IMG_6185.jpeg){:.center}

Vyměnil jsem, ale žádná změna.
V balení byl bohužel datový kabel s jiným konektorem, takže jsem musel nechat starý.
Alespoň jsem zkusil [kabel prozvonit](https://www.youtube.com/watch?v=6XRbZJppbfY) (umí to i levný multimetr).
Kabel se mi zdá v pohodě.

Čekám, až se technik vrátí z dovolené a přiveze novou základovou desku.
Beru to s humorem a pouštím si _standup_ [Pavel Tomeš - Řemeslníci](https://www.youtube.com/watch?v=lXHoj5gKrAM).

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/lXHoj5gKrAM?si=m0tv-UvqMwOlxWRa" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Technik přijíždí připraven vyměnit základovou desku, ale pro jistotu přivezl ještě nový datový kabel.
A co myslíte?
Bylo to tím!


## Závěr

A jaké z toho plyne poučení?
Moji posedlost analytickým myšlením nechme stranou.
Náš technik je prima, ten díl navíc jsem na rozdíl o pána ve skeči neplatil.
Chtěl jsem sepsat, že závada se dá a má hledat systematicky, že to svépomocí zvládnete.
Svépomoc je levná a hlavně rychlá, nemusíte čekat, až někdo přijede, obzvláště když jde o takovou věc, jako nefunkční topení.
Jdete-li po nejčastější závadách, máte celkem velkou šanci, že to bude tím.
A když není, tak si holt na odborníka počkáte. 


## Související

- [Energetická náročnost rodinného domu](/bydlení/2017/08/31/energeticka-narocnost-rodinneho-domu.html)
- [Roční spotřeba energie v domácnosti](/bydlení/2008/03/07/rocni-spotreba-energie-v-domacnosti.html)
- [Pavel Tomeš - Řemeslníci](https://www.youtube.com/watch?v=lXHoj5gKrAM)
