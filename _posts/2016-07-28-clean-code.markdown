---
layout: post
title:  "Clean Code"
date:   2016-07-28
categories: [software development]
disqusId: 178
---
Jeden z mých nejúspěšnějších tweetů a přitom taková blbost. Takže asi stojí za rozepsání. Mám totiž za to, že existuje korelace mezi pořádkumilovností a čistým kódem.

{% twitter https://twitter.com/banterCZ/status/711907363830239233 %}

Občas vídám kód, z kterého je mi fyzicky nevolno. Ale člověk nějak musí zjistit, co je špatné. Abych citoval <a href="http://archetypal
.cz/2016/ilustrovana-kniha-argumentacnich-klamu/?view=flipbook">Ilustrovanou knihu argumentačních faulů</a>:

> Číst o věcech, které bychom neměli dělat, je často užitečná a poučná zkušenost. Ve své knize O psaní píše Stephen King: „Nejlépe 
se člověk naučí, čeho se vyvarovat, při čtení špatné prózy.” Popisuje svou zkušenost se čtením obzvlášť špatného románu jako „literární ekvivalent očkování proti neštovicím” [King]. Matematik George Pólya bývá citován, jak ve své přednášce o výuce matematiky prohlásil, že člověk musí nejen téma dobře chápat, ale také musí vědět, jak lze téma chápat špatně [Pólya].

Na pomoc si vezmu knihu <a href="https://www.goodreads.com/review/show/677612852?book_show_action=false">Clean Code (Robert C. Martin)</a> a doplním o pár svých postřehů. Měl jsem si ji přečíst na začátku své kariéry, ale na druhou stranu po deseti letech praxe ji dokážu o to víc ocenit. Je smutné, že principy v ní popisované jsou často opomíjené.
<!--more-->

Filozofie 5S
------

Hned v počátku knihy je zmiňovaná <a href="https://en.wikipedia.org/wiki/5S_(methodology)">filozofie 5S</a>, která se skládá z následujících konceptů.
* <strong>Seiri</strong> - rozděl. Klíčové je vědět, kde věci jsou. K tomu je potřeba vhodných jmen.
* <strong>Seiton</strong> - setřiď. Kus kódu by měl být na místě, kde ho očekáváte, že ho naleznete. Pokud ne, tak refaktorujte, abyste ho tam dostali.
* <strong>Seiso</strong> - uspořádej. Udržujte pracoviště čisté, bez překážejících drátů, mastnot, ústřižků a odpadků. Co se zaneřáděným kódem plným komentářů a zakomentovanými řádky, které zachycují historii nebo přání do budoucna? Zbavte se jich!
* <strong>Seiketsu</strong> - standardizuj: Skupina se shodne na tom, jak udržovat pracoviště čisté.
* <strong>Shutsuke</strong> - dodržuj. To znamená mít disciplínu následovat dané postupy, často reflektovat svou práci a být ochotný učinit změnu.

Citace z knihy
------

V knize jsem si hodně podtrhával. Vybrané citace překládám. Začal bych jedním citátem, který nám sahá do svědomí, jelikož máme často tendence svádět příčiny projektových problémů na jiné lidi a vnější okolnosti, přičemž sami máme máslo na hlavě.

> Nic nemá z dlouhodobého hlediska tak ničivý efekt na projektu jako špatný kód. Špatné plánování lze změnit, špatné požadavky předělat, špatnou dynamika týmu opravit. Ale špatný kód hnije a kvasí a stává se neúprosným závažím, které táhne tým dolů.

> Jack W. Reeves: Potřebujeme dobrou architekturu (top level design), dobrou abstrakci (class design) a dobrou implementaci (low level design)

Tady bych připomněl Ilju Kravala a jeho <a href="https://www.goodreads.com/book/show/7874765-analytick-modelov-n-informa-n-ch-syst-m-pomoc-uml-v-praxi?from_search=true">Analytické modelování informačních systémů pomocí UML v praxi</a>, kde razí rozdělování úrovně abstrakce na analytické modelování, návrh designu a kódování. Často se setkávám s tím, že se úrovně příliš míchají a přeskakují. Programátoři mají tendenci přejít rovnou k implementaci, čímž si zadělávají na vážný problém. 

> Čistý kód vždy vypadá, jako by ho psal někdo, komu na tom záleží.

> Poměr mezi časem stráveným čtením a psaním bude dobře víc jak 10:1

> Profesionálové používají svou sílu správně a píší kód, kterému mohou ostatní rozumět.

> Formátování kódu je důležité. Je příliš důležité, abychom ho ignorovali a příliš důležité, abychom z něj udělali náboženství. Formátování kódu je o komunikaci a komunikace je první byznysové přikázání profesionálního programátora.

> Vracet z metod <em>null</em> je špatné, ale posílat <em>null</em> do metod jako parametr je horší.

> Týmy si neuvědomují, že mít nepořádek v testech je stejné jako, ne-li horší než, nemít testy žádné.

> Pokud necháte testy shnít, tak shnije i váš kód. Udržujte svoje testy čisté.

> Abyste napsali čistý kód, musíte nejprve napsat špinavý kód a pak ho vyčistit.

> Samozřejmě že špatný kód může být vyčištěn, ale to je velmi drahé.

Poznámky
------

Ještě pár poznámek bez doslovných citací. Není pochyb, že funkce s mnoha parametry je špatná, ale překvapilo mě, že doporučuje i dyadické funkce (se dvěma proměnnými) konvertovat na monadické funkce (s jednou proměnnou) a má pro to rozumné vysvětlení.

Kdo pamatujete třeba prehistorické verze Hibernate, vzpomenete si, že se to hemžilo checkovanými výjimkami, ale ty porušují <a href="https://en.wikipedia.org/wiki/Open/closed_principle">open/closed princip</a>. Však od nich jazyky (třeba Groovy, kde nemusíte deklarovat <em>throws</em>) a frameworky upouštějí (nahrazují je runtime výjimkami).

Kniha mi přijde jako dobré východisko pro nastavení standardů pro vaše code review. Ovšem ocenil bych, kdyby programátoři psali čistší kód a při code review byl větší prostor na byznys logiku či architekturu, a ne že se v šumu prkotin ztratí to důležité.

Kreativní nepořádek
------

Nevěřím na kreativní nepořádek. Jasně, že když jste uprostřed práce, na nějaký drobek nehledíte, ale v průběhu uklízím a nakonec uklidím úplně (manželka by samozřejmě měla výhrady). Když jsem v příspěvku <a href="/item/145">Co se firmy můžou přiučit od armády 2</a> jen s mírnou nadsázkou zdůvodňoval, proč je dobrý nápad, abychom nosili uniformy, dostal jsem slušnou čočku. Přesto znovu poukážu na armádu, tentokrát na dril a jejich ustlané postele nebo vyčištěné boty. V článku <a href="http://www.telegraph.co.uk/men/the-filter/10890075/Trooping-the-Colour-6-life-lessons-you-can-learn-from-the-drill-square.html">Trooping the Colour: 6 life lessons you can learn from the drill square</a> píší:

> V královské gardě je pozornost věnovaná detailu měřena leskem vašich bot.

Článek <a href="https://unclutterer.com/2011/03/29/scientists-find-physical-clutter-negatively-affects-your-ability-to-focus-process-information/">Scientists find physical clutter negatively affects your ability to focus, process information</a> upozorňuje na výsledky výzkumu Princetonské univerzity.

> Když je vaše prostředí plné nepořádku, tak ten chaos omezuje vaši schopnost se soustředit. Nepořádek rovněž omezuje schopnost mozku zpracovat
 informace. Nepořádek vás činí roztěkanými a neschopné zpracovat informace ve srovnání s uspořádaným, organizovaným a klidným prostředí.
 
Jestli máte lepší zdroje k tématice, šup s nimi do komentářů.

{% twitter https://twitter.com/rdresler/status/268722475049820161 %}

Historka z natáčení
------

Závěrem jedna (ne)veselá historka z natáčení. V duchu <a href="/item/168">Joel Test 2.0</a> děláme statickou analýzu kódu v Sonaru. Jednou za čas se mění pravidla a jejich závažnost, k čemuž se mají šanci všichni vyjádřit. Strhla se celkem vášnivá debata nad pravidlem <em>Unused imports</em> (má ho <a href="http://checkstyle.sourceforge.net/config_imports.html#UnusedImports">Checkstyle</a> i <a href="http://pmd.sourceforge.net/pmd-4.3.0/rules/imports.html#UnusedImports">PMD</a>) a hlavně nad nastavenou závažností <em>Critical</em>, kvůli čemuž byly najednou takřka všechny projekty červené a releasy stopnuté. Domnívám se, že by se na úklid vynaložilo menší úsilí, než na danou diskuzi, obzvlášť když zrovna tohle umí zametat samo IDE. Tím jsem chtěl ilustrovat, že čistota není programátory žádaná. A to ani taková, kterou lze snadno zajistit. Což teprve nějaké pokročilejší postupy jako konvertování dyád na monády.

A proč že potřeba odstraňovat nepoužité importy? V knize Clean Code se píše:

> Specifické importy jsou tvrdá závislost...

A jak že to dopadlo? Závažnost se snížila a nepoužité importy zůstaly. Pak
 už jen krůček k nepoužitým závislostem Mavenu a <a href="/item/166">rázem má war 80 MB</a>.
 
Související
------

* <a href="/item/174">Úvod do profese</a>
* <a href="/item/171">Trocha architektury</a>
* <a href="/item/155">TDD jako podvojné účetnictví</a>
* <a href="/item/159">Pořádek v multi-module buildu</a>
* <a href="/item/133">Věci, které byste nikdy neměli dělat - část první</a>
* <a href="/item/166">Jak velký je váš war</a>