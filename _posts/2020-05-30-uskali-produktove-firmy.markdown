---
layout: post
title:  "Úskalí produktové firmy"
date:   2020-05-30
categories: [software development]
disqusId: 226
image: "https://live.staticflickr.com/1838/42908057945_5c2b3f97ac_z.jpg"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><a href="https://www.flickr.com/photos/brickbroadcasting/42908057945"><img src="https://live.staticflickr.com/1838/42908057945_5c2b3f97ac_q.jpg" /></a><br /><a href="https://www.flickr.com/photos/brickbroadcasting/">Brick Broadcasting </a><br />(<a href="https://creativecommons.org/licenses/by-nc/2.0/">CC BY-NC 2.0</a>)</div>

Už jsem se věnoval srovnání [servisní a produktové firmy](https://blog.zvestov.cz/software%20development/2019/10/22/servisni-versus-produktova-firma.html). Nastínil jsem, že jedno z úskalí, kterému produktová firma čelí, je [zpětná kompatibilita](https://blog.zvestov.cz/software%20development/2019/12/09/zpetna-kompatibilita.html). Ovšem řeší jiné, mnohdy důležitější, problémy. Tak jako ostatní články i tento píšu rovněž pro sebe, abych si srovnal myšlenky a jednotlivá úskalí pojmenoval. Nevyhnu se tomu, abych se k rozdílu servisní a produktové firmy ještě nevrátil.

<div style="clear:both"></div>
<!--more-->

## Ohlasy

Začnu ohlasy, které srovnání servisní a produktové firmy, respektive jejich přerod, vyvolal. [Pavel Müller, v reakci na můj předchozí příspěvek, napsal](https://www.linkedin.com/feed/update/urn:li:activity:6592625791421427712?commentUrn=urn%3Ali%3Acomment%3A%28activity%3A6592625791421427712%2C6592684274346938368%29)

> Můj závěr ale je, že se servisní firma nedá transformovat na produktovou. Pro podnikatele je podle mě lepší založit komplet novou firmu a chovat se v ní jako investor, byť peníze pochází z výnosů původní servisní firmy.

## Produktová firma

V servisní firmě je zákazník vaším pánem. V produktové taky, ale tam potřebujete vyvažovat pohledem produktu, který má nějaký plán či jízdní řád, a slouží i jiným zákazníkům.

Abych citoval [Petra Dvořáka](https://twitter.com/joshis_tweets) z [Wultra](https://www.wultra.com/).

> „Jak dělat produktový vývoj agilně v kontextu dodávek produktu ke koncovým zákazníkům?“ je z kategorie otázek za milion.

Strhla se kolem toho [diskuze](https://twitter.com/banterCZ/status/1260156017121378304). Samotnému mi vadí, že slovo _agilní_ devalvovalo, ale znal jsem kontext tohoto citátu, tady konkrétně _pružná reakce na změnový požadavek_. U velkých produktových molochů nemáte moc šanci něco ovlivnit. Menší firmy v tomto můžou mít konkurenční výhodu, ale vocaď pocaď. Někde si ty hranice neumí nastavit a pak je obhájit, protože to drhne.

A ještě vypíchnu jednu citaci, která věc dovysvětlovala:

> Konkrétně: Často potkáváme situaci, kdy po nás klient chce změnu, která sama o sobě vlastně zabere třeba 5 dní práce. Jenže nám přišla měsíc před vydáním produktového release, který vydáváme po 6 měsících, a tak klienta „zazdíme“ větou: „Za 7 měsíců vám to dodáme jak na koni...“

Když to dokážete ukočírovat, získáte nezměrné výhody. Zvládnete zákazníkovi neustále dodávat (jak obchodně, tak i reálně) nové verze s funkčnostmi, které implementačně vznikly, aby pokryly potřebu jiného zákazníka.

Na menši dodavatele může být vyvíjen větší tlak, aby udělali nějakou výjimku. Ve firmě 37 Signals šli tak daleko, nebo to alespoň v knize [It Doesn't Have to Be Crazy at Work](https://blog.zvestov.cz/software%20development/2019/10/01/doesnt-have-be-crazy-work) píšou, že zavedli paušální platbu a ne částku za uživatele, aby na ně velcí zákazníci neměli takovou páku.

## Dokumentaristi

Dokumentace mnohdy bývá popelkou. Servisní firma to dokáže možná překlepat, ale v produktové se vám problém vyjeví v celé síle. Bez kvalitní dokumentace jste zahlceni dotazy, které by bývaly mohly být zodpovězeny dokumentací, což vám zabere čas na nový vývoj.

Doporučím starší rozhovor [Meet Anna, the documentation team lead for IntelliJ IDEA](https://blog.jetbrains.com/team/2018/01/22/meet-anna-the-documentation-team-lead-for-intellij-idea/).

> V mnoha firmách je bohužel dokumentace stále psaná jen proto, že se očekává, že ji zákazník dostane. Ve skutečnosti se nikdo nezastaví a nezamyslí, pro koho ji píšou a jaké byznysové problémy řeší.

Kdo by se tak dokázal zamyslet? Podle mě je chyba dokumentaci (nemluvím o javadocu) svěřovat programátorům. Kompetencí dokumentaristy je znalost jazyka a uživatelská znalost (ne na úrovni kódu, ale domény). Raději než absolventa technické školy bych vzal někoho z [filologie](https://cs.wikipedia.org/wiki/Filologie).

[Závěr 208. dílu CZ Podcastu](https://soundcloud.com/czpodcast-1/cz-podcast-208-skoleni-dokumentace#t=58:33), kde byli jako hosté Radim Šnajdr a Vilém Vatrt z [Quadientu](http://quadient.cz/), si nechám zarámovat.

> Poměr, který více méně dodržujeme, je deset vývojářů ku jednomu dokumentaristovi.

## Logování a podpora

S logováním je to obdobné jako s dokumentací. Logujete-li špatně, trávíte čas dotazy a dohledáváním, což vás obírá o prostor, který jste mohli věnovat rozvoji produktu.

Tady bych se pozastavil u [úrovně podpory](https://en.wikipedia.org/wiki/Technical_support#Multi-tiered_technical_support), které chápu následovně:

* **L1** - dokáže restartovat server, najít logy, vyřešit běžné problémy
* **L2** - zvládne konfigurovat systém podle příručky a upravit pro byznysové potřeby (napsat makro, plugin...)
* **L3** - průzkum až na úrovni zdrojových kódů a jejich případnou opravu

Jako servisní firma pravděpodobně řešení provozujete sami. Jako produktová firma nejspíš ne, ideálně je mezi vámi a zákazníkem ještě partner. Podpora L1 je nejspíš zákazník, L2 partner a L3 vy jako produktová firma (nebude to mít takto ostrou hranici, může se prolínat). K rukám L3 se dostanou jen kusy logu a vy z těch střípků máte něco vyřešit. Nehledě na to, že bez kvalitní dokumentace a logů padá na L3 příliš mnoho věcí.

Z knihy [Monolith to Microservice (Sam Newman)](https://www.goodreads.com/review/show/3195806364?book_show_action=false&from_review_page=1), [zdarma dostupné na nginx.com](https://www.nginx.com/resources/library/monolith-to-microservices/), bych chtěl zdůraznit dvě myšlenky týkající se situace produktové firmy, kterou mikroslužby ještě zhorší.

1. Nemůžete očekávat, že zákazníci mají schopnosti nebo dostupnou platformu, aby provozovali vaši architekturu mikroslužeb.  A i kdyby měli, nemusí to být to samé, co vyžadujete.
2. Pokud s mikroslužbami začínáte, nemějte obavu o to, jak velké mají být. Zaměřte se na to, kolik jich dokážete zvládnout a jak mají definované hranice.

## Závěr

Kdo čekal nějaký návod, bude zklamaný. Kdo se chystá začít s produktovou firmou, vidí, co ho čeká. Já si zopakoval, že v těchto čtyřech oblastech (zpětná kompatibilita, dokumentace, logování a správa požadavků) vidím zdroj potíží, které je potřeba řešit. 

## Související

- [Servisní versus produktová firma](https://blog.zvestov.cz/software%20development/2019/10/22/servisni-versus-produktova-firma.html)
- [Zpětná kompatibilita](https://blog.zvestov.cz/software%20development/2019/12/09/zpetna-kompatibilita.html)