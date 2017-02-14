---
layout: post
title:  "Jak přesvědčit, že je správné psát testy"
date:   2012-10-25
categories: [software development]
disqusId: 112
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://www.flickr.com/photos/bantercz/8094597899/in/photostream"><img src="https://farm9.staticflickr.com/8193/8094597899_b8db71f99b_m.jpg" /></a></div>Smutné je, že na téma – jak přesvědčit o správnosti psaní testů – mám vůbec příležitost něco napsat. V ideálním světě by unit testy byly nedílnou součástí vývoje software. Bohužel jsou stále vnímány jako agilní a ne všechny týmy a ne všechny projekty unit testování aplikují. Dokonce ani na kritických systémech, ty pak vypadají jako věž na obrázku. No řekněte, chtěli byste na ni přidat nějakou kostku? Naštěstí je tu dost entuziastů, kteří ovšem při přesvědčování ostatních mnohdy narážejí na zeď. Podělím se o několik argumentů, které používám já. Na každou skupinu zabere  něco jiného. <a href="/item/107">Nejsnazší je to se začátečníky</a>, se starými psy je to (v korporátní mluvě) výzva a občas musíte přesvědčovat i management.
<!--more-->

<div style="clear: both"></div>

Kolečko na křečka
------

Následující obrázek pochází z knihy <a href="http://amzn.to/TyHvC3">Test Driven Development: By Example</a>, kde Kent Beck na názorném příkladu ukazuje, jak díky testům s jistotou ověřili, zda daný finanční systém bude možné bez problémů rozšířit o podporu různých měn. 

![](/assets/2012-10-25/20121025-kolecko_na_krecka.png)

Obrázek ukazuje zápornou zpětnou vazbu mezi stresem a psaním testů a mezi psaním testů a vzniku chyb. Oproti tomu mezi počtem chyb a stresem je kladná zpětná vazba. To znamená, že čím víc jste ve stresu, tím méně píšete testy. A čím méně píšete testy, tím více děláte chyb. No a čím více chybujete, tím ve větším stresu jste. Prostě kolečko na křečka. Přitom testy by vás nechaly vydechnout.

Litanie proti strachu
------

Strach paralyzuje; testy slouží ke zbavení strachu. Jak chcete jinak zasahovat do kódu, když nemáte testy? Buď se tedy nebojíte, nebo jste hazardéři. V knize Duna (Frank Herbert), případně ve stejnojmenném <a href="http://www.csfd.cz/film/6250-duna/">filmu</a> (mimochodem jeden z nejsrozumitelnějších od Davida Lynche), je silní scéna, kdy Paul Atreid unikne smrti, protože překoná svůj strach. Pomůže mu odříkat litanii proti strachu:

> Nesmím se bát. Strach zabíjí myšlení. Strach je malá smrt, přinášející naprosté vyhlazení. Budu svému strachu čelit. Dovolím mu, aby prošel 
kolem mne a skrze mne. A až projde a zmizí, otočím se a podívám se, kudy šel. Tam, kam strach odešel, nic nebude. Zůstanu pouze já.

Vaší litanií budou právě testy.

Doktoři si myjí ruce
------

<div style="float: left; margin: 2em 1em 1em 0em; text-align: center;"><a href="http://www.flickr.com/photos/ex_magician/2538223777/"><img src="https://farm3.staticflickr.com/2412/2538223777_14c7824f02_m.jpg" /></a><br/><a href="http://www.flickr.com/photos/ex_magician/2538223777/">ex_magician CC BY 2.0</a></div>
Považujeme za samozřejmé, že si lékaři myjí ruce, ale ne vždy tomu tak bylo. Behaviorální ekonom Steven D. Levitt ve své knize <a href="http://amzn.to/S41pBZ">Super Freakonomics</a> popisuje příběh <a href="http://cs.wikipedia.org/wiki/Hore%C4%8Dka_omladnic">horečky omladnic</a>. V současné době zemře při porodu 9&nbsp;matek&nbsp;ze&nbsp;100&nbsp;000. Kolem roku 1846 ve Všeobecné vídeňské nemocnici zemřela 1 ze 6 zdravých rodiček, víc než dvakrát tolik co doma za přítomnosti porodní báby. Nejčastější příčinou byla právě horečka omladnic. Ignác Filip Semmelweis, kterého ho nakonec propustili, objevil souvislost mezi nemocí a mytím rukou. Doktoři se nikdy nenakazili, až jednou jeden student řízl profesora, který následně zemřel s projevy horečky omladnic.

Takže až po vás někdo bude chtít, abyste nepsali testy, protože tím ušetříte čas, tak se ho zeptejte, zda by rovněž žádal lékaře, aby si před zákrokem nemyl ruce. Ušetří přeci čas.

Závěr
------

Nestačí o testech jen mluvit, musíte taky nějaké napsat. Nejspíš budete narážet na výmluvy typu: Nemáme čas. Skutečná příčina však může být v 
tom, že se programátoři bojí přiznat, že psát testy neumí. To je ideální příležitost pro párové programování, při kterém je to můžete naučit. Držte se parafrázované myšlenky Jana Amose Komenského (Toulky českou minulostí, díl číslo 444):

> Co můžeš, udělej sám a neodkládej to na jiné. Sám se snaž, sám usiluj a bude-li tvé dílo dobré, ostatní ti pomohou.

A jak prosazujete testy vy? Vypadá vaše aplikace jako stabilnější věž z kostek?

<div style="text-align: center;"><a href="http://www.flickr.com/photos/bantercz/8094597571/in/photostream"><img src="https://farm9.staticflickr.com/8051/8094597571_2692911b6a_n.jpg" /></a></div>