---
layout: post
title:  "Jak jsem začal s kroužkem programování"
date:   2018-10-29
categories: [software development]
disqusId: 207
image: "/assets/2018-10-29/scratchblocks.png"
tags: [kroužek programování]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://scratchblocks.github.io/#?lang=cs&script=opakuj%20(10)%20kr%C3%A1t%20%0A%20%20%C5%99ekni%20%5BAhoj%20sv%C4%9Bte%5D%0Aend"><img src="/assets/2018-10-29/scratchblocks.png" /></a></div> O tom, jak jsem začal s kroužkem programování, jsem mluvil na nekonferenci [jOpenSpace 2018](https://www.jopenspace.cz/2018.html). [K dispozici je videozáznam](https://www.youtube.com/watch?v=tptR39r8ZmE), ale do deseti minut se nevejde všechno, co bych býval chtěl říct. Navíc já stejně raději píšu a vy možná raději, stejně jako já, čtete, než koukáte na video. Berte to i jako drobné rozšíření přednášky.

<div style="clear:both"></div>
<!--more-->

## Expozice

<iframe width="560" height="315" src="https://www.youtube.com/embed/tptR39r8ZmE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Když jsem byl malý, tak skoro každý kluk u nás na vsi měl nějakého [pionýra](https://cs.wikipedia.org/wiki/Pion%C3%BDr_(motocykl)). Věčně se v něm vrtali, štelovali předstih, ladili karburátor, a tak se motorku naučili opravovat. Já měl novější, značně spolehlivější, motocykl německé výroby [Simson S51](https://cs.wikipedia.org/wiki/Simson#S51), do kterého se jen lil benzín (s olejem), proto jsem se nikdy pořádně motorky spravovat nenaučil. Zato [jsem měl osmibitový počítač Commodore C64](https://blog.zvestov.cz/software%20development/2014/05/30/stesti-nebo-osobni-zasluhy.html#můj-příběh). Na něm vás po spuštění přivítala příkazová řádka, čili k programování to byl jen krůček. Dnešní počítače jsou uživatelsky mnohem přívětivější, z toho důvodu je krok k programování o něco delší. Možná dnešním dětem stačí tu možnost prostě ukázat.

<a href="https://commons.wikimedia.org/wiki/File:Jawa_555.jpg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Jawa_555.jpg/640px-Jawa_555.jpg" /></a>

