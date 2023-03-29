---
layout: post
title:  "Mechanické obvody Spintronics"
date:   2023-02-28
categories: [software development]
disqusId: 257
image: "/assets/2023-03-28/transistor.png"
tags: [kroužek programování]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2023-03-28/transistor.png" /></div>

Na [kroužku programování](/tag/krou%C5%BEek-programov%C3%A1n%C3%AD) se věnuju i aktivitám bez počítače.
Tentokrát bych vám chtěl představit výukovou hru [Spintronics](https://upperstory.com/spintronics/), která má za cíl zábavnou formou naučit principy elektrických obvodů na mechanické bázi.

<div style="clear:both"></div>
<!--more-->

## Úvod


Od firmy [Upper Story](https://upperstory.com) mám již [mechanický počítač Turing Tumble](/software%20development/2021/10/20/mechanicky-pocitac-turing-tumble.html),
se kterým jsem náramně spokojen.
Když rozjeli další [Kickstarter kampaň](https://www.kickstarter.com/projects/upperstory/spintronics-build-mechanical-circuits), tak jsem dlouho odolával.
Nedávalo mi smysl učit elektrické obvody na mechanické stavebnici.
Vždyť kdo by to potřeboval, když existuje tolik zajímavých elektrických hraček?
Nakonec jsem změnil názor ze dvou důvodů.
Několik kamarádů mě na výrobek upozornilo, tak jsem mu věnoval víc pozornosti.
Ale hlavně jsem viděl reakci na moji opakovanou lekci [Polovodiče v kroužku programování](/software%20development/2020/06/29/polovodice-v-krouzku-programovani.html).
Jako dítě jsem trávil mnoho času nad encyklopediemi a vybudoval si nějaký základ abstrakce.
Ovšem všichni nejsou já, že ano.
A když na děti ve druhé třídě poprvé nahrnete neviditelné elektrony, tak je to pro ně (pochopitelně) obtížně pochopitelné.

Níže můžete vidět [ukázkové video](https://www.youtube.com/watch?v=957kZIBKob8).

<iframe width="560" height="315" src="https://www.youtube.com/embed/957kZIBKob8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


## Didaktika

V nabídce mají tři krabice od nejjednodušších úloh s rezistory, uzly, vypínači, kapacitory až po tranzistory a induktory.
Každá obsahuje tzv. _Puzzle Book_ se seznamem úloh.
Na webu najdete [nápovědy i řešení](https://upperstory.com/spintronics/solutions/).
Navíc je to celé zaobalené do komiksového příběhu dcery hodinářů, která dokáže sestavit něco jako obraceč času. 
Lze to tedy brát „pouze“ (myšleno v dobré slova smyslu) jako logickou hru, která vás a děti zabaví na několik hodin.
Hru mám doma pouze několik týdnů, je tedy trochu troufalé o ní psát už teď, ale myslím si, že některé úlohy jsou tak obtížné,
že se k ní snad budeme několik let vracet, takže nechci se svými dojmy tak dlouho čekat.

Dvanáctiletý syn potřebuje moji pomoc.
Tím se to tedy neliší od jiných chytrých výukových hraček, které nemůžete na děti jen hodit.
A ani nechcete, přece si to užijete s nimi.
Jednak je vše anglicky, jednak se občas někde zasekl nebo jsem mu vysvětlil, co/jak/proč funguje.

Vracím se k lekci [Polovodiče v kroužku programování](/software%20development/2020/06/29/polovodice-v-krouzku-programovani.html).
Jak by šlo Spintronics použít tam?
Elektrony jsou články řetězu.
Především jsou vidět.
Dále to může pomoci pochopit, že signál se šíří rychlostí světla, ale ne tak, že by celý obvod oběhl takovou rychlostí jediný elektron.
Články řetězu jsou k dispozici i v jiné barvě, takže snadno rozpoznáte, jak velký proud teče obvodem.
A už se nabízí oslí můstky, jak že měříme proud a napětí v obvodu, když elektrony nevidíme? (Neprozrazujte to dětem hned, mnohdy to vědí, stačí 
napovědět. Učitel by měl být spíš průvodce než mudrc, byť s tím mám často sám problém to dodržet.)
Měřáky má Spintronics pochopitelně taky.

Syn sám došel k poznání, aniž bych ho k tomu nějak naváděl, že sériově zapojené rezistory se sčítají
(takhle formálně se tam tomu neříká, ale v principu, abychom si rozuměli). V paralelních zapojeních to někdy vidí rychleji než já, moc to koumám.

![](/assets/2023-03-28/spintronics.jpeg)

Úlohy pokrývají široký teoretický základ od jednodušších věcí jako [Kirchhoffovy zákony](https://cs.wikipedia.org/wiki/Kirchhoffovy_z%C3%A1kony) 
po roli induktoru v obvodu a končí až u [klopných obvodů](https://cs.wikipedia.org/wiki/Bistabiln%C3%AD_klopn%C3%BD_obvod).
Jako dítě jsem měl problém pochopit princip tranzistoru (knihy neměly pohyblivé animace ani přibalené relé k vyzkoušení).
Jeho mechanická podoba to snad může ulehčit. 


## Praktická ukázka

Trochu školometsky: Paralelně zapojené rezistory mají menší odpor než kterýkoli z rezistorů samostatně.
Jejich celkový odpor je menší, než je odpor rezistoru s nejmenším odporem.
Komiksový příběh vám to podá lépe, ale nedokážu vám to tady předat.
Nicméně prakticky by to ve stavebnici vypadalo takhle ([zdroj a vysvětlení](https://upperstory.com/spintronics/science/#circuitdiagrams)).

![](/assets/2023-03-28/parallel-science-circuit-a.jpg)

Trochu váhám, zda mám prozradit, že si to můžete [vyzkoušet v simulátoru](https://simulator.spintronics.com/?linkID=33),
protože to vás nemá vůbec šanci ohromit tak jako praktická ukázka.
Simulátor je klikací, kurzor je váš prst, kterým lze ovládat vypínač nebo přidržet rezistor a učinit z něj tak nekonečný odpor.


## Cena

Hru si můžete zakoupit přímo na [stránkách výrobce](https://store-eu.upperstory.com/collections/spintronics).
Všechny tři díly včetně poštovného, daně a po slevě pro kroužek, mě vyšly na 202 Euro.
Osobně se mi zdá cena odpovídající.
Pochopitelně neplatíte pouze výrobní náklady, ale celý didaktický vývoj.
Na druhou stranu není cena nijak malá, masově se to šířit nebude.

Pozor, přestože koupíte všechny krabice, nedostanete všechny díly, [dioda je zvlášť](https://store-eu.upperstory.com/collections/spintronic-parts/products/spintronic-diode).
To jsem nevěděl, býval bych za jedno poštovné přihodil.

Po nějaké době se mi rozbil zdroj, asi [sériová vada](https://community.spintronics.com/t/problem-with-the-battery-skipping/153).
Ovšem je radost reklamovat něco ve vyspělém světě (v Česku zatím tak půl na půl).
Stačilo napsat e-mail, ani nechtěli díl zpět, a obratem zaslali nový kus.


## Závěr

Spintronics můžu vřele doporučit.
Nejspíš ne pro každého rodiče, ale pro nadšence to jsou dobře utracené peníze.
Ať už jako hra nebo jako didaktická pomůcka.
Máte-li hru využít na plno, je vhodné, aby učitel či rodič rozuměl tomu, jak elektrické obvody fungují,
nebo alespoň nastudoval dodávanou příručku a nenechal děti ve štychu.

Ohledně škol nebo kroužků programování bych byl zdrženlivý.
Když už mám hru doma, tak ji samozřejmě nárazově použiju.
Jenže nejedná se o aktivity na pár minut, ale na delší souvislý čas.
Rovněž vidím jazykovou bariéru, protože je hra dostupná pouze v angličtině, ač jsem zato jindy z výchovných důvodů rád (když děti musí používat angličtinu v praxi).
Dále je to cena.
A v neposlední řadě si nejsem jistý, jak by díly snesly drsné zacházení, a jestli se články řetězu nepoztrácí.

Každopádně zvídavé děti zvídavých rodičů si to užijí.


## Související

- [Mechanický počítač Turing Tumble](/software%20development/2021/10/20/mechanicky-pocitac-turing-tumble.html)
- [Polovodiče v kroužku programování](/software%20development/2020/06/29/polovodice-v-krouzku-programovani.html)
