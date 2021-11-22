---
layout: post
title:  "Výuka programování bez počítačů"
date:   2021-11-22
categories: [software development]
tags: [kroužek programování]
disqusId: 243
image: "/assets/2021-11-22/325644.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2021-11-22/325644.png" /></div>

Na [kroužku programování](https://blog.zvestov.cz/tag/krou%C5%BEek-programov%C3%A1n%C3%AD) se věnuju i aktivitám bez počítače. Chtěl bych tady na jednom místě shrnout, co jsem vyzkoušel a co se mi osvědčilo. Rozcestník původně vznikl jako přednáška pro ne-konferenci [jOpenSpace](https://www.jopenspace.cz/). Záznam bude zveřejněn později, ale já osobně mám rád i textovou podobu.

<div style="clear:both"></div>
<!--more-->


## Úvod

Děti celkem umí s tablety a mobily. S počítačem a myší je to horší. Pro mladší je výzva i zadat heslo k počítači a pak do adresního řádku přepsat `code.org/join`. Počítače nám tedy někdy hází klacky pod nohy. Když se chci soustředit na vysvětlení konkrétní problematiky, sáhnu po aktivitě bez počítače. Obvykle na začátku hodiny zhruba na deset minut.

Nebojte, nebudu se věnovat [děrným štítkům](https://cs.wikipedia.org/wiki/D%C4%9Brn%C3%BD_%C5%A1t%C3%ADtek). Ač z pohledu dětí pamatuju hodně, tak tohle už ne.


## Aktivity


### Převody soustav


Základní znalostí, kterou později využijete i pro složitější témata, je samozřejmě převod mezi [dvojkovou a desítkovou soustavou](https://www.csunplugged.org/en/topics/binary-numbers/unit-plan/) (poprvé a ne naposledy se odkazuji na projekt [CS Unplugged](https://www.csunplugged.org) od novozélandská [University of Canterbury](http://www.canterbury.ac.nz)). Pro děti ze škol, kde se učí matematika podle Hejného metody, se nejedná o žádnou novinku. Hned v tom viděly [pohádkovou zemi Biland](https://www.matika.in/cs/category.php?category=biland), kde se platí A groši a B groši.


### Opakování a vzory

Elementární schopností programátora je rozpoznávání opakovaní a vzorů. Ono se vám to asi nezdá, když vzory vidíte všude, ale je to velký skok v abstrakci, místo `krok krok krok` psát `opakuj 3x krok`. U pokročilých programátorů je zase problém s pochopením, že [duplicita je mnohem levnější než nesprávná abstrakce](https://blog.zvestov.cz/software%20development/2020/12/08/nespravna-abstrakce.html), ale držme se při zemi. To je jako s pravidly fotografování - nejdřív se je musíte nadrtit a pak je (máte-li patřičný kreativní důvod) teprve můžete začít porušovat.

Vezměte cokoliv barevného, čeho máte doma hodně, a připravte řady, které budou mít za úkol doplnit.

![](/assets/2021-11-22/kolecka.jpg)

Hledejte materiály pro [výuku vzorů v matematice](https://www.mathinenglish.com/PWkS/grade3/completepattern4(2).pdf).

[Hodiny jsou skvělý příklad](https://www.mathinenglish.com/PWkS/grade4/timepatterns.pdf) nejen na [modulo](https://en.wikipedia.org/wiki/Modulo_operation). Nepříjemně mě překvapila doplňující úloha, jak moc jim dal zabrat převod mezi analogovým a digitálním formátem.

O [IQ testech](https://openpsychometrics.org/printable/intelligence-quotient-test.pdf) si můžete myslet cokoliv, ale je to výborná studnice úloh na opakování a vzory. Děti mají tendenci řešení tipovat, proto se jich ptám, proč zvolily právě danou možnost. Navíc ostatní pokouším, zda souhlasí nebo jsou naopak proti.


### Ladění

Máme krásně hnusné slovo _debuggování_, vlastně ladění. Identifikace chyby v kódu je jedna z nejobtížnějších činností. [Bloková schémata můžete rozebrat i na papíře](https://scratchblocks.github.io/#?style=scratch3&lang=cs&script=opakuj%20dokola%0Akdy%C5%BE%3CKARTA%20je%20men%C5%A1%C3%AD%20ne%C5%BE%205%3Etak%0Akdy%C5%BE%3CKARTA%20je%20%C4%8CERN%C3%81%3Etak%0ATV%C5%AEJ%20t%C3%BDm%20dostene%20tolik%20bod%C5%AF%2C%20kolik%20je%20na%20kart%C4%9B%0Ajinak%0ADRUH%C3%9D%20t%C3%BDm%20dostane%20(1)%20bod%0Aend%0Ajinak%0Akdy%C5%BE%3CKARTA%20je%20SRDCOV%C3%81%3Etak%0ATV%C5%AEJ%20t%C3%BDm%20dostane%20(1)%20bod%0Aend%0Aend%0Ahraje%20druh%C3%BD%20t%C3%BDm%0Aend%0A). Připravil jsem si rozhodovací schéma, vzal hrací karty a nechal je krokovat.

{% twitter https://twitter.com/banterCZ/status/982330066435588096 %}

Nebo mějme bludiště...

![](/assets/2021-11-22/bludiste.jpg)

...spolu s nabídkou možností, ze kterých mají vybrat správné řešení.

![](/assets/2021-11-22/bludiste-moznosti.png)

Případně sáhněte po šachovnici. Představivosti se meze nekladou.


### Datové struktury a algoritmy

Dostáváme se ke komplikovanějším tématům.

Vysvětlíme si, že počítače jsou sice (zatím) hloupé a dělají jen to, co jim řekneme, ale není nutné si ukládat každý pixel zvlášť, že můžeme využít základní komprese. [Naklikejte si vlastní obrázek](https://scratch.mit.edu/projects/561519780/).

Podobně funguje i [komprese textu](https://classic.csunplugged.org/documents/activities/text-compression/unplugged-03-text_compression.pdf) (využil jsem anglického originálu, jako cvičení v cizím jazyce dobrý).

Nemyslete si, že hrajeme poker nebo vykládáme pasiáns, ale karty jsou vhodný nástroj, protože jsou po ruce. Využil jsem je i pro [demonstraci kódování pro detekci a korekci chyb](https://blog.zvestov.cz/software%20development/2019/06/24/detekce-a-korekce-chyb.html).

![](/assets/2019-06-24/karty.jpg)

Analogicky to funguje s [kontrolní číslicí čárového kódu](https://blog.zvestov.cz/software%20development/2019/07/22/kontrolni-cislice-caroveho-kodu.html).

![](/assets/2019-07-22/error-correction-paint-tin.png)

Obligátní [třídění](https://www.csunplugged.org/en/resources/sorting-network/). Diagram můžete křídou nakreslit na hřiště nebo fixou na prostěradlo, děti pak reprezentují jednotlivá čísla a navzájem se setřídí.

Kryptografii pravděpodobně uvedete na [Caesarově šifře](https://cs.wikipedia.org/wiki/Caesarova_%C5%A1ifra).

[Teorii grafů předvedeme na obci Blátov](https://classic.csunplugged.org/documents/activities/minimal-spanning-trees/unplugged-09-minimal_spanning_trees.pdf).

[Bobřík informatiky](https://www.ibobr.cz/) nově umožňuje připravovat si vlastní sady testových otázek.


### Elektronika

Sice jsem absolvoval FEL ČVUT, ale ohledně elektroniky se necítím silný v kramflecích. Proto kudy chodím, doporučuji knihu Martina Malého - [Hradla, volty, jednočipy](https://knihy.nic.cz/).

{% twitter https://twitter.com/iotta_cz/status/948864725936459776 %}

Existují elektrotechnické stavebnice jako [Boffin](https://boffin.cz/) či různé čínské klony, pro které jsem si připravil [polovodiče v kroužku programování](https://blog.zvestov.cz/software%20development/2020/06/29/polovodice-v-krouzku-programovani.html).

![](/assets/2020-06-29/tranzistor.jpg)

Lze demonstrovat, jak funguje [mechanický počítač Turing Tumble](https://blog.zvestov.cz/software%20development/2021/10/20/mechanicky-pocitac-turing-tumble.html).

![](/assets/2021-10-20/counter.png)


### Měkké dovednosti


Z [konference učIT jinak](https://blog.zvestov.cz/software%20development/2018/05/15/konference-ucit-jinak) jsem si odnesl úlohu stavění domečku, je to taková alternace na tichou poštu. V trojici byl jeden stavitel, jeden posel (který nemohl stavět, model neviděl) a jeden pozorovatel (na druhé straně místnosti, mluvil s poslem, viděl model). Měli za úkol postavit domeček podle vzoru, přičemž cílem cvičení bylo ukázat, jak obtížná je komunikace.


## Závěr

Metodicky se mi osvědčilo zařazovat aktivity bez počítače. Dovolí vám to soustředit se pouze na potřebnou látku a nerozptylovat se technikou. Rovněž pro dynamiku hodiny je vhodné střídat aktivity. Rozhodně nemusíte vymýšlet nic vlastního, materiálů existuje nepřeberné množství, stačí je pouze vyhledat, nastudovat a případně mírně adaptovat. Samotné [CS Unplugged](https://www.csunplugged.org) by vám mělo vystačit na dost dlouho.


## Související

- [Jak jsem začal s kroužkem programování](https://blog.zvestov.cz/software%20development/2018/10/29/jak-jsem-zacal-s-krouzkem-programovani.html)
- [Polovodiče v kroužku programování](https://blog.zvestov.cz/software%20development/2020/06/29/polovodice-v-krouzku-programovani.html)
- [Kontrolní číslicí čárového kódu](https://blog.zvestov.cz/software%20development/2019/07/22/kontrolni-cislice-caroveho-kodu.html)
- [Detekce a korekce chyb](https://blog.zvestov.cz/software%20development/2019/06/24/detekce-a-korekce-chyb.html)
- [Mechanický počítač Turing Tumble](https://blog.zvestov.cz/software%20development/2021/10/20/mechanicky-pocitac-turing-tumble.html)