_[Jawa 555, Marek Koudelka](https://commons.wikimedia.org/wiki/File:Jawa_555.jpg) [(CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/deed.en)_

Leitmotivem loňské nekonference [jOpenSpace 2017](https://blog.zvestov.cz/software%20development/2017/10/24/jopenspace-2017.html) bylo vzdělávání dětí. Řešili jsme to takřka o každé přestávce. Úplně jsem cítil to nadšení, ale bál jsem se, aby nevyprchalo. To se naštěstí nestalo, protože jsem se hned v prosinci [zúčastnil akce Hodina kódu](https://blog.zvestov.cz/software%20development/2017/12/11/hodina-kodu-s-lightbot-a-edison.html), která se setkala s velkým ohlasem, tak jsem se rozhodl pustit do kroužku programování. Trochu to připomíná [akci „Z“ ](https://cs.wikipedia.org/wiki/Akce_Z), ale jak bylo řečeno na [konferenci učIT jinak](https://blog.zvestov.cz/software%20development/2018/05/15/konference-ucIT-jinak.html) (a víte to nejspíš sami), výuka informatiky na českých základních školách není v nejlepší kondici (byť se to například projekt [iMyšlení](http://imysleni.cz/) snaží změnit).

## Krok první

Upsal jsem se ke kroužku, ale jak začít? Dojel jsem na návštěvu za manželi Ivou a Martinem Javorkovými, kteří [vedou kroužek v Lázních Toušeň](https://www.programovanihrou.cz/), abych viděl, jak taková hodina vypadá. „Jejich“ děti za hodinu zvládnou ve [Scratchi](https://scratch.mit.edu/) naprogramovat [hru, třeba ovládat vlka, který chytá jablka padající ze stromu](https://scratch.mit.edu/projects/198632819/). Chycená jablka se připisují jako body. Spadne-li jablko na zem, hra končí. Tohle je pro mě zatím nedosažitelný cíl.

{% twitter https://twitter.com/programohrajeme/status/951530431232512002 hide_thread=true %}

## Peníze

V neposlední řadě bylo potřeba vyřešit i peníze. U nás na škole je paušální poplatek za kroužek a pololetí 400&nbsp;korun. Byl jsem varován, aby se z toho nestalo levné hlídání a aby tam tudíž nechodily děti, které to nezajímá. Ale není to kroužek v Praze a já chtěl bariéru udržet co nejníž. Hrozba se nenaplnila a to mimo jiné proto, že kroužek se koná v době školní družiny.

Musíte sehnat nějaký prostor, kde se bude učit. Nejlépe vybavenou školní učebnu. Slyšel jsem o školách, které si za to účtují nájem. To mi přijde jako smutný příběh.

Pokud vybavenou učebnu nemáte, nezbývá než si ji zařídit. Původně jsem pokukoval po chromebooku, ale vzhledem k ceně, jsem skončil u staršího hardware. Za zhruba 2000&nbsp;korun seženete slušný stolní počítač případně o něco horší notebook, který ovšem stále vyhovuje potřebám kroužku (vůbec nevadí, že má vyšeptanou baterii nebo že ji nemá vůbec).

Na naší škole lektorům kroužků náleží i nějaká drobná mzda. Jako student bych ji asi ocenil, ale teď jsem ji s díky odmítl, aby zbylo víc peněz na hardware. Připomnělo mi to doporučení z knihy Teaching Tech Together - Plaťte odpovídající mzdu nebo nic. Odměnou jim pak bude dobrý pocit (o samotné knize viz níže).

## Děti

Obdivuji učitelky, které mají ve třídě 32 dětí. Vůbec nechápu, jak to zvládají. A to ani v případě, kdy se třeba půlí na výuku cizích jazyků. Díky úspěchu Hodiny kódu se přihlásilo dost dětí. Vyšlo to na dvě skupiny, každá po deseti dětech. Martin Javorek mě varoval, že je to příliš, a měl samozřejmě pravdu, ale já jsem je nechtěl zklamat. Nakonec jsme to pololetí nějak zvládli, ale musel jsem vybírat snazší úlohy a neudělali jsme takový pokrok, jaký bych si představoval. Tohle pololetí jsem si stanovil strop na šest dětí a je to mnohem lepší. Hlavní problém v počtu je ten, že děti potřebují často s něčím poradit (byť s drobností), jenže je nestíháte obíhat. Když jste u čtvrtého, tak se znovu dožaduje pozornosti už ten první. Nutno podotknout, že na kroužek mi chodí děti z prvního stupně. Na druhém stupni to může být trochu jiné.

Programování je mnohem víc o čtení než o psaní. Z toho důvodu není dobrý nápad si na kroužek brát prvňáky a to ani v druhém pololetí, kdy sice už zdánlivě umí číst, ale potřebujete, aby se uměli orientovat v textu a něco v něm najít. Mají s tím kolikrát problém i páťáci. Na druhou stranu alespoň vidí, jak důležité čtení je. Abych vás neodradil, můžete začít i s některými předškoláky, sám jsem zkoušel doma, ale je rozdíl, jestli se jedná o jedno dítě, kterému se naplno věnujete, nebo zda jich máte v hodině víc.

Programování je bohužel takový *macho* obor. Myslím, že by nám větší přítomnost žen prospěla. Třeba [v Polsku už na tom jsou výrazně lépe](https://blog.zvestov.cz/software%20development/2018/07/30/polsky-devoxx-2018.html#Ženy). Proto mi dělá radost, že do kroužku chodí zhruba třetina holek. Vidím v tom určitou naději do budoucna.

Náš kroužek se sice koná v prostorách školy, ale jako mimoškolní aktivita, takže se na mě (prý) nevztahují takové ty legislativní věci jako pedagogické minimum.

Mohlo by vás zajímat, jak je to s vykáním či tykáním. Tak to jsem vůbec neřešil. Někdo mi říká pane učiteli, někdo pane Račanský a někdo, protože se známe třeba ze skauta, prostě jen Luboši.

## Náplň

Z velké části jsem si vystačil s projektem [code.org](https://code.org) (americká neziskovka, která stojí mimo jiné za Hodinou kódu), kde najdete nespočet cvičení i celé osnovy. Osobně jsem si spíš vyzobával konkrétní úlohy. V tomhle pololetí s tím zkouším pracovat systematičtěji. Založil jsem tam dětem účet, takže můžu sledovat jejich pokrok (pomáhá to, když nějaké dítě někdy chybělo, tak vím, co ještě nemá hotové).

Jednou bych se chtěl dostat ke Scratchi, což zatím vázlo na počtu a věku dětí.

Loni mě trochu trápila jejich motivace udělat úlohu (na jakýkoliv počet kroků) a hned jít dál, nesnažit se ji splnit na nejmenší možný počet kroků. Ale pak jsem na to rezignoval a letos k tomu došli sami. Úlohu udělají a vylepší ji buď hned, nebo se k ní vrací, když dodělají kolo.

![](/assets/2018-10-29/unplugged.jpg)

Byť jsou děti hrozně natěšené na počítač, snažím se na prvních zhruba deset minut věnovat aktivitám bez počítače. Zaměřuji se na rozpoznávání vzorců a opakování. Případně jsou děti v roli robota a vykonávají program, učí se tak krokovat. Inspiraci můžete hledat na stránkách [bobříka informatiky](https://www.ibobr.cz/) či [CS Unplugged](https://www.csunplugged.org).

To by mi jako náplň kroužku stačilo, ale chtěl jsem ještě něco hmatatelného, čím bych mohl hodiny občas zpestřit, aby byl kroužek ještě atraktivnější. Na trhu existuje nepřeberné množství různých robotů, ale z mnoha důvodů jsem nakonec tenkrát [pro Hodinu kódu pořídil robota Meet Edison](https://blog.zvestov.cz/software%20development/2017/12/11/hodina-kodu-s-lightbot-a-edison.html#meet-edison). Kromě toho, že je kompatibilní s legem, tak lze pořídit za rozumnou cenu 800 až 1000&nbsp;korun. Programuje se ve Scratch Junior, [nově i plnohodnotný Scratch (zatím bohužel pouze anglicky)](https://edscratchapp.com) a pro starší dokonce Python. Problém není v chybějících nástrojích, ale v didaktice. Meet Edison poskytuje nějaké materiály, z kterých jsem byl původně nadšený, ale pak jsem trochu vystřízlivěl. Stejně nezbývá, než si úlohy připravit sám, jako třeba [železniční přejezd](https://blog.zvestov.cz/software development/2018/08/20/uloha-zeleznicni-prejezd.html).

## Čas

Chtěli byste začít s kroužkem, ale nevíte, jestli to zvládnete časově? Je nutné věnovat nějakou dobu přípravě, řekněme 1&nbsp;hodinu, ale napsal bych to s hvězdičkou. Čekám totiž, že vás to chytne a budete s tím trávit času mnohem víc. Podařilo se mi to skloubit i s prací. V pátek vstanu v půl šesté, od šesti pracuji. Pak si dám delší pauzu na oběd, kdy odučím dvě hodiny po 60 minutách, a zbytek dodělám večer.

## Poznámky z deníčku

Po návratu z kroužku si snažím zapsat alespoň pár slov do deníčku, abych se mohl poučit z toho, co fungovalo a co ne. Ostatně poznámky stojí za vznikem tohoto příspěvku.

Už na školeních pro dospělé jsem se naučil chodit včas a vklidu si vše připravit. Zároveň máte možnost otevřít okna a vyvětrat. Nutné opakovat i o přestávkách. I tak jsou děti unavené (pátek odpoledne). Ovšem na jaře jako když do nich střelí, jsou plné energie. Přebytek energie i únava mají zásadní vliv na kázeň. Výhoda kroužku je, že to není povinné. Jednou a to zcela výjimečně jsem sáhl po krajním řešení a řekl dvěma dětem, ať příště nechodí a popřemýšlí, zda chtějí v kroužku pokračovat (chtěli). Znovu se vracím k počtu dětí v hodině, méně je lepší (deset je moc).

A nezapomínejte na pitný režim, vyučování je náročné!

![](/assets/2018-10-29/karty.jpg)

Děti umí ovládat tablet, ale s myší jsou o něco nemotornější, to musí trénovat. Největší výzva nebylo naprogramovat cyklus, ale přepsat do prohlížeče adresu `code.org/join`.

Jako úvod do Scratche jsem zkoušel [Scratch karty od Javorků](https://www.programovanihrou.cz/jak-na-to/), ale bylo mi líto je tisknout. Nicméně došel jsem ke zjištění, že návody vytištěné být musí. Zdálo se mi, že nedokáží rozlišit, co je programovací prostředí a co je návod. Motali se v tom. A opět se vracím k tomu čtení, pokud máte starší karty a mezitím se u bloku změní popis, tak to děti nenajdou (hledají přesnou shodu).

Snažím se pamatovat na to, že bych dětem neměl sahat po myši a klávesnici. Platí to i pro ostatní děti. Můžou si radit navzájem (pokud dotyčný o radu stojí), ale nesmí úlohu vyřešit místo něj.

## Knihy a jiné zdroje

Hledal jsem inspiraci v knihách. Jako první jsem sáhl po [Lifelong Kindergarten](https://www.goodreads.com/book/show/34889378-lifelong-kindergarten), kterou napsal Mitchel Resnick, spoluautor Scratche. Neříkám, že je špatná, ale čekal jsem asi něco praktičtějšího. Odnesl jsem si dva poznatky. Za prvé, že by učitel měl být spíš nenápadný průvodce než mudrc na jevišti. 

> There’s an old saying that a teacher should be a “guide on the side,” not a “sage on the stage. 

A za druhé koncept 4P: Projects, Passion, Peers, and Play; tedy projekty, vášeň, parťáci a hra.

Mnohem nadšenější jsem byl z knihy [Teaching Tech Together (Greg Wilson), k dispozici zdarma](http://teachtogether.tech/en/). Je hodně ozdrojovaná, takže mi nebezpečně nabobtnal seznam knih, které si hodlám přečíst. Autor říkal, že potřebujete odbornou znalost (tu si troufnu tvrdit, že mám). Dále vědět, jak obor učit (mám trochu představu, i z toho, jak učili nás, ale neustále hledám inspraci, jak učit děti). A pak obecně vědět, jak učit (v tom mám největší mezery). Aby se děti nemusely učit, jak programovat, tak se lektoři kroužků učí, jak učit, a právě pro ty je určena tato kniha.

Doporučuji se připojit do [facebookové skupiny Učíme Informatiku](https://www.facebook.com/groups/UcimeInformatiku) a sledovat [twitter kanál @programohrajeme](https://twitter.com/programohrajeme).

## Motivace

Cílem kroužku není primárně vychovat nové programátory. Pokud se tím jednou bude někdo živit, prima. Pokud ne, rozhodně nebudu zklamaný. Chci jim ukázat smysluplnou práci s počítačem a procvičit v logickém myšlení.

Nelson Mandela řekl:

> Každý člověk má v životě dvojí závazek - vůči rodině, rodičům, ženě a dětem, ale také vůči národu, komunitě, zemi.

Každý má podvědomou touhu dělat něco, co ho přesahuje. Někdo přispívá do opensource, jiný je zase členem sboru dobrovolných hasičů, angažuje se v církvi nebo třeba trénuje atletický oddíl. Loni proběhly dvoje volby, které z pohledu liberálního voliče nedopadly vůbec dobře. Na sociálních sítích jsem zaznamenal výkřiky: „Tady bydlet nebudu, stěhuju se do zahraničí.“ [Vláďa Misterka k tomu tenkrát napsal](http://www.sklenicka.com/volebni-vikend/):

> Češi jsou plačky. A nejvíc fňukají ti, co se sami mají nejlíp. Dá se s tím něco udělat jen za cenu několikaleté práce.

A já dodávám: nejlépe s mládeží.

Je to jako v té bajce o kolibříkovi:

> Když v pralese vypukl požár, zvířata utíkala a bezmocně se dívala na všechnu tu zkázu. Jen maličký kolibřík v zobáčku nosil vodu sem a tam. Když se ho zvířata ptala, proč to dělá – vždyť je maličký a nemá to smysl –, odpověděl: „Dělám, co mohu.“

Připojíte se i vy?

## Související

* [Hodina kódu s LightBot a Meet Edison](https://blog.zvestov.cz/software%20development/2017/12/11/hodina-kodu-s-lightbot-a-edison.html)
* [Konference učIT jinak](https://blog.zvestov.cz/software development/2018/05/15/konference-ucIT-jinak.html)
* [Úloha železniční přejezd](https://blog.zvestov.cz/software development/2018/08/20/uloha-zeleznicni-prejezd.html)
* [Zápisky z Robotiky - první hodiny (Ondřej Tůma)](https://zeropage.cz/a/zapisky_z_robotiky_prvni_hodiny)
* [Štěstí nebo osobní zásluhy](https://blog.zvestov.cz/software%20development/2014/05/30/stesti-nebo-osobni-zasluhy.html)
* [jOpenSpace 2017](https://blog.zvestov.cz/software%20development/2017/10/24/jopenspace-2017.html)
