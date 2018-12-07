---
layout: post
title:  "Hackeři a malíři"
date:   2013-07-25
categories: [software development]
disqusId: 135
tags: [překlad, Paul Graham]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://en.wikipedia.org/wiki/File:Durer_selfporitrait.jpg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Durer_selfporitrait.jpg/172px-Durer_selfporitrait.jpg" title="Albrecht Dürer - Autoportrét v kožichu" /></a></div><i>Z esejů Paula Grahama jsem již (<a href="http://www.paulgraham.com/gfaq.html">s laskavým svolením</a>) přeložil <a href="/item/131">Přebal Javy</a>. Nyní se dostávám k delší a hlubší úvaze, kterou lze označit za kultovní. Původní text <a href="http://www.paulgraham.com/hp.html">Hackers and Painters</a>. (překlad uvolňuji pod <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/cz/">licencí Creative Commons by-nc-sa</a>)</i>

Květen 2003

Tento esej vznikl z hostující přednášky na Harvardu, která zahrnovala dřívější proslov na Northeastern University Boston.

Když jsem dokončil inženýrské studium informatiky, šel jsem na uměleckou školu studovat malířství. Mnoho lidí, zdá se, překvapilo, že někdo, kdo se zajímá o počítače, by se také mohl zajímat o malířství. Očividně si mysleli, že hackování a malířství jsou velmi odlišné druhy práce - hackování je chladné, přesné a metodické; zatímco malířství je bouřlivé vyjádření nějakého prapůvodního nutkání.

Oba tyto pohledy jsou nesprávné. Hackování a malířství toho mají mnoho společného. Ve skutečnosti jsou všichni tito rozdílní lidé (hackeři a malíři), které znám, podobní.

Hackeři a malíři mají společné to, že obě skupiny jsou tvůrčí. Spolu se skladateli, architekty a spisovateli se hackeři a malíři snaží dělat dobré věci. Nedělají výzkum jako takový, přesto objeví-li při samotném pokusech o dobru věc nějakou novou techniku, tím lépe.
<!--more-->

Architekti versus inženýři
------

Nikdy jsem neměl rád termín <i>computer science</i>. Hlavní důvod, proč ho nemám rád je, že taková věc neexistuje. <i>Computer science</i> je pytel, do kterého sesypali chabě spolu související oblasti, dané dohromady jen historickou náhodou jako Jugoslávie. Na jedné straně máte skutečné matematiky, ale nazvete jejich činnost <i>computer science</i>, takže můžou požádat <a href="http://cs.wikipedia.org/wiki/DARPA">DARPA</a> ( Agentura pro výzkum pokročilých obranných projektů) o grant. Někde uprostřed jsou lidé, které zajímá bezprostřední historie počítačů - studují například chování algoritmů pro směrování dat skrze sítě. Druhým extrémem jsou hackeři, kteří se snaží napsat zajímavý software a pro které jsou počítače jen vyjadřovacím prostředkem. Jako beton pro architekty nebo barva pro malíře. Je to jako kdyby matematici, fyzici a architekti byli všichni v tom samém oddělení.

Někdy hackeři dělají něco, čemu se říká softwarové inženýrství, ale tento termín je zavádějící. Dobří softwarový designéři nejsou inženýři víc než architekti. Hranice mezi architekturou a inženýrstvím  není ostře definovaná, ale je. A to mezi <i>co</i> a <i>jak</i>: architekti rozhodují co dělat, kdežto inženýři přicházejí na to, jak to udělat.

Co a jak by nemělo být příliš oddělováno. Říkáte si o malér, pokud se rozhodnete co, aniž byste rozuměli, jak to udělat. Ovšem hackování může být zajisté víc než jen rozhodování o tom, jak implementovat nějakou specifikaci. Nejlepší z toho je vytváření specifikace, třebaže nejlepší způsob, jak to učinit, je specifikaci implementovat.

Hackeři nejsou vědci
------

Možná jednou bude <i>computer science</i> jako Jugoslávie, rozpadne se na malé části. Může to být pro dobro věci. Především znamená-li to nezávislost pro hackování, moji rodnou zem.

Spojit všechny tyto různé typy práce dohromady v jedno oddělení může být vyhovující administrativně, ale matoucí intelektuálně. Je ještě další důvod, proč nemám rád označení jako <i>computer science</i>. Lidé uprostřed zřejmě dělají něco jako experimentální vědu. Ale lidé na obou koncích, hackeři a matematici, ve skutečnosti vědu nedělají.

