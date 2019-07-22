---
layout: post
title:  "Kontrolní číslice čárového kódu"
date:   2019-07-22
categories: [software development]
disqusId: 216
image: "/assets/2019-07-22/error-correction-paint-tin.png"
tags: [kroužek programování]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2019-07-22/error-correction-paint-tin.png" /></div> Kolik lidí si podle vás v supermarketu kontroluje účtenku, aby se ujistili, zda jim namarkovali vše správně? Obvykle ne mnoho, jelikož čárový kód je tak spolehlivý, že mu důvěřují, že funguje. (Já tedy vídám, že si to lidé kontrolují a namátkově to dělám tady. Přeci jen je tam lidský prvek, ne vše se markuje podle kódu, případně může být zboží špatně přiřazeno).

Tento článek vychází z díla [Product code check digits (csunplugged.org)](https://www.csunplugged.org/en/topics/error-detection-and-correction/unit-plan/product-code-check-digits/) a zachovává licenci [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.cs).
<div style="clear:both"></div>
<!--more-->

## Pro koho je úloha určená

Úlohu jsem dělal s dětmi od druhé do páté třídy.

## Potřeby

- 15 až 20 minut
- několik kusů zboží s čárovým kódem (případně stačí jen obaly) o délce 13 číslic

## Postup

Zeptáme se dětí, jak funguje čárový kód v obchodě. Vysvětlíme, jaký je vztah mezi samotným kódem a cenou (kód sám o ceně nic neříká, identifikuje zboží v databázi, kde je cena uvedená). Jak si přístroj může být jistý, že přečetl čárový kód správně? To si dnes ukážeme.

Tady je příklad, jak spočítat poslední číslici čárového kódu o délce 13 číslic. Je to trochu divný proces sčítání a násobení, ale stejný postup vám vždycky dá správnou hodnotu třinácté kontrolní číslice (pakliže nebyla chyba v čísle).

![čárový kód s číslicemi 9 400547 009879](/assets/2019-07-22/barcode-13.jpg)

Výše uvedený příklad čárového kódu je ze zboží, které si děti mohly vybrat, takže by vám měly sdělit těchto 12 číslic (třinácté by si zatím měly nechat pro sebe). 

![řekly vám tyto číslice 940054700987?](/assets/2019-07-22/barcode-13-step-1.png)

Nicméně zapište si každou druhou číslici do jiného řádku. 

![horní řada obsahuje 600443, dolní 35928](/assets/2019-07-22/barcode-13-step-2.png)

Číslice na liché pozici zapisujete na horní řádek, sudé na dolní.

Teď sečtěte všechna čísla v první řádce (= 29) a vezměte jen číslici z jednotkového řádu (případně můžete zapojit znalost modulo aritmetiky, 9 + 5 = 4).  

![9+0+5+7+0+8=29](/assets/2019-07-22/barcode-13-step-3.png)

Potom sečtěte všechna čísla na druhém řádku (= 24) a opět vezměte pouze jednotkový řád.

![4+0+4+9+0+7=24](/assets/2019-07-22/barcode-13-step-4.png)

Vynásobte číslici ze součtu druhého řádku třemi. Z čísla 24 je to tedy 4 krát 3 a opět vezměte pouze jednotkový řád (2).  

![3*4=12](/assets/2019-07-22/barcode-13-step-5.png)

Sečtěte výsledek součtu prvního řádku s výsledkem násobení z předchozího kroku (v tomto případě 9 z 29 k 2 z 12).

![9+2=11](/assets/2019-07-22/barcode-13-step-6.png)

Znovu potřebujeme pouze poslední číslici, v tomto případě 1. Teď se zeptáme, kolik potřebujeme přidat, abychom dostali 0 na posledním místě (tedy 0 nebo 10). Ptáme se: _co_ plus 1 = 10? Odpověď je 9, což nám dá kontrolní číslici 13místného čárového kódu. Pokud by předchozí součet obsahoval hnědou nulu, tak by kontrolní číslice byla nula (jelikož přičtením nuly by opět vznikla nula na posledním místě).

![?+1=10 ?=9](/assets/2019-07-22/barcode-13-step-7.png) 

Toto číslo by mělo odpovídat poslední číslici čárového kódu. Zeptejte se žáků, zda jste se dopočítali ke správnému výsledku. Samozřejmě je určitá šance, že jste to uhádli, ale můžou si to teď zkusit sami a brzy zjistí, že to funguje pokaždé, pokud si číslo správně opíšou.

Nesouhlasí-li poslední číslice, tak je chyba v čárovém kódu. Což je krásná ilustrace detekce chyby v praxi. Buď jste si ho špatně opsali, nebo ho žáci špatně nadiktovali. Případně máte chybu ve výpočtu, k čemuž by na počítači nejspíš nedošlo, alespoň se však procvičí v základních počtech.

Nyní zkuste změnit jednu číslici v čárovém kódu a zkontrolujte, že konečný součet nevychází 0 a že jste schopní detekovat chybu.

[Celý postup si můžete vytisknou](/assets/2019-07-22/Barcode Checksum Poster (13 digits - a4).pdf).

## Co jsme se naučili

Musí existovat systém, který ověřuje kontrolní součet, aby lidé dokázali zjistit, že se čárový kód špatně načetl. Jak operátor nebo pokladní zjistí, že došlo k chybě? Obvykle speciálním pípnutím signalizujícím chybu. Pokud je balení poškozené nebo ohnuté a kód nelze přečíst čtečkou, tak se ho operátoři mohou pokusit opsat ručně.

## Didaktické poznámky

Doporučují, byť to není nutné, projít před tím se žáky [lekci ohledně modulo](https://www.csunplugged.org/en/topics/kidbots/unit-plan/modulo/) (přeložím někdy později).

Jedná se, podle mě, o jednodušší úlohu než [Detekce a korekce chyb](/software%20development/2019/06/24/detekce-a-korekce-chyb.html). S tou můžete pokračovat příště.

Tento článek vychází z díla [Product code check digits (csunplugged.org)](https://www.csunplugged.org/en/topics/error-detection-and-correction/unit-plan/product-code-check-digits/) a zachovává licenci [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.cs).

## Související

- [Detekce a korekce chyb](
/software%20development/2019/06/24/detekce-a-korekce-chyb.html)