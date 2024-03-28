---
layout: post
title:  "Microbit robůtek Cutebot s joystickem"
date:   2024-03-28
categories: [software development]
disqusId: 267
image: "/assets/2024-03-28/microbit.png"
tags: [kroužek programování, microbit]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2024-03-28/microbit.png" /></div>

Další „hračky“ pro potřeby kroužku aktivně nevyhledávám, ale nedokážu těm dobrý odolat.
Na posledním semináři pro učitele informatiky mě přítomností poctil Milan Lempera, programátor a vedoucí kroužku, který s sebou na ukázku přivezl spoustu udělátek.
Mimo jiné doplňky pro microbit od firmy [Elecfreaks](https://www.elecfreaks.com/).
Jmenovitě se chci věnovat robůtkovi Cutebot a joystiku.
Ukázalo se, že škola zakoupila tři kusy verze 2, takže jsem si je hned půjčil domů, nastudoval, a zařadil na program svého kroužku.

<div style="clear:both"></div>
<!--more-->

## Úvod

Z příspěvků na mém blogu je patrné, že co se robotů týče, vybral jsem si [Meet Edison](/tag/meet-edison/) a jsem s nimi spokojen (a to mluvím o verzi dva, trojku jsem ještě neměl v ruce, ale vypadá dobře).
Ovšem proč nezkusit něco jiného, že?

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/A1UiBjSV5x8?si=DhKnsLVUoaIve2Zs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Edison je robustní, ale neumožňuje připojovat periferie.
Cutebot je opak, zašlápnutí ho asi může dost pocuchat, zato ho lze rozšiřovat.

A je nutné ho sestavit.
Není to nic obtížného, ale didakticky to hodnotím pozitivně (IKEA efekt).
Zatímco u robota stačí zapojit senzor a oboustrannou páskou přilepit držák baterie, tak u joysticku je nutné i šroubovat, což se u dětí na prvním stupni ukázalo jako velká výzva, která nám zabrala velkou část hodiny.
Aby bylo jasno, i za šroubky a čas s nimi strávený jsem rád.
Úmyslně jsem to dětem neskládal já předem.

Kód editujete normálně jak jste zvyklí na [makecode.microbit.org](https://makecode.microbit.org/), jen si přidáte rozšíření blokového jazyka.


## Periferie

V krabici dostanete ultrazvukový senzor HC-SR04. 
Hned vedle konektoru pro ultrazvukový senzor najdete I2C konektor pro další moduly.
To je trochu i nevýhoda, protože HC-SR04 velmi snadno vložíte do špatného konektoru a Cutebot se pak chová podivně.
Prostě běžné potíže harwarového světa.

Dále se na desce nachází i konektor pro zapojení serva, to jsem ještě nevyzkoušel.


## Didaktické materiály

Líbí se mi anglické návody na webu Elecfreaks.

Edison detekuje překážku pomocí infračerveného světla, se kterým podle mě nejde dosáhnout takové přesnosti jako s ultrasonickým čidlem.
Využito v [lekci 10, udržování fixní vzdálenosti](https://www.elecfreaks.com/learn-en/microbitKit/smart_cutebot/cutebot_case10.html), říkal jsem tomu adaptivní tempomat.

Naší vrcholnou hodinou bylo [ovládání Cutebotu joystickem, lekce 13](https://www.elecfreaks.com/learn-en/microbitKit/smart_cutebot/cutebot_case13.html).


## Joystick

<iframe class="center" width="560" height="315" src="https://www.youtube.com/embed/qp5tpZYlklk?si=FRFlmCL0n30qUl_e" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Joystick na sobě má vibrační motorek pro poskytnutí zpětné vazby (pozor, máte-li microbity v obalech, tak pro tento účel doporučuji sundat).

Jako úlohu _ahoj světe_ pro joystick jsem zvolil [ukazatel směru ovládaný gamepadem](https://www.elecfreaks.com/learn-en/microbitExtensionModule/joystick_bit_v2.html#project-2-direction-indicator).
V základu se jedná o čtyři směry.

Abych však jen neodkazoval na cizí návody, tak přidám něco ze své zahrádky.
Děti zajímalo, jak ukazovat i úhlopříčky.
To jsem z hlavy nedal, ale vypracoval jsem si v klidu za domácí úkol.
V emulátoru se to ladí trochu těžkopádně, musíte si nastavovat hodnoty na analogových pinech P1 a P2.
Povšimněte si inicializace joysticku, chvíli mi trvalo, než jsem přišel na, že když to zapomenu, tak joystick fungovat nebude.

<div style="position:relative;height:0;padding-bottom:70%;overflow:hidden;"><iframe style="position:absolute;top:0;left:0;width:100%;height:100%;" src="https://makecode.microbit.org/#pub:S41554-38192-32900-09767" frameborder="0" sandbox="allow-popups allow-forms allow-scripts allow-same-origin"></iframe></div>

Zároveň jsem se zasekl na tom, že zásadní refactoring se v blocích dělá celkem pracně.
Naštěstí jsem si uvědomil, že se můžu přepnout do javascriptu, upravit si tam, a pak se opět vrátit do blokového jazyka..

```javascript
joystickbit.initJoystickBit()
basic.forever(function () {
    if (joystickbit.getRockerValue(joystickbit.rockerType.Y) >= 800 && joystickbit.getRockerValue(joystickbit.rockerType.X) >= 800) {
        basic.showArrow(ArrowNames.NorthWest)
    } else if (joystickbit.getRockerValue(joystickbit.rockerType.Y) >= 800 && joystickbit.getRockerValue(joystickbit.rockerType.X) <= 200) {
        basic.showArrow(ArrowNames.NorthEast)
    } else if (joystickbit.getRockerValue(joystickbit.rockerType.Y) <= 200 && joystickbit.getRockerValue(joystickbit.rockerType.X) <= 200) {
        basic.showArrow(ArrowNames.SouthEast)
    } else if (joystickbit.getRockerValue(joystickbit.rockerType.Y) <= 200 && joystickbit.getRockerValue(joystickbit.rockerType.X) >= 800) {
        basic.showArrow(ArrowNames.SouthWest)
    } else if (joystickbit.getRockerValue(joystickbit.rockerType.X) <= 200 && (joystickbit.getRockerValue(joystickbit.rockerType.Y) > 200 || joystickbit.getRockerValue(joystickbit.rockerType.Y) < 800)) {
        basic.showArrow(ArrowNames.East)
    } else if (joystickbit.getRockerValue(joystickbit.rockerType.Y) <= 200 && (joystickbit.getRockerValue(joystickbit.rockerType.X) > 200 || joystickbit.getRockerValue(joystickbit.rockerType.X) < 800)) {
        basic.showArrow(ArrowNames.South)
    } else if (joystickbit.getRockerValue(joystickbit.rockerType.X) >= 800 && (joystickbit.getRockerValue(joystickbit.rockerType.Y) > 200 || joystickbit.getRockerValue(joystickbit.rockerType.Y) < 800)) {
        basic.showArrow(ArrowNames.West)
    } else if (joystickbit.getRockerValue(joystickbit.rockerType.Y) >= 800 && (joystickbit.getRockerValue(joystickbit.rockerType.X) > 200 || joystickbit.getRockerValue(joystickbit.rockerType.X) < 800)) {
        basic.showArrow(ArrowNames.North)
    } else {
        basic.showIcon(IconNames.SmallDiamond)
    }
})
```

Kdyby vám docházely nápady, tak na joysticku můžete po stisku tlačítka ukazovat vzdálenost, kterou naměřil ultrazvukový senzor Cutebotu.


## Závěr

Výrobky Elecfreaks jsou zajímavé (pravděpodobně o nich nepíšu naposledy).
Cutebot i joystick ve výuce jistě využijete.
Pokud byste museli vybírat jediný směr kvůli omezené časové dotaci nebo nedostatku finančních prostředku,
tak zvažte, zda jste hračičkové (chcete věci spojovat a řešit případné problémy) nebo zda preferujete kompaktní a robustní řešení.
Zároveň dodávám, že informatika i kroužek se zvládnou obejít bez podobných pomůcek.
Určitě se nemusíte cítit provinile, pakliže je nemáte.
I když pozornost dětí to přitáhne.
Respektive to s pomůckami nemusíte přehánět.


## Související

- [Hudba s Microbitem](/software%20development/2020/03/24/hudba-s-microbitem.html)
- [Microbit lavinový vyhledávač](/software%20development/2023/05/30/microbit-lavinovy-vyhledavac.html)
- [Obchod HWKITCHEN - Cutebot](https://www.hwkitchen.cz/cutebot-microbit-chytre-zavodni-auto/)
- [Obchod HWKITCHEN - Joystick](https://www.hwkitchen.cz/joystick-bit-v2-plus-s-uchyty-gamepad-modul-pro-microbit/)
