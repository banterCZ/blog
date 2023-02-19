---
layout: post
title:  "Mechanický počítač Turing Tumble"
date:   2021-10-20
categories: [software development]
tags: [kroužek programování]
disqusId: 242
image: "/assets/2021-10-20/bit.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2021-10-20/bit.png" /></div>

Na [kroužku programování](/tag/krou%C5%BEek-programov%C3%A1n%C3%AD) se věnuju i aktivitám bez počítače. Od kamaráda jsem dostal tip na mechanický počítač [Turing Tumble](https://www.turingtumble.com/), který vznikl na základě [Kistarter kampaně](https://www.kickstarter.com/projects/upperstory/turing-tumble-gaming-on-a-mechanical-computer). Těm se záměrně vyhýbám, protože bych byl v pokušení kupovat kopec věcí, ale tuhle ~~hračku~~ učební pomůcku by byla škoda minout. Jsem rád, že kampaň skončila úspěšně i bez mého příspěvku a že jsem si mohl výsledek koupit až následně (nejednalo se o limitovanou edici, jak se někdy stává).

<div style="clear:both"></div>
<!--more-->

## Úvod

Turing Tumble je mechanický, [turingovsky úplný](https://cs.wikipedia.org/wiki/Turingovsk%C3%A1_%C3%BAplnost), počítač. Lze na něm ukázat, jak fungují logická hradla. Je pojmenovaný na počest Alana Turinga. (Kdo jste neviděl film [Kód Enigmy](https://www.csfd.cz/film/283747-kod-enigmy/prehled/), tak máte co dohánět.)

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/3r0P3CSYI-U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Didaktika

Krabice obsahuje tzv. _Puzzle Book_ se seznamem 60 úloh a jejich možných řešení. Navíc je to celé zaobalené do komiksového příběhu astronautky opravující počítač. Lze to tedy brát „pouze“ (myšleno v dobré slova smyslu) jako logickou hru, která vás a děti zabaví na několik hodin. Hru už mám doma přes rok, s přestávkami se k ní s mým desetiletým synem vracíme, ale zatím jsme ji ještě nedohráli. Syn vyžadoval moji pomoc. Tím se to tedy neliší od jiných chytrých výukových hraček, které nemůžete na děti jen hodit. A ani nechcete, přece si to užijete s nimi. Jednak je vše anglicky, jednak se občas někde zasekl nebo jsem mu vysvětlil, co/jak/proč funguje.

Čímž se dostávám k dalšímu rozměru, který tomu dává více jak stostránkový [Educator Guide](https://www.turingtumble.com/edu/Turing%20Tumble%20Educator%20Guide%201_0.pdf), do kterého se rozhodně nestydím nahlížet. Podle mého názoru se jedná o kvalitní didaktický materiál, který vám umožní vysvětlit jednotlivé počítačové principy.

{% twitter https://twitter.com/banterCZ/status/1296501908987883521 %}

## Praktická ukázka

Existuje online simulátor, na kterém bych chtěl demonstrovat [čítač](https://cs.wikipedia.org/wiki/%C4%8C%C3%ADta%C4%8D) (furt se mi to plete se [sčítačkou](https://cs.wikipedia.org/wiki/Bin%C3%A1rn%C3%AD_s%C4%8D%C3%ADta%C4%8Dka)).

![](/assets/2021-10-20/counter.png)

Řešení používá díl _gear bit_ tedy bit s ozubeným kolem. To je součástka, díky které je hra turingovsky úplná. Padající kuličky ovlivňují pouze bity pod sebou. Ozubená kola dokáží přenést informaci zpět.

Ale od začátku. Ty modré šipky, to jsou jednotlivé bity. Natočené vlevo znamenají logická 0, vpravo logická 1. Počítají kuličky. Po sedmi kuličkách byste měli mít všechny modré šipky napravo, `111`, `2^3 - 1 = 7`. Zelené součástky můžete ignorovat. Říkají tomu _rampa_ a jedná se o drát (Když jsem hru ukazoval jiným ajťákům, tak namítali, že autoři mohli barvu ubrat a tím dát najevo menší význam.)

Víc nenapočítáte, další kulička způsobí vynulování. Proto mají procesory v registrech [příznak přetečení](https://cs.wikipedia.org/wiki/P%C5%99%C3%ADznak_p%C5%99ete%C4%8Den%C3%AD). To je v našem případě ta sestava koleček. Kdyby to byl „obyčejný“ bit, tak při druhém přetečení si příznak nechtěně resetujeme (praktický důkaz nechávám na čtenáři).

Zpět k bitu s ozubeným kolem, osobně jsem s tím neměl problém, ale při zrychlené ukázce je to pro nováčky lehce matoucí, protože víc vidíte ozubené kolo než samotný bit.

[Vyzkoušejte si sami na simulátoru!](https://jessecrossen.github.io/ttsim/#s=13,17&z=32&cc=6&cr=8&t=3&sp=1&sc=0&b=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAASCAYAAACAa1QyAAAAAXNSR0IArs4c6QAAAP9JREFUOE+Vk4GNwyAMRb83yAgwww0QVHWQRLk9QgeJlOxRVUxwygawwJ1ugroyFVETaNNaQoDx42MD5Jy7Nk0DaeM4whgD5xySbf3WWlCCJMj7AK3VAqTBMAR03d1fgDwRAAagtWbvvUyjyTyDJIBAYDBSv5UUcFGq63rZMSnRhcCHuPnKpmnimFOC9pSEziBxfqZEhBMYPQPPjpYpnQi7wAoytaFYtSfJP1ZildM7QFEpq2/BEZWstdftWt/3y721bZtdFimlMsgHD600hjCgU12ml0GPr7p0XFkvKiWwBMn3KUISLGDJ5L8RwPytvvBT/YH+j/itzqjmgPlFKW/ia7mwphfDXgAAAABJRU5ErkJggg==) Spouštíte kliknutím na ten modrý turniket vlevo dole. [Podrobněji viz návod](https://jessecrossen.github.io/ttsim/usage).

## Cena

Hru si můžete [zakoupit za 70 euro](https://store-eu.turingtumble.com/). Vydyndal jsem slevu deset procent pro kroužek (klíčové slovo v angličtině je _code club_). Osobně se mi zdá cena odpovídající. Pochopitelně neplatíte pouze výrobní náklady, ale celý didaktický vývoj.

Za 15 euro si můžete koupit plány pro 3D tisk. Do toho jsem se pouštět nechtěl, rozhodně ne před tím, než si vše vyzkouším. A asi bych to nedoporučoval ani teď (vyjma opravdovým hračičkům). Jednak samotná deska je dost velká, aby ji šlo vytisknout na libovolné tiskárně, jednak krabice obsahuje dva druhy kuliček, které asi ani vyrobit nedokážete (kovové závaží a samotné hrací kuličky). Samozřejmě by vám chyběl barevný komiks na lesklém papíře.

Na druhou stranu není cena tak malá, abych bez zaváhání koupil další exempláře do kroužku. Pohrávám si s myšlenkou, že bych jim nabídl barterový obchod, pár krabic za překlad, ale nedostává se mi času.

## Závěr

Turing Tumble můžu vřele doporučit. Nejspíš ne pro každého rodiče či školu, ale pro nadšence to jsou dobře utracené peníze. Ať už jako hra nebo jako didaktická pomůcka. Pro kroužek, alespoň ten můj, si zatím nejsem jistý, a to hlavně proto, že to nejsou aktivity na pár minut, ale na delší souvislý čas. Rovněž vidím jazykovou bariéru, protože je hra dostupná pouze v angličtině, ač jsem zato jindy z výchovných důvodů rád (když děti musí používat angličtinu v praxi). Máte-li hru využít na plno, je vhodné, aby učitel či rodič rozuměl tomu, jak počítače fungují, nebo alespoň nastudoval dodávanou příručku a nenechal děti ve štychu.

Jo a kdybyste byli v pokušení, tak od stejných autorů právě běží [Kistarter kampaň Spintronics: mechanické obvody](https://www.kickstarter.com/projects/upperstory/spintronics-build-mechanical-circuits).
