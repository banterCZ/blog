---
layout: post
title:  "97 věcí, které by každý architekt měl znát"
date:   2019-01-30
categories: [software development]
disqusId: 210
image: "/assets/2019-01-30/97things_cover.jpg"
tags: [kniha]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2019-01-30/97things_cover.jpg" /></div>
Daří se nám pokračovat ve [společném čtení](/software%20development/2018/02/27/spolecne-cteni-knih.html). Četli jsem i knihu [97 Things Every Programmer Should Know](https://www.goodreads.com/book/show/7003902-97-things-every-programmer-should-know), ale ta je, podle mého, určená začátečníkům. Mnohem vhodnější mi přijde kniha [97 Things Every Software Architect Should Know](https://www.goodreads.com/book/show/5487765-97-things-every-software-architect-should-know), kterou bych vám do začátku určitě doporučil. Jedná se o sbírku krátkých esejů, takže lidé můžou mít dobrý pocit, že jim čtení odsýpá. [Dagi](https://dagblog.cz/) se mě v [CZ Podcast ptal](https://soundcloud.com/czpodcast-1/cz-podcast-192-rekni-mi-co-ctes), o kolika knihách už jsem na blogu psal. Našel jsem [12 článků](/tag/kniha/), které se knihám věnují, a tímto přidávám další.

Nate Schutta ve své přednášce [Thinking Architecturally na Devoxx 2018]((/software%20development/2018/07/30/polsky-devoxx-2018.html#thinking-architecturally-nate-schutta)) říkal, že:

> Architekt je někdo, kdo dělá architektonické rozhodnutí.

Proto se nebojte, že by kniha *97 Things Every Software Architect Should Know* nebyla vhodná pro programátory, ba právě naopak. Nehodlám přežvýkat obsah celé knihy. Vyzobal jsem pár esejů a myšlenek, které jsem si odnesl, abych vás nalákal. Nejedná se o shrnutí kapitol. V knize jsou silnější i slabší kousky, i když tím neříkám, že ty, co nezmiňuji, nestojí za to číst. Prostě se nevešly do mého výběru.

<!--more-->

## Výběr esejů

#### 2. Simplify essential complexity; diminish accidental complexity (Neal Ford)

Dnešní řízení letového provozu je tak komplexní, že je obtížné až nemožné něco změnit. Je postavené na technologii staré víc jak třicet let.

#### 4. Communication is King; Clarity and Leadership its humble servants (Mark Richards)

Nikdo z vašeho týmu nebude číst stostránkový architektonický dokument.

#### 6. Seek the value in requested capabilities (Einar Landre)

Tohle je můj oblíbený příběh (knihu jsem četl už podruhé). Zadání bylo vyrobit bojový letoun dosahující rychlosti 2 až 2,5&nbsp;Ma, který by měl navíc být levný a lehký. Ovšem pro zdvojnásobení rychlosti je kvůli odporu vzduchu potřeba zečtyřnásobit sílu, což má dopad na hmotnost. Slepě neplnili požadavky a zeptali se, proč má být letadlo tak rychlé. Bylo to kvůli únikům z bitvy. Vznikl tak *F-16 Falcon* s dobrou manévrovatelností a zrychlením, nikoliv maximální rychlostí.

#### 8. Skyscrapers aren't scalable (Michael Nygard)

Hledáme různé analogie k softwarovému inženýrství a velmi často utíkáme ke stavebnímu inženýrství. Tento příběh je ukázkou toho, že přirovnání trochu kulhá. Ostatně mluvil o tom i [Franta Řezáč ve své přednášce Mosty, katastrofy a bytecode](https://youtu.be/-3BCl8DTd0U).

Nikdo nezačne stavět mrakodrap, aniž by věděl, jak má být vysoký. Přidání patra k již stojící budově je nákladné a riskantní, takže se tomu snaží vyhnout. Ani se nikdo nepokouší navrženou budovu přestěhovat (nechme stranou tanečky kolem Národní knihovny od Jana Kaplického).

Není snadné přidat dálniční pruh, ale zato jsme si zvykli, že je snadné přidat softwarovou funkčnost. To není chyba, ale fakt, s kterým pracujeme.

#### 10. Quantify (Keith Braithwaite)

*Rychlý* není požadavek. Tohle už mě kdysi naučil [Richard Šerý](https://twitter.com/richardsery), že je potřeba se ptát: Kolik? V jakém období? Jak často? V jakém poměru?... Cíl musí být měřitelný.

#### 19. Architects must be hands on (John Davies)

Architekt je jako pilot letadla. Nemusí být zaneprázdněný celou dobu, ale využívá desítky let praxe k tomu, aby sledoval situaci a případně okamžitě zasáhl, když zpozoruje něco mimořádného. Což bylo krásně vidět ve filmu [Sully: Zázrak na řece Hudson](https://www.csfd.cz/film/53975-sully-zazrak-na-rece-hudson/komentare/).

#### 22. Architectural Tradeoffs (Mark Richards)

Příběh pejska a kočičky kterak dělali dort je všeobecně známý. Když dáte spoustu dobrých věcí na jednu hromadu, nemusí to dopadnout dobře. Stejně to bylo v 17. století s [lodí Vasa](https://cs.wikipedia.org/wiki/Vasa), která se potopila hned po vyplutí z přístavu.

#### 24. Use uncertainty as a driver (Kevlin Henney)

Každá architektura je design, ale ne každý design je architektura. Architektura representuje klíčová designová rozhodnutí, která tvarují systém, přičemž klíčovost se měří cenou změny.

#### 26. Reuse is about people and education, not just architecture (Jeremy Meyer)

Sníme o znovupoužitelnosti, ale framework nebo systém budou používat lidé, kteří:

* vědí, že existuje
* vědí, jak ho použít
* jsou přesvědčení, že je lepší než to, co si udělají sami

#### 28. Get the 1000ft view (Erik Doernenburg)

Diagramy jsou pohled na krajinu z letadla ve výšce 10&nbsp;000 metrů. Zdrojový kód je pohled ze země. Chybí nám pohled mezi, z výšky 300 metrů.

#### 35. Warning, problems in mirror may be larger than they appear (Dave Quick)

Problémy, které se zpočátku zdály triviální, se později stanou kritickými, ale to už bude pozdě je opravovat. Nastavte si způsob jak spravovat rizika. Většina vývojářů jsou optimisté. Všichni máme slepé skvrny.

#### 37. Software architecture has ethical consequences (Michael Nygard)

Úspěšné programy ovlivňují životy tisíců a miliónů lidí. Jejich dopad může být pozitivní nebo negativní. Vyberete si snazší nebo obtížnější variantu? A ještě jednou si vzpomenu na Richarda Šerého, který se vždycky zajímal, kolik uživatelů vystupuje v dané scénáři.

#### 39. Context is King (Edward Garson)

Výběr konkrétní databáze obvykle není architektonicky významné rozhodnutí. Ovšem při vývoji tanku M1 Abrams to důležité bylo. Výstřel z kanónu způsobí tak silný elektromagnetický pulz, že to restartuje celý systém. Proto vybrali  InterBase, jelikož rychle nastartuje.

#### 52. Record your rationale (Timothy High)

Zapisujte si svá rozhodnutí, co jste zvažovali a proč jste se rozhodli zrovna takhle. Po roce si třeba sami nevzpomenete, případně ukážete nově příchozím.

#### 54. It is all about the data (Paul W. Homer)

Změnit chování programu není zase tak obtížné. Ale předělat datové struktury může vyžadovat hodně velké úsilí.

#### 57. Focus on Application Support and Maintenance (Mncedisi Mawabo Kasper)

Přes 80 &nbsp;% životního cyklu aplikace tvoří údržba. Měli byste na to při návrhu myslet. V produkci není žádný debugger.

#### 65. Your system is legacy, design for it. (Dave Anderson)

Přestože používáte nejnovější technologie, tak pro člověka, který přijde po vás, to bude *legacy* kód.

#### 67. Understand the impact of change (Doug Crawford)

Role architekta není nutně v tom, aby změnu řídil, ale spíš aby se ujistil, že změna je řiditelná.

#### 70. "Perfect" is the Enemy of "Good Enough" (Greg Nyberg.)

Architektura je nikdy nekončící činnost. Domenový model škemrá o to, abyste se na něj ještě jedou podívali, jestli nemůžete vytáhnout nějakou funkci nebo atribut do předka.

#### 71. Avoid "Good Ideas" (Greg Nyberg)

Cesta do pekel je dlážděná dobrými úmysly. Tady s autorem trochu nesouhlasím. Myslím si, že frameworky se upgradovat (s rozmyslem) musí. Jinak se můžete dostat do situace, kdy povýšit už nevyhnutelně potřebujete, ale ten krok už je na vás příliš velký.

#### 73. The Business Vs. The Angry Architect (Chad LaVigne)

Tady upomínka i pro mě: Pokud mluvíš ty, tak můžeš slyšet jen to, co už víš.

#### 76. A rose by any other name will end up as a cabbage (Sam Gardiner)

Název této eseje je moc pěkná slovní hříčka na Shakespeara, za domácí úkol zjistit původní znění (anglicky i česky).

Připomíná jednu ze dvou nejtěžších věcí, pojmenování. Nevíte-li, jak by se měla věc jmenovat, tak nemůžete vědět, co to je. Nevíte-li co to je, nemůžete to implementovat. `ClientBusinessObjects` je úžasně vágní, široké a zavádějící pojmenování.

#### 82. Your Customer is Not Your Customer (Eben Hewitt)

Zákazník vašeho zákazníka je váš zákazník! Osobně vyvíjím software pro banky, takže musím neustále myslet na koncové klienty banky.

#### 95. The Importance of Consommé (Eben Hewitt)

Tentokrát analogie z kulinářství. V jedné kuchařské škole testují vývar tak, že do misky hodí deseťák a když jste schopní přečíst datum ražby, tak jste prošli. Vaše architektura bude hotová, až bude čistá jako vývar.

## Závěr

Jestli chcete rozjet čtení u vás v týmu, nemusíte hned dokončit celou knihu. Vyberte si jeden, dva či tři eseje a proberte je spolu. Pak dejte vědět, jak to dopadlo.

{% twitter https://twitter.com/sw_samuraj/status/1088708564657549314 hide_thread=true %}

Jsem teď obklopený partou chytrých lidí, takže jsem v [letošním průzkumu Stack Overflow](https://stackoverflow.com/dev-survey/start) zaškrtl, že se cítím jako průměrný programátor. Když [SoftWare Samuraj](https://sw-samuraj.cz/) připomněl citát z knihy [Peopleware](https://www.goodreads.com/book/show/67825.Peopleware), tak bych to mohl přehodnotit. Čteme zhruba čtyři knihy ročně, teď zrovna knihu [The Design of Everyday Things (Donald A. Norman)](https://www.goodreads.com/book/show/840.The_Design_of_Everyday_Things), která se mi jeví jako pěkná návaznost na téma architektury. Ale o tom zase někdy příště.