Matematici se tím zjevně neznepokojují. Šťastně postavili práci na dokazování vět jako ostatní matematici v matematickém oddělení kolem a možná si brzy přestanou všímat, že budova, ve které pracují, má na sobě napsáno <i>computer science</i>. Zato s označením pro hackery je potíž. Pokud nazveme jejich práci vědou, tak dostanou pocit, že by se s nimi mělo jednat vědecky. Takže místo toho aby dělali, co chtějí, což je navrhovat krásný software, budou hackeři na univerzitách a v laborkách mít dojem, že by měli psát výzkumné práce.

V nejlepším případě to bude formalita. Hackeři naprogramují úžasný software a pak o něm něco napíší. Tyto papíry se stanou zastoupením pro to, čeho se daným softwarem  dosáhlo. Nicméně často tenhle zmatek způsobí problém. Je snadné nechat se unést od stavby krásných věcí ke stavbě ošklivých, které jsou vhodnější jako objekt výzkumné práce.

Bohužel krásné věci nejsou vždy nejlepším objektem, o kterém by šlo psát. Výzkum musí být zaprvé originální - kdokoliv, kdo psal disertaci kvůli svému Ph.D. titulu, ví, že abyste s jistotou prozkoumávali nedotknuté území, vyžaduje to tvrdě hájit zem, kterou nikdo nechce. Zadruhé výzkum musí být dostatečně rozsáhlý a příšerný systém plodí tuny papírů, protože můžete psát o překážkách, které jste museli překonat. Nic nezaručí vydatný  problém jako začít špatným předpokladem. Většina umělé inteligence je příkladem tohoto pravidla; pokud předpokládáte, že znalost může být reprezentována jako seznam predikátů logických výrazů, jejichž proměnné reprezentují abstraktní koncept, budete mít mnoho co psát, jak by to mělo fungovat. Jak Ricky Ricardo říkával: "Lucy, máš co vysvětlovat."

Způsob jak vytvořit něco krásného je často v nepatrných kosmetických úpravách již existujícího, případně kombinací dosavadních myšlenek trochu jinak. Tento způsob práce je obtížné převést ve vědecké papíry.

Jak posuzovat kvalitu práce
------

Tak proč univerzity a laboratoře stále soudí hackery podle publikací? Ze stejného důvodu jako je školní znalost měřena prostými standardizovanými testy nebo produktivita programátorů měřena řádkami kódu. Tyto testy je jednoduché aplikovat a není nic lákavějšího jako snadný test takového druhu práce.

Měření toho, o co se totiž hackeři pokouší, tj. návrh úžasného softwaru, by bylo mnohem obtížnější. Musíte mít smysl pro design, abyste mohli design posuzovat. A není žádná korelace, leda záporná, mezi schopností rozpoznat dobrý design a sebejistotou, že to umí. 

Jediný vnější test je čas. Časem se krásným věcem daří, a ošklivé bývají odloženy. Naneštěstí potřebný čas může být delší nežli lidský život. Samuel Johnson řekl, že trvá sto let, než se ustálí spisovatelova pověst. Musíte počkat než spisovatelovi vlivní přátelé a pak ještě jejich následovníci zemřou. 

Domnívám se, že hackeři prostě musí resignovat na velkou roli náhody, která ovlivňuje na jejich pověst. Nijak se tím neliší od ostatních tvůrců. Ve skutečnosti mají v tomto srovnání štěstí, protože vliv módy není v hackování ani zdaleka takový jako v malířství.

Skicování
------

Jsou horší věci, než to, že lidé neporozumí vaší práci. Horší je, že sami neporozumíte své práci. Souvisí to s tím, kde hledáte nápady. Když jste na oddělení <i>computer science</i>, máte například sklon věřit, že hackování je aplikovaná verze <i>computer science</i>. Po celou dobu inženýrského studia jsem měl nepříjemný pocit někde vzadu v hlavě, že bych měl znát více teorie. Bylo pak ode mne velmi ledabylé, že jsem vše zapomněl do tří týdnů od státnic.

Nyní si uvědomuji, jak jsem se mýlil. Hackeři potřebují rozumět počítačové teorii stejně tak, jako malíři musí rozumět chemii barev. Potřebujete znát jak vypočítat časovou a paměťovou složitost a mít povědomí o <a href="http://cs.wikipedia.org/wiki/Turingovsk%C3%A1_%C3%BAplnost">turingovské úplnosti</a>. Měli byste si pamatovat i něco o stavových strojích, pro případ, že byste měli napsat parser nebo knihovnu pro regulární výrazy. Malíři si opravdu musí o barvách pamatovat mnohem víc.

Zjistil jsem, že nejlepší zdroj nápadů nejsou ostatní oblasti světa počítačů, ale oblasti společné i ostatním tvůrcům. Malířství mi bylo mnohem bohatším zdrojem myšlenek, než počítačová teorie.

Například nás ve škole učili, že bychom si měli program, před tím, než se vůbec přiblížíme k počítači, napsat celý na papír. Zkusil jsem si, že takhle neprogramuji, že při tom rád sedím před počítačem, ne s kusem papíru. O co hůř, místo trpělivého psaní úplného programu a ujišťování se, že je správně, jsem měl sklony chrlit ze sebe kód, který byl beznadějně rozbitý a postupně ho stloukal do nějakého tvaru. Učili nás, že debugování je druh závěrečné zkoušky, kde zachytíme překlepy a to, co jsme doposud přehlédli. Způsob, jakým jsem pracoval, se spíš zdál jako programování složené z debugování.

Dlouhou dobu mě to trápilo, stejně jako tehdy, když jsem se cítil provinile za to, že nedržím pero tak, jak nás to učili na základce. Kdybych se býval podíval na ostatní tvůrce, malíře nebo architekty, uvědomil bych si, že pro to, co jsem dělal, existuje jméno: skicování. Můžu říct, že způsob programování, který mě učili ve škole byl celý špatně. Musíte přijít na program zatímco ho píšete, stejně jako to dělají spisovatelé, malíři a architekti.

Uvědomění si toho má skutečný dopad na softwarový design. Znamená to, že programovací jazyky by měly být především kujnou hmotou. Programovací jazyk je k vymýšlení programů, ne k vyjadřování programů, které jste už vymysleli. Měl by být tužkou, nikoliv perem. Staticky typované programy by byly krásný nápad, kdyby lidé psali programy tak, jak nás to učili ve škole. Ale tak žádný hacker, kterého znám, nepíše. Potřebujeme jazyk, který nás nechá čmárat, šmudlat a mazat, ne jazyk, u kterého budete sedět s čajovým šálkem plných typů, balancovat ho na koleni a vést zdvořilou konverzaci s přísnou tetičkou kompilátorem.

Matematická závist
------

Když už jsme narazili na téma statického typování, identifikujeme-li se s tvůrci, ušetří nás to dalšího problému, který trápí vědu: matematická závist. Každý ve vědě tajně věří, že matematici jsou chytřejší, než ve skutečnosti jsou. Mám dojem, že matematici tomu taky věří. Každopádně ve výsledku se vědci snaží, aby jejich práce vypadalo co nejvíce matematicky. V oboru jako je fyzika to nejspíš nenapáchá tolik škody, ale čím víc se blížíme přírodním vědám, tím větší problém se z toho stává.

Stránka vzorečků prostě vypadá působivě. (Tip na extra působivost, použijte písmena řecké abecedy). Což svádí k tomu, pracovat na problémech, které lze vyřešit formálně, spíš než na problémem, které jsou, řekněme, důležité.

Pokud se hackeři ztotožní s jinými tvůrci, jako spisovatelé a malíři, nebudou mít snahu tohle dělat. Spisovatelé a malíři netrpí matematickou závistí. Mají za to, že dělají něco naprosto nesouvisejícího. Stejně jako hackeři, alespoň se to domnívám.

Velké firmy
------

Jestliže univerzity a výzkumné laboratoře nepustí hackery k práci, kterou chtějí dělat, tak je pro ně možná vhodné místo ve firmách. Bohužel ani firmy nenechají dělat hackery co chtějí. Univerzity a výzkumné laboratoře nutí hackery, aby byli vědci, a firmy je nutí, aby byli inženýry.

Objevil jsem to teprve nedávno. Když Yahoo koupilo Viaweb, zeptali se mě, co chci dělat. Nikdy jsem neměl příliš v lásce byznys, tak jsem řekl, že chci prostě hackovat. Když jsem se dostal do Yahoo, zjistil jsem, že pro ně hackování znamená implementovat software, nikoliv ho navrhovat. Programátory brali jako techniky, kteří převádí vizi (jestli tomu tak lze říkat) produktových manažerů do zdrojového kódu.

To je, zdá se, výchozí plán ve velkých firmách. Činí tak proto, že tím snižují směrodatnou odchylku v příjmu. Pouze malé procento hackerů totiž může navrhovat software a pro lidi, kteří řídí firmy, je obtížné tyto lidi rozpoznat. Místo svěření budoucnosti software jednomu brilantnímu hackerovi se firmy zařídili tak, že design navrhuje výbor a hackeři ho pouze implementují.

Pokud chcete v nějakém bodu vydělat peníze, pamatujte toto, protože je to jeden z důvodů, proč startupy uspějí. Velké firmy chtějí snížit směrodatnou odchylku designu, protože se chtějí vyhnou katastrofě. Ovšem když oříznete oscilace, přijdete jak o vysoké hodnoty tak i o nízké. To je problém velkých firem, nevyhrají tím, že by dělali skvělý produkt. Velké firmy vyhrají, protože stojí za prd méně, než jiné velké firmy.

Pokud přijdete na to, jak vést designovou válku s dostatečně velkou firmou, kde je software navrhován produktovými manažery, nemůžou vám nikdy stačit. Tyto příležitosti není snadné najít. Je obtížné velkou firmu zatáhnou do designové války, asi tak jako je obtížné vylákat obránce hradu ven do bitvy muže proti muži. Bylo by například úžasně snadné napsat lepší textový editor než Microsoft Word. Ve svém hradu monopolu na operační systém by si toho dokonce nejspíš ani nevšimli.

Bitevní pole designových válek jsou nové trhy, kde ještě nikdo nestačil zřídit opevnění. Zde můžete hodně získat odvážným přístupem k designu, máte-li navíc lidi, kteří dělají obojí, jak navrhují, tak implementují produkt. Microsoft sám to na začátku učinil. Stejně tak Apple, rovněž Hewlett-Packard. Mám podezření, že tak si tak počínal téměř každý úspěšný startup.

Startup
------

Jeden ze způsobů, jak napsat parádní software, je začít vlastní startup, ačkoliv to s sebou přináší dva problémy. Zaprvé ve startupu musíte dělat spoustu věcí vedle psaní software. Ve Viaweb považuji za štěstí když programuji čtvrtinu času. Věci, které musím dělat ve zbývajících třech čtvrtinách, jsou někde mezi nudný po úděsný. Mám na to srovnávací měřítko. Jednou jsem musel opustit poradu vedení kvůli zubnímu kazu. Pamatuji si, jak jsem seděl v zubařském křesle, čekal na vrtačku, a cítil se jako na dovolené.

Další problém se startupy je, že není velký přesah mezi druhem software, který vydělává peníze, a druhem, který je zajímavé psát. Psaní programovacích jazyků je zajímavé, první produkt Microsoftu byl takový, ale dnes nikdo za programovací jazyk platit nebude. Chcete-li vydělat peníze, obvykle bude třeba pracovat na problémech, které jsou příliš nesympatické, aby je řešili zadarmo.

Všichni tvůrci čelí tomuto problému. Ceny jsou určeny nabídkou a poptávkou a není tak velká poptávka po věcech, na kterých je radost pracovat, jako po věcech, které řeší všední problémy individuálních zákazníků. Hraní v divadle Off-Brodway není placené tolik jako nošení gorilího převleku u něčího stánku na veletrhu. Psaní románů nevynáší tolik jako psaní inzerátu na kuchyňský drtič odpadu. A hackování programovacích jazyků není placené tak, jako vyřešení, jak připojit zastaralou a shnilou firemní databázi na jejich webový server.

Denní práce
------

Myslím, že odpovědí na tento problém je, i v případě software, koncept známý téměř všem tvůrcům: denní práce. Toto označení začalo s muzikanty, kteří vystupovali večer. Obecněji to znamená, že máte jednu práci pro peníze a druhá je vaší láskou.

Takřka všichni tvůrci mají v počátku kariéry denní práci. Malíři a spisovatelé jsou tím proslulí. Když máte štěstí, tak vaše denní práce bude úzce spjata s vaší skutečnou prací. Hudebníci často pracují v prodejně s nahrávkami. Hackeři pracují na programovacím jazyku nebo operačním systému, který jim podobně může sehnat denní práci. [<a href="#1">1</a>]

Nepřináším nic nového, mluvím-li od denní hackerské práci a psaní krásného softwaru bokem. O tom je vlastně open-source. Možná že je open-source ten správný model, protože je nezávisle stvrzen všemi ostatními hackery.

Překvapuje mě, že se zaměstnavatelé zdráhají dovolit hackerům pracovat na open-source projektech. Ve firmě Viaweb bychom se naopak zdráhali přijmout někoho, kdo tak nečinil. Při technickém pohovoru nás jako hlavní věc zajímá, jaký software napsali ve svém volném čase. Nemůžete dělat doopravdy nic pořádně, jestliže to nemilujete. A milujete-li hackování, nevyhnutelně budete pracovat na svých projektech. [<a href="#2">2</a>]

Postupné učení
------

Jelikož hackeři jsou spíš tvůrci než vědci, tak správná metafora není věda ale srovnání s ostatními typy tvůrců. Co dalšího nás může malování naučit o hackování?

Jedna věc, kterou se můžeme od malování přiučit, nebo alespoň potvrdit, je, jak se naučit hackovat. Malovat se naučíte většinou tak, že budete malovat, stejně tak hackovat. Většina hackerů se nenaučila hackovat tak, že by chodila na vysokoškolské kurzy programování. Naučili se hackovat díky psaní vlastních programů ve svých třinácti letech. Dokonce i na vysoké škole se naučíte hackovat především hackováním. [<a href="#3">3</a>]

Jelikož za sebou nechávají malíři stopu, můžete sledovat jak se praxí zdokonalovali. Podíváte-li se na malířovo portfolio v chronologické pořadí, uvidíte, že každá malba staví na věcech, které se naučil na předchozí malbě. Pokud v malbě něco funguje velmi dobře, obvykle naleznete verzi jedna v menším provedení na nějakém předchozím obraze.

Předpokládám, že tak pracuje většina tvůrců, zdá se, že i spisovatelé a architekti. Možná by bylo pro hackery dobré, kdyby se chovali víc jako malíři a pravidelně začínali od nuly, místo letitého pokračování na jednom projektu a pokoušet se zahrnout všechny své pozdější nápady jako revize.

Skutečnost, že hackeři se učí hackovat tím, že hackují, je další známka toho, jak se liší od vědců. Vědci se neučí vědu tak, že by ji dělali, ale tím, že dělají laborky a vzorové úlohy. Vědci začínají dělat práci, která je dokonalá, v tom smyslu, že se pokoušejí zreprodukovat práci, kterou už pro ně někdo udělal. Případně se dostanou do bodu, kdy můžou dělat původní práci. Zatímco hackeři dělají od samého počátku původní práci, což je prostě velmi špatně. Takže hackeři začínají <i>původně</i>, dostanou se k <i>dobře</i>, a vědci začínají s <i>dobře</i> a dostanou se k <i>původně</i>.

Kopírujte jako umělci
------

Dalším způsobem, jak se tvůrci učí, je pomocí příkladů. Pro malíře je muzeum referenční knihovnou technik. Po staletí bylo kopírování velkých mistrů součástí tradičního vzdělání malířů, protože kopírování vás přinutí se dívat pozorněji na to, jak byla malba provedená.

Stejně tak spisovatelé. Benjamin Franklin se naučil psát tak, že shrnoval myšlenky z esejů Addisona a Steeleho a pokoušel se je reprodukovat. Raymond Chandler dělal to samé s detektivkami.

Podobně se hackeři mohou naučit programovat díváním se na dobré programy; ne jen na to, co dělají, ale taky do zdrojového kódu. Jeden z nejméně propagovaných přínosů open-source hnutí je to, že učení se programovat učinilo snazší. Když jsem se učil programovat, museli jsem se spolehnout většinou na příklady z knih. Jeden dostupný pořádný kus kódu byl Unix, ale dokonce ani ten nebyl open-source. Většina lidí, která četla kód, ho četla z nelegální kopie knihy, kterou napsal <a href="http://en.wikipedia.org/wiki/John_Lions">John Lion</a> v roce 1977 a jejíž vydání bylo povolené teprve až v roce 1996.

Změna
------

Další příklad, který si můžeme vzít z malování je to, jak jsou obrazy tvořeny postupným vylepšováním. Malby obvykle začnou skicou. Postupně jsou doplňovány detaily. Ale není to pouze proces vyplňování. Občas se původní plány ukážou být chybné. Na nesčetně maleb, když se na ně podíváte rentgenem, se ukážou končetiny, které byly přesunuty nebo upravené rysy obličeje.

To je poučení, které jsem si vzal z malířství. Myslím, že hackování by mělo fungovat stejně. Je nereálné očekávat, že specifikace programu bude dokonalá. Budete na tom lépe, pokud si to přiznáte a budete psát programy, které umožní změnu v průběhu.

(Struktury velkých firem jim to dělají složitějším, takže další aspekt, v čem mají startupy výhodu.)

Každý teď nejspíš ví o nebezpečí předčasné optimalizace. Mám za to, že bychom se měli také bát předčasného návrhu; rozhodnout se příliš brzy, co by program měl dělat.

Správné nástroje vám pomůžou se tomuto nebezpečí vyhnout. Dobrý programovací jazyk, stejně jako olejová barva, by vám měl umožnit snadno změnit názor. Dynamické typování je zde výhrou, protože se nemusíte předem zavázat ke specifické datové reprezentaci. Ovšem klíčem ke flexibilitě je, myslím, učinit jazyk velmi abstraktním. Nejsnáze se mění krátký program.

Detail
------

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://en.wikipedia.org/wiki/File:Leonardo_da_Vinci,_Ginevra_de%27_Benci,_1474-78.png"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Leonardo_da_Vinci%2C_Ginevra_de%27_Benci%2C_1474-78.png/180px-Leonardo_da_Vinci%2C_Ginevra_de%27_Benci%2C_1474-78.png" title="Leonardo da Vinci, Ginevra de' Benci" /></a><br /><a href="http://en.wikipedia.org/wiki/File:Leonardo_da_Vinci,_Ginevra_de%27_Benci,_1474-78.png">Leonardo da Vinci, Ginevra de' Benci</a></div>Zní to jako paradox, ale skvělí malíři musí být lepší než je potřeba. Když například Leonardo maloval portrét <a href="http://en.wikipedia.org/wiki/Ginevra_de'_Benci">Ginevra de Benci</a> v Národní galerii, umístil ji za hlavu jalovec. Přičemž pečlivě vymalovat každý jednotlivý list. Mnoho malířů si přesto může myslet, že je to prostě jen něco, co přijde na pozadí, aby to zarámovalo její hlavu. Nikdo se tak blízko nepodívá.

Nikoliv však Leonardo. Jak tvrdě pracoval na části malby vůbec nezáleželo na tom, jak očekával, jak moc z blízka se bude někdo dívat. Byl jako Michael Jordan. Vytrvalý.

Vytrvalost vítězí, protože v souhrnu se stávají neviděné detaily viditelnými. Když lidé prochází kolem portrétu Ginevra de Benci, jejich pozornost je jím často upoutána, aniž by se předtím podívali na štítek a všimli si, že je na něm napsáno Leonardo da Vinci. Všechny tyto zkombinované neviděné detaily vytvoří něco, co je prostě ohromující jako tisíc sotva slyšitelných zpívajících hlasů, které ladí.

Podobně tak skvělý software vyžaduje fanatickou oddanost kráse. Podíváte-li se dovnitř dobrého softwaru, shledáte, že části, o kterých se nepředpokládá, že je někdo uvidí, jsou rovněž krásné. Netvrdím, že píšu skvělý software, ale vím, že když přijde na psaní kódu, jsem zralý na prášky, kdybych tak přistupoval i běžnému životu. Vytáčí mě, když vidím špatně odsazený kód nebo ošklivá jména proměnných.

Cykly
------

Pokud by hackeři byli pouze implementátoři přetvářející specifikaci do kódu, mohli by k tomu přistupovat jako k hloubení výkopu. Ale jestliže jsou hackaři tvůrci, musíme vzít v potaz inspiraci.

V hackování jako v malířství přichází práce v cyklech. Někdy vás nakopne nový projekt a chcete na něm pracovat šestnáct hodin denně. Jindy se zase nic nezdá zajímavé.

Abyste odváděli dobrou práci, musíte tyto cykly vzít na vědomí, protože ovlivňují to, jak na ně reagujete. Když řídíte auto s manuální převodovkou a jedete do kopce, musíte občas sešlápnout spojku, aby vám nechcípl motor. Sešlápnout spojku může podobně zabránit poklesu ambic. Jak v malířství tak v hackování jsou některé úlohy děsivě ambiciozní a jiné zase uklidňujícím způsobem rutinní. Je dobrý nápad šetřit si nějaké snadné úlohy na chvíle, kdybyste se mohli zaseknout.

V hackování to doslova znamená vyšetřovat bugy. Mám rád debugování, při tom je hackování tak přímočaré, jak si lidé myslí, že je. Máte zcela omezený problém a musíte ho vyřešit. Váš program by měl dělat x, místo toho dělá y. Kde se to pokazilo? Víte, že nakonec vyhrajete. Je to odpočinkové jako malování zdí.

Spolupráce
------

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://en.wikipedia.org/wiki/File:Andrea_del_Verrocchio_002.jpg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Andrea_del_Verrocchio_002.jpg/180px-Andrea_del_Verrocchio_002.jpg" title="Andrea del Verrochio, Kristův křest" /></a><br /><a href="http://en.wikipedia.org/wiki/File:Andrea_del_Verrocchio_002.jpg">Andrea del Verrochio, Kristův křest</a></div>Malířství nás může naučit nejenom si organizovat svou vlastní práci, ale taky jak spolupracovat. Mnoho ohromného umění v minulosti vzniklo jako práce více rukou, přesto vedle něj v muzeu visí pouze jedno jméno. Leonardo byl učeň v dílně mistra jménem Andrea del Verrocchio a maloval tam anděly na obraze <a href="http://en.wikipedia.org/wiki/File:Andrea_del_Verrocchio_002.jpg">Kristův křest</a>. Takový způsob práce byl pravidlem, nikoliv výjimkou. Michelangelo byl považován za obzvláště zaníceného, protože trval na tom, že bude malovat všechny postavy na stropě Sixtinská kaple sám.

Pokud vím, tak když pracují malíři společně, tak nikdy nepracují na stejné části. Bylo běžné, že mistr maloval hlavní figury a asistenti ostatní a pozadí. Ale nikdy nemaloval nikdo přes práci někoho jiného. 

Myslím, že je to správný model spolupráce i pro software. Když je kus kódu hackován třemi nebo čtyřmi různými lidmi, nikdo ho skutečně nevlastní a skončí to jako společenská místnost. Obvykle bezútěšné a opuštěné, kde se hromadí odložené věci. Myslím, že správný způsob spolupráce je rozdělit projekt do ostře definovaných modulů, každý by měl určeného správce. Rozhraní mezi nimi je pečlivě navrženo a artikulováno (je-li to možné) jako programovací jazyk.

Empatie
------

Stejně jako malířství je software většinou určen lidem. Proto hackeři stejně jako malíři musí mít empatii, aby dokázali skvělou práci. Musíte být schopní vidět věci z uživatelského pohledu.

Jako dítěti mi vždy říkali, abych se díval na věci z pohledu někoho jiného. Což v praxi vždy znamenalo dělat něco, co chtěl někdo jiný, místo toho, co jsem chtěl jí. To pochopitelně dalo empatii špatné jméno a já si udělal poznámku, že empatii nemám rozvíjet.

Páni, jak já se mýlil. Ukázalo ze, že dívat se na věci z pohledu jiných lidí je prakticky tajemství úspěchu. Neznamená to nutně být obětavý. Zdaleka ne. Porozumění tomu, jak se někdo dívá na danou věc, neznamená, že budete jednat v jeho prospěch; v některých situacích (například ve válce) budete chtít udělat přesně opak. [<a href="#4">4</a>]

Většina tvůrců dělí věci pro lidi. Abyste zaujali publikum, musíte porozumět jejich potřebám. Například téměř všechny velké významné malby jsou malby lidí, protože lidé jsou to, co lidi zajímá.

Empatie je možná ten nejdůležitější rozdíl mezi dobrým a skvělým hackerem. Někteří hackeři jsou docela chytří, ale když dojde na empatii, jsou v podstatě <a href="http://cs.wikipedia.org/wiki/Solipsismus">solipsisti</>. Pro takové lidí je obtížné navrhnout skvělý software [<a href="#5">5</a>], protože se nedokáží na věc podívat cizíma očima.

Jak dobří jsou lidé v empatii poznáte, když je budete pozorovat, jak vysvětlují technickou otázku někomu netechnickému. Všichni nejspíš známe lidi, jinak chytré, kteří jsou v tomto komicky špatní. Pokud se jich někdo na večírku zeptá, co je to programovací jazyk, řeknou něco jako: „Ehm, vyšší programovací jazyk je to, co kompilátor používá jako vstup pro generování objektového kódu.“ Vyšší programovací jazyk? Kompilátor? Objektový kód? Někdo, kdo neví, co je programovací jazyk zjevně neví co znamenají ani tyto termíny.

Součást toho, co musí dělat software, je vysvětlovat sám sebe. Abyste napsali dobrý software, je potřeba, abyste porozuměli tomu, jak málo uživatelé rozumí. Proklikají program bez příprav a bylo by lepší, aby dělal to, co hádali, že bude dělat, protože návod číst nebudou. Nejlepší systém, který jsem kdy viděl, že na to bral ohled, byl v roce 1985 originál Macintosh. Dělal, co software téměř nikdy nedělá: prostě fungoval. [<a href="#6">6</a>]

Zdrojový kód by se také měl vysvětlit sám. Pokud by si lidé měli pamatovat jediný citát o programování, měl by to být ten z úvodu knihy <a href="http://amzn.to/15XLZ9j">Structure and Interpretation of Computer Programs</a>.

<i>Programy by měly být psány tak, aby je lidé zvládli přečíst, nikoliv jen aby je stroje mimochodem vykonávaly.</i>

Musíte mít empatii nejen pro vaše uživatele, ale i pro vaše čtenáře. Je to pro vaše dobro, protože budete jeden z nich. Mnoho hackerů napsalo program jen proto, aby po šesti měsících, kdy se k němu vrátili, neměli ani tušení, jak funguje. Znám několik lidí, kteří se po takové zkušenosti zřekli Perlu. [<a href="#7">7</a>]

Nedostatek empatie je spojován s inteligencí, někde je to dokonce něco jako móda. Ale já si nemyslím, že je mezi nimi nějaká korelace. Můžete dělat dobře matematiku a přírodní vědy aniž byste se naučili empatii. Lidé v těchto oborech bývají chytří, takže tyto dvě kvality bývají spojovány. Ale je spoustu hloupých lidí, kteří jsou v empatii taky špatní. Jen schválně poslouchejte otázky, které lidé volají do talk show. Ptají se takovou oklikou, že moderátor musí dotaz přeformulovat za ně.

Sláva
------

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://en.wikipedia.org/wiki/File:Federico_da_Montefeltro.jpg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Federico_da_Montefeltro.jpg/169px-Federico_da_Montefeltro.jpg" title="Piero della Francesca, Federico da Montefeltro" /></a><br /><a href="https://en.wikipedia.org/wiki/File:Federico_da_Montefeltro.jpg">Piero della Francesca, Federico da Montefeltro</a></div>Jestliže funguje hackování jako malířství a psaní, není to skvělé? Dostanete jen jeden život. Můžete ho strávit prací na něčem skvělém.

Bohužel na otázku je těžké odpovědět. Vždy je velké časové zpoždění co se prestiže týče. Je to jako světlo ze vzdálené hvězdy. Malířství má teď významné postavení, protože lidé před pěti sty lety dělali skvělou práci. V té době si nikdo nemyslel, že tyto malby budou tak důležité jako dnes. Tehdy by se zdálo velmi divné, že <a href="https://en.wikipedia.org/wiki/Federico_da_Montefeltro">Federico da Montefeltro</a>, urbinský vévoda, bude jednoho dne znám převážné jako chlápek s divným nosem díky obrazu, který namaloval <a href="https://cs.wikipedia.org/wiki/Piero_della_Francesca">Piero della Francesca</a>.

Přestože přiznávám, že hackování teď není tak bezva jako malířství, měli bychom pamatovat na to, že ani malířství se nezdálo tak skvělé.

S částečnou jistotou můžeme prohlásit, že dnes je hackování na výsluní slávy. Ve většině oborů je skvělá práce udělána podstatně dřív. Obrazy namalované mezi roky 1430 a 1500 jsou stále nepřekované. Shakespeare, zdá se, se už jako profesionální divadelník narodil a posunul toto médium tak daleko, že každý autor divadelních her musí od té doby žít v jeho stínu. Albrecht Dürer učinil to samé s rytinou a Jane Austen s románem.

Znovu a znovu vídáme ty samé vzorce. Objeví se nové médium a lidé jsou z něj tak nadšení, že objevují většinou jeho možností během několika generací. Hackování, zdá se, je nyní v této fázi.

Malířství nebylo v čase Leonarda tak skvělé, jako ho jeho práce pomohla udělat. Jak skvělé se nakonec ukáže být hackování, bude záležet na tom, co s tímto novým médiem dokážeme udělat.


Poznámky
------

<a name="1"></a>[1] Největší škodu, kterou fotografie udělala malířství, může být skutečnost, že zničila jeho nejlepší denní práci. Většina velkých malířů v historii se živila malováním portrétů. 

<a name="2"></a>[2] Bylo mi řečeno, že Microsoft odrazuje zaměstnance od přispívání do open-source projektů, i kdyby v jejich volném čase. Ale tolik nejlepších hackerů pracuje na open-source projektech, že hlavní dopad této politiky může být postarat se, že nebudou schopní najmout žádného prvotřídního programátora.

<a name="3"></a>[3] Co se naučíte o programování na vysoké škole je jako co se naučíte o knihách, oblečení nebo randění. Měli jste na střední špatný vkus?

<a name="4"></a>[4] Taky je příklad aplikované empatie. Ve firmě Viaweb jsme se nemohli rozhodnou mezi dvěma alternativami. Zeptali jsem se, co by naši konkurenti nenáviděli nejvíce? V jednom okamžiku přidal konkurent funkčnost do svého software. Byla to vlastně zbytečnost, ale bylo to něco, co jsme my neměli, takže to tlačili do novin. Mohli jsme se pokusit vysvětlit, že je to zbytečnost, ale místo toho jsme se rozhodli, že by našeho konkurenta naštvalo, kdybychom funkčnost implementovali sami. Takže jsme danou funkčnost ještě to samé odpoledne nahackovali po svém.

<a name="5"></a>[5] Kromě textových editorů a kompilátorů. Na jejich navrhování hackeři nepotřebují empatii, protože jsou sami typickými uživateli.

<a name="6"></a>[6] Tedy téměř. Nějak minuli dostupnou RAM, což způsobovalo nevhodné swapování disku, ale to mohlo být opraveno během několika měsíců tak, že jste si koupili další disk.

<a name="7"></a>[7] Programy neuděláte čitelnější tím, že je vycpete komentáři. Ještě bych citát posunul o krok vpřed. Programovací jazyky by měly být navrhovány k vyjádření algoritmů, nikoliv jen aby říkali počítačům, jak je mají vykonávat. Dobrý programovací jazyk by měl být lepší pro vysvětlení software než angličtina. Měli byste potřebovat komentář jen v případě, že potřebujete varovat čtenáře ohledně nějakého rychlého a špinavého řešení. Jako jsou na silnici značky jen u nečekaně ostrých zatáček.

<strong>Poděkování</strong> patří: Trevor Blackwell, Robert Morris, Dan Giffin, a Lisa Randall za přečtení konceptu a Henry Leitner a Larry Finkelstein za pozvání přednášet.