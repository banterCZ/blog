---
layout: post
title:  "Hudba s Microbitem"
date:   2020-03-24
categories: [software development]
disqusId: 224
tags: [kroužek programování]
image: "/assets/2020-03-24/microbit2_1.png"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2020-03-24/microbit2_1.png" /></div> 

[Micro Bit](https://en.wikipedia.org/wiki/Micro_Bit) je programovatelný mikropočítač, který vyvinuli v BBC a rozdali žákům základních škol ve Velké Británii. Podrobnější úvod si můžete přečíst třeba na [microbiti.cz](https://www.microbiti.cz/2019/03/co-je-bbc-microbit.html). Mně zaujala možnost připojení periferií, ale dlouho jsem rozmýšlel, jakou jednoduchou a přesto zajímavou úlohu zvolit. Nakonec jsem vyzkoušel tvorbu a přehrávání hudby. Moje zkušenost vychází z článku [Making music with micro:bit](https://www.teachwithict.com/microbit-music.html) zveřejněným pod licencí [Creative Commons BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.cs). Navíc jsem to trochu spojil i s hodinou fyziky. Vhodné zařadit až po několika seznamovacích hodinách s Micro Bitem (ne se rovnou vrhnout na periferie).

<!--more-->

![](/assets/2020-03-24/IMG_1272.jpg)

## Fyzikální Teorie

Úvodních deset až patnáct minut se snažím věnovat aktivitě bez počítače. Tentokrát jsem místo cvičení probíral teorii. Vytáhl jsem z knihovny [Usborne - Dětskou encyklopedii vědy a techniky](https://www.goodreads.com/review/show/2805859856?book_show_action=false&from_review_page=1), určitě si dokážete najít materiály na internetu, ale někdy se hodí šustit papírem. Osvědčilo se mi nevést monolog, ale vytáhnou z dětí, co vědí a znají. Rády se pochlubí. Vědí toho dost. Stačí to lehce moderovat.
 
Jak to, že vůbec něco slyšíme? Zvuk je vlnění. Když hodíte do vody kámen, na hladině uvidíte šířit vlny. Podobně se zvuk šíří vzduchem, byť to nevidíme. Když si kosmonauti ve volném prostoru uprdnou, tak to ten druhý neuslyší (to se jim náramně líbilo), jelikož vzduchoprázdnem se nemá jak šířit. Zvuk vydá třeba buben (ukázali jsme si, jak se rozkmitá) a my ho slyšíme díky ušnímu bubínku. Mluvení je kmitání hlasivek.

<div class="center">
<a href="https://www.flickr.com/photos/dmelchordiaz/8406776942/"><img src="https://live.staticflickr.com/8499/8406776942_aa952bd658_z.jpg" /></a><br/>DAVID MELCHOR DIAZ, Levitation (<a href="https://creativecommons.org/licenses/by-nc-nd/2.0/">Creative Commons BY-NC-ND 2.0</a>)
</div>

Jak to, že slyšíme reprodukovanou hudbu? Reproduktor má membránu, kterou rozkmitá elektromagnet. Při průchodu elektrického proudu vodičem se kolem vytváří elektromagnetické pole. Jak to, že se nám podařilo hudbu nahrát? Máme mikrofon, to je v podstatě reproduktor naruby.
 
Vezmeme do ruky sluchátka a ukážeme konektor, pravděpodobně _3.5 mm jack_ Proč je dělený na tři části? Protože stereo. Následně jsem vzal sluchátka od telefonu. Proč má konektor čtyři části? Protože má i mikrofon. Děti na první stupni se k tomu sami (nebo jen s malou nápomocí) dokáží dopracovat.

![](/assets/2020-03-24/headphones2.png){:.center}

Všechna zmíněná fakta jsou srozumitelně znázorněná v doporučované knize, ale jistě najdete i ve své oblíbené encyklopedii.

## Vybavení

Budete potřebovat webový prohlížeč a v něm otevřít [editor makecode.microbit.org](https://makecode.microbit.org/). Nejobtížnější je sehnat kabely s krokodýlky, ale na [aliexpress.com](https://www.aliexpress.com/) jsou k dostání v ceně jeden až dva dolary včetně poštovného. Hledejte _crocodile clips cable_. V neposlední řadě potřebujeme reproduktor nebo sluchátka.
 
 **POZOR**: Sluchátka si nesmí v žádné případě dávat na uši, hrozí poškození sluchu, jelikož vůbec nepracujeme s nastavením hlasitosti. Zvuk uslyší, i když nechají sluchátka ležet na stole.
 
Micro Bit má vestavěné bloky pro hraní tónu.
 
![](/assets/2020-03-24/blok_hrat_ton.png) 

## Hudební Teorie

Ne každé dítě chodí do hudebky a ze školy nemusí mít dostatečnou znalost notového zápisu. Každopádně je potřeba zdůraznit, že programovací prostředí vychází z anglických/amerických konvencí a tak jak jindy máme „problém“ s podobou zápisu desetinného čísla, tak tentokrát je rozdíl v našich notách H a B a „jejich“ B a Bb. Kromě fyziky a hudební teorie se tedy naučí i anglické reálie.

![](/assets/2020-03-24/trebleclef_3.png){:.center}

Jako bonus můžete ukázat, že anglická terminologie má i jiné názvy pro délky not, neříkají tedy čtvrťová (v americké angličtině normálně _quarter note_) nýbrž _crotchet_.

![](/assets/2020-03-24/notes1_2.png){:.center}

## Úloha

1. Připojte sluchátka a zahrajte jeden libovolný tón.
2. Najděte si svoji oblíbenou píseň (v papírovém zpěvníku či obtížnější úloha na internetu). Poznají ji spolužáci na konci hodiny? Mějte připravenou nějakou píseň v záloze, kterou jim přidělíte, pokud si nedokáží sami vybrat.

![](/assets/2020-03-24/headphones.png){:.center}

## Vychytávky

Přepis not je zdlouhavá práce. Nemusí bloky přetahovat z nabídky, ale lze na již umístěném bloku zvolit pravým tlačítkem možnost klonovat. Dále je možné využívat blok opakuj (nemusí jít pouze o repetice, ale jakékoliv opakování, které sami najdou).
 
Nejspíš jim nebude vyhovovat výchozí tempo, ale možná je ani nenapadne to hledat, jelikož budou příliš soustředění na noty.

Povšimněte si, že mám páskou zalepený pin s napájením 3&nbsp;V. V této úloze není potřeba. Je to taková blbuvzdorná pojistka, aby ani omylem nevyvolali zkrat.

![](/assets/2020-03-24/IMG_1270.jpg)

Pro potřeby úlohy jsem doma ze šuplíku vyhrabal hromadu starých sluchátek. Jedny měly zlomený kabel, což se didakticky náramně hodilo, jelikož si ověřili teorii z počátku hodiny a použili druhý kanál.

## Závěr

Úloha mi přijde zdařilá jako ukázka zapojení periferií. Lze stihnout za 60 minut. Děti mě příjemně překvapily, že jsme stačili z teorie probrat víc, než jsem původně čekal. Trochu horší to bylo s odhodláním rutinního přepisování not. Pomohla soutěživost, když jsme zapojili hádání písní.