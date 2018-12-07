---
layout: post
title:  "Kódující architekt"
date:   2017-01-22
categories: [software development]
disqusId: 185
tags: [kniha]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://www.flickr.com/photos/bantercz/15799780329/in/album-72157649269744987/"><img src="https://c2.staticflickr.com/8/7500/15799780329_ae3fde9d79_m.jpg" /></a></div>Napsal jsem a přeložil několik článků o stárnutí programátorů a změně jejich pozice. Završím to pohledem na kódujícího architekta. Zatímco v článku <a href="/item/169">Technický lídr</a> si zoufám, že <em>jednou z nejtěžších voleb technické hvězdy, ze které se stává lídr, je ztráta kontaktu s nejnovější technologií</em>, tak kniha <a href="https://leanpub.com/software-architecture-for-developers">Software Architecture for Developers (Simon Brown)</a> mi dává určitou naději. Podle autora je softwarový architekt technická kariéra.
<!--more-->

Kompetence
------
Architekt se nemusí a ani by neměl vzdávat programování, to je mi sympatické. Ale ani by neměl programovat celou dobu, je totiž potřeba udělat práci architekta. Tedy někoho, kdo má širší pohled na věc, kdo bude pamatovat na nefunkční požadavky: bezpečnost, rychlost, logování, údržba databáze, monitoring, zotavení z chyb, UX, risk management atd. Přistoupíme-li na dělení <a href="http://honzajavorek.cz/blog/kolonizatori-a-spravci-kolonii">Kolonizátoři a správci kolonií</a>, tak jsou architekti spíš správci, než kolonizátoři.

Citace
------
V knize <a href="">Software Architecture for Developers (Simon Brown)</a> jsou uvedené myšlenky, se kterými souhlasím, intuitivně jsem si k nim rovněž došel, ale neuměl jsem je tak pěkně formulovat. Proto si dovolím několik citací přeložit.

> Termín nefunkční požadavky nezní lákavě, ale to neznamená, že je to důvod je zanedbat.

> Webdeveloper: „Prostě mi dejte data jako JSON a já si s nimi na webové vrstvě udělám, co potřebuju.“

> Softwarová architektura je platforma pro konverzaci

> Softwarová architektura hraje klíčovou roli v doručení úspěšného software, ale přesto je frustrující, jak je mnoha týmy zanedbávaná.

> Armáda je známá svou schopností vytvářet efektivní týmy ze skupiny cizích lidí.

> Organizace mají tendenci vidět softwarového architekta spíš jako hodnost než roli

> Architektura je o struktuře, je o dekompozici produktu do několika komponent či modulů a jejich interakce.

> Architektura je o porozumění, co je potřeba vybudovat, vytváří vizi a činí příslušná designová rozhodnutí. To musí být založeno na požadavcích, protože ty řídí architekturu.

> Softwarový architekt, který programuje, je efektivnější a šťastnější architekt.

> Nemusíte být nejlepší programátor v týmu

> Programátoři budou nejspíš ignorovat vaši zkušenost s programováním, pokud s nimi na projektu nebudete programovat

> Na rozdíl od středověkého stavitelského průmyslu postrádá softwarové inženýrství jasnou cestu, jak se z junior programátora stát softwarovým architektem. Nemáme běžný učňovský model.

Tady bych si dovolil analogii z českého stavitelství. Jak zaznělo v pořadu <a href="http://m.rozhlas.cz/toulky/vysila_praha/_zprava/874-schuzka-chudeho-pohrobka-trnita-cesta-ke-slave--1026542">Toulky českou minulostí (874. schůzka)</a>, Josef Zítek, architekt Národního divadla, si k diplomu architekta pořídil i výuční list zedníka. <em>Mícháním malty nebo vyvazováním zdi si opatřil řemeslnou zručnost, která mu bude jednou k nezaplacení při projektování i při kontaktu s dělníky.</em>

![](/assets/2017-01-22/20170122-software architecture role.png)
_diagram ze strany 16_

Jak se stát architektem
------
Jak už bylo řečeno, v IT nemáme učňovský model. Proto jsem se již několikrát rozplýval nad armádou, kde si lídry snaží vychovat. Co můžeme pro svou kariéru architekta udělat? V článku <a href="/item/176">Programátorem po čtyřicítce</a> radili: <em>Zapomeňte na trendy.</em> V článku <a href="https://www.zdrojak.cz/clanky/uvahy-stareho-programatora/">Úvahy „starého“ programátora</a> zase zaznělo: <em>Polovina toho, co programátoři znají, bude za deset let k ničemu.</em> Je potřeba investovat nejvíc do trvalých znalostí (algoritmy, bezpečnost aplikací, optimalizace výkonu a architektura). Architekturu je potřeba umět vizualizovat (o tom by měl být druhý díl <a href="https://leanpub.com/visualising-software-architecture">Visualise, document and explore your software architecture</a>). To pomůže to vytvořit a udržet společné porozumění celkového kontextu. 

Závěr
------
Kontroverzní Erik Meijer v <a href="https://vimeo.com/110554082">přednášce One Hacker Way</a> říká, že programátoři by měli programovat jen do třiceti. Je v tom určitě kus pravdy. S věkem jistě bude klesat dravost, ale snad bude růst jejich zkušenost a rozvaha. Je tu role kódujícího architekta, kterou by určitě mohli starší programátoři plnit. Já osobně už plán na dvě příští pětiletky mám.

Zakončím přáním z článku <a href="/item/171">Trocha architektury</a>: <em>Požehnaný tým, jehož architekt se stará o to, co má skutečně smysl, a odkládá věci, které ho nemají.</em>

Související
------
* <a href="/item/171">Trocha architektury</a>
* <a href="/item/169">Technický lídr</a>
* <a href="http://www.dagblog.cz/2015/01/mytus-nekodujiciho-architekta_26.html">Mýtus nekódujícího architekta</a>
* <a href="http://honzajavorek.cz/blog/kolonizatori-a-spravci-kolonii">Kolonizátoři a správci kolonií</a>
* <a href="/item/176">Programátorem po čtyřicítce</a>
* <a href="https://www.zdrojak.cz/clanky/uvahy-stareho-programatora/">Úvahy „starého“ programátora</a>
