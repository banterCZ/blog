---
layout: post
title:  "Věci, které byste nikdy neměli dělat - část první"
date:   2013-06-12
categories: [software development]
disqusId: 133
tags: [překlad, Joel Spolsky]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://en.wikipedia.org/wiki/File:CAT-D10N-pic001.jpg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/CAT-D10N-pic001.jpg/200px-CAT-D10N-pic001.jpg" /></a></div><i>Mnohdy mi chybí <a href="/item/130">pokora</a> a mám chuť zahodit kód. Samozřejmě cizí kód a to nejlépe celý. Jako terapie slouží již starší článek <a href="http://www.joelonsoftware.com/articles/fog0000000069.html">Things You Should Never Do, Part I</a>, který napsal Joel Spolsky (autor <a href="http://www.stackoverflow.com">stackoverflow.com</a>). S jeho <a href="https://twitter.com/spolsky/status/339403373348548608">laskavým svolením</a> jsem text přeložil do češtiny (překlad uvolňuji pod <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/cz/">licencí Creative Commons by-nc-sa</a>).</i>

<div style="clear:both"></div>

6\. dubna 2000

Netscape 6.0 jde konečně do své první veřejné beta verze. Nikdy nebyla verze 5.0. Poslední major release, verze 4.0, byl vydán téměř před třemi lety. Tři roky jsou ve světě Internetu hrozně dlouhá doba. Během této doby Netscape bezmocně a nečinně přihlížel, jak jejich podíl na trhu prudce klesá. 

Je ode mne trochu troufalé kritizovat, že s releasem čekali tak dlouho. Udělali to úmyslně, ne?

No ano, udělali. Udělali tu nejhorší strategickou chybu, které se může softwarová firma dopustit.

Rozhodli se přepsat zdrojový kód úplně od začátku.
<!--more-->

Netscape nebyl první firmou, která tuto chybu učinila. Borland se dopustil té samé chyby, když koupil Arago a pokusil se ho přepsat pro <a href="http://cs.wikipedia.org/wiki/DBase">dBase</a>. Projekt odsouzený k záhubě, který trval tak dlouho, že Miscrosoft Access za ně slízl smetanu. Pak chybovali znovu, přepisovali Quattro Pro úplně od začátku, přičemž udivili tím, jak málo funkcionality dodali. Microsoft udělal málem tu samou chybu. Pokusil se od začátku přepsat Word pro Windows v projektu zvaný Pyramid, ten byl ovšem zastaven, zahozen a zameten pod koberec. Naštěstí pro Microsoft, nikdy nepřestali pracovat na původní zdrojovém kódu, takže měli něco, co mohli dodat, čímž došlo jen k finanční pohromě, nikoli strategické.

Jsme programátoři. Programátoři jsou svým srdcem architekti a první věc, kterou chtějí udělat, když přijdou na plac, je srovnat vše se zemí a začít stavět na rovině. Nebaví nás postupné úpravy: opravovat, zlepšovat nebo opečovávat květinový záhon.

Důvod, proč programátoři vždy chtějí zahodit kód a začít znovu, je zanedbatelný. Myslí si, že starý kód je binec. Zajímavý postřeh: Pravděpodobně se mýlí. Myslí si, že starý kód je svinstvo, kvůli elementárnímu zákonu programování: <b>Je obtížnější kód číst než ho psát.</b>

Proto je znovupoužití kódu tak těžké. Proto každý ve vašem týmu má raději jinou funkci na rozdělení stringu do pole. Napsali si vlastní funkci, protože je to snazší a zábavnější než zjišťovat, jak funguje již existující funkce.

Díky tomuto axiomu se dnes můžete zeptat téměř libovolného programátor na kód, na kterém pracuje. „Je to bordel,“ řeknou vám, „nejraději bych to zahodil a začal od začátku.”

Proč je to binec?

„Podívej,“ odpoví, „tahle funkce, jak je dlouhá. Zabírá dvě stránky! Nic z toho sem nepatří! Netuším k čemu je polovina volání tohohle API.“

Philippe Kahn, svérázný zakladatel Borlandu, byl, před uvedením jejich tabulkového procesoru pro Windows, hojně citován v tisku se svým vychloubáním, jak bude Quattro Pro mnohem lepší než Microsoft Excel, protože ho píšou od začátku. Vše nový kód! Jako by kód rezivěl.

Myšlenka, že nový kód je lepší než starý, je očividně absurdní. Starý kód byl používaný a testovaný. Bylo nalezeno mnoho chyb, které byly opraveny. Na tom není nic špatného. Kód nechytí chyby od toho, že jen tak sedí na vašem pevném disku. Naopak! Je software jako starý <a href="http://en.wikipedia.org/wiki/Dodge_Dart">Dodge Dart</a>, rezne v garáži? Je snad jako plyšový medvídek ošklivý proto, že není vyrobený z nejnovějších materiálů?

Zpět k oné funkci na dvě stránky. Ano, já vím, bývala to jednoduchá funkce na jednu obrazovku, ale nějak narostla a nikdo neví proč. Povím vám proč: Jsou to opravy chyb. Jedna z oprav se týká chyby, kdy se Jana pokoušela nainstalovat program na počítač, kde nebyl Internet Explorer. Jiná oprava se zase týká chyby, která se objevuje při nedostatku operační paměti. Další záplata opravuje chybu, když je soubor na externí disku a uživatel ho vytrhne uprostřed práce. Tohle volání LoadLibrary je ošklivé, ale zaručuje, že to poběží na staré verzi Windows&nbsp;95.

Každá z těchto chyb zabrala týdny skutečného používání než byly nalezeny. Programátoři mohli strávit několik dní tím, že se je snažili reprodukovat a opravit. Stejně jako mnoho jiných chyb, oprava může být na jeden řádek nebo dokonce na jen pár znaků, ale do těch dvou znaků byla vložena spousta práce a času.

Když zahodíte kód a začnete úplně od začátku, zahazujete s tím i všechny tyto znalosti. Všechny sebrané chyby, roky programátorské práce.

Zahazujete svou vedoucí pozici na trhu. Dáváte konkurenci dva nebo tři roky náskok a věřte mi, to je v softwarovém průmyslu dlouhá doba.

Vystavujete se nebezpečné situaci, kdy budete několik let dodávat starou verzi kódu. Neschopni udělat jakékoliv strategické změny nebo reagovat na požadavky trhu, protože nemáte kód, který lze dodat. Můžete po tu dobu zavřít krám.

Plýtváte ohromným množstvím peněz na psaní kódu, který již existuje.

Je nějaká alternativa? Shoda panuje v tom, že starý kód Netscape byl <i>skutečně</i> špatný. Mohl být špatný, ale víte co? Fungoval zatraceně dobře na hrozně moc opravdových počítačových systémech na celém světě.

Pokud programátoři říkají (a vždy říkají), že jejich kód je svinstvo, tak za to můžou následující tři body.

Za prvé se jedná o architektonické problémy. Kód není uspořádán správně. Kód pro síťovou komunikaci se objevuje ve vlastním dialogovém okně uprostřed ničeho; to mělo být vyřešeno v UI kódu. Takové problémy lze vyřešit, jeden po druhém, opatrným přesouváním kódu, refaktorováním či změnou rozhraní. Zvládne to jeden programátor pečlivě kontrolující všechny své změny najednou, takže práce nikoho jiného není narušena. I celkem velké architektonické změny mohou být učiněny <i>bez zahazování kódu</i>. Na projektu Juno jsme strávili několik měsíců změnou architektury v jediném ohledu: prostém přesouváním věcí, jejich čištěním, vytvářením smysluplných základních tříd a ostrých rozhraních mezi moduly. Ovšem dělali jsme to opatrně a s naším existujícím kódem. Nezanesli jsme žádnou novou chybu a nezahodili jsme přitom funkční kód.

Druhým důvodem, proč si programátoři myslí, že je jejich kód binec je neefektivita. Renderovací kód v Netscape byl pověstný svou pomalostí. Nicméně to ovlivňovalo pouze malou část projektu, kterou můžete optimalizovat nebo dokonce přepsat. Nemusíte přepisovat celek. Při optimalizaci na rychlost vám 1% práce přinese 99% užitku.

Za třetí, kód může být sviňsky ošklivý. Pracoval jsem na jednom projektu, který měl skutečně datový typ nazvaný FuckedString. Jiný projekt přišel s konvencí začínat instanční proměnné podtržítkem, později přešli na častěji používaný formát "m_". Takže polovina funkcí začínala "_" a polovina "m_", což vypadalo děsně. Upřímně, tohle vyřešíte za pět minut makrem v Emacsu, ne přepsáním celého kódu.

Je důležité si pamatovat, že když začnete úplně od začátku, není <b>vůbec žádný důvod</b> věřit tomu, že se vám to tentokrát povede lépe než napoprvé. Především asi ani nemáte ten samý tým, který pracoval na první verzi, takže ani nemáte víc zkušeností. Prostě se znovu chystáte udělat jednu z nejstarších chyb a zavést nový problém, který v původní verzi nebyl.

Mantra <i>verze jedna k zahození</i> je nebezpečná, aplikujete-li ji na komerční aplikace velkého rozsahu. Píšete-li experimentální kód, můžete chtít, v případě že vymyslíte lepší algoritmus, roztrhat funkci, kterou jste napsali minulý týden. To je v pořádku. Můžete chtít refaktorovat třídu, aby byla lépe použitelná. To je rovněž v pořádku. Ale zahodit celý program je nebezpečně hloupé a pokud by Netscape býval měl nějaký dospělý dozor se zkušenostmi ze softwarového průmyslu, možná by se nestřelil do nohy tak zle.
