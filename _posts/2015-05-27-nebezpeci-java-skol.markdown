---
layout: post
title:  "Nebezpečí Java škol"
date:   2015-05-27
categories: [software development]
disqusId: 162
tags: [překlad, Joel Spolsky]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://www.flickr.com/photos/hinkelstone/5114616335/"><img src="https://farm2.staticflickr.com/1100/5114616335_6aa38ba8bf_m.jpg" /></a><br/><a href="https://www.flickr.com/photos/hinkelstone/">Karl-Ludwig Poggemann (cc by 2.0)</a></div>Jsou pointery a rekurze latinou softwarového inženýrství? Zde je článek <a href="http://www.joelonsoftware.com/articles/ThePerilsofJavaSchools.html">The Perils of JavaSchools</a>, který napsal Joel Spolsky (mimo jiné spoluautor <a href="http://www.stackoverflow.com">stackoverflow.com</a>). S jeho <a href="http://local.joelonsoftware.com/wiki/Clarifications_and_Explanations">laskavým svolením</a> na serveru, kde už je <a href="http://local.joelonsoftware.com/wiki/Czech">více jeho českých překladů</a>, jsem text přeložil do češtiny (překlad uvolňuji pod <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/cz/">licencí Creative Commons by-nc-sa</a>).
<div style="clear: both"></div>
<!--more-->

29\. prosince, 2005

Líná děcka.

Kam se poděla tvrdá dřina?

Jistou známkou mé senility je naříkání nad „dnešními dětmi“ a nad tím, jak už nechtějí či nezvládnout dělat cokoliv obtížného.

Jako dítě jsem se učil programovat na děrných štítcích. Pokud jste udělali chybu, neměli jste žádnou z těch moderních vymožeností jako tlačítko zpět, abyste chybu napravili. Museli jste štítek vyhodit a začít od začátku.

Když jsem v roce 1991 začal dělat vstupní pohovory s programátory, nechal jsem je vybrat si libovolný jazyk k řešení problémů, které jsem jim dal. V 99&nbsp;% případů si vybrali C.

Dnes dávají přednost Javě.

Nechápejte mě špatně, s Javou jako implementačním jazykem není nic špatně.

Počkat, chci změnit své prohlášení. V tomto konkrétním článku nepíšu nic o tom, že je Java špatný jazyk. Je mnoho věcí, co je na ní špatně, ale to je na samostatný článek.

Místo toho bych rád zdůraznil, že Java není dostatečně složitý programovací jazyk, aby dokázal oddělit skvělého programátora od průměrného. Může to být dobrý jazyk na práci, ale to není dnešním tématem. Dokonce bych zašel tak daleko a řekl, že fakt, že Java není tak složitá, není <em>bug</em>, ale <em>featura</em>.

Můžu-li být tak drzý, z mé skromné zkušenosti soudím, že jsou na univerzitách jako součást osnov Computer Science (dále jen CS) tradičně učeny dvě věci, které mnoho lidí nikdy skutečně plně nepochopilo: pointery (ukazatele) a rekurze.

Na škole jste začínali s kurzem datových struktur (spojové seznamy, hashovací tabulky atd.) s rozsáhlým použitím pointerů. Tyto kurzy byly často používány jako síto. Byly tak obtížné, že kdo by býval nezvládl mentální výzvu oboru CS, by to vzdal. Což bylo dobře, protože pokud si myslíte, že pointery jsou obtížné, počkejte až se pokusíte dokázat věci ohledně <a href="http://en.wikipedia.org/wiki/Fixed-point_theorem">fixed-point teorému</a>.

Všechna ta děcka, která válela na střední, protože si v BASICu napsali hru pong pro svůj Apple II, se dostala na vysokou. Zapsali si CompSci, kurz datových struktur, a když se dostali k pointerům, jejich mozek prostě explodoval. Další věc, kterou o nich víte je, že získali titul z politologie, protože právničina se jim zdála jako lepší nápad. Viděl jsem různá čísla kolik lidí odpadne z CS, obvykle je to mezi 40&nbsp;% a 70&nbsp;%. Školy mají sklon si myslet, že je to plýtvání. Já si myslím, že je to prostě nezbytné třídění lidí, kteří se nestanou šťastní a úspěšní v kariéře programátora.

Další obtížný kurz pro mnoho mladých studentů CS byl kurz, kde jste se učili funkcionální programování včetně rekurze. MIT nastavilo pro tyto kurzy laťku velmi vysoko. Vytvořili povinný <a href="http://sicp.csail.mit.edu/Fall-2005/">kurz</a>(6.001) a učebnici (Abelson & Sussman - <a href="http://mitpress.mit.edu/sicp/full-text/book/book.html">Structure and Interpretation of Computer Programs</a>), která byla použita na stovkách nejlepších škol jako de facto úvod do CS. (Můžete a měli byste se podívat na starší verzi přednášky <a href="http://swiss.csail.mit.edu/classes/6.001/abelson-sussman-lectures/">online</a>.)

Obtížnost těchto kurzů je udivující. V první lekci jste se naučili téměř vše ze Scheme a byli jste již seznámeni s funkcí, která bere další funkci jako svůj vstup. Když jsem zápasil s takovým kurzem (CSE121 na Penn), viděl jsem, jak ho mnoho studentů, ne-li téměř všichni, nezvládli. Materiál byl příliš obtížný. Napsal jsem profesorovi dlouhý lkavý dopis, že to nebylo fér. Někdo na Penn mě (nebo někoho jiného) musel vyslyšet, protože teď je kurz vyučován v Javě.

Kéž by bývali neposlouchali.

Léta skuhrání líných bakalářů jako já v kombinaci se stížnostmi z průmyslu na to, jak málo inženýrů promuje na amerických univerzitách, si vybralo svou daň. Velké množství jinak perfektně dobrých škol v posledních deseti letech přešlo 100&nbsp;% na Javu. Je to trend. Personalistům, kteří používají „grep“ na vyhodnocení životopisů, se to, zdá se, líbí. Nejlepší na tom je, že na Javě není nic tak obtížného, abyste na tom mohli vyhazovat programátory, kterým chybí ta část mozku, která zvládá pointery a rekurzi. Takže odpadne málo lidí, fakulty mají více studentů, větší rozpočet a vše je dobré.

Štastná děcka z Java škol nikdy nedostanou divný segfault při implementaci na pointerech založené hash tabulky. Nikdy neztuhnou hrůzou ani nebudou blouznit při převodu věcí do bitů. Nebudou si lámat hlavu nad tím, že se v čistě funkcionálním programu nikdy nemění hodnota proměnné a přesto se stále mění. Paradox!

<iframe width="420" height="315" src="https://www.youtube.com/embed/oSJF0F3PlwY" frameborder="0" allowfullscreen></iframe>
<blockquote>To jste měli štěstí! My jsme tři měsíce bydleli ve zmuchlaných novinách v septiku! Museli jsme každé ráno vstát v šest ráno a vyčistit noviny, běžet do fabriky, tam pracovat čtrnáct hodin denně, týden za týdnem, šest pencí týdně a když jsme se vrátili domů, otec nás uspával ranami opaskem!</blockquote><a href="https://www.youtube.com/watch?v=oSJF0F3PlwY">Monty Pythonův létající cirkus - Four Yorkshiremen</a>

Jsem jen jeden z těch starých bručounů, jako Four Yourkshirmen, chvástajících se, jak drsné bylo přežít všechny ty obtíže?

V roce 1900 byla na vysokých školách latina a řečtina povinný předmět ne proto, že by sloužila k nějakému účelu, ale protože byla svým způsobem považovaná za všeobecný rozhled vzdělaných lidí. V jistém smyslu se můj argument neliší od lidí, kteří prosazovali latinu. "[Latina] trénuje vaši mysl. Trénuje paměť. Rozluštit latinskou větu je úžasné myšlenkové cvičení," <a href="http://www.promotelatin.org/whylatin.htm">napsal</a> Scott Barker. Ale nemůžu najít jedinou univerzitu, která by ještě latinu vyžadovala. Jsou pointery a rekurze latinou CS?

Připouštím, že programování s pointery není v 90&nbsp;% případech potřeba, ve skutečnosti jsou v produkčním kódu naprosto nebezpečné. Dobrá. A funkcionální programování není tak moc využíváno v praxi. Souhlasím.

Ale je to stále důležité pro některé z nejvzrušujících programátorských prací. Bez pointerů bychom například nikdy nebyli schopní pracovat na linuxovém jádru. Nemůžete porozumět řádku kódu Linuxu, ani jiného operačního systému, bez skutečného porozumění pointerům.

Bez porozumění funkcionálnímu programování bychom nevynalezli <a href="http://labs.google.com/papers/mapreduce.html">MapReduce</a>, algoritmus který dělá Google tak masivně škálovatelný. Termín Map a Reduce přišly z Lispu a funkcionálního programování. Zpětně viděno, MapReduce je zřejmé každému, kdo si pamatuje něco z 6.001 - čistě funkcionální program nemá žádné vedlejší efekty a proto je snadno paralelizovatelný. Fakt, že Google, nikoliv Microsoft, vynalezl MapReduce, říká něco o tom, proč Microsoft stále nemůže dohnat základy vyhledávání, zatímco Google se posunul k dalšímu problému: budování <a href="http://en.wikipedia.org/wiki/Skynet">Skynet</a>^H^H^H^H^H^H světově největší hromadně paralelní <a href="http://www.pbs.org/cringely/pulpit/pulpit20051117.html">superpočítač</a>. Nemyslím si, že by si Microsoft plně uvědomoval, jak daleko jsou za konkurencí.

Kromě prima facie důležitosti pointerů a rekurze je jejich skutečná hodnota v tom, že velké systémy vyžadují tento druh mentální flexibility, které se vám dostane během učení se o pointerech a rekurzi. A tuto mentální schopnost potřebujete, aby vás nevyhodili z kurzů, kde se učí. Pointery a rekurze vyžadují určitou schopnost úsudku, abstraktního myšlení, a hlavně vidět problém v několika úrovních abstrakce zároveň. A proto schopnost porozumět pointerům a rekurzi je přímo úměrná schopnosti být skvělým programátorem.

Z osnov postavených kompletně na Javě skutečně nic nevytřídí studenty,  kteří postrádají mentální hbitost vypořádat se s těmito koncepty. Jako zaměstnavatel jsem viděl, že Java školy začaly stloukat máslo ze studentů, kteří nejsou prostě dost dobří na to, aby pracovali na složitější aplikaci než <em>další Java účetnictví</em>. Přesto je byli schopní protlačit novými, neskutečně zjednodušenými předměty. Tito studenti by nikdy nepřežili 6.001 na MIT nebo CS 323 na Yale. A upřímně, to je jeden z důvodů, proč si jako zaměstnavatel cením titulu z MIT nebo Yale víc než z Duke, kde nedávno kompletně přešli na Javu. Nebo U. Penn, kde nahradili Scheme a ML Javou a snaží se učit předmět CSE121, který téměř zabil mě i moje kamarády. Ne že bych nechtěl najmout chytrá děcka z Duke nebo Penn, najímám je, jen je pro mě o dost těžší zjistit, co jsou zač. Býval jsem schopný poznat chytrá děcka, protože bývali schopní ve vteřině porozumět rekurzivnímu algoritmu nebo implementovat funkce na manipulaci se spojovým seznamem pomocí pointerů tak rychle, jak rychle uměli psát na tabuli. Ale u Java absolventů nedokážu říct, zda se s tím problémem trápí proto, že nejsou dostatečně vzdělaní, nebo proto, že jim chybí ta speciální část mozku, kterou budou potřebovat pro skvělou programátorskou práci. Paul Graham takovým říká <a href="http://www.paulgraham.com/avg.html">Blub Programmers</a>.

Je velmi zlé, že Java školy nevytřídí taková děcka, která se nikdy nestanou skvělými programátory. Školy se můžou vymluvit, že to není jejich problém. Průmysl, nebo alespoň personalisté-používající-grep jistě volají po tom, aby se učila Java.

Ale Java školy rovněž selhávají v trénování mozků dětí k tomu, aby byli znalé, hbité a dostatečně flexibilní pro to dělat dobrý softwarový design (a nemyslím objektově orientovaný „design“, kde trávíte nespočet hodit přepisováním svého kódu do hierarchie objektů nebo dřina s falešnými „problémy“ jako has-a versus is-a). Potřebujete trénovat myšlení o věcech na více úrovních abstrakce zároveň a tento druh myšlení je přesně to, co potřebuje návrh skvělé softwarové architektury.

Může výuka objektově orientovaného programování (OOP) nahradit síto pointerů a rekurze? Rychlá odpověď: ne. Bez debaty o podstatě OOP to není dostatečně obtížné k vytřídění průměrných programátorů. OOP se na školách skládá většinou z memorování slovníkových hesel jako „zapouzdření“ a „dědičnost“ a absolvování testů ohledně rozdílů mezi polymorfismem a přetěžováním. O nic složitější než se naučit pár slavných dat a jmen v hodinách dějepisu. OOP tak nepředstavuje dostatečnou hrozbu, která by odradila prváky. Pokud máte problémy s OOP, <em>váš program bude stále pracovat</em>, jen ho bude složité udržovat. Ovšem máte-li problémy s pointery, tak dostanete <strong>Segmentation Fault</strong> a nebudete mít tušení, co se děje, dokud se nezastavíte, zhluboka nadechnete a skutečně přinutíte svou mysl pracovat ve dvou různých úrovní abstrakce najednou.

