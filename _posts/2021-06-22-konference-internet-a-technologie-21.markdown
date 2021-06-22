---
layout: post
title:  "Konference Internet a Technologie (21)"
date:   2021-06-22
categories: [software development]
tags: [konference]
disqusId: 239
image: "/assets/2021-06-22/289283.png"
---

<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2021-06-22/289283.png" /></div>

[Konference](https://blog.zvestov.cz/tag/konference/) pokračují, covidu navzdory, alespoň online. Tentokrát přináším pár poznámek z konference 
[Internet a Technologie (21)](https://www.nic.cz/it21/) (ze dne 10. června 2021) věnované eIdentitám a autentizační službě mojeID. Za konferencí i za službou stojí sdružení CZ.NIC.

<div style="clear:both"></div>
<!--more-->

## mojeID

Jak ten čas letí. Služba [mojeID](https://www.mojeid.cz) pro správu internetové identity a možností přihlášení, je tu s námi již od roku 2010. Účet jsem si tam zřizoval dávno (už nedohledám kdy), ale nebyla pro mě moc zajímavá. Pro registraci a přihlášení do různých služeb jsem používal převážně svůj google účet. Což se výrazně změnilo s [eIdentitou](https://www.eidentita.cz), protože mojeID poskytuje prostředky pro elektronickou identifikaci s úrovní záruky „vysoká“.

O FIDO hardwarové klíči už jsem psal v [Cyb3r Days 2020](https://blog.zvestov.cz/software%20development/2020/11/16/cyb3r-days-2020.html#autentizační-metody-odolné-phishingu-michael-grafnetter). MojeID rozdávali hardwarové tokeny „zdarma“. Už jich je 25 tisíc aktivovaných, 5 tisíc zatím stále ne. V podmínkách bylo, že je aktivovat musíte, ale zatím to nevypadá, že by je po vás chtěli vracet.

MojeID mělo svoji mobilní autentizační aplikaci, ta už dožívá (nově ji nejde přidat, ale stále funguje). Ovšem [uvedli novou aplikaci MojeID Klíč pro dvoufaktorovou autentizaci](https://www.lupa.cz/aktuality/cz-nic-spustil-aplikaci-mojeid-klic-pro-dvoufaktorovou-autentizaci-k-mojeid/) od společnosti [Wultra](https://www.wultra.com/). Vřele doporučuji. Podle mě hlavní výhodou oproti hardwarovému tokenu [GoTrust Idem Key](https://www.czc.cz/gotrust-idem-key-usb-nfc-bezpecnostni-klic/306894/produkt) je v to, že vidíte, jaký požadavek autorizujete a jen slepě nepotvrzujete. Samozřejmě se sluší přiznat, že jsem zaujatý, protože s Petrem Dvořákem spolupracuji na realizaci jejich řešení v bankovním sektoru.

Kdo se těšil na nativní [FIDO](https://fidoalliance.org/) do všech mobilních operačních systémů, bude zklamán, jelikož Apple zatím nemá certifikaci a není jasné kdy a zda ji získá či jestli o ni vůbec požádá.

## eIdentita

Třeba někomu křivdím, ale české elektronické občanky jsem ze svého repertoáru vytěsnil. Manželka má občanku s čipem, netuší která bije (na úřadě prý „nějaký” pin zadávala, ale řekli jí, že je k ničemu). Protože jsem [praštěný z předchozích projektů](https://blog.zvestov.cz/software%20development/2015/12/15/jak-funguje-biometricky-pas.html), tak mám čtečku, což je podmínka nutná, nikoliv dostačující. Čtvrt hodiny (to není omezení mojí linky) stahuju 167 MB middleware (milé překvapení, že vůbec funguje na Macu), abych zjistil, že „IOK není inicializován”.

> S novými občankami je spojeno až šest různých číselných kódů (PINů).

[Jaké jsou a jak fungují nové elektronické občanky? (Lupa.cz, Jiří Peterka)](https://www.lupa.cz/clanky/jake-jsou-a-jak-funguji-nove-elektronicke-obcanky/)

Jak se kdo popasoval s eIdentitou? Pěknou zkušenost mám s [Úřadem pro civilní letectví](https://www.caa.cz), kde jsem jim tedy jednu chybku hlásil.

{% twitter https://twitter.com/banterCZ/status/1366673771655004160 %}

[Proč dochází k omezení v Nahlížení do katastru nemovitostí (Lupa.cz, Kamil Zmeškal)](https://www.lupa.cz/clanky/proc-dochazi-k-omezeni-v-nahlizeni-do-katastru-nemovitosti/). Nakonec asi i kvůli volbám politici couvli a zachovali i _CAPTCHA_. To je na delší debatu, ovšem přikláněl bych se pouze k eIdentitě (byť to má samozřejmě i nevýhody). Největší chybou byla pravděpodobně komunikace, chtělo to podobný článek publikovat v předstihu a zjednodušenou formu i v tisku pro laickou veřejnost. 

Abychom nečpěli síru jen na stav IT české veřejné správy, tak jsem nedávno kontaktoval [Das Bundesarchiv](https://www.bundesarchiv.de/) stylem: tisk PDF, podepsat, scan, poslat e-mailem. Nad eIDAS by jeden zaplakal.

## Bankovní identita

Nejspíš za tím stojí moje paranoia, ale chci mít oddělený účet a přístup ke státní správě. Vedli jsme o tom s kolegy vášnivé diskuse, že k bance člověk musí mít důvěru, když u nich má peníze nebo půjčku (to paradoxně vyžaduje ještě mnohem větší důvěru, nebo by alespoň mělo). V každé případě bych rád minimalizoval ztráty. Nicméně vzhledem k uživatelské nepřívětivosti občanek (viz předchozí odstavec) je bankovní identita pro mnoho uživatelů dostupná a srozumitelná varianta.

Zatím se zdá, že nefunguje pro všechny. [Bankovní identita je pro statisíce lidí nedosažitelná. Smůlu mají i Slováci (iDnes, paywall)](https://www.idnes.cz/ekonomika/domaci/bankovni-identita-cizinec-doklad-ockovani-premium-zpravodajstvi.A210609_202810_ekonomika_mato).

Můžete zkontrolovat, zda je mezi [zapojenými bankami](https://bankovni-identita.cz/banky-a-reseni/) i ta vaše.

## Letem světem elektronické identifikace

Pokud bych si měl z konference odnést jedinou věc, tak je to shrnutí Jiřího Peterky. Jeho články na Lupě jsou skvělé, i když tedy většinou vyžadují opakované hluboké čtení. 

[Prezentace Letem světem elektronické identifikace](https://www.slideshare.net/jiri.peterka/leterm-svtem-elektronick-identifikace)

Vypíchl by to, že česká eIdentita využívá nepřímý model identifikace, kdy IdP (Identity Provider) neví, kam se uživatel přihlašuje a SeP (Service Provider) neví, od jakého IdP uživatel přichází.

## eIDAS

Filip Bílek (MVČR) hovořil o tom, že v Česku je v současné době 3,73 milionu aktivních prostředků. Je s tím spokojen. Já tedy moc ne, přijde mi to pořád málo. Chystá se revize [nařízení Evropské unie eIDAS](https://cs.wikipedia.org/wiki/EIDAS). To mám tedy trochu v mlze. Ale údajně se během covidu ukázala slabá místa, na která by to snad mohlo reagovat. Řeč byla i o digitální peněžence, ne tedy na peníze, ale na atributy. Že byste v hospodě mohli prokazovat svůj věk. Budiž, ale nijak revoluční mi to nepřijde.

## iD Brána

Praktické použití elektronických podpisů je stále tristní. Otázka, zda za to můžou pouze občanky. Z projektu [iD Brána](https://www.idbrana.cz/) mám ambivalentní pocity. Na jednu stranu jsem rád, že někdo přijde z řešením, jak podepisovat dokumenty online i bez elektronického podpisu, úspěch jim přeju. Na druhou stranu jsem smutný z toho, že takový systémový nedostatek se řeší na úrovni komerčního produktu.

Ta analogie bude kulhat minimálně na jednu nohu, ale přesto si ji neodpustím. Obávám se, že založit společnost s ručením omezeným stále není otázkou pár kliknutí, ale bývalo i hůř. Pamatuji doby, kdy existovaly firmy, které zakládaly prázdné společnosti. Vy jste jen zaplatili a přejmenovali. Ušetřilo vám to čas a nervy. Ne že bych někomu nepřál vydělanou korunu, ale byl bych býval raději, kdyby úřední proces fungoval lépe a lidské úsilí jsme mohli upřít na užitečnější cíle.

## Závěr

Abych nekončil negativně. Podle mě eIdentita funguje. Bankovní identita ji může přiblížit běžným uživatelům. Já se je snažím držet oddělené. Elektronickou občanku ignoruju. Využívám mojeID se softwarovým a hardwarovým tokenem (ten se hodí i jinde). Elektronický styk je určitě kam posouvat.

## Související

- [Cyb3r Days 2020](https://blog.zvestov.cz/software%20development/2020/11/16/cyb3r-days-2020.html)
- [Jak funguje biometrický pas](https://blog.zvestov.cz/software%20development/2015/12/15/jak-funguje-biometricky-pas.html)