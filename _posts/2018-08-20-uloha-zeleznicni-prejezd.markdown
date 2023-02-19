---
layout: post
title:  "Úloha železniční přejezd"
date:   2018-08-20
categories: [software development]
disqusId: 205
image: "/assets/2018-08-20/prejezd_thumb.jpg"
tags: [kroužek programování, Meet Edison]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="/assets/2018-08-20/prejezd.jpg"><img src="/assets/2018-08-20/prejezd_thumb.jpg" /></a></div>Přes prázdniny mají učitelé nárok na zasloužený odpočinek, pokud ovšem někdo leží v přípravách, tak se mu může hodit úloha **železniční přejezd** z kroužku programování za použití robotů [Meet Edison](https://meetedison.com/). Roboty jsem představoval v příspěvku [Hodina kódu s LightBot a Meet Edison](/software%20development/2017/12/11/hodina-kodu-s-lightbot-a-edison.html), kde jsem si pochvaloval dostatek didaktických materiálů, ale dnes už mi přijde, že tam chybí zajímavé a složitější úlohy. Ty je nejspíš potřeba si vymyslet. S touto úlohou přišel Martin Javorek na svém twitterovém účtu [@programohrajeme](https://twitter.com/programohrajeme). Jeho varianta je složitější, využívá Python. Já jsem si ji zjednodušil pro menší děti, abych si vystačil jen s vizuálním „kostkovým“ jazykem.

<div style="clear:both"></div>
<!--more-->

## Jak funguje železniční přejezd

Po tragédii na železničním přejezdu ve Studénce jsem narazil na tento [článek, který vysvětluje, jak fungují železniční přejezdy](http://www.machinegun.cz/o-zeleznicnich-prejezdech/). Dozvíte se tam třeba, proč je v [§ 29 odst. 1 písm. c) zákona č. 361/2000 Sb. o provozu na pozemních komunikacích](https://www.zakonyprolidi.cz/cs/2000-361#p29-1-c) ustanoveno:

> Řidič nesmí vjíždět na železniční přejezd, sklápějí-li se, jsou-li sklopeny nebo zdvihají-li se závory.

Pro naši potřebu si úlohu ovšem značně zjednodušíme.

## Zadání

Naprogramujte chráněný železniční přejezd. Závory se sklopí, když se vlak dostane do *přibližovacího úseku*. Zdvihnou se, jakmile vjede do *anulačního obvodu*. Anulační obvod se spouští projetím lokomotivy, musí proto být dostatečně daleko od závor (na kontrolu projetí posledního vagonu byste potřebovali Python, jedná se o složitější úlohu). Po dobu zdvíhání a sklápění budou závory vydávat akustický a světelný výstražný signál. Uvažujte pouze jednosměrný provoz. Programujte v prostředí [EdBlock](https://www.edblocksapp.com/)

{% twitter https://twitter.com/programohrajeme/status/968045558186246144 hide_thread=true %}

## Pro koho je úloha určená

Úlohu zvládnou děti od sedmi let. Předpokládám, že už umí základy práce s robotem Meet Edison a dokáží postavit jednoduché věci z lega. Jsou potřeba základní znalosti programování, zejména koncept *opakuj* a *posílání zpráv* (to lze probrat v rámci této úlohy). Úlohu lze za výrazné pomoci lektora zvládnout za 60 minut. Pokud by to měli řešit jako problém, tedy na řešení přijít co nejvíc sami, bylo by potřeba času mnohem víc.

## Potřeby

* robot Meet Edison, 3 kusy
* vláčkodráha
* mašinka (nemusí být nutně s pohonem) s vagony
* libovolné lego technic na sestavení závory a podložení robotů do správné výšky

## Řešení

Uvádím řešení v prostředí [EdBlock](https://www.edblocksapp.com/). Pro každou komponentu (přibližovací úsek, závory a anulační obvod) budete potřebovat samostatného robota. Doporučuji rozlišit si přibližovací úsek a anulační bod barevnou kostičkou, abyste pak pracně nehledali záměnu.

### Přibližovací úsek

Přibližovací úsek po projetí vlaku pošle zprávu přes infračervené rozhraní. Spouštěčem zprávy bude detekce překážky. Potřebujeme, aby se pro vlakovou soupravu poslala pouze jediná zpráva, takže po odeslání vložíme adekvátní pauzu. Pro potřeby ladění si můžeme rozsvítit LEDky. Navrhuji rozsvítit, pokud je přibližovací úsek připravený poslat zprávu. Po odeslání, když čeká, zhasne. Vše se opakuje v nekonečné smyčce.

![](/assets/2018-08-20/priblizovaci_usek.png)

### Závory

Závory čekají na zprávu z přibližovacího úseku nebo anulačního obvodu. Nekontrolují, zda jim nějaká zpráva přišla víckrát. Během zdvihání i sklápění blikají a pípají. Je potřeba odladit velikost kroku a počet opakování.

![](/assets/2018-08-20/zavory.png)

### Anulační obvod

Anulační obvod funguje úplně stejně jako přibližovací úsek. Spouštěčem je opět detekce překážky, tedy lokomotiva, nepočítáme poslední vagon soupravy. Jediný, ale podstatný, rozdíl je v tom, že pošle jinou zprávu, aby je závory dokázaly rozlišit.

![](/assets/2018-08-20/anulacni_obvod.png)

## Problémy

Při realizaci jsem narazil na dva drobné technické problémy. Za prvé jsem musel řešení zjednodušit více, než jsem chtěl, jelikož mi výrazové prostředky vizuálního jazyka nedovolily blikat a pípat i se spuštěnými závorami (respektive, aby pak byly schopné reagovat na zprávu o zvednutí). Pokud se vám někomu podaří vylepšit, budu rád za zpětnou vazbu. Za druhé jsme museli řešit to, že sklápění závory nemůže být na stejný počet kroků, jelikož dlouhá a těžká závora motor převažuje a asi o kousek přeskočí (stačí ubrat kroky).

Kromě technického problému jsem řešil i ten didaktický. Na kroužku jsem měl zhruba osm dětí a jen tři roboty, tudíž jsem potřeboval, aby pracovali v kolektivu, nikoliv samostatně. Což nemusí být naškodu, ostatně Mitchel Resnick v knize [Lifelong Kindergarten](https://www.goodreads.com/book/show/34889378-lifelong-kindergarten) prosazuje princip 4P (Projects, Passion, Peers, and Play; tedy projekty, vášeň, parťáci a hra). Nicméně kromě technické části pak potřebujete sledovat dynamiku skupiny a kromě implementačních rad případně korigovat i chování jednotlivců, které nevede ke zdárnému konci.

## Související

* [Konference učIT jinak](/software%20development/2018/05/15/konference-ucIT-jinak.html)
* [Hodina kódu s LightBot a Meet Edison](/software%20development/2017/12/11/hodina-kodu-s-lightbot-a-edison.html)
