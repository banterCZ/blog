---
layout: post
title:  "Interface k potápěčským počítačům Suunto"
date:   2007-10-03
categories: [technika]
disqusId: 42
---
V roce 2003 jsem nalezl návod na výrobu __interface__ (rozhraní nebo prostě kabel), na propojení PC a potápěčského počítače __Suunto Cobra, Vyper, 
Mosquito, Vytec a D3__. Originál USB interface stojí 2 490 Kč, kabel pro sériové rozhraní od té doby zlevnil na 1 190,- Kč. Vlastnoručně vyrobený interface vás bude stát řádově desítky korun. Návod na __sériové rozhraní__ jsem si tenkrát prozřetelně uložil. Z internetu totiž zmizel. Kontaktoval jsem autora, Jaroslava Heraina, a s jeho laskavým svolením zveřejňuji návod (drobně upraven a krácen).
<!--more-->

Varování
------
Níže popsaný obvod byl vyzkoušen jako spolehlivý a bezpečný. Správně postavený obvod nemůže poškodit ani počítač ani PC. Stavba, zkoušení a provoz tohoto je však přesto na vlastní nebezpečí.

Něco o Suunto dive manager
------

Suunto dive manager (SDM) je program, kvůli kterému si interface pořizujeme. Lze ho získat z [www.suunto.com](www.suunto.com) zdarma. Program je určen sice pod
 Windows, ale běží i [pod Linuxem ve Wine (anglicky)](http://www.gagme.com/greg/linux/suunto_dm-linux.php).

Co je potřeba znát
------

![](/assets/2007-10-03/20071003-zapojení tranzistorů.png)

Základní znalosti a trocha praktických zkušeností s výrobou elektroniky, případně dostatek odvahy a trpělivosti. Nebudu přesně popisovat jak 
se vyrábí a osazuje plošný spoj, to si jistě případně najdete někde jinde ([návod na wikiknihy](http://cs.wikibooks.org/wiki/V%C3%BDroba_plo%C5%A1n%C3%BDch_spoj%C5%AF)), nebo vám ho vyrobí a osadí někdo, kdo to 
umí.

![](/assets/2007-10-03/20071003-diody.jpg)

Použité součástky, rozpočet:
Je možné použít i součástky ze šuplíku, není potřeba použít přesně uvedené typy (ale hodnoty ano!). Ceny součástek jsou spíše informativní.

|-----------+---------------+-------------------------------------------+-------------------|
|Označení   |	Typ, hodnota|Charakteristika	                        |Cena zhruba        |
|-----------|---------------|-------------------------------------------|-------------------|
|Q1         |BC546 B	    |univerzální NPN tranzistor	                |1 Kč               |
|Q2, Q3     |BC556 B	    |univerzální PNP tranzistor	                |2 x 1Kč            |
|D1	        |BZX55C4V3	    |Zenerova dioda 4,3 V *)	                |1Kč                |
|D2, D3, D4	|1N4148	        |univerzální dioda	                        |3 x 1Kč            |
|R1	        |10 kΩ	        |obvyklý typ	                            |1Kč                |
|R2	        |27 kΩ	        |obvyklý typ	                            |1Kč                |
|R3, R4, R6	|22 kΩ	        |obvyklý typ	                            |3 x 1Kč            |
|R5	        |1 kΩ	        |obvyklý typ	                            |1Kč                |
|kabel	    |1 až 2 metry   |čtyřžilový, lépe stíněný a měkký - ohebný	|10 Kč /2m          |
|konektor	|Canon	        |9-kolíkový, samice (pro sér. port) s krytem|kolem 30 Kč        |
|-----------+---------------+-------------------------------------------+-------------------|
{:.mbtablestyle}

*) Já jsem neměl 4,3V, tak jsem vyzkoušel 3,9V i 5,1V a interface fungoval.
Cena součástek celkem: __53 Kč__
Podle toho kde nakoupíte, to bude od asi 40 do 80 Kč, nejdražší položkou je konektor.

Plošný spoj
------
Na obrázcích je schéma zapojení, výkres desky a schéma pro osazování (neoznačená dioda vlevo je D2).

![](/assets/2007-10-03/20071003-plosnak.png)

![](/assets/2007-10-03/20071003-schema.png)

Jsou tři možnosti:  
1) „vrabční hnízdo“ = pájení součástek za vývody k sobě  
\+ jednoduchost   
\- nepřehlednost   
\- možnost zkratu (může vést až k poškození PC) 

2) „drátkování“ = zapíchání součástek do kartónu (silnější čtvrtky) a propojení vývodů drátky  
\+ není potřeba vyrábět klasický plošňák  
\- není to ono a kdyby papír dostatečně zvlhnul, přestane to fungovat

3) plošný spoj  
\+ vzhled   
\- pracnost (kreslení-leptání-vrtání-pájení)

U mne vítězí plošný spoj. Zde je jednoduchý a malých rozměrů a není ani potřeba velká přesnost, všechny součástky se dají přizpůsobit. Ke kreslení používám zelenou kreslicí kapalinu, tedy správně "leptuvzdorný lak", ta velmi rychle zasychá. U tenkých čar prakticky ihned, po zaschnutí vydrží i velmi nešetrné leptání roztokem HCl + H2O2. Dále klasicky: omýt lak lihem, natřít spoje kalafunou v lihu (nebo něčím lepším), vyvrtat, osadit, zapájet, šikovný člověk je za 80 minut hotový. Cena maximálně několik desetikorun a trocha práce.

Připojení interface k PC
------

Použijeme čtyřžilový kabel a konektor typu Canon 9-kolíkový, samici (má zdířky a je to protikus ke konektoru sériového portu PC). Prohlédněte si schéma zapojení, v něm jsou čísla pinů konektoru na které se budou pájet příslušné vodiče. Číslování je obvykle vylisováno přímo na konektoru, tak se jím řiďte! Rozmístění a popis na desce je na schématu pro osazování, na konektoru zapojujeme RXD na č. 2, DTR na č.4 , TXD na č.3 a GND na č.5 konektoru (schéma zapojení!)- vodiče jsou jeden vedle druhého.

![](/assets/2007-10-03/20071003-kontakt.png)

Připojení k interface
------

Na spodní straně počítače je dvojice kontaktů (obr.), přes které probíhá komunikace. Propojení s interfacem "common" počítače s "common" na desce a "D I/O" počítače s "D I/O" na desce, pokud to prohodíte, nic se nestane ani PC ani počítači, ale SDM ohlásí chybu při pokusu o komunikaci.Aby byla bezchybná, je potřeba spolehlivý kontakt správných částí a to je asi největší problém celé výroby. Originál Suunto interface to řeší snad (nevím jistě, neviděl jsem) kontakty z vodivého pružného polymeru. V originální dokumentaci je to dvojice "contact probes" - přeložitelné asi jako "kontaktních sond", ale ani tohle se mi nezdálo. V řešení tohohle problému je asi největší rozdíl od originálu. Popis by byl složitý, fotky mluví jasně. Kontakty jsou ze staršího konektoru k čemusi. Je to zlacený fosforbronz - pružný a neoxidující. Bohužel to není nijak k sehnání, musíte si poradit a najít nebo vymyslet něco jiného. I já vymýšlím vylepšení, pokud nějaké bude, tak se tady objeví.

![](/assets/2007-10-03/20071003-p9042214.jpg)

Oživení a testování
------

Jsou dvě možnosti:
1) Máme voltmetr a zdroj: 
Nejprve třikrát zkontrolujeme vše v obvodu (orientace tranzistorů a diod, hodnoty odporů, zapojení kabelu...) Připojíme vývody inteface označené DTR a TXD na +9V (proti zemi - ozn. GND). Napětí na kontaktech pro počítač "common" a "D I/O" by mělo být kolem 3V proti zemi a napětí na RXD asi 8V proti zemi. Změníme napětí na TXD na -9V proti zemi, napětí na kontaktech pro počítač "common" a "D I/O" by mělo být kolem 0V proti zemi a napětí na RXD asi -8V proti zemi. 

2) Nemáme měřicí techniku:
Šestkrát zkontrolujeme vše v obvodu (orientace tranzistorů a diod, hodnoty odporů, zapojení kabelu...).

Pak vyzkoušíme rozpoznání interface v SDM:
Připojíme interface k volnému COM portu počítače. Pozor na rezidentní ovladače jiných zařízení, port se tváří volný, ale komunikace není možná. Např. v mém případě by to mohl způsobovat ovladač tabletu, který se zavádí při startu Windows a je rezidentní i když je tablet odpojen! Teprve po nastavení v příslušném programu ("...tablet driver ON/OFF") je port správně funkční. Pokud takové zařízení máte, tak asi víte, jak si sním poradit.

V menu je nabídka TRANSFER, ta obsahuje položku PC INTERFACE SETUP, klikněte na ni. V okně PC INTERFACE SETUP stiskněte tlačítko TEST, zobrazí se varování (máte-li připojen počítač Suunto, odpojte ho!), po odkliknutí proběhne test, a je-li úspěšný, zobrazí se hláška: "The Suunto PC Interface was found on COM_ (číslo portu) Do you want to use this port? Po odkliknutí YES a OK je SDM úspěšně nastaven pro použití interface.
Řešení některých problémů s nefunkčností je popsáno v orig. dokumentaci, ale to asi nebudete potřebovat. Obvod funguje obvykle na první zapojení. Pokud ne a nevíte si rady, tak se mi ozvěte. 

Gratuluji, máte hotovo a výrobek funguje. Užijte si, že se můžete kochat barevnými grafy ponorů a dokonalou statistikou každého ponoru. Myslím, že to stálo za vynaloženou námahu a trochu peněz.

Můj interface je vestavěn v upravené plastové krabičce od hodinek. Ke dnu jsou přilepeny "nožičky" z rozpůlené novodurové trubky a je tady připevněna i destička s plošným spojem. Na horní část se dá položit připojený počítač.

![](/assets/2007-10-03/20071003-p9042211.jpg)

![](/assets/2007-10-03/20071003-p9042213.jpg)