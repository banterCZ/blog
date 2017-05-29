---
layout: post
title:  "Funkční specifikace bezbolestně – Část čtvrtá: tipy"
date:   2017-05-29
categories: [software development]
disqusId: 189
---

Překlad článku [Painless Functional Specications – Part 4: Tips](https://www.joelonsoftware.com/2000/10/15/painless-functional-specifications-part-4-tips/), jednoho ze série článků o psaní specifikace, který napsal Joel Spolsky (mimo jiné spoluautor [stackoverflow.com](http://www.stackoverflow.com)) již v roce 2000 a až na pár technických nástrojů jako kdyby ho psal dneska. S jeho [laskavým svolením](https://web.archive.org/web/20160412103153/http://local.joelonsoftware.com/wiki/Clarifications_and_Explanations#Translations_outside_the_wiki) jsem text přeložil do češtiny (překlad uvolňuji pod [licencí Creative Commons by-nc-sa](http://creativecommons.org/licenses/by-nc-sa/3.0/cz/)).
<!--more-->

15\. října 2000

Dobrá, mluvili jsme o tom [proč potřebujete specifikaci](https://www.joelonsoftware.com/articles/fog0000000036.html), [co specifikace obsahuje](https://www.joelonsoftware.com/articles/fog0000000035.html) a [kdo by ji měl psát](https://www.joelonsoftware.com/articles/fog0000000034.html). Ve čtvrtém a posledním dílu této série se s vámi podělím o některé své rady, jak psát dobrou specifikaci.

Největší stížnost, kterou slýchávám od týmů píšící specifikaci, je, že nikdo specifikace nečte. Když nikdo nečte specifikace, tak lidé, kteří je píší, mají sklon být trochu cyničtí. Je to jako starý Dilbert komiks, ve kterém inženýři použili deset centimetrů tlustý štos specifikace pro přestavění své kancelářské kóje. Ve vaší typické velké a byrokratické firmě každý tráví měsíce psaním nudné specifikace. Jakmile je specifikace hotová, uloží se na polici a už se nikdy nesundá. Produkt je implementován od píky a bez ohledu na to, co je napsané ve specifikaci, protože nikdo specifikaci nečetl, jelikož je tak ubíjející. Samotný proces psaní specifikace mohl být dobré cvičení, protože to alespoň každého přinutilo nad věcí se zamyslet. Ale fakt, že specifikace leží na polici (nepřečtená a nemilovaná), dává lidem pocit, že to bylo k ničemu.

Jakmile bude produkt doručen, dostanete se do mnoha sporů kvůli tomu, že vaše specifikace nebyla nikdy čtená. Někdo (management, marketing nebo zákazník) řekne: „Počkejte! Slíbili jste mi, že tam bude pařáček na mušle! Kde je pařáček na mušle?“ A programátoři řeknou: „Ne. Když se podíváte do specifikace do kapitoly 3, podkapitoly 2.3.0.1, uvidíte, že říká celkem jasně ‚žádný pařáček na mušle.‘“ To ale neuspokojí zákazníka, který má vždycky pravdu, takže nevrlí programátoři to musí dovybavit pařáčkem na mušle (což je učiní ještě cyničtější ohledně specifikací). Nebo manažer řekne: „Hele, všechna ta slova v tomhle dialog boxu, to je moc ukecané. Nad každým by měl být nadpis.“ A frustrovaní programátoři řeknou: „Ale ty jsi schválil specifikaci s přesným obsahem a rozvržením každého dialog boxu!“ Ale manažer samozřejmě specifikaci nečetl, protože když se pokusil, jeho mozek začal unikat skrz oční důlky a stejně to kolidovalo s jeho úterním golfem.

Takže specifikace jsou dobré, ale nikdo je nečte. Jako autor specifikace musíte lidi přimět, aby vaše věci četli. Pravděpodobně byste se měli snažit nezpůsobit to, aby už tak malý mozek unikl skrz oční důlky.

Přimět lidi, aby četli vaše věci, je obvykle jen otázkou dobrého psaní. Ale nebylo by ode mě fér říct jen: „buďte dobrými spisovateli,“ a nechat to tak. Zde jsou čtyři jednoduchá pravidla, která musíte následovat, abyste vytvořili specifikaci, která je čtena.

Pravidlo 1: Buďte vtipní
======

Jo, pravidlo číslo jedna. Abyste přiměli lidi číst vaši specifikaci, je nutné udělat z toho zážitek. Neříkejte mi, že jste se narodili nudní. To neberu. Každý má neustále zábavné nápady, jen je vyřadíme autocenzurou, protože máme za to, že jsou „neprofesionální“. Pche. Občas musíte porušit pravidla.


Pokud jste četli tu spoustu smetí, které jsem na tomto webu napsal, jistě jste si všimli několika roztroušených chabých pokusů o vtip. Čtyři odstavce zpět jsem vtipkoval na tekutost těla a utahoval si z manažerů za hraní golfu. Ačkoliv ve skutečnosti nejsem tak vtipný, přesto se snažím být zábavný ve stylu smutného klauna. Píšete-li specifikaci, tak vhodné místo, kde být vtipný, jsou příklady. Pokaždé když potřebujete říct příběh, jak funkce funguje, tak místo:

> Uživatel stiskne Ctrl + N pro vytvoření nové tabulky Zaměstnanec a začne zadávat jména zaměstnanců.

Napište něco jako:

> Slečna Prasátko šťouchá do klávesnice řasenkou, protože její buclaté prsty jsou příliš tlusté, aby zmáčkly jednotlivé klávesy, stiskne Ctrl + N pro vytvoření nové tabulky Přítel a napíše jeden záznam „Kermit“.

Pokud jste četli, co napsal Dave Barry, zjistíte, že jeden z nejjednodušších způsobů být vtipný je být konkrétní, i když to není potřeba. „Mrňaví mopsíci“ jsou vtipnější než „psi“. „Slečna prasátko“ vtipnější než „uživatel“. Místo „zvláštní účastníci“ řekněte „levorucí pěstitelé avokáda“. Místo: „Lidé, kteří odmítají uklízet po svých psech, by měli být potrestáni,“ řekněte, že by měli „být posláni do vězení tak osamělého, že vězni musí za sex platit pavoukům.“

Jo a pokud si myslíte, že je neprofesionální být vtipný, tak je mi líto, ale jen nemáte smysl pro humor. (Nepopírejte to. Lidé bez smyslu pro humor to vždycky popřou. Nemůžete mě oblafnout.) A pokud pracujte ve firmě, kde vás lidi budou méně respektovat, když vaše specifikace bude svěží, vtipná a zábavné číst, tak jděte a najděte jinou firmu, protože život je sakra příliš krátký, abyste dny trávili na tak krutém a mizerném místě.

Pravidlo 2: Pište specifikaci jako kód, který vykoná mozek
======

Proč si myslím, že programátoři mají problémy psát dobrou specifikaci?

Píšete-li *kód*, vaším hlavním publikem je kompilátor. Jo, já vím, že lidé taky musí číst kód, ale obecně je to pro ně velmi obtížné. Pro většinu programátoru je dost těžké, aby dostali kód do stavu, kdy ho přečte kompilátor a správně ho interpretuje. Starat se o to, zda je kód i lidsky čitelný, je luxus. Když napíšete:

    void print_count( FILE* a, char * b, int c ){
      fprintf(a, “there are %d %s\n”, c, b);}
    
    main(){ int n; n =
    10; print_count(stdout, “employees”, n) /* code deliberately obfuscated */ }


nebo

    printf(“there are 10 employees\n”

dostanete stejný výstup. Proto, pokud se nad tím zamyslíte, mají programátoři sklon psát něco jako:

> Mějme funkci AddressOf(x), která je definovaná jako mapování z uživatele x na emailovou adresu (ANSI řetězec), daného uživatele podle specifikace RFC-822. Předpokládejme uživatele A a uživatele B, kdy A chce poslat e-mail uživateli B. Takže uživatel A iniciuje novou zprávu za použití nějaké techniky (ale ne všech) uvedené jinde a napíše AddressOf(B) do pole *To:*</blockquote>

To lze přeformulovat:

> Slečna Prasátko chce jít na oběd, takže vytvoří nový e-mail a do políčka *To:* napíše Kermitovu adresu. 
>
> **Technická poznámka**: adresa musí být standardní internetová adresa (podle specifikace RFC-822).

Oboje má teoreticky stejný „význam“, až na to, že prvnímu příkladu není možné porozumět, dokud si ho pečlivě nedekódujete. Zato druhému příklad je snadné rozumět. Programátoři se často snaží psát specifikaci, která vypadá jako hutné vědecké pojednání. Myslí si, že „přesná“ specifikace potřebuje být „technicky“ přesná a tím to hasne.

Chybou je, že když píšete specifikaci, tak kromě toho, že musí být přesná, musí být rovněž srozumitelná. Což v programátorské hantýrce znamená, že musí být napsaná tak, aby ji lidský mozek mohl „zkompilovat“. Jeden z velkých rozdílů mezi počítačem a lidským mozkem je, že počítače jsou ochotné trpělivě sedět, dokud nedefinujete termíny, které chcete použít později. Ale lidé neporozumí tomu, o čem mluvíte, pokud je nejprve nemotivujete. Lidé nechtějí něco dekódovat. Prostě si to chtějí přečíst, aby tomu porozuměli. Lidem musíte poskytnout přehled a pak ho naplnit detaily. U počítačových programů začínáte pracovat s plným detailem od shora až dolů. Počítač nezajímá, zda jsou názvy proměnných smysluplné. Lidský mozek rozumí věcem lépe, když dokážete jeho mysli vykreslit živý obraz vyprávěním příběhu (i kdyby to měl být zlomek příběhu), protože naše mozky jsou vyvinuty právě pro porozumění příběhů.

Ukážete-li zkušenému šachistovi šachovnici uprostřed hry, byť jen na vteřinu nebo dvě, okamžitě bude schopný si zapamatovat pozice všech figur. Ale nesmyslně posuňte několik figur na místa, kam by se v normální hře nedostaly (například pěšec do první řady nebo oba černé střelce na černá pole), a bude pro ně mnohem obtížnější si šachovnici zapamatovat. Počítače myslí jinak. Počítačový program si může zapamatovat možné i nemožné rozložení šachovnice se stejnou lehkostí. Lidský mozek nepracuje způsobem náhodného přístupu, vyšlapané cestičky mají sklon být naším mozkem zesíleny. Některým věcem je snazší porozumět, protože jsou běžnější.

Takže když píšete specifikaci, pokuste se představit si osobu, které je určená, a že chcete, aby pochopili každý krok. Větu za větou se sami sebe ptejte, zda v kontextu, který jste jim doposud dali, při čtení této věty věci do hloubky *porozumí*. Pokud někdo z vašeho publika neví, co to je RFC-822, tak to buď musíte  definovat, nebo alespoň pohřbít do technické poznámky, aby manažeři, kteří budou specifikaci číst, to nevzdali hned, jak narazí na spoustu technického žargonu. 

Pravidlo 3: Pište co nejjednodušeji
======

Nepoužívejte strojený formální jazyk, protože si myslíte, že je neprofesionální psát v jednoduchých větách. Použijte co nejjednodušší jazyk jaký můžete.

Lidé používají slova jako „uplatnit“, protože si myslí, že „použít“ zní neprofesionálně. (Zas je tu to slovo „neprofesionální“. Pokaždé, když vám někdo řekne, že byste něco neměli dělat, protože je to „neprofesionální“, tak víte, že mu dochází opravdové argumenty.) Domnívám se, že ve skutečnosti si mnoho lidí myslí, že jednoduché psaní znamená, že něco je špatně.

Rozdělte text do krátkých vět. Máte-li problém napsat větu čistě, tak ji rozdělte do dvou či třech kratších.

<div style="float: right; margin: 0 1em 1em 2em; width: 40%;">
<hr/>

Časopisu jdou dokonce tak daleko, že vezmou citaci z článku a vytisknou ji velkým písmem doprostřed stránky. Používejte odrážky nebo seznamy, obrázky, grafy, tabulky a spoustu bílého místa tak, aby čtení vypadalo načančaně.

<hr/>
</div> Vyhněte se textovým zdím: celé stránky jen s textem. Lidi to vyděsí a nebudou je číst. Kdy jste si naposled všimli populárního časopisu nebo novin s celostránkovým textem? Časopisy jdou dokonce tak daleko, že vezmou citaci z článku a vytisknou ji velkým písmem doprostřed stránky. Používejte odrážky nebo seznamy, obrázky, grafy, tabulky a spoustu bílého místa tak, aby čtení vypadalo načančaně.
<div style="clear: both"></div>

Nic nezlepší specifikaci víc než velká spousta snímků obrazovek. Obrázek může mít cenu tisíce slov. Kdokoliv, kdo píše specifikaci pro software na Windows, by měl investovat do licence Visual Basic a naučit se ho používat alespoň tak, aby byl schopný dělat _mockupy_ obrazovek (Na Macu použijte REAL Basic; pro webové stránky Front Page nebo Dreamweaver). Zachyťte snímky obrazovky (Ctrl&nbsp;+&nbsp;PrtSc) a vlože je do své specifikace.

Pravidlo 4: Několikrát si vše znovu přečtěte a revidujte
======

Původně jsem měl připravený dlouhý výklad tohoto pravidla, ale je prostě tak snadné a zřejmé. Přečtěte si specifikaci několikrát a revidujte. Jasné? Naleznete-li větu, které není úžasně jednoduše rozumět, tak ji přepište.

Ušetřil jsem spoustu času nevysvětlováním pravidla 4, takže přidám jiné pravidlo.

Pravidlo 5: šablony jsou škodlivé
======
Odolejte pokušení mít standardní šablony pro specifikace. Zpočátku si můžete myslet, že je důležité, aby „každá specifikace vypadala stejně“. Tip: Není. Jaký je v tom rozdíl? Vypadá každá kniha ve vaší domácí knihovně úplně stejně? Chtěli byste to?

Horší je, že máte-li šablony, přidáte do nich několik sekcí, o kterých si myslíte, že jsou důležité pro každou funkcionalitu. Například: Velký Bill vydá nařízení, že od teď by měl mít každý Microsquish produkt internetovou komponentu. Takže šablona specifikace má teď sekci „internetová komponenta“. Kdykoliv někdo bude psát specifikaci, bez ohledu na to jak triviální, musí vyplnit tuto sekci, i kdyby zrovna psal specifikaci pro Microsquish klávesnici.

Sekce se hromadí a šablona začíná být pěkně velká. (Tady je [ukázka velmi špatné šablony pro specifikaci](https://web.archive.org/web/20060210123111/http://www.construx.com/survivalguide/desspec.htm). Kdo ve specifikaci potřebuje bibliografii nebo glosář?) Problém takto velkých šablon je, že lidi vyděsí od psaní specifikace, protože to vypadá jako strašidelný úkol.

Specifikace je dokument, který chcete, aby lidé četli. V tom se nijak neliší od sloupku v _The New Yorker_ nebo studentské práce. Už jste někdy slyšeli o profesorovi, který by studentům rozdával šablony? Už jste někdy četli dva dobré eseje, které by šly napasovat do šablony? Zapomeňte na to.