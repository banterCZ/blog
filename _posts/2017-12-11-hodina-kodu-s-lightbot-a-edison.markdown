---
layout: post
title:  "Hodina kódu s LightBot a Meet Edison"
date:   2017-12-11
categories: [software development]
disqusId: 197
image: "https://openclipart.org/image/150px/svg_to_png/76615/robot-line-art-rg1024.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://openclipart.org/detail/76615/robot-line-art"><img src="https://openclipart.org/image/150px/svg_to_png/76615/robot-line-art-rg1024.png" /></a></div>

Díky všeobecnému nadšení na [jOpenSpace](https://blog.zvestov.cz/software%20development/2017/10/24/jopenspace-2017.html) se zvýšilo moje odhodlání ohledně výuky programování dětí. Než stačilo nadšení trochu opadnout, upozornil mě [Martin Javorek](https://twitter.com/mjavorek/) na akci [Hour of Code](https://hourofcode.com) (česky Hodina kódu), které se účastní desítky milionů žáků z více než 180&nbsp;zemí světa, jejímž cílem je ukázat, že informatika je zábavná a tvůrčí, že není třeba se jí bát a že to zvládne každý. Napsal jsem do školy, kam chodí syn, jestli se nepřipojíme, a bylo to. 

<!--more-->

## Příprava

{% twitter https://twitter.com/mjentak/status/654752405477691393 %}

Nabídl jsem se, že s akcí pomůžu. Nemáte-li nápad, co zvolit, můžete se inspirovat na stránkách [Hour of Code](https://hourofcode.com). Lze dělat i aktivity bez počítače. Vybral jsem aplikaci LightBot, kterou už jsme před tím se synem zkoušeli, a sehnal tři fyzické roboty. Přinesl jsem dva své notebooky. Škola má taky pár počítačů a paní učitelka Klaudysová, se kterou jsem akci organizoval, také zapůjčila několik svých počítačů. Nakonec jsme měli deset počítačů.

## LightBot

![](/assets/2017-12-11/lightbot_screen_proc.png)

Někteří z vás si možná vzpomenou na [programovací jazyk Karel](http://wiki.ceskaskola.cz/Home/vybrane-clanky-z-let-2001-2009/ict/dobry-karel-jeste-zije). [LightBot](http://lightbot.com/) je graficky hezčí a o něco mocnější nástroj. Existuje aplikace **zdarma** pro iOS, Android i Kindle Fire a flash právě pro akci Hour of Code (procedury a rekurze). Můžete si zakoupit i rozšířenou variantu o cykly a podmínky.

Kdybyste náhodou chtěli ohrnovat nos nad tím, že tam nejsou písmenka, tak doporučuji k shlédnutí jak Dan Garcia, profesor na Berkeley, vysvětluje, [proč přešli při výuce algoritmizace k vizuálnímu „kostkovému“ jazyku](https://www.youtube.com/watch?v=_Mwc1gc77dc). Vypíchl bych, že studenti nedělají syntaktické chyby (chybějící závorka či středník) a neřeší obskurní chybové hlášky.

<iframe width="560" height="315" src="https://www.youtube.com/embed/_Mwc1gc77dc?rel=0" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## Roboti

Fyzičtí roboti jsou atraktivní. Asi znáte [Ozobota](https://ozobot.com). Nikdo mi ho vyloženě nerozmlouval, ale je drahý a slyšel jsem výtky, že nefunguje se všemi fixami a displeji. Na stavění vlastního nemám znalosti ani čas. Líbil se mi třeba [Makeblock](http://store.makeblock.com/mbot-ranger), takový Merkur, ale je ještě dražší než Ozobot.

Ať žije twitter! Psal jsem tam svoje úvahy a posílal odkazy, až mi [Michal Valoušek](https://twitter.com/msgre) doporučil Edisona a spojil mě s [Honzou Bednaříkem](https://twitter.com/janbednarik).

### Meet Edison

<iframe width="560" height="315" src="https://www.youtube.com/embed/ooSYO5Azj4E?rel=0" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

Robot [Meet Edison](https://meetedison.com/) mě nadchnul a doporučuji ho, kudy chodím. Je kompatibilní se stavebnicí Lego. Má čidlo čáry, infra (přes to si umí i navzájem posílat zprávy), čidlo viditelného světla, mikrofon, reproduktor a LED diody. Existují čtyři úrovně, jak ho programovat.

1. Předpřipravené čárové kódy.
2. [EdBlock](https://meetedison.com/robot-programming-software/edblocks/), dialekt jazyka Scratch.
3. [EdWare](https://meetedison.com/robot-programming-software/edware/), grafický jazyk rozšířený o text.
4. [EdPy](https://meetedison.com/robot-programming-software/edpy/), dospělý Python.

S tímto arzenálem vystačíte od mateřské školky až po vysokoškoláky.

![](/assets/2017-12-11/edison.jpg)

S počítačem se propojuje přes 3.5&nbsp;mm audio jack, takže nepotřebujete USB a zvládnete i z tabletu. Edison má průsvitný vršek, takže vidíte jeho vnitřnosti.

Hlavní problém výuky nebude technický (nástrojů je dost), ale didaktický. [Edison poskytuje spoustu výukových materiálů](https://meetedison.com/robotics-lesson-plans/), se kterými můžete začít. Velká část je přeložená i do češtiny.

Edison je cenově dostupný. Před měsícem posílali jen do Německa či na Slovensko, ale k nám ne (nechápu). [Honza Bednařík](https://twitter.com/janbednarik) zorganizoval objednávku dvaceti kusů, za což mu patří dík. Kus nás pak vyšel na pěknou ajťáckou cenu 1024 korun (včetně poštovného, DPH a poplatku za celní zastoupení). Jelikož se strhnul zájem z České republiky, tak už mají poštovné zdarma i pro nás. DHL express trvalo 4 dny i s proclením, menší objednávky jdou bohužel několik týdnů.

Vydyndal jsem pro vás kupón, měla by to být sleva 10&nbsp;%, tak zkuste **CzechD17** a dejte vědět, jestli vám to funguje.

## Zkušenosti z průběhu

Nejdřív jsme si děti poslechli, na co se těší. Pak jsem jim vysvětlil, co je to programování a k čemu je to dobré.

Líbilo se mi, [jak to pojal Jan Peterka](http://student.e15.cz/agora/jan-peterka-ucme-programovani-1340185)

> Když vše vyřešíte a pošlete robota na cestu, něco určitě nebude fungovat tak, jak jste si vysnili. To, že se program chová jinak, než jste chtěli, je běžné. Někde jste udělali chybu. Poprvé možná budete mít pocit, že jste selhali a že to nezvládnete. Časem si ale zvyknete na to, že chyby děláte. Že je to normální a že na tom není nic špatného. Zjistíte, kde je chyba a opravíte ji. A každou chybou jste se naučili něco nového

Děti byly rozdělené do dvou skupin. První, druhá a třetí třída začínaly, následovaly čtvrtá a pátá třída. Každá skupina měla vyhrazený čas hodinu a půl. Děti ve skupině byly rozdělené na třetiny a po půl hodině se střídaly u Edisonů. Většinu času tak strávili s LighBotem.

LighBot je přeložený i do češtiny, takže dítě může teoreticky pracovat samostatně, ale počítejte s tím, že bude potřebovat pomoc. Děti z první, druhé a třetí třídy se dostaly k procedurám, kde začaly tápat, ale stejně už jim vypršel čas. V první skupině bylo 17 dětí a to už je i dvou dospělých mazec. Mladší, větší skupina pracovala ve dvojicích jednak kvůli složitosti, jednak kvůli nedostatku počítačů. Starší žáky jsem nechal dojít k procedurám, pak je zastavil a vysvětlil jim to najednou. Nikdo se vyloženě nezasekl a všichni udělali velký kus práce.

Na Edisona děti měly půl hodiny. To stačilo na základní seznámení a [aktivity z podložky](https://meetedison.com/edmat/):
* Sleduj čáru
* Zápas sumo
* Sleduj světlo
* Vyhýbej se překážkám

Z brožury [Ty to řídíš ](https://meetedison.com/content/EdBooks/Czech/EdBook1%20-%20EdVenture%20-%20Ty%20to%20ridis.pdf) jsem si vytiskl čárové kódy na řízení dálkovým ovladačem.

![](/assets/2017-12-11/kruh.jpg)

Na konci jsme si v kruhu popovídali, jaké si kdo odnesl dojmy. Skoro všichni by chtěli chodit na kroužek programování. Člověku to udělá radost.

Nevěnoval jsem pozornost upomínkovým předmětům, to jsem podcenil, ale naštěstí na to pamatovala paní učitelka Klaudysová a každému připravila diplom, samolepku a takovou tu placku na špendlík.

{% twitter https://twitter.com/ruthmbuckschool/status/938924560782573568 %}

## Čísla

[Příjemně mě překvapilo, že na GeeCONu byl nadprůměrný počet žen](https://blog.zvestov.cz/software%20development/2017/11/27/geecon-2017.html) (na české poměry), ovšem převažovaly cizinky. Jak to v zahraničí jen dělají? Zkusme si porovnat počet akcí Hour of Code. K dnešnímu dni [je registrováno](https://hourofcode.com/cz/events/all) v České republice 392 akcí, přičemž v Polsku je to 2027. Polsko je sice větší, ale ne tolikrát. Zaostáváme ve vzdělávání? [U nás je 906 tisíc žáků základních škol](https://www.czso.cz/csu/czso/cr_od_roku_1989_skoly). Když budu velkorysý a řeknu, že průměrně bylo na akci 30 dětí, tak se zúčastnilo 1,3&nbsp;% žáků. Zvedneme to za rok o řád?

## Propagace

Registrací na stránkách [Hour of Code](https://hourofcode.com) přidáte na mapu jeden špendlík se svou akcí. Je dobré se vnutit i do regionálního tisku, o nás psal [Benešovský deník](https://benesovsky.denik.cz/zpravy_region/zaci-si-vyzkouseli-programovani-a-ne-naposledy-20171206.html). Dokonce přijel i Český rozhlas. Nevím, zda reportáž nakonec vysílali, ale mělo tam zaznít něco následujícího. No, byla to sranda. Kolem máte děti, které potřebují pomoc a zároveň máte odpovídat redaktorce. Snad jsem blekotal něco smysluplného.

<audio controls><source src="/assets/2017-12-11/STC-bn-lounovice-programovani-robotu.mp3" type="audio/mpeg">Váš prohlížeč nepodporuje přehrávání mp3.</audio>

## Závěr

Nebude ze mě nikdy výjimečný programátor jako třeba [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds), systematicky nepřispívám do žádného open source projektu, ale přesto můžu něco udělat a třeba, při vší skromnosti, nějaké dalšího Linuse Torvaldse nakopnout v jeho kariéře. Když už nic jiného, tak dětem dám nějakou smysluplnou zábavu.

Vůbec se nechci chlubit, mám na paměti biblické:

> Dávejte si pozor, abyste nepředváděli své dobré skutky lidem na odiv.

[Matouš (6:1), Bible 21](http://www.bible21.cz/online#matous/6/1)

Nicméně kdybych alespoň jednoho čtenáře přesvědčil, aby příští rok zorganizoval Hour of Code, tak budu šťastný. Jo a kroužek bude od pololetí, ale o tom zase až někdy příště.

