---
layout: post
title:  "Nechte kouzlo zmizet"
date:   2017-09-18
categories: [software development]
disqusId: 193
image: "/assets/2017-09-18/secretlondon-Wizard-s-Hat.png"
tags: [překlad, Uncle Bob]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2017-09-18/secretlondon-Wizard-s-Hat.png" /></div>

[Robert C. Martin (Uncle Bob) svolil](https://twitter.com/unclebobmartin/status/905899584056066048) k překladu svého článku [Make the Magic go away](https://8thlight.com/blog/uncle-bob/2015/08/06/let-the-magic-die.html) (z roku 2015).

Díval jsem se na [rxJava](https://github.com/ReactiveX/RxJava/wiki/How-To-Use-RxJava). Jde o pěkný malý framework, který pomáhá vytvářet a spravovat observery. Zdá se, že filozofií návrhu je, že vše může být pozorováno, vše tudíž může být spravováno callbacky.

To je samozřejmě velmi stará myšlenka, které se datuje už pro [data flow jazyky](https://en.wikipedia.org/wiki/Dataflow_programming), funkcionální a jiné deklarativní jazyky. Tato myšlenka měla dokonze dozvuk v pozdních 90. letech, kdy byla poprvé vydána kniha GOF. Ti z vás, kteří v té době programovali, si možná pamatujete, že několik měsíců si každý myslel, že návrhový vzor observer je _tak úžasný_. Viděli jsme mnoho špatných návrhů postavených nad observerem. Pak se to zastavilo, protože takový návrh byl příliš nepřímý. Kód bylo obtížné debugovat. (Testoval to někdo?) 

Neříkám, že rxJava je špatný nápad. Jak říkám, vypadá celkem pěkně. Jen že to není úplně nová myšlenka. Ostatně co je?
<!--more-->

## Nekonečný úkol

Autoři rxJava, Spring, JSF, JPA, Struts a [dosaďte svůj oblíbený framework] všichni hledají stejnou věc. Tyto fameworky vznikly kvůli frustraci z jazyka a jsou pokusem daný jazyk zlepšit.

Každý framework, který jste viděli, je ve skutečnosti jen ozvěnou výroku:

> Můj jazyk stojí za starou belu!

A tak píšeme frameworky, abychom kompenzovali vlastnosti, které bychom si přáli mít v našem jazyce. A když to nezafunguje, tak, jako James Gosling, Bjarne Stroustrup, Alan Kay, Brad Cox, Dennis Ritchie, Rich Hickey a mnoho mnoho dalších, píšeme nový jazyk.

Nový jazyky! Zlatý! Čistý! Perfektní! Nový jazyk vyřeší všechny nedostatky. Nový jazyk, který nahradí všechny ostatní. Nový jazyk, který odpoví na všechny stížnosti, vyřeší všechny slabiny a urovná veškeré spory. Nový jazyk, kterým se lze snadno vyjádřit, je bezpečný, úsporný, hutný, pružný, disciplinovaný a a a --- perfektní!

## Bzzz! Špatná odpověď!

Samozřejmě že taková bestie neexistuje. Není perfektního jazyka. A v neposlední řadě, všechny „nové“ jazyky už tu byly, jsou to jen předělávky té samé staré ... té samé staré ... _té samého staré_ věci. Upřímně si nemyslím, že by od pozdních 70. a raných 80. let vznikla nová myšlenka v programovacích jazycích.

Myslím tím, že pokud jste jednou programovali v Assembler, FORTRAN, C, Pascal, C++, Smalltalk, Lisp, Prolog, Erlang a Forth, tak jste je viděli všechny. Ach, předpokládám, že byste mohli nadhodit jazyky jako Snobol, ML, Cobol, and XSLT (chce se mi zvracet). Ale většina jejich myšlenek již byla pokryta předchozím seznamem.

To samé platí pro frameworky. Kdy jste naposledy viděli framework s opravdu novou myšlenkou? Pro mě to byl framework _Inside Macintosh_ napsaný v Pascalu v pozdních 70. a raných 80. letech. A to ve skutečnosti bylo jen předělání o pár let staršího Smalltalk frameworku.

Co je nového v software?

> Za posledních třicet let _celkem nic_.

## Santayanova kletba

Tak proč pokračujeme ve psaní nových jazyků a frameworků? Myslím, že odpověď je velmi snadná:

> Ti, kdo si nepamatují minulost, jsou odsouzeni k tomu ji opakovat.

[Jorge Agustin Nicolas Ruiz de Santayana y Borras](https://en.wikipedia.org/wiki/George_Santayana)	

Jinými slovy, každá nová skupina programátorů, která přijde, je předurčena (odsouzena!) k tomu, přepsat ty samé staré jazyky a ty samé staré frameworky. Hm, budou vypadat trochu jinak a budou nepatrně jinak natočené, ale nebudou nové v ničem smysluplném. 

Některé z těchto jazyků a frameworků získají jistou nechvalnou proslulost a stanou se na chvíli populární, jako kdyby byly něco nového a kouzelného, ale to bude jen iluze způsobená pohledem z krátkodobého hlediska. Zastánci těchto „nových“ jazyků a frameworků budou hlasitě prohlašovat, jak moc rychleji můžete programovat, jak snadněji můžete postavit systém a jak lépe jsou ty systémy navržené. Ale nakonec budou programy psány stejnou rychlostí jako předtím, obtížnost bude ohromná jako dřív a návrh bude stále stejně špatný.  

## Kouzlo!

Proč se to děje? Proč lidé stále pátrají po dalším novém jazyku a dalším novém frameworku? Proč se stále dokola točíme na tomto kolotoči frameworků a jazyků v naději, že při další otočce uvidíme novou scenérii? Proč doufáme v kouzlo? 

Doufáme v kouzla, protože věříme na kouzla. Používali jsme jazyky, jejichž chování se zdá magické. Používali jsme frameworky, které dělají magické věci. A v naší naivitě věříme tomu, že prostě můžeme shromáždit o trochu víc takového kouzla a pak při příštím otočení kolotoče se náhle objeví perfektní jazyk nebo perfektní framework. 

## Žádné kouzlo

Ale žádné kouzlo neexistuje. Jsou to jen jedničky a nuly manipulovány mimořádnou rychlostí absurdně jednoduchým strojem. Tyto stroje potřebují diskrétní a detailní instrukce, které jsem povinni pro ně psát.

Myslím, že lidé by se měli co nejdříve naučit assembler. Nečekám, že budou assembler používat dlouhou dobu, protože práce v assembleru je pomalá a bolestivá (a radostná!). Cílem mé obhajoby assembleru je, ujistit se, že kouzlo je zničeno. 

Pokud jste nikdy nepracovali se strojovým kódem, je pro vás téměř nemožné opravdu pochopit, co se děje. Když programujete v Javě, C#, C++ nebo dokonce v C, tak tam je kouzlo. Ale potom, co jste napsali nějaký strojový kód, kouzlo zmizí. Uvědomíte si, že byste mohli napsat kompilátor C ve strojovém kódu. Uvědomíte si, že byste mohli napsat JVM, kompilátor C++ nebo interpreter Ruby. Zabralo by to trochu času a úsilí, ale mohli byste to udělat. Kouzlo je pryč.
 
 A když je kouzlo jednou pryč, tak na věc máte jiný pohled. Díváte se na jazyk jako C, Java nebo C# jako na jiné vyjádření strojového kódu. Podíváte se na řádek kódu v C a můžete „vidět“ instrukce, které generuje. Podíváte se na řádek kódu v Java a můžete si vizualizovat instrukce vykonané JVM. Není v tom záhada, tajemství ani kouzlo. Víte, že kdybyste museli, mohli byste to vše napsat ve strojovém kódu.

To samé platí pro frameworky. Pokud jste někdy psali jednoduchý webový server (jedno jak jednoduchý), pokud jste psali kód, který poslouchá socket, rozbaluje HTTP request packet, generuje HTML a balí ho do HTTP response packetu, ten zapisuje zpět do socketu, tak kouzlo je pryč. Víte, jak napsat webový server. To vrhá úplně jiné světlo na jakýkoliv webový framework, který byste byli v pokušení použít.

Pokud jste někdy psali jednoduchý dependency injector, XML parser, observer generátor nebo query generátor, tak jste kouzlo odehnali. Mohli byste napsat framework, kdybyste potřebovali. Nebo byste mohli napsat kód ve vaší aplikaci, když bude potřeba. _Nepotřebujete něčí framework._

To vrhá na framewok úplně jiné světlo. Nepotřebujete ho. A když ho nepotřebujete, tak nad vámi nemůže mít žádnou moc. Můžete se podívat z čeho je: _jen obyčejný starý kód_ a možná o moc víc kódu, než vlastně potřebujete.

Nyní můžete posoudit, zda náklady všeho toho kódu mají nějaký přínos. Možná existuje jednodušší framework, který to zvládne stejně dobře. Možná nepotřebujete vůbec žádný framework. Možná, _možná_ byste měli napsat trochu kódu, který potřebujete, místo importování tisíce a tisíce řádek do vašeho projektu. Řádky, které jste nenapsali. Řádky, které nemáte pod kontrolou. Řádky, ve které byste nejspíš neměli vkládat tolik důvěry.  

## Moje rada

Nevěřte kouzlům! Předtím, než se uvážete k nějakému frameworku, se ujistěte, že byste ho mohli napsat. Zkuste napsat něco jednoduchého, co 
dělá základní věci, které potřebujete. Ujistěte se, že kouzlo zmizelo. Pak se podívejte na framework znovu. Stojí za to? Dokážete bez něj žít?