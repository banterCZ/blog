---
layout: post
title:  "Svoboda výběru technologií"
date:   2020-08-20
categories: [software development]
disqusId: 228
image: "https://live.staticflickr.com/5023/5653863096_7ae3db51ce_c_d.jpg"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><a href="https://www.flickr.com/photos/fdecomite/5653863096"><img src="https://live.staticflickr.com/5023/5653863096_7ae3db51ce_q_d.jpg" /></a><br /><a href="https://www.flickr.com/photos/fdecomite//">fdecomite </a><br />(<a href="https://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>)</div>

Tento měsíc nějak selhal můj redakční plán. Neměl jsem jasné téma. Samozřejmě na seznamu čekají překlady, ale tentokrát to nějak vázne s povolením. Trn z paty mi vytrhl [tweet o tom, zda si tým může vybrat libovolnou technologii](https://twitter.com/ph1/status/1293646200944508930), jehož autor sáhl po analogii ze strojního inženýrství, že by si část vybrala bit [PH (Phillips)](https://en.wikipedia.org/wiki/List_of_screw_drives#Phillips) a část [inbus](https://en.wikipedia.org/wiki/List_of_screw_drives#Hex).

<div style="clear:both"></div>
<!--more-->

Na jOpenSpace 2018 František Řezáč ve své přednášce [Mosty, katastrofy a bytecode](https://youtu.be/-3BCl8DTd0U) tvrdil, že je v pořádku inspirovat se z jiných oborů, ale že používání příměrů je zrádné. Ale co už. Analogie jsou zajímavé, jen je člověk nemůže brát doslova. Mnohokrát jsem pro srovnání utekl ke stavebnictví či k armádě, tentokrát však sáhnu opět po strojírenství.

## Strojírenství

{% twitter https://twitter.com/ph1/status/1293646200944508930 %}

Zůstaňme u počáteční analogie:

> Pokud každému produktovému týmu dovolíte vybrat si druh šroubu, můžete skončit tak, že polovina bude používat PH (Phillips) a polovina inbus.
> To znamená, že každý člen infrastrukturního týmu s sebou bude muset nosit oba šroubováky.

Reagoval jsem tak, že PH bit je překonaný. Dalo by se říct že starší a horší. Proč by někdo volil starší a horší technologii? Například se vám snadno může stát, že strhnete hlavu šroubu. Vystavíte se takovému riziku?

Dostalo se mi zajímavé odpovědi, nad kterou doposud přemýšlím:

> Existuje víc lidí s PH šroubovákem, kteří dokáží dotáhnout šroub. Najal bys někoho, kdo nemá oba šroubováky, PH a inbus?

Ještě doplním svoje kutilské postřehy. Velmi jsem si oblíbil [torx](https://en.wikipedia.org/wiki/Torx), jedna z jeho výhod je, že nasazení bitu je výrazně rychlejší, což se velmi hodí v automatickém provozu. Myslím, že to je hlavní důvod toho, proč například Apple mění bity (nemám po ruce zdroj), protože každá ušetřená milisekunda se v masivní výrobě rovná obrovské úspoře z rozsahu. Nedělají to, podle mě, proto aby kutilům házeli klacky pod nohy. To lze udělat i jinak, bity si vždycky koupíte.

I když troška pravdy v tom bude. Podívejte se na [bit SP](https://bity.heureka.cz/bit-sp8-narex/), se kterým se například setkáte na elektrospotřebičích. Je podobný [bitu spanner](https://en.wikipedia.org/wiki/List_of_screw_drives#Spanner), který (podle Wikipedie) najdete na útočné pušce M17 a M18, kde značí, že dané části jsou mimo obvyklou rozborku/sborku na bitevním poli. To se mi jeví jako velmi prozíravé řešení ve světle zkušenosti mého kamaráda, kterému se podařilo rozvrtat si svoji stativovou hlavu, jelikož části, do kterých se neměl hrabat, byly popsané pouze v manuálu, ovšem měly stejné bity (dokonce byl takový šroubovák přiložen).

Vraťme se k torxu. V mém voze Ford Fiesta (rok výroby 2004) je nutné pro výměnu žárovky předního světlometu uvolnit jeden šroub právě s hlavou torx. Jistě, takovou opravu neděláte každý den (proto speciální šroubovák nevozím), ale párkrát za život ano. A život mě naučil, že v nouzi na torx stačí vhodná velikost [plochého šroubováku](https://en.wikipedia.org/wiki/List_of_screw_drives#Slot) (jasně, hrozí stržení hlavy, ztrácíte výhodu rozložení síly) a že ta vhodná velikost je zrovna šroubovák na švýcarském noži, který s sebou neustále nosím.

## Softwarové inženýrství

A jak tohle všechno souvisí se softwarovým inženýrstvím?

Mikroslužbám nijak zvlášť neholduju, dalo by se říct, že možná proto, že je pořádně neumím, ale snad se lze vymluvit na to, že do [produktové firmy úplně nepasují](/software%20development/2020/05/30/uskali-produktove-firmy.html), nicméně jako jednu z jejich výhod jsem chápal, že pokud zachováte dané rozhraní (například REST) a definovaný kontrakt, tak je jedno, že služba je napsaná třeba v Erlangu a její konzument klidně v Perlu. Druhá věc je, zda to dává smysl z pohledu firmy. Dagi v [CZ Podcastu](https://soundcloud.com/czpodcast-1) (přesnou epizodu si nevzpomenu) mluvil o své zkušenosti z GoodData, kde se jim to rozrostlo v rozsáhlý cirkus, do kterého nesnadno hledají členy a vzájemná zastupitelnost je omezená. A to je právě otázka úvodního tweetu. Jestli by měla existovat volnost a kde by měla případně končit.

Nebo jiný případ, nad kterým v současné době přemýšlím mnohem víc. PH versus inbus, Maven versus Gradle. Řekněme, že Maven je PH bit, který má v kapse každý programátor. Má to svoje nevýhody, například to, že [paralelní build je stále experimentální](https://cwiki.apache.org/confluence/display/MAVEN/Parallel+builds+in+Maven+3) (mnoho pluginů podporu vůbec nemá) a dnešní serverové stroje, kde už se snáz dostanete k více jádrům, tak plně nevyužijete. Může si tým vybrat Gradle? Když budou ve firmě oba nástroje, najal bych někoho, kdo Gradle neumí? Já ano. Myslím, že se to doučí. A co stávající členové ostatních týmů? Ti se to samozřejmě také doučí, ale stojí to firmě za to? Má nové šrouby dávat do nových výrobků nebo nahradit i na existujících výrobcích?

## Závěr

Udělalo mi to dobře, číst si chvíli něco o šroubech, ale aby myšlenka měla nějaký závěr. Můžou týmy sáhnout po technologii podle svého výběru? Nejlepší je na to asi klasická konzultantská odpověď: „To záleží!“ Každý si na ní musí odpovědět sám. Proč jinak by stále existoval PH bit, byť se ho snažili vylepšit na [PZ](https://en.wikipedia.org/wiki/List_of_screw_drives#Pozidriv) a možná i usnadnit přechod, protože když [máte v kapse PH, můžete ho na PZ použít (ale ne úplně bez komplikací](https://www.finehomebuilding.com/2015/09/16/what-is-the-difference-screw-bits-phillips-vs-pozidriv)). Zkuste si doma něco rozebrat a schválně pozorujte, zda je v celém výrobku použitý jediný typ hlavy šrouby (nehledě na velikost).

## Související

- [Repair Manifesto](https://www.ifixit.com/Manifesto)
- [Přípravek](/software%20development/2020/01/13/pripravek.html)
- [Zpětná kompatibilita](/software%20development/2019/12/09/zpetna-kompatibilita.html)
- [Úskalí produktové firmy](/software%20development/2020/05/30/uskali-produktove-firmy.html)
- [Stavebnictví versus softwarové inženýrství](/software%20development/2013/10/11/stavebnictvi-versus-softwarove-inzenyrstvi.html)
- [Co se firmy můžou přiučit od armády](/software%20development/2012/12/15/co-se-firmy-muzou-priucit-od-armady.html)
- [Co se firmy můžou přiučit od armády 2](/software%20development/2013/12/18/co-se-firmy-muzou-priucit-od-armady-2.html)
