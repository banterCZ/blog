---
layout: post
title:  "Otázky u pohovoru"
date:   2012-11-14
categories: [software development]
item: 114
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://www.flickr.com/photos/bantercz/6539198603/in/photostream"><img src="http://farm8.staticflickr.com/7164/6539198603_c38604cb89_m.jpg" /></a></div>Jsou firmy, kde vás u pohovoru budou dusit na asymptotické složitosti (ještě bych to tak chápal u <a href="/item/106">přijímacího pohovoru do Googlu</a>) a to jen proto, aby vás pak mohli posadit k aplikaci prošpikované SQL injection. <a href="http://www.sw-samuraj.cz/2012/11/jak-delam-java-pohovor.html">Guido psal o tom, jak dělá pohovor</a> on. Kromě toho, že budete vyžadovat dodržování <a href="/item/109">Listiny základních programátorských práv</a>, bych se chtěl víc zaměřit na vaše, kandidátovy, otázky. Chystáte se do rovnocenného vztahu, takže si zaměstnavatele pořádně proklepněte. Steve Biddulph v <a href="http://www.kosmas.cz/detail.asp?cislo=164279&amp;afil=1102">Knize o mužství napsal</a>:
<div style="clear:both"></div>
> Někteří lidé nemají na výběr. Mají mizernou a špatně placenou práci a s tím, co za ni dostanou, sotva vyjdou. Takových lidí však není mnoho a
 vy k nim pravděpodobně nepatříte. Jste vzdělaní a sečtělí, takže si můžete vybírat.
<!--more-->

Automatické testy
------
Sice jste v komentářích v článku <a href="http://blog.zvestov.cz/item/112">Jak přesvědčit, že je správné psát testy</a> tvrdili, že testy jsou v každé firmě samozřejmost, ale pojďme si zrovna na nich ukázat, jak se ptát. Především klaďte otevřené otázky, tedy takové, na které nelze odpovědět pouze ano/ne.

Špatně:

>Píšete automatické testy?

Lépe:

> Jaké máte pokrytí automatickými testy?

Lákavá odpověď:
> Padesát procent, ale pracujeme na zlepšení, naším cílem je sedmdesátiprocentní pokrytí. Pochopitelně nás víc zajímá branch coverage než line 
coverage.

Nikdy jsem si nemyslel, že budu někoho od psaní testů odrazovat. Pokud ovšem někdo tvrdí, že chtějí čí mají stoprocentní pokrytí, tak to taky smrdí.

Kolik dělají programátoři za rok přesčasů
------
Je jasné, že v případě releasů zůstanete přes čas, ale celý rok se sprintovat nedá. Ne nadarmo extrémní programování radí dodržovat 40&nbsp;hodinový pracovní týden. I lidová moudrost praví: „Ráno moudřejší večera.“

Co používáte za build server
------
Až příliš konkrétní otázka, že? Vtip je v tom, že mi vůbec nejde o to, zda Losňu nebo Mažňáka, ani zda TeamCity nebo Jenkins. Tuto otázku jsem položil i technickému řediteli jedné finanční instituce (jméno si už ani nepamatuji). V inzerátu se chvástali, jak jsou agilní, tak jsem to zkusil. Odpovědí mi bylo: „Ehm, co to je build server?“. Rozpačitě jsem reagoval: „Takže vy buildíte z workspacu?“ A bylo vymalováno.

Jak často děláte usability testy
------
Určení správné četnosti uživatelských testů nechám na vás, stejně tak jakou jim přikládáte váhu. Já to beru jako indikátor vyspělosti firmy.

Můžu vidět nějaký váš wireframe
------
Nemusíte se jen ptát, nechte si i něco ukázat. Firma, kde se nekreslí wireframy, může mít problém se srozumitelností zadání.

Ukažte mi kód, na který jste nejvíce hrdí
------
{% twitter https://twitter.com/rdresler/status/268722475049820161 %}

Jak si firmu prověřujete vy? A jaké kladete otázky?