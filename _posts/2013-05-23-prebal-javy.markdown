---
layout: post
title:  "Přebal Javy"
date:   2013-05-23
categories: [software development]
disqusId: 131
tags: [překlad, Paul Graham]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://en.wikipedia.org/wiki/File:Java_programming_language_logo.svg"><img src="https://upload.wikimedia.org/wikipedia/en/thumb/3/30/Java_programming_language_logo.svg/80px-Java_programming_language_logo.svg.png" /></a></div><i>Eseje Paula Grahama jsou tak úžasné čtení, že jsem se rozhodl (s jeho <a href="http://www.paulgraham.com/gfaq.html">laskavým svolením</a>), že některé přeložím do češtiny (překlad uvolňuji pod <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/cz/">licencí Creative Commons by-nc-sa</a>). Začínám esejí ještě z pravěku Javy. Sami posuďte, na kolik je text <a href="http://www.paulgraham.com/javacover.html">Java's Cover</a> po dvanácti letech (možná i s přihlédnutím k tanečkům ohledně další verze) aktuální.</i>

<div style="clear:both"></div>

Duben 2001

Tato esej vznikla z diskuse s několika dalšími programátory o tom, proč vypadá Java podezřele. Nejedná se o kritiku Javy! Je to případová studie hackerova radaru.

V průběhu času si hackeři vytvořili cit pro dobré (a špatné) technologie. Domníval jsem se, že by mohlo být zajímavé sepsat, proč mi je Java podezřelá.

Někteří čtenáři připustili, že se jedná o zajímavý pokus napsat něco, o čem předtím ještě nikdo nepsal. Jiní namítali, že se dostanu do potíží zdáním, že píšu o věcech, kterým nerozumím. Dovolte mi vyjasnit (jestli to pomůže), že nepíšu o Javě (kterou jsem nikdy nepoužil), ale o hackerově radaru (o kterém jsem naopak přemýšlel hodně).
<!--more-->

Slovní obrat „nesuď knihu podle obalu“ pochází z dob, kdy byly knihy prodávány v prostém lepenkovém přebalu, kdy si ji každý kupující obalil podle svého vkusu. Tenkrát jste nemohli posoudit knihu podle jejího obalu. Nakladatelský průmysl ovšem pokročil: dnes si nakladatelé dají práci s tím, aby se podle přebalu dalo o knize něco říct.

Strávil jsem mnoho času v knihkupectvích a mám pocit, že jsem se naučil rozumět všemu, co mi nakladatelé měli v úmyslu o knize říct a možná ještě o trochu víc. Čas, který jsem nestrávil v knihkupectvích, jsem trávil převážně u počítače. Věřím, že jsem se rovněž naučil, do určité míry, posoudit technologie podle jejich obalu. Může to být štěstí, ale zachránil jsem se o několika málo technologií, ze kterých se vyklubal pořádný zmetek.

Zatím se mi Java jeví jako zmetek. Nikdy jsem nenapsal žádný program v Javě, ne víc než prolistovat odbornými knihami, nicméně mám tušení, že to nebude příliš úspěšný jazyk. Může se ukázat, že se mýlím; technologické předpovědi jsou nebezpečná záležitost. Ale jako vzkaz budoucím generacím, zde jsou důvody, proč se mi Java nezdá:

1. Kolem Javy je humbuk. Skutečné standardy nepotřebují reklamu. Nikdo netlačil C, Unix nebo HTML. Skutečný standard v době, kdy o něm většina lidí slyší, je už obvykle zavedený. Perl je (na hackerově radaru) stejně velký jako Java, ne-li větší, a to jen díky vlastní zásluze.

2. Java míří nízko. V původní bíle knize Gosling výslovně říká, že Java byla navržena tak, aby nebyla příliš obtížná pro programátory zvyklé na C. Byla navržena jako další C++, C plus několik myšlenek převzatých z pokročilejších jazyků. Stejně jako tvůrci sitcomů nebo nezdravé stravy, designéři Javy záměrně navrhovali produkt pro lidi ne tak chytré jakou jsou oni. Historicky vzato se jazyky, navrhované pro jiné lidi, ukázaly být špatné: Cobol, PL/I, Pascal, Ada, C++. Dobré jazyky byly a jsou takové, které byly navrhování pro své tvůrce: C, Perl, Smalltalk, Lisp.

3. Java má postranní úmysly. Někdo jednou řekl, že svět by byl lepší, kdyby lidé psali knihy je tehdy, když mají co říct, než proto, že chtějí napsat knihu. Rovněž důvod proč neustále slyšíme o Javě není ten, že má něco říct o programovací jazycích. Slyšíme o Javě jako součásti společnosti Sun podrýt Microsoft.

4. Nikdo Javu nemiluje. C, Perl, Python, Smalltalk, a Lisp programátoři milují své jazyky. Nikdy jsem neslyšel o někom, kdo by tvrdil, že miluje Javu. 

5. Lidé jsou donuceni používat Javu. Mnoho lidí, které znám, používají Javu, protože mají pocit, že musí. Buď cítí, že to musí dělat pro obživu; nebo si myslí, že zákazník to tak chce; případně jim to management nařídil. Jsou to chytří lidé. Pokud by daná technologie byla dobrá, používali by ji dobrovolně.

6. Java má příliš mnoho kuchařů. Nejlepší programovací jazyky byly vyvinuty malou skupinou. Zdá se, že Java je řízena komisí. Pokud se nakonec ukáže, že jde přesto o dobrý jazyk, bude to první případ v historii, kdy komise navrhla dobrý jazyk. 

7. Java je byrokratická. Z toho mála, co vím o Javě, se mi zdá, že existuje mnoho protokolů, jak věci dělat. Opravdu dobré jazyky takové nejsou. Nechají vás dělat, co chcete, a nepřekáží.

8. Java je zdánlivě modní. Sun předstírá, že Java je řadový open-source jazyk jako Perl nebo Python. Javě se jen prostě přihodilo, že je kontrolována obří společností. Takže jazyk je spíš stejně fádní a nepraktický jako cokoliv, co vzešlo z velké firmy.

9. Java je navržena pro korporátní organizace. Ty mají jiné cíle než hackeři. Chtějí jazyky, které jsou (nebo se to alespoň má za to) vhodné pro použití ve velkých týmech složených z průměrných programátorů. Chtějí jazyky s nástroji jako omezovač rychlosti v <a href="http://en.wikipedia.org/wiki/U-Haul">náklaďáku U-Haul</a>, který zabrání hlupákům v tom, aby nadělali příliš mnoho škody. Hackeři nemají rádi jazyky, které je znevažují. Hackeři chtějí jenom sílu. Čas ukázal, že jazyky navržené pro velké firmy (PL/I, Ada) prohrály, zatímco hackerské jazyky (C, Perl) vyhrály. Důvod: dnešní hackeři jsou zítřejšími technickými řediteli.

10. Javu mají rádi nevhodní lidé. Programátoři, které nejvíce obdivuji, nejsou Javou celkem uchváceni. Kdo má rád Javu? Bílé límečky, kteří nerozeznají jeden jazyk od druhého, ale vědí, že o Javě četli v novinách; programátoři ve velkých firmách, kteří jsou ohromeni tím, že nalezli ještě něco lepšího než C++; absolventi, kteří jsou připraveni mít rádi jakýkoliv jazyk, který jim zajistí práci (píšem z toho písemku?). Názory těchto lidí jsou kam vítr, tam plášť.

11. Byznys model Sunu je oslaben na dvou frontách. Levné procesory Intel, ty samé, které se používají na stolních počítačích, jsou nyní víc než dostatečně rychlé i pro servery. Navíc FreeBSD se zdá být minimálně stejně tak dobrý operační systém jako Solaris. Reklamy od Sunu naznačují, že potřebujete Sun server pro průmyslově nasazené aplikace. Pokud by to byla pravda, tak by Yahoo bylo první ve frontě na nákup Sunu. Jenže když jsem tam pracoval, všechny servery byly krabice s Intely, na kterých běželo FreeBSD. To je předzvěstí Sunovské budoucnosti. Jestliže se Sun dostane do potíží, stáhnou Javu s sebou.

12. Ministerstvo obrany má rádo Javu, přesvědčují programátory, aby ji používali. To se mi zdá jako nejprůkaznější známka ze všech. Ministerstvo obrany dělá kvalitní, i když drahou, práci zajišťující obranu země. Ovšem milují plány a procedury. Jejich kultura je opakem té hackerské. V otázkách softwaru mají tendenci se mýlit. Naposledy kdy opravdu měli rádi programovací jazyk, tak to byla Ada.

Vězte, že tohle není kritika Javy, nýbrž jejího obalu. Neznám ji dostatečně na to, abych ji měl rád nebo nerad. Je to jen vysvětlení, proč nelačním po tom se Javu naučit.

Může se to zdát povýšené zavrhnout jazyk ještě před tím, než si v něm zkusím něco napsat. Ovšem je to něco, co musí dělat všichni programátoři. Existuje příliš mnoho technologií k naučení. Musíte se naučit posuzovat podle vnějších znaků a určit, které technologie vám stojí za váš čas. Podobně povýšeně jsem zavrhl Cobol, Ada, Visual Basic, IBM AS400, VRML, ISO 9000, protokol SET, VMS, Novell Netware a mimo jiné i CORBA. Prostě smrděly.

Může se stát, že se v případě Javy mýlím. Snad jazyk protlačený velkou firmou, navržený komisí, určený hlavnímu proudu, vychvalovaný do nebes, milovaný Ministerstvem obrany, se přesto stane čistým, krásný a silným jazykem, ve kterém bych k rád programoval. Možná, ale zdá se mi to velmi nepravděpodobné.

Anketa
------

<script type="text/javascript" charset="utf-8" src="https://static.polldaddy.com/p/7125237.js"></script>
<noscript><a href="http://polldaddy.com/poll/7125237/">Můj vztah k Javě</a></noscript>