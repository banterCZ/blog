---
layout: post
title:  "Vezmi mě na Měsíc"
date:   2026-10-10
categories: [software development]
disqusId: 289
tags: [historie, konference, jopenspace]
image: "/assets/2026-10-10/57439.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2026-10-10/57439.png" /></div>

Jedná se o textový přepis přednášky, kterou jsem měl na nekonferenci [jOpenSpace](https://www.jopenspace.cz/) 2026, [videozáznam ke zhlédnutí](https://vhsky.cz/w/3LmQt1oVN84vtybW63s99R).
Nepřináším žádné závratné novinky, nýbrž tichou ale naléhavou, touhu po úniku z drsné přítomnosti do idylického bezpečí minulosti.
Vracím se k programu Apollo a ptám se, jak se lidé dostali na Měsíc a zpět navzdory tehdejším technickým omezením.

<div style="clear:both"></div>
<!--more-->


## Úvod

[Fly Me to the Moon](https://en.wikipedia.org/wiki/Fly_Me_to_the_Moon) je jazzová skladba, kterou proslavil Frank Sinatra.
Jedná se i o [stejnojmennou romantickou komedii](https://www.csfd.cz/en/film/1432860-fly-me-to-the-moon/overview/), která roztomile rozvíjí konspirační teorii, že Američané na Měsíci nepřistáli.
A já vás dnes chci vzít na Měsíc.

<iframe class="center" title="jOpenSpace 2026 - Luboš Račanský - Fly Me to the Moon" width="560" height="315" src="https://vhsky.cz/videos/embed/3LmQt1oVN84vtybW63s99R" allow="fullscreen" sandbox="allow-same-origin allow-scripts allow-popups allow-forms" style="border: 0px;"></iframe>

Když jsem chodil na základku, v čítance byla zařazená [povídka Blbec z Xeenemünde](https://www.databazeknih.cz/povidky/blbec-z-xeenemunde-1308), kterou napsal Josef Nesvadba.
Byl podle ní [natočen i film](https://www.csfd.cz/film/430-blbec-z-xeenemunde/recenze/).
Tehdy mi nedošlo a nikdo mi nevysvětlil, že jde o narážku na [základnu Peenemünde](https://museum-peenemuende.de/), kde vyvíjeli rakety V1 a V2. Budete-li mít cestu do severovýchodního Německa, muzeum navštivte. Možná vědci romantickou posedlostí jen omlouvali svou účast na válečném tažení, ale je fakt, že vývoj zbraní nás na Měsíc dostal.

Léta jsem nejapně žertoval, že telefon v kapse má větší výpočetní výkon než raketa, která letěla na Měsíc.
Až jsem jednou na [HackerNews](https://news.ycombinator.com/) narazil na myšlenkový experiment, který [propočítává, že i nabíječka má výkon větší](https://forrestheller.com/Apollo-11-Computer-vs-USB-C-chargers.html).
To byla jedna z věcí, která mě přiměla podívat se na vesmírný výzkum trochu systematičtěji.

Předesílám, že na téma nejsem odborník, přináším jen rozcestník zajímavostí, které mi přišly pod ruku.

Zarámujme to geopoliticky.
Nacházíme se v šedesátých létech, USA na tom nejsou dobře.
[Invaze v Zátoce Sviní skončí debaklem](https://cs.wikipedia.org/wiki/Invaze_v_z%C3%A1toce_Svin%C3%AD) a Sověti dostávají prvního člověka do vesmíru.

Pak přichází JFK a jeho slavný [Moon Speech](https://www.youtube.com/watch?v=QXqlziZV63k), nejlepší projev, který jsem kdy slyšel.
Pravidelně se k němu vracím a pokaždé se u toho dojmu.

> Rozhodli jsme se v tomto desetiletí letět na Měsíc a uskutečnit i další věci, ne proto, že by to bylo snadné, ale právě proto, že je to obtížné…

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/QXqlziZV63k?si=xg_KLWxca4ONdcIg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Následuje program Mercury, který měl dostat Američana na oběžnou dráhu.
Program Gemini otestoval delší pobyt ve vesmíru a spojení dvou těles.
Teprve navazující program Apollo pak zamířil přímo k Měsíci.

![](https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f4/NASA_spacecraft_comparison.jpg/330px-NASA_spacecraft_comparison.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=thumbnail){:.center}

_NASA/Davis Paul Meltzer, Public Domain_{:.center}

Programům Mercury a Gemini se nestihneme věnovat. I přes kritiku za historickou nepřesnost vřele doporučuji film [Správná posádka](https://www.csfd.cz/film/5024-spravna-posadka/recenze/).

## Navigační systém

Navigační systém se skládal z několika částí.
Pojďme si je postupně projít.
Čerpal jsem mimo jiné z [přednášky Roberta Willse](https://www.youtube.com/watch?v=B1J2RMorJXM).

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/B1J2RMorJXM?si=oDthJ73F9sJDKDW8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Ve vesmíru není žádné nahoře, referenčním prvkem byla setrvačnost.
Inerciální navigaci si zjednodušeně můžeme představit jako chůzi se zavázanýma očima, přičemž si průběžně zaznamenáváte každý krok a každý obrat.
Inerciální jednotka Apollo byla založena na fyzických rotujících gyroskopech.
Dnes máme k dispozici i micro-elektro-mechanické systémy nebo optická vlákna.
[Názorné porovnání všech variant najdete v tomto videu.](https://www.youtube.com/watch?v=jtQXFaBK-eQ)

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/jtQXFaBK-eQ?si=gOsxLVh-IFdixVWX" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## Počítač

Mozkem byl [Apollo Guidance Computer](https://en.wikipedia.org/wiki/Apollo_Guidance_Computer).
V době sálových počítačů vzniklo zařízení s příkonem 55 wattů a hmotnosti 32 kilogramů.

![](https://thumb.wikimedia.org/wikipedia/commons/thumb/7/79/Agc_view.jpg/330px-Agc_view.jpg?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail){:.center}

_Apollo Guidance Computer and DSKY, Public Domain_{:.center}

V době, kdy kdy vstupem i výstupem byly děrné štítky, tu máme „display and keyboard“, vyslovujeme DISS-kee.
Klávesnici je nutné ovládat i v rukavicích.
Princip zadávání je založen na kombinaci slovesa a podstatného jména.
Na [simulátoru](https://www.svtsim.com/moonjs/agc.html) vidíme _verb_ 16 sleduj, _noun_ 65 aktuální čas.

![](/assets/2026-10-10/simulator.png){:.center}

Klíčovou součástí navigačního systému jsou i optické prvky.
Zaměřovač v okně lunárního modulu a sextant ve velitelském modulu, který sloužil ke kalibraci inerciální jednotky vzhledem ke hvězdám.

[Paměť byla magnetická](https://www.righto.com/2019/07/software-woven-into-wire-core-rope-and.html), 4KB RAM a 72KB ROM.
Každým jádrem (nebo kolem něj) prochází 192 snímacích vodičů, takže každé jádro pojalo 12 slov dat.

{% twitter https://twitter.com/fermatslibrary/status/2042197982506828161 %}

[Zdrojový kód Apollo Guidance Computer byl zveřejněn](https://github.com/chrislgarry/Apollo-11).
Samozřejmě se jedná o assembler.
Napsali jste v něm alespoň _hello world_?
Tady na 30 řádcích počítají cosinus.
Pro aproximace používají [Taylorův polynom](https://cs.wikipedia.org/wiki/Taylorova_%C5%99ada) a pro snížení počtu násobení [Hornerovo schéma](https://cs.wikipedia.org/wiki/Hornerovo_sch%C3%A9ma).
Na grafu je vidět rozdíl mezi aproximací a přesným průběhem.


## Přistání

![](/assets/2026-10-10/error.png){:.center}

Během přistání Apolla 11 se několikrát objevila neočekávaná chyba.
Procedura přistání zabírala 80% výkonu.
Kvůli přípravě na případné nouzové přerušení sestupu byl zapnutý rendez-vous radar, ten zabíral 15 % výkonu.
Zobrazení a aktualizace údajů k přistání vedly k přetížení.
Systém však byl navržen robustně.
Restartoval se a omezoval úlohy s nízkou prioritou.

Neil Armstrong kromě řešení chyby musel navíc přejít na ruční ovládání, aby se vyhnul balvanům v místě plánovaného přistání.
Zbývalo mu palivo na několik posledních vteřin, přesto měl tepovku kolem 150.
Já na gauči při sledování scény ve filmu [První člověk](https://www.csfd.cz/film/502300-prvni-clovek/) nebo poslechu [záznamu radiokomunikace](https://apolloinrealtime.org/11/?t=102:38:29) jsem měl tepovku mnohem větší.


## Margaret Hamilton

Traduje se historka, že Margaret Hamilton přivedla do práce svou čtyřletou dceru, která způsobila selhání simulátoru a odhalila tak potenciální zranitelnost systému.
Uvědomila si, že astronauti by mohli během skutečné mise udělat stejnou chybu, ale NASA její obavy zpočátku bagatelizovala.
Jenže posádka Apolla 8 si opravdu omylem smazala data potřebná pro zpáteční cestu.
Tato událost podtrhla význam jejího proaktivního přístupu k prevenci chyb.
[Řada postupů, které použila, byly později aplikovány v moderních konceptech softwarové architektury](https://news.mit.edu/2026/margaret-hamilton-computing-pioneer-dies-1007).
(Zemřela 30. září 2026, ve věku 90 let, několik dní před přednáškou.)

![](https://thumb.wikimedia.org/wikipedia/commons/thumb/d/db/Margaret_Hamilton_-_restoration.jpg/500px-Margaret_Hamilton_-_restoration.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=thumbnail){:.center}

_Hamiltonová v roce 1969, stojící vedle výpisů z naváděcího softwaru pro program Apollo, který vyvinula spolu se svým týmem z MIT, Public Domain_


## Cesta domů

Horolezci vědí, že se nemají upínat pouze k výstupu na vrchol, že stejně náročný, ne-li náročnější, je návrat.
Neuvědomil jsem si, jak netriviální je setkání s velitelským modulem na oběžné dráze.
Nebudu tady zabíhat do fyziky, [odkážu vás na tohle video](https://www.youtube.com/watch?v=KdHI5Fn9Fu8).
Snad jen vypíchnu zdánlivě neintuitivní fakt, že nižší oběžná dráha znamená větší rychlost a tedy kratší dobu oběhu.

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/KdHI5Fn9Fu8?si=Z16ki9V9xWwTr6kc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## Apollo 12

Pouhých 36 vteřin po startu zasáhl raketu Apolla 12 blesk a loď ztratila telemetrii.
Od zmaření celé mise a nebezpečného přerušení startu posádku zachránila předchozí zvídavost mladého kontrolora [Johna Aarona](https://en.wikipedia.org/wiki/John_Aaron).

Aaron si z dřívějších simulací pamatoval přesný vzorec tohoto selhání a vyslal ikonický pokyn: *„SCE to AUX“* (přepnutí napájení jednotky převodníku signálů na záložní větev).
Astronaut Alan Bean přepínač na palubní desce bleskově přepnul, telemetrie ožila a mise pokračovala.
Tato schopnost porozumět systému do nejmenších detailů udělala z Aarona legendu.

![](https://upload.wikimedia.org/wikipedia/commons/4/44/JAaron.jpg?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original){:.center}

_John Aaron, Public Domain_{:.center}


## Apollo 13

Apollo 13 není třeba dlouze představovat.
Tato mise přinesla velké poučení nejen o tom, jak zásadní je kompatibilita náhradních dílů.
V [této scénce vidíme](https://www.youtube.com/watch?v=eeEM_IBUv70), že filtr z lunárního modulu nepasuje na velitelský.
Celý workaround držel pohromadě díky stříbrné lepicí pásce, která se naštěstí v kosmické lodi vždy nacházela.

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/eeEM_IBUv70?si=pQU23DExvWwEOk4C" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## Apollo 14

Apollo 14 je asi první živý hotfix v historii.
Malý kousek pájky ve stavu beztíže zkratoval kontakt tlačítka _abort_.
Don Eyles softwarově opravil hardwarovou chybu.
Přesvědčil počítač, že signál pro přerušení sestupu už byl zpracován, takže systém začal falešný signál ze zkratovaného tlačítka ignorovat a mohl bezpečně pokračovat v přistání.
Astronauti nahráli program pomocí 61 stisků na DSKY.


## Jak to bylo dál?

Geopoliticky zarámujeme i konec dekády.
[Na univerzitě v Ohiu zastřelí příslušníci Národní gardy několik studentů během protiválečné demonstrace](https://cs.wikipedia.org/wiki/Masakr_student%C5%AF_na_Kentsk%C3%A9_st%C3%A1tn%C3%AD_univerzit%C4%9B_v_Ohiu).
[Na olympiádě v Mnichově je spáchán teroristický útok](https://www.csfd.cz/film/1550116-mnichov-1972).

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/H-kA3UtBj4M?si=UZ4hiqYOYxK000uN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Éra Apolla skončila v prosinci 1972 a trvalo přes půl století, než jsme se k lunárnímu programu vrátili.
Mohlo by se zdát, že s dnešním nepředstavitelným výpočetním výkonem a moderními materiály to bude hračka.
Původně jsem v historických materiálech hledal senzaci, ale zůstal ve mně především obdiv k lidem, kteří to dokázali poprvé.
O to větší respekt si zaslouží současný program Artemis.
[Mise Artemis II letos úspěšně obletěla Měsíc](https://www.nationalgeographic.cz/specialy/artemis-ii-ctyri-astronauti-mesic/) a ukázala, že bezpečně dopravit lidskou posádku k Měsíci a zpět zůstává i dnes špičkovou inženýrskou disciplínou.

![](https://thumb.wikimedia.org/wikipedia/commons/thumb/7/76/Artemis_II_Watch_Party_Social_Media_1920x1080_%281954105009817%29.jpg/960px-Artemis_II_Watch_Party_Social_Media_1920x1080_%281954105009817%29.jpg?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail){:.center}

_Artemis II Watch Party Social Media, Public Domain_


## Závěr

Trefně to shrnul [Gene Kranz](https://en.wikipedia.org/wiki/Gene_Kranz), letový ředitel misí programů Mercury, Gemini a Apollo, ve své knize [Failure is Not an Option](https://www.goodreads.com/book/show/141499.Failure_is_Not_an_Option).

> Přes všechen technický pokrok byl lidský faktor pro úspěch naprosto klíčový.

Je to motto, které mi v dnešním turbulentním světě dává pevnou půdu pod nohama.
Psaní kódu nás programátory bavilo, ale fakticky jsme za to placení nebyli.
Teď je to jen víc vidět.
Umět programovat znamená ve své podstatě myslet.
Řešíme problémy a jsme v tom fakt dobří.
Jen se s nástupem AI změnily podmínky.
Skutečnou hodnotou inženýra stále zůstává analytické myšlení a návrh robustních systémů.
