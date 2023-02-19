---
layout: post
title:  "Kolaterální ztráty nemoci covid-19 nejen v IT"
date:   2021-02-18
categories: [software development]
disqusId: 235
tags: [security, státní správa]
image: "/assets/2021-02-18/321832.png"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2021-02-18/321832.png" /></div>

Nemoc covid-19 nám způsobuje značné přímé ztráty na lidský životech. Vezmeme-li v potaz nadúmrtnost, tedy zvýšení počtu úmrtí proti dlouhodobému průměru, tak v ČR jsou to již tisíce obětí a to ještě není všemu konec.

Pak tu máme [kolaterální ztráty](https://cs.wikipedia.org/wiki/Vedlej%C5%A1%C3%AD_%C5%A1kody) nejen v IT.

<div style="clear:both"></div>
<!--more-->

Přestože velké fabriky dál jedou, tak všem na očích jsou existenční problémy malých firem, drobných řemeslníků či umělců. 

> It's the economy, stupid

[James Carville, kampaň Billa Clintona](https://en.wikipedia.org/wiki/It%27s_the_economy,_stupid#:~:text=%22The%20economy%2C%20stupid%22%20is,Bush.)

Co je patrné možná až na druhý pohled, zato nás může dohnat mnohem víc, je podkopání důvěry v pravidla a dokonce i v samotný ústavní řád.

> Společnost, která stále více nerespektuje pravidla hry, protože nedůvěřuje vlastnímu státu, zejména pak své vládě, se ocitá na kluzké ploše. To, co drží demokratické společnosti pohromadě, jsou totiž právě společná pravidla hry, zaštítěná konstitucionalismem. A také důvěra, že stát je dokáže vynucovat, když je kdokoliv porušuje.

[Jiří Pehe, Deník N, Neúcta k pravidlům rozežírá českou demokracii (paywall)](https://denikn.cz/556923/neucta-k-pravidlum-rozezira-ceskou-demokracii-ti-kdo-je-nastavuji-nejen-toleruji-jejich-nedodrzovani-ale-obejdou-je-kdykoliv-se-jim-to-hodi/?ref=tit)

Dále to je vliv na fyzické a psychické zdraví dětí. Velkou část roku jsou deprivované jejich sociální vazby s vrstevníky.

> mezi dětmi narůstá apatie, přestává je zajímat, co se okolo nich děje. Je jim tak nyní už i jedno, kdy se vrátí do škol či kdy zas budou moci začít sportovat či chodit do oblíbených kroužků. Přestaly se na cokoliv z toho těšit

[Pediatrička: Mezi dětmi narůstá apatie, chybí jim škola a kolektivní sport, novinky.cz](https://www.novinky.cz/domaci/clanek/pediatricka-mezi-detmi-narusta-apatie-chybi-jim-skola-a-kolektivni-sport-40349908)

## Vliv na IT

Jelikož nejsem sociolog, právník, statistik, ekonom ani lékař, tak výše jmenované oblasti nebudu dále rozebírat. Ovšem troufnu si tvrdit, že covid negativně ovlivnil i IT a to následujícím způsobem.

### Důvěra v IT

V první řadě je to důvěra běžných uživatelů, která doposud jistě nebyla nezlomná, ovšem pandemií určitě utrpěla hluboké šrámy.

Řekněme taková registrace k očkování. Jako občan jsem vytočený, že to nefunguje. Jako člověka z IT mě uráží, jaký stín to na nás vrhá. Tím nechci tvrdit, že to programovali lemplové. Chyba byla už v zadání. Nejspíš ani nelze napsat tak robustní systém (za rozumné peníze), který by obsloužil všechny naráz. Divím se, že u systému _kdo dřív přijde, ten dřív mele_ se někdo diví, že se přihlásí tolik lidí najednou. Ostatně obdobný problém je i s podáváním žádostí o některé dotace. Místo toho, aby stát všechny žádosti sesbíral a vyhodnotil, tak to bere jako závod v podání. Druhá věc (a o tom více i později) je, že občan musel vyvinout nějakou aktivitu, přestože stát informace má. Mohl je oslovovat například skrz pojišťovny. Dalo by se jistě vymyslet spoustu lepších a levnějších funkčních řešení. A v neposlední řadě je to časový harmonogram. Rok čekáme na vakcínu, ale systém začneme připravovat dva týdny předem. 

Stojí za připomenutí zamyšlení o etice naší profese [Úvod do profese](/software%20development/2016/03/07/uvod-do-profese.html). Nechci se morálně vyvyšovat nad ty, kteří systém psali, ale sám se zamýšlím nad tím, jak bych se zachoval na jejich místě, zda bych byl dostatečně statečný na to, abych praštil do stolu, že tohle programovat teda nebudu. Zda bych se zachoval jako profesionál nebo jako dělník, který to dostal příkazem.

### Bezpečnostní návyky

Moje zkušenost z trasování je otřesná. Jako občan bych nejspíš tolik neremcal, ale soustřeďme se na IT pohled.

Dcera ve školce přišla do kontaktu s pozitivně testovanou osobou, stane se. Přišel e-mail. Přišel z adresy školy, nikoliv z hygieny. Nebyl digitálně podepsaný a navíc nikdo nemá důkaz, že jsme ho skutečně obdrželi. By mě zajímalo, jak u soudu dokazují nedodržení karantény (asi nevynucují, viz smutný úvod o právu). A teď k obsahu. Kdyby tohle posílali na jaře, tak budiž, ale jestli jeho podobu rok ladili, tak alespoň pro mě stále není ideálně srozumitelný. Namátkou třeba chybí odkaz na registraci. Dále by mě zajímalo, proč žádanku nevystaví rovnou.

![](/assets/2021-02-18/email.png)

Telefonicky se ozvali. Měli štěstí, že volali manželce, já bych se s nimi odmítl bavit a sdělovat neověřenému telefonnímu číslu osobní údaje. Z finančního úřadu mi třeba posílají SMS, že se mnou potřebují mluvit, a já se jim ozvu na jejich číslo, které mám šanci si ověřit. V tom vidím veliké riziko, které se nám vymstí. Banky se mermomocí snaží své klienty vzdělávat, aby neskočili na kdejaký phishing, a tady vidíte, že se stačí prohlásit za hygienu a dostanete údaje na stříbrném podnose.

Ani nevím na co všechno se vyptávali, ale určitě kam chodí dcera do školky, kde bydlíme, její rodné číslo, kdo je naše lékařka. Tím se vracím k registraci k očkování, kdy stát data nevyužívá, jak by měl. A když už tedy nejsou registry propojené, proč se údaje nevyplňují přes formulář, abychom tím nezatěžovali call centrum?

> Chytrá karanténa je ovšem nesmírně ambiciózní záměr a neškodí připomenout, že v čisté podobě se neuskutečnila nikde na světě.

[Petr Koubský, Deník N, Můžeme si lehnout a rozplakat se. Lepší je ale vstát, číst a pochopit (paywall)](https://denikn.cz/521923/muzeme-si-lehnout-a-rozplakat-se-lepsi-je-ale-vstat-cist-a-pochopit-rok-covidu-ocima-petra-koubskeho/?cst=06e262135b4e877bf6cb57ee4c9f7ca73dbda4bb)

Kdybychom neměli ambice, tak jsme ani na ten Měsíc nedoletěli. Ani jsem nečekal, že by se chytrá karanténa povedla dokonale, ale výsledek, který já jsem měl možnost vidět, je velmi slabý. Rozhodně není ambiciózní.


## Závěr

Vzhledem k lidským obětem se můžou zdát nedostatky IT a nedůvěra v něj banální, ale bývalo by jeho účelnější využití mohlo průběh pandemie zmírnit. A nebo taky nemuselo. Celý společenský systém eroduje na více frontách. Zatím se nezhroutil, ale vyhrabat se z tohoto marastu dát zabrat. A tím nemyslím měsíce, ale bohužel roky a desetiletí. Rád bych se mýlil.

## Související

- [Úvod do profese](/software%20development/2016/03/07/uvod-do-profese.html)