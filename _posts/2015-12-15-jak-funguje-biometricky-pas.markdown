---
layout: post
title:  "Jak funguje biometrický pas"
date:   2015-12-15
categories: [software development]
disqusId: 170
---
<img src="/assets/2015-12-15/20151215-passport.PNG" style="float: left; margin: 0 1em 1em 0; text-align: center;" />Psát CRUD aplikace zvládne
 cvičená opice, nejzajímavější a nejobtížnější bývá naučit se danou doménu. Tentokrát se pokusím přiblížit, jak funguje <a href="https://en.wikipedia.org/wiki/Biometric_passport">biometrický pas</a> a proč si vaše otisky nemůže přečíst nikdo neoprávněný. Ve srovnání s <a href="http://www.csfd.cz/film/230238-dablova-dilna/prehled/">filmem Ďáblova dílna</a> (případně stejnojmennou <a href="https://www.goodreads.com/book/show/17456731-blova-d-lna">knihou</a>),  i když tam šlo <em>jen</em> o bankovky, se způsoby, jak zabránit padělání, posunuly díky elektrickým dokumentům dál.
<!--more-->

<div style="clear:both"></div>

Specifikace
------

<div style="float: right; margin: 0 0 1em 1em; text-align: center;"><a href="https://en.wikipedia.org/wiki/File:Flag_of_ICAO.svg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Flag_of_ICAO.svg/200px-Flag_of_ICAO.svg.png"></a><br/>Vlajka ICAO</div>S automatizací přišel požadavek, aby dokumenty byly strojově čitelné. V roce 1980 tak vznikl pas s <a href="https://en.wikipedia.org/wiki/Machine-readable_passport">MRZ</a> (Machine Readable Zone, strojově čitelná zóna), takové to se zobáčky &lt;&lt;&lt;. Zkuste si následující MRZ prohnat <a href="http://www.highprogrammer.com/cgi-bin/uniqueid/mrzpr">analyzátorem</a>.

<pre>
P&lt;GBRSMITH&lt;&lt;CRYSTAL&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;
0991733606GBR9111048F1601013&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;08
</pre>

Tím bychom měli MRTD (Machine Readable Travel Document, strojově čitelný cestovní doklad). Ačkoliv budu mluvit o cestovním pasu, tak pod cestovním dokladem se skrývají třeba i víza. Specifikaci má na starosti organizace <a href="https://en.wikipedia.org/wiki/International_Civil_Aviation_Organization">ICAO</a> (International Civil Aviation Organization) a dokumenty jsou, na rozdíl od ISO normy, k dispozici zdarma, viz <a href="http://www.icao.int/publications/pages/publication.aspx?docnum=9303">Doc 9303</a>. Pochopitelně definují i elektrickou verzi dokladu, t.j. eMRTD, o kterém právě bude řeč. První biometrický pas byl vydán v Malajsii v roce 1997, a pas splňující normu ICAO pak v roce 2004 v Belgii.

Účel čipu a požadavky na bezpečnost
------

Elektrický cestovní pas obsahuje bezkontaktní čip (technologie NFC), na kterém jsou nahrané ty samé údaje jako na grafické části (to musí souhlasit) a ještě něco navíc (otisk prstu, duhovka...). Z toho plyne několik požadavků na bezpečnost. Předně nechceme dovolit, aby si čip mohl číst kdokoliv (navíc z kapsy), případně aby nemohl odposlouchávat již navázanou komunikaci. Rovněž je potřeba zabránit úpravě údajů případně kopírování celého dokladu (respektive abychom úpravu poznali).

Struktura čipu
------

Pro zajímavost uvádím, že na Smart Cards běží <a href="https://en.wikipedia.org/wiki/Java_Card">applety napsané v Javě</a>. Ale zpět ke 
specifikaci, čip má následující strukturu, viz obrázek. Nás bude zajímat soubor <em>CardAccess</em>, který rozhoduje o zvoleném bezpečnostním 
mechanismu. Dále _eMRTD Application_, kde jsou již samotné údaje uložené v DG (Data Group). Důležité je i SOD (Document Security Object), který obsahuje digitální podpis čipu a certifikát nutný k ověření tohoto podpisu (o certifikátech podrobněji níže).

![](/assets/2015-12-15/20151215-file structure.PNG)

Níže vidíte rozpis jednotlivých DG a co je v nich uloženo. Všimněme si zejména DG1, kde je uloženo MRZ. Z citlivých údajů je to například otisk prstu v DG3.

![](/assets/2015-12-15/20151215-data groups.PNG)

Bezpečnostní mechanismy
------

Pro lepší pochopení jsem v diagramu rozdělil bezpečnostní mechanismy 
na tři úrovně (level), ovšem nejedná se o ICAO terminologii. V první úrovni si můžete přečíst méně citlivé údaje jako jméno, fotografii...

Druhá úroveň vás opravňuje přečíst si citlivé údaje jako otisky prstů nebo duhovku. A nakonec třetí úroveň ověřuje, zda byl dokument vydán někým důvěryhodným a do dat se nezasahovalo. Tučně je vyznačen doporučený průchod.

![](/assets/2015-12-15/20151215-Security Mechanism.png)

BAC/SAC
------

BAC a SAC mají dva hlavní účely. Jednak slouží k autentizaci terminálu (přístroj na čtení), na základě toho, že terminál má optický přístup k dokladu. A jednak, což je neméně důležité, nastavují šifrovaný kanál čip-terminál.

<a href="https://en.wikipedia.org/wiki/Basic_access_control">BAC (Basic Access Control)</a> kontroluje, že terminál má fyzický přístup k dokladu tak, že vyžaduje optické čtení MRZ. To zaručí, že vám nepřečtou cestovní pas z kapsy. BAC má tu nevýhodu, že klíč pro komunikaci s terminálem se odvozuje od MRZ, které má nedostatečnou entropii, ale hlavně je statický.

![](/assets/2015-12-15/20151215-can.PNG)

_Ukázka CAN_

Proto je tu bezpečnější <a href="https://en.wikipedia.org/wiki/Supplemental_access_control">SAC (Supplemental Access Control)</a> , který rovněž vyžaduje MRZ, případně může akceptovat CAN (Card Access Number, viz obrázek). CAN byste použili třeba v případě, když by terminál neuměl OCR a museli byste opisovat údaj ručně. CAN je totiž výrazně kratší než MRZ. Ale hlavní rozdíl je v tom, že PACE (Password Authenticated Connection Establishment) naváže tzv. <em>Secure Messaging</em> na základě slabého hesla, ale hned potom vygeneruje silná hesla, která se používají v následné komunikaci. Přestože je entropie kvůli kratšímu CANu snížená, celkově je bezpečnost vyšší, jelikož klíč pro <em>secure messaging</em> je unikátní pro každou session (na rozdíl od statického v případě BAC). To zabraňuje tomu, že by někdo odposlechl komunikaci a hrubou silou rozlouskl pro příští použití.

Active Authentication/EAC
------

Hlavní smyslem  <em>Active Authentication</em> je prevence proti klonování dat tím, že ve veřejných datech je pouze veřejná část klíče, zatímco privátní je před čtením skrytá někde v nepřístupné části paměti. <em>Active Authentication</em> má tu nevýhodu, že při navázání spojení se podepisuje tzv. <em>challenge</em>, kterou karta obdrží. U elektronického podpisu platí zásada nepopiratelnosti (<a href="https://en.wikipedia.org/wiki/Non-repudiation">non-repudiation</a>), v našem případě to může znamenat, že pas nějaký terminál neodmítne a hlavně, že to někdo použije za důkaz, že jste někde byli. Navíc čipy v sobě nemají napájení, tedy ani hodiny, řídí se podle terminálu, tudíž jim nějaký zlý terminál může hodiny upravit (sice jen dopředu) a podvrhnout nejen místo ale i čas.

Proto je k dispozici lepší mechanismus <a href="https://en.wikipedia.org/wiki/Extended_Access_Control">EAC (Extended Access Control)</a>, ačkoliv ten není definován specifikací ICAO ale BSI (Bundesamt für Sicherheit in der Informationstechnik), viz <a href="https://www.bsi.bund.de/EN/Publications/TechnicalGuidelines/TR03110/BSITR03110.html">eMRTDs with BAC/PACEv2 and EACv1</a>. Pro navázání spojení se používá <em>Chip Authentication</em> na principu Diffie-Hellman (nikoliv podpis <em>challenge</em> jako u <em>Active Authentication</em>). Následně se musí autentizovat terminál, čímž se zkontroluje, že mu důvěřujeme a že si může přečíst z čipu citlivé údaje (otisk prstu).

![](/assets/2015-12-15/20151215-cvca distribution.PNG)

Terminál má svůj certifikát, který vydal DV (Document Verifier), 
organizační jednotka které 
spravuje skupinu terminálů. Certifikát pro DV podepisují CVCA (Country Verifier Certificate Authority) jednotlivých zemí, které tím udělují terminálům (svým i jiných zemí) číst citlivé údaje (otisk prstu) ze svých pasů. Pro zajímavost uvádím, že se tyto certifikáty <a href="http://www.icao.int/Security/mrtd/Downloads/Technical%20Reports/CSCA%20Countersigning%20and%20Master%20List%20issuance%20Version%201.0.pdf">doručují diplomatickou poštou</a>.

CVCA je uložen na čipu a protože je jeho platnost kratší než platnost pasu, aktualizuje se během kontroly na případnou novější verzi. Platnost certifikátů se musí na chvíli překrývat, viz obrázek.

![](/assets/2015-12-15/20151215-cvca validity.PNG)

Passive Authentication
------

<em>Passive Authentication</em> slouží k ověření toho, že se obsah čipu nezměnil a že je autentický. Jak se toho dosáhne? Během vydání dokladu se vytvoří hash z data group a ten se nechá podepsat komponentou, které se říká <em>Document Signer</em> (DS). Vznikne tak SOD s digitálním podpisem obsahu čipu (viz kapitola struktura čipu). Během <em>Passive Authentication</em> se podpis ověří.

Pro úplnost dodávám jak je to s klíči DS. Privátní klíč DS je vydáván na krátkou dobu, zhruba tři měsíce, a je rovněž omezen počtem vydaných dokumentů. To proto, aby v případě jejich kompromitace, nebylo ohroženo příliš mnoho dokumentů. Naopak veřejný klíč má platnost zhruba 10 let, aby bylo možné podpis stále ověřit. Certifikáty pro DS vydává <em>Document Signer Certification Authority</em>&nbsp;(DSCA). Platnost klíčů DSCA je delší, privátní klíč 3 až 5 let, veřejný klíč 13 až 15 let.

<a name="SDW_InterOp_2016"></a><b>Edit:</b>
Na <a href="http://www.sdw2016.com/interop2016/">SDW InterOp 2016</a> porovnávali interoperabilitu výrobců řešení elektronických pasů. Při přípravě vzorku dokumentů udělali chybu v CSCA (Country Signer Certificate Authority). Přesto polovina ověřovacích aplikací úspěšně prošla <em>Passive Authentication</em>. Jde o významný problém, který byl zaznamenán i v procesu skutečných hraničních kontrol. <em>Passive Authentication</em> je nejdůležitější bezpečnostní mechanismus, který by měl detekovat padělání elektronického cestovního dokladu. 	

Domácí úkol
------

Sice <a href="/item/157">nemám Android v lásce</a>, ale pokud vlastníte přístroj s podporou NFC, můžete si za domácí úkol přečíst svůj pas pomocí aplikace <a href="https://play.google.com/store/apps/details?id=nl.innovalor.nfciddocshowcase">Passport Reader</a> a ověřit, že zvládnete <em>BAC/SAC</em> a prohlédnout si fotografii, ale už ne <em>EAC</em> a prohlédnout si otisk prstu, protože vám Česká republika nepodepsala certifikát.

A kdybyste chtěli vyrábět skutečné doklady, přečtěte si <a href="http://www.sw-samuraj.cz/2013/07/hledam-do-sveho-tymu-java-vyvojare.html">náborový příspěvek od sw-samuraje</a>.

<iframe width="560" height="315" src="https://www.youtube.com/embed/qdaVkDBvLGk" frameborder="0" allowfullscreen></iframe>

Poděkování
------
Chtěl bych poděkovat Alexandru Sevrjukovi a Jaroslavu Cibulkovi, kteří si po mně článek přečetli.
