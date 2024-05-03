---
layout: post
title:  "Děti programují hry na konzoli"
date:   2024-05-03
categories: [software development]
disqusId: 268
image: "/assets/2024-05-03/konzole.png"
tags: [kroužek programování, microbit]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2024-05-03/konzole.png" /></div>

Již mnohokrát jsem se vyznával, že jsem se k počítačům dostal přes hry.
Na jejich tvorbu jsem však neměl schopnosti.
Ovšem i [cesta k nim byla v dobách osmibitů (jako C64) obtížnější](/software%20development/2023/10/23/pocta-c64.html).
Nicméně nutkání mě nikdy úplně neopustilo.
Dlouho jsem měl v hledáčku [pygame](https://www.pygame.org/news) respektive knihu [Making Games with Python & Pygame](https://inventwithpython.com/pygame/).
Osobně jsem se k tomu nikdy nedostal, ale s vedením kroužku programování jsem o tom opět začal uvažovat.
Zatím sobě a hlavně dětem nehodlám _písmenkovými_ programovacími jazyky komplikovat život a zůstanu u blokových jazyků.
Naštěstí taková varianta existuje a tu vám chci přiblížit.
Jedná se o dialekt Microbitu.
Navíc jsou na trhu k dispozici i fyzické herní konzole, kde si vlastní výtvory můžete doslova osahat.

<div style="clear:both"></div>
<!--more-->

## Úvod

Zásluhy je třeba připsat Martinu Malému a jeho knize [Micro:bit krok za krokem](https://www.goodreads.com/review/show/5864585406), kde jsem se o dané možnosti dozvěděl.
Šikovně mě navnadil hardwarem, konkrétně [konzolí Retro Arcade](https://www.elecfreaks.com/retro-arcade-for-education.html) od firmy [Elecfreaks](https://www.elecfreaks.com/).
Jejich výrobky můžete znát z minulého příspěvku [Microbit robůtek Cutebot s joystickem](/software%20development/2024/03/28/microbit-robutek-cutebot-s-joystickem.html).
[Seznam podporovaných výrobců hardware](https://arcade.makecode.com/hardware) je však mnohem delší.

![](/assets/2024-05-03/konzole.jpeg){:.center}

Jak už bylo řečeno, jedná se o dialekt Microbitu a editor naleznete na [MakeCode Arcade](https://arcade.makecode.com/).
Kromě editoru je tam především velkém množství tutoriálů včetně předpřipravených _assetů_ (rozuměj pozadí a postav alias _spritů_).
Tutoriály mají podobu jednak v editoru, jednak [souhrnou stránku pro učitele (zde například Mama Dino)](https://arcade.makecode.com/skillmap/educator-info/dino-map-info).


## Didaktika

Připravené materiály vás neomezují v tom, že byste si nemohli kreslit vlastní, ale pomůže vám to ušetřit čas nebo vyřešit výtvarné zábrany žáků.
Velmi kladně hodnotím, že tutoriály postupně odhalují jednotlivé bloky (ostatní jsou skryté a nedostupné), což výrazně pomáhá žáky nezahltit.
Tutoriál lze s menší či větší pomocí vyučujícího za hodinu stihnout.
K dispozici není český překlad.
To nehaním, naopak se mi to didakticky hodí.
Po přihlášení k Microsoft nebo Google účtu (žáci pravděpodobně mají alespoň školní) se jednotlivé projekty uloží (s _písmenkovými_ jazyky bych musel učit ještě verzovací systémy).

![](/assets/2024-05-03/tutorial.png){:.center}

Tutoriály nebo dopomoc učitele jsou dost návodné.
Ale tvorba her je obtížný obor, bez toho si začátek nedokážu představit.
Ostatně i dříve jsme opisovali řádek za řádkem z časopisu ABC a snažili se pochopit, o co tam jde.

Později jsem opustil tutoriály a sáhl po materiálu od Elecfreaks, konkrétně [Aircraft Battle](https://www.elecfreaks.com/learn-en/RetroArcadeforEducation/RETRO_case_01.html).
Tento návod nemá formu tutoriálu ani připravené _assety_ (kreslíte si vlastní, ale můžete vybrat libovolný kus z galerie).
Navíc v projektu pracujete se všemi bloky.
To žáky celkem zahltilo, některé podobné se jim pletou.
Celkově to hodnotí minimálně o řád složitější.

K samostatnému návrhu vlastní hry jsme se nedostali, snad někdy příště. 

Na šest dětí jsem zakoupil jednu konzoli.
Kromě emulátor tak mají šanci si svůj výtvor vyzkoušet i naživo.


## Závěr

MakeCode Arcade díky blokovému jazyku a dostupným didaktickým materiálům přibližuje tvorbu her velmi dostupnou formou i začátečníkům.
Hardwarová konzole zážitek umocní, ale není to nutné, vystačíte i pouze s emulátorem.
Pamatujte, že od následování tutoriálu k samostatné tvorbě vlastní hry je to obrovský skok.
I z toho důvodu se zase na chvíli vracím ke [code.org](https://studio.code.org), abychom změnili druh úloh a žáci samostatně čelili přiměřeným výzvám.


## Související

- [Microbit robůtek Cutebot s joystickem](/software%20development/2024/03/28/microbit-robutek-cutebot-s-joystickem.html)
- [Obchod HWKITCHEN - herní konzole Retro Arcade](https://www.hwkitchen.cz/retro-arcade-herni-konzole-pro-vyuku-programovani/)
- [Pocta C64](/software%20development/2023/10/23/pocta-c64.html)
- [Making Games with Python & Pygame](https://inventwithpython.com/pygame/).
