---
layout: post
title:  "Refaktorování nepatří do backlogu"
date:   2016-09-12
categories: [software development]
disqusId: 180
---
<a href="/item/178">Z některého kódu se mi dělá fyzicky nevolno</a> a mám chuť ho <a href="/item/133">od začátku přepsat, což by se rozhodně dělat nemělo</a>. Další nápad je, přidat refaktorování do backlogu, ale tam nepatří. 
<a href="https://twitter.com/RonJeffries">Ron Jeffries</a> to vysvětluje v článku <a href="http://ronjeffries.com/xprog/articles/refactoring-not-on-the-backlog/">Refactoring -- Not on the backlog!</a> Článek jsem <a href="https://twitter.com/RonJeffries/status/765165129444888576">s laskavým svolením autora</a> přeložil do češtiny.

30\. července 2014

V nedávné době se objevilo hodně otázek na konferencích a v e-mailových diskusích ohledně toho, zda dávat refaktorovací <em>story</em> do <em>backlogu</em>. I kdyby <em>technický dluh</em> vyrostl, tak to nic nemění na tom, že je to hrozná myšlenka. Vysvětlení proč:

![](/assets/2016-09-12/20160912-Ref01-1024x768.jpg)

Na začátku projektu je kód čistý. Pole je posekané, život krásný a svět náš. Všechno půjde hladce.

<!--more-->

![](/assets/2016-09-12/20160912-Ref02-1024x768.jpg)

Můžeme snadno a rychle dodávat <em>featury</em>, přesto to musíme pokaždé vzít malou oklikou nebo trochu zabočit. Věci se zdají celkem čisté, navíc spěcháme. Nevšimneme si, že se něco kazí, a tlačíme na rychlost.
![](/assets/2016-09-12/20160912-Ref03-1024x768.jpg)
Přesto občas necháváme na našem téměř perfektní poli kódu nějaké trní. Občas to lidé nazývají <em>technický dluh</em>. Ve skutečnosti to žádný dluh není, je to jen ne úplně dobrý kód. Ale ještě nevypadá tak zle.
![](/assets/2016-09-12/20160912-Ref04-1024x768.jpg)
Nicméně jak tvoříme, musíme obcházet houští nebo se prodrat skrze ně. Především chodíme kolem.
![](/assets/2016-09-12/20160912-Ref05-1024x768.jpg)
To nás nevyhnutelně trochu zpomalí. Jsme tedy o něco méně opatrní než předtím, abychom udrželi rychlost. Takže brzy vyroste další plevel.
![](/assets/2016-09-12/20160912-Ref06-1024x768.jpg)
Nové křoví nás spolu se starým zpomalí ještě víc. Uvědomíme si, že je to problém, ale jsme příliš ve spěchu, abychom s tím něco udělali. Tlačíme víc na pilu, abychom udrželi naši počáteční rychlost.
![](/assets/2016-09-12/20160912-Ref07-1024x768.jpg)
Brzy je polovina kódu, se kterou musíme pracovat, zarostlá plevelem, podrostem a překážkami všeho druhu. Můžou tam někde být dokonce staré plechovky nebo špinavé oblečení. Třeba i nějaká jáma.
![](/assets/2016-09-12/20160912-Ref08-1024x768.jpg)
Každý výlet skrz tohle zaneřáděné pole se stává dlouhou cestou s vyhýbáním se  pastím, kterém jsme za sebou nechali. Do některých nevyhnutelně spadneme a pak se z nich musíme vyhrabat. Zpomalujeme ještě víc než kdy předtím. Něco se musí stát.
![](/assets/2016-09-12/20160912-Ref09-1024x768.jpg)
Hustota problémů je pro nás teď velmi viditelná a je zřejmé, že nemůžeme na poli rychle poklidit. Je potřeba mnoho refaktorování, abychom se dostali zpět na čisté pole. Jsme v pokušení požádat našeho <em>product ownera</em> o čas na refaktorování. Často tento čas nedostaneme: žádáme o čas na opravu něčeho, co jsme pokazili v minulosti. Nad tím nejspíš nikdo oči nepřimhouří.
![](/assets/2016-09-12/20160912-Ref10-1024x768.jpg)
Pokud bychom čas dostali, nedobrali bychom se dobrého výsledku. Uklidíme, co vidíme a co lze stihnou v daném čase, který nikdy nebude dostatečný. Trvalo mnoho týdnů, než se kód pokazil, a určitě nedostaneme tolik týdnů na spravení.

To není ta správná cesta. Velké refaktorovací akce je těžké prosadit a když ano, tak s velkým zpožděním dostaneme méně, než v co jsme doufali. To není dobru nápad. Co bychom tedy měli dělat?
![](/assets/2016-09-12/20160912-RefA1-1024x768.jpg)
Jednoduše! Místo obcházení každého roští si u další <em>featury</em> najdeme čas na to, prorazit cestu skrz některá. Možná jiná obejdeme. Vylepšíme kód, kde pracujeme a ignorujeme ten kód, kde ne. Dostaneme krásnou čistou cestu pro nějakou naši práci. Je šance, že tohle místo někdy znovu navštívíme. Takhle funguje softwarový vývoj.

Možná <em>featura</em> zabere delší dobu. Často ne, jelikož úklid nám pomůže s proražením cesty i pro tu první <em>featuru</em>.
![](/assets/2016-09-12/20160912-RefA2-1024x768.jpg)
Vypláchnout a opakovat. S každou novou <em>featurou</em> vyčistíme kód, který je pro ni potřeba. Investujeme o trochu víc času, než kdybychom pokračovali v zaneřáďování, ale ne o moc a často méně. Obzvláště jak proces pokračuje, těžíme z výhod úklidu čím dál tím více a věci začínají jít rychleji a rychleji.
![](/assets/2016-09-12/20160912-RefA3-1024x768.jpg)
Brzy (často už v tom samém sprintu, kdy začneme uklízet) si všimneme, že následující <em>featura</em> vlastně používá oblast, kterou jsme předtím vyčistili.

Práce jde lépe, kód se stává čistším a my dodáváme víc <em>featur</em>, než kolik jsme byli schopní předtím. Každý vyhrává. Začneme těžit z postupného refaktorování hned. Pokud bychom bývali čekali na velkou várku refaktorování, stálo by nás to víc úsilí a jakékoliv výhody by přišly později, jestli vůbec. Takže by se spíš plýtvalo prostředky, které nám zatím nic nepřináší.

Související
------

* <a href="/item/133">Věci, které byste nikdy neměli dělat - část první</a>
* <a href="/item/178">Clean Code</a>