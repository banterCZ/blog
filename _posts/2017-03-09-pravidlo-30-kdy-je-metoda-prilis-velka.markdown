---
layout: post
title:  "Pravidlo 30 – kdy jsou metoda, třída nebo subsystém příliš velké"
date:   2017-03-09
categories: [software development]
disqusId: 187
image: "https://openclipart.org/image/150px/svg_to_png/173389/B14-30.png"
tags: [překlad]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://openclipart.org/detail/173389/b1430"><img src="https://openclipart.org/image/150px/svg_to_png/173389/B14-30.png" /></a></div>

V _code review_ jsem připomínkoval stořádkovou metodu, která mi přišla příliš dlouhá. Hranice může být otázkou osobního vkusu, tak jsem hledal zdroje, čím bych svůj názor podpořil. Narazil jsem přitom na článek [Rule of 30 – When is a method, class or subsystem too big?](http://swreflections.blogspot.cz/2012/12/rule-of-30-when-is-method-class-or.html), který napsal Jim Bird. S [laskavým svolením autora](https://twitter.com/jimrbird/status/837298902189535233) jsem článek přeložil. 

<div style="clear:both"></div>

4\. prosince 2012

Lidé, kterým záleží na psaní dobrého kódu, neustále kladou otázku: „Jaká je [správná velikost metody, funkce](http://programmers.stackexchange.com/questions/133404/what-is-the-ideal-length-of-a-method), [třídy](http://stackoverflow.com/questions/4338831/when-is-a-class-too-big), balíčku nebo jiného kusu kódu? Od určité chvíle může být kód příliš velký na to pořádně ho pochopit – ale jak velké je příliš velké?“

<!--more-->

Začíná to [na úrovni metody nebo funkce](http://stackoverflow.com/questions/475675/when-is-a-function-too-long).

V knize [Code Complete](http://www.stevemcconnell.com/cc.htm) Steve McConnell říká, že teoreticky nejlepší maximální limit pro metodu nebo funkci je počet řádek, které se vejdou na obrazovku (tj. co vývojář může vidět najednou). Jmenuje studie z 80. a 90. let, podle kterých je ideální velikost funkce mezi 65 a 200 řádky. Takhle velké funkce je levnější vyvinout a mají méně chyb na řádek kódu. Nicméně od určitého místa za 200 řádky vstupujete do nebezpečné zóny, kde kvalita a porozumění kódu bude upadat. Kód, který nelze testovat, nemůže být bezpečně změněn. Případně skončíte u něčeho, čemu Michael Feathers říká „[runaway methods](http://michaelfeathers.typepad.com/michael_feathers_blog/2012/09/runaway-methods.html)“. Funkce jsou dlouhé několik stovek či tisíc řádek, jsou neustále měněny, což je průběžně dělá většími a děsivějšími.

[Patrick Duboy](http://dubroy.com/blog/method-length-are-short-methods-actually-worse/) se ponořil hlouběji do analýzy délky metod a poukázal na novější studii z roku 2002, která říká, že kód s kratšími funkcemi má méně chyb, což odpovídá intuici a zkušenosti většiny lidí.

Menší musí být lepší
------

Bob Martin v knize [Clean Code](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882) dovedl myšlenku „jestli malé je dobré, tak menší musí být lepší“ do extrému. 

> První pravidlo funkcí je, že by měly být malé. Druhé pravidlo funkcí je, že by měly být ještě menší než to. Funkce by neměly být 100 řádek dlouhé. Funkce by měly být stěží 20 řádek dlouhé.

Martin přiznává: „Tento předpoklad nemůžu dokázat. Nemůžu citovat žádný výzkum, který říká, že velmi malé funkce jsou nejlepší.“ Takže stejně jako mnoho další pravidel a doporučení v komunitě softwarového vývoje je tento soud založen na jejich osobní zkušenosti s psaním kódu, estetických a etických argumentech, spíše než na těch ověřených experimentem. Styl nad hmotu.  

Stejný návod „menší je lepší“ platí pro [třídy](http://www.drdobbs.com/architecture-and-design/in-praise-of-small-classes/230300002), balíčky a subsystémy – všechny stavební bloky systému. V knize Code Complete je zmíněná studie z roku 1996, která zjistila, že třídy s více funkcemi mají více chyb. Podle knihy Clean Code mají být třídy (stejně jako funkce) rovněž „menší než malé“. Někteří doporučují 200 řádek jako [dobrý limit pro třídu](http://programmers.stackexchange.com/questions/66523/how-many-lines-per-class-is-too-many-in-java) (nikoliv metodu) nebo tak málo jako 50 až 60 řádek (Ben Nadel [Object Calisthenics](http://www.bennadel.com/resources/uploads/2012/ObjectCalisthenics.pdf)). Takové třídy by se měly skládat z [„méně než 10“ nebo „ne víc jak 20“ metod](http://stackoverflow.com/questions/2050171/recommended-number-of-lines-per-java-class-file). Slavný [projekt C3](http://www.martinfowler.com/bliki/C3.html), kde vzniklo extrémní programování, měl [v průměru 12 metod na třídu](http://c2.com/cgi/wiki?ManyShortMethodsPerClass). A nemělo by být víc než 10 tříd na balíček.

[PMD](http://pmd.sourceforge.net/), nástroj statické analýzy, který pomáhá upozornit na problémy ve struktuře a stylu kódu, definuje nějaké [výchozí hodnoty pro velikost kódu](http://pmd.sourceforge.net/pmd-4.2.5/rules/codesize.html): 100 řádek na metodu, 1&nbsp;000 řádek na třídu a 10 metod na třídu. Podobný nástroj [Checkstyle](http://checkstyle.sourceforge.net/) navrhuje [odlišné limity](http://checkstyle.sourceforge.net/config_metrics.html#JavaNCSS): 50 řádek na metodu a 1&nbsp;500 řádek na třídu.

Pravidlo 30
------

Hledání doporučení jako jsou tato mě přivedlo k „pravidlu 30“ v knize [Large Software Projects](http://www.amazon.com/Refactoring-Large-Software-Projects-Restructurings/dp/0470858923) (Martin Lippert, Stephen Roock).

> Skládá-li se element z více než 30 subelementů, tak je vysoká pravděpodobnost, že je tam vážný problém:
>
> a) Metody by v průměru neměly mít víc než 30 řádek kódu (nepočítáme prázdné řádky a komentáře).
>
> b) Třída by v průměru měla obsahovat méně jak 30 metod, což je dohromady až 900 řádek kódu. 
>
> c) Balíček by neměl obsahovat víc než 30 tříd, což je dohromady až 27&nbsp;000 řádek kódu.
>
> d) Subsystému s více než 30 balíčky bychom se měli vyhnout. Takový subsystém by obsahoval až 900 tříd s až 810&nbsp;000 řádek kódu
>
> e) Systém s 30 subsystémy by pak obsahoval 27&nbsp;000 tříd a 24,3 milionů řádek kódu.

Jak to vypadá? Vezměte povětší systém s 1 milionem NCLOC (Non-Comment Line of Code). Ten by se měl rozpadnout do:

* 30&nbsp;000+ metod
* 1&nbsp;000+ tříd
* 30+ balíčku
* Snad víc než 1 subsystém

Kolik systémů v reálném světe vypadá stejně a nebo podobně jako tenhle (obzvláště velké systémy, které už tu jsou pár let)?

Jsou tato pravidla užitečná? Jak byste je měli použít?
------

Použít velikost kódu jako základní pravidlo jako tohle je snadné. Snadné vidět a porozumět. Mnoho lidí by argumentovalo, že až příliš jednoduché: lepší indikátor, zda je kód příliš velký, je [cyklomatická složitost](http://onjava.com/pub/a/onjava/2004/06/16/ccunittest.html) nebo jiné metriky kvality kódu. Ale některé nedávné studie ukázaly, že velikost kódu je ve skutečnosti [silný indikátor komplexity a kvality](http://www.neverworkintheory.org/?p=58)

> metriky komplexity vysoce korelují s řádky kódu a proto komplexnější metriky neposkytují žádné další informace, které by nemohly být jednoduše změřeny řádky kódu

V kapitole „Za řádky kódu: Potřebujeme komplexnější metriky?“ v knize [Making Software](http://shop.oreilly.com/product/9780596808303.do), jdou autoři tak daleko, že říkají, že řádky kódu by měly být vždy považovány za „první a jedinou metriku“ pro indikaci defektů, vývoje a údržby modelů.  

Uznání takových prostých pravidel velikosti je na vás. Měli bychom je používat? A pokud ano, tak jak?

Líbí se mi myšlenka prostého a jednoduše pochopitelného pravidla, které můžete mít na mysli, když píšete kód nebo když se rozhodujete, jestli by měl být refaktorován. Skutečná hodnota doporučení jako pravidlo 30 je v tom, když revidujete kód a identifikujte rizika a náklady.

Nicméně vynucení takových pravidel silnou rukou na každém kousku kódu je hloupé. Nechcete se zastavit, jakmile začnete psát 31. řádek metody, to by neskutečně zpomalilo práci. Nutit každého rozdělit kód tak, aby splňoval velikostní limity, povede nikoliv k lepšímu, ale k horšímu kódu (ve struktuře budou dominovat krátkodobá rozhodnutí). 

Jeff Langer v diskusi s Ken Beck poukázal na [čtyři pravidla jednoduchého designu v čistém kódu](http://theholyjava.wordpress.com/2011/02/14/clean-code-four-simple-design-rules/):

> Naším cílem je udržet náš systém malý a stejně tak udržet i malé funkce a třídy. Nicméně toto pravidlo má nejnižší prioritu ze všech čtyř pravidel jednoduchého designu. Ačkoliv je důležité udržet malý počet tříd a funkcí, tak mnohem důležitější je mít testy, eliminovat duplicity a vyjádřit svou myšlenku.

Občas to zabere víc než 30 řádek (nebo 20 nebo 5 nebe jaký je to limit) vytvořit soudržný kus práce. Je důležitější být opatrný s výběrem správné abstrakce a algoritmů a psát jasný, čistý kód. Pomůže-li k tomu domluvený velikostní limit, tak jej použijte. Jestli ne, tak se tím neobtěžujte.