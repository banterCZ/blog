---
layout: post
title:  "Skrytý poklad nahlížení do katastru"
date:   2024-09-11
categories: [bydlení]
disqusId: 271
image: "/assets/2024-09-11/120607.png"
tags: [státní správa]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2024-09-11/120607.png" /></div>

Abych nebyl jen negativní a nepsal pouze o [námitkách ohledně elektronických přihlášek na střední](/software%20development/2024/02/26/elektronicke-prijimacky-na-stredni.html) nebo se vyjadřoval k novému stavebnímu řízení (obecně vítám, proces provedení by šlo kritizovat), tak bych tentokrát pro změnu raději chválil a poodkryl skryté poklady státní správy.
Český katastr nemovitostí i obchodní a živnostenský rejstřík v našem českém rozsahu a přístupnosti shledávám, i ve světovém srovnání, jako věc nevídanou.
[Nahlížení do katastru nemovitostí na adrese https://nahlizenidokn.cuzk.cz](https://nahlizenidokn.cuzk.cz/) jistě znáte a vlastně si nedokážu představit, že by někdo alespoň jednou v životě nepoužil (i když možná jsem příliš uzavřen do své bubliny).
Každopádně bych vám chtěl ukázat, jak získat víc informací, než jen jakou má nemovitost výměru a komu patří.
Lze zjistit, od koho ji kdo dostal nebo koupil a dokonce za kolik.
Jen je to pro běžného člověka trochu neintuitivní, tak to alespoň vydá na článek. 

<div style="clear:both"></div>
<!--more-->


## Úvod

Jak jsem již uvedl, máme mocný nástroj nahlížení do katastru nemovitostí.
Klaďme si filozofickou otázku (na kterou zde nebudu odpovídat), zda je to přiměřený zásah do soukromí v porovnání se společenským přínosem.
Někdo možná pamatujete, že jste nemuseli opisovat _captcha_ nebo se dokonce přihlašovat identitou občana, přičemž původně měly být plné detaily dostupné pouze po přihlášení, ale kompromisní varianta nakonec zobrazuje část informací pouze po zadání _captcha_.
[Pro Lupa.cz odůvodnil Kamil Zmeškal z ČÚZK.](https://www.lupa.cz/clanky/proc-dochazi-k-omezeni-v-nahlizeni-do-katastru-nemovitosti/)

Český právní řád vám umožňuje nahlížet do různých písemností, včetně nabývacích titulů k nemovitostem, kde bývá i cena a spoustu osobních údajů.
Proč by slušný člověk měl vůbec mít takové šmírácké choutky?
Dovolte mi to vysvětlit na mých dvou případech použití.

Pravidelný čtenář ví, že jsem procitl a [začal se alespoň trochu věnovat zemědělské půdě](/bydlen%C3%AD/2020/04/27/jak-jsem-zatim-nezalesnil-pozemky.html).
Od té doby sleduji nabídky realit.
Ve stručnosti, je to hrůza.
Předražené ([průměrná tržní cena zemědělské půdy za rok 2023 byla 34,4 Kč/m²](https://www.farmy.cz/download/zpravy_o_trhu/ZPRAVA-o-trhu-s-pudou-FARMYCZ-leden-2024.pdf)),
rozdrobené na nesmyslné podíly, s nevýhodnými dlouhodobými pachtovními smlouvami a v neposlední řadě rozházené po katastrálním území bez přístupových cest (tam kde neproběhly pozemkové úpravy). 
A teď konečně k té ceně.
Odpověděl jsem na jeden inzerát, kde ještě podle výpisu z katastru dobíhal zápis výsledku dražby, takže mě zajímalo, pod jakou cenu určitě nepůjdou.
Dohledal jsem usnesení o příklepu.

Druhý případ se týkal zasedání obecního zastupitelstva.
Bohužel spoustu obecních cest je zaoraných, ale v mapách pořád jsou a obec se je snaží postupně obnovovat.
V mapě byl patrný jeden díl, který nepochybně takovou cestou kdysi býval, ale obec ho dnes již nevlastní.
Obec, která řádně hospodaří, se takových pozemků nikdy nevzdá.
Proto jsme se snažili najít, jak majitel k tomuto pozemku vůbec přišel. 

Oba případy byste vyřešili na katastrálním úřadě, ale kdo by tam jezdil a čekal ve frontě?
Ukažme si tedy, jak to lze zařídit z domova přes počítač.


## Dálkový přístup

Český úřad zeměměřický a katastrální provozuje [Dálkový přístup na adrese https://dpn.cuzk.gov.cz/](https://dpn.cuzk.gov.cz/).
Cenové údaje se evidují a nabízí až od roku 2014.
Starší můžete zažádat o zdigitalizování (podrobněji viz níže).
Listiny jsou k dispozici po přihlášení a za úhradu.
A4 za 20&nbsp;Kč maximálně však 300&nbsp;Kč.
Nelze jen nějaké stránky, buď vše a nebo nic, ale cenu spočítají předem.
Platba možná kartou.
Pro orgány veřejné moci dostupné bezúplatně.
[Účet si můžou zřídit na žádost přes datovou schránku pomocí tohoto formuláře.](https://cuzk.gov.cz/Katastr-nemovitosti/Poskytovani-udaju-z-KN/Dalkovy-pristup/Informace-o-bezuplatnem-poskytovani-udaju-KN-od-1.aspx)

Začněme jednodušší variantou tedy novějším záznamem.
V nahlížení si otevřete detail nemovitosti a vidíte řízení, v rámci kterých byl k nemovitosti zapsán cenový údaj.

![](/assets/2024-09-11/rizeni.png){:.center}

Listinu si vyhledáte a koupíte v dálkovém přístupu.

![](/assets/2024-09-11/vyhledavani.jpeg){:.center}


## Digitalizace starších listin

Pakliže nenajdete řízení se zapsáním cenového údaje, potřebujete si zažádat o digitalizaci.
K tomu je nutné znát číslo řízení, které získáte pomocí následujících několika kroků.

Za prvé v dálkovém přístupu naleznete požadovanou nemovitost.
Bude k dispozici minimálně výpis z katastru nemovitostí.
LV je v hantýrce list vlastnictví.
List vlastnictví může obsahovat více nemovitostí.
Mně konkrétně se v celém výpisu pomíchalo víc řízení a nebylo jasné, které řízení patří ke které nemovitosti.
V takovém případě koupíte „Částečný výpis z KN (LV)“.

![](/assets/2024-09-11/dostupne-listiny.png){:.center}

Z výpisu zjistíme číslo řízení a jdeme ho najít.
Jenže ještě není k dispozici

![](/assets/2024-09-11/neni-k-dispozici.png){:.center}

Proklikneme a zažádáme o zpřístupnění.
Zatím ještě nic neplatíte (ani zatím nevíte, kolik je to stránek).
Čekáte na e-mailovou notifikaci (v mém případě hned následující pracovní den).

![](/assets/2024-09-11/zadost.png){:.center}

Až vám přijde notifikace, můžete zakoupit, jak jsme si již ukázali v předchozím kroku.
Digitalizací konkrétního dokumentu jste ho totiž nabídli ke koupi všem.


## Závěr

Český stát provozuje i funkční a přínosné systémy.
Dokážete se dostat k ceně, za jakou byla nemovitost pořízena.
Je vyžadován drobný poplatek a přihlášení identitou občana.
Dálkově se dostanete i k dokumentům, které doposud nebyly zdigitalizované.


## Související

- [Jak jsem, zatím, nezalesnil pozemky](/bydlen%C3%AD/2020/04/27/jak-jsem-zatim-nezalesnil-pozemky.html)
- [Proč dochází k omezení v Nahlížení do katastru nemovitostí (Lupa.cz, Kamil Zmeškal)](https://www.lupa.cz/clanky/proc-dochazi-k-omezeni-v-nahlizeni-do-katastru-nemovitosti/)
- [Elektronické přijímačky na střední](/software%20development/2024/02/26/elektronicke-prijimacky-na-stredni.html)