Mimochodem personalisté-používající-grep jsou zde vysmíváni z dobrého důvodu. Nikdy jsem nepotkal nikoho, kdo umí Scheme, Haskel a pointery v C, kdo by se nedokázal naučit Javu za dva dny a psát lepší kód než lidé s pětiletou praxí v Javě, ale zkuste to vysvětlit průměrnému HR trubci.

A co s poslání CS fakult? Nejsou to učňáky! Nemělo by být jejich úkolem trénovat lidi pro práci v průmyslu. To by vám měli říct kolegové nebo v rekvalifikačním kurzu. Univerzity by měly dávat studentům základní nástroje na žití jejich života, nikoliv je připravovat na první týdny v práci. Není to tak?

Přesto CS jsou důkazy (rekurze), algoritmy (rekurze), jazyky (lambda kalkulus), operační systémy (pointery), kompilátory (lambda kalkulus). Z toho plyne že Java školy, které nebudou učit C ani Scheme, ve skutečnosti vůbec neučí CS. Jakkoliv neužitečný může být koncept <a href="http://en.wikipedia.org/wiki/Currying">function currying</a> pro skutečný svět, je to základní požadavek pro CS školy. Nedokážu pochopit, proč profesoři při schvalování osnov dovolili, aby jejich program zprimitivněl na úroveň, kdy nejen že už nezvládnout produkovat pracující programátory, ale nedokáží ani produkovat studenty, kteří by mohli získat doktorát a ucházet se o jejich práci. Počkat. Nevadí, možná že rozumím.

Když se vlastně vrátíte zpět a prozkoumáte diskusi, která se odehrála na akademické půdě během Velké Java změny, všimnete si, že největší obavou bylo zda je Java, jako výukový jazyk, dostatečně jednoduchá.

<em>Můj bože,</em> pomyslel jsem si, <em>chtějí osekat osnovy ještě víc!</em> Proč rovnou nekrmit studenty lžičkou? Nechme asistenty, ať za ně píší testy, tak alespoň nikdo neuteče na humanitní studia. Jak se má kdokoliv cokoliv naučit, když byly osnovy pečlivě sestaveny tak, aby bylo všechno zjednodušeno ještě více, než už to je? Zdá se, že je tu síla (<a href="http://www.sigcse.org/topics/javataskforce/java-task-force.pdf">PDF</a>), která se snaží najít jednoduchou podmnožinu Javy, kterou by šlo učit studenty. Připravují zjednodušenou dokumentaci, která pečlivě schovává všechen ten EJB/J2EE balast před jejich něžnou myslí.

Nejsympatičtější interpretace toho, proč CS fakulty tak nadšeně zjednodušují předměty, je to, že jim to nechává víc času na vysvětlení skutečných CS konceptů. Pokud by nepotřebovali celé dvě lekce na vysvětlení rozdílu, řekněme, Java <b>int</b> a <b>Integer</b>. No, pokud je to ten případ, tak 6.001 pro to má perfektní odpověď: Scheme, je to tak jednoduchý jazyk že může být bystrým studentům vysvětlen celý za deset minut. Pak můžete věnovat zbytek semestru <a href="http://en.wikipedia.org/wiki/Fixed-point_theorem">fixed-point teorému</a>.

Pche.

Vracím se k jedničkám a nulám.

(Cože, vy máte jedničky? Klikaři! My měli jen nuly.)

Osobní poznámka překladatele
------

Nebyl jsem ze studia FEL ČVUT nijak nadšený, naopak jsem <a href="/item/43">dost držkoval</a>. Ovšem nutno přiznat, že ačkoliv nás učili Javu, prošel jsem si i pointery a rekurzi (pravda, <a href="/item/151">to už jsme měli na střední</a>). Bohužel se pro samý hardware a elektroniku nedostalo na Haskel, Lisp...

Zpětně viděno, má <a href="/item/106">úloha z přijímacího pohovoru do Google</a> velký smysl.

Související
------

* <a href="/item/131">Java přebal (Paul Graham)</a>
* <a href="/item/133">Věci, které byste nikdy neměli dělat - část první (Joel Spolsky)</a>
* <a href="/item/106">Google – přijímací pohovor</a>