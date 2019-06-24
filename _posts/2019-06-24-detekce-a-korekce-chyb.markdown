---
layout: post
title:  "Detekce a korekce chyb"
date:   2019-06-24
categories: [software development]
disqusId: 215
image: "/assets/2019-06-24/parity-cards.png"
tags: [kroužek programování]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2019-06-24/parity-cards.png" /></div> Na vysoké škole nás učili, jak počítač dokáže přečíst lehce škrábnuté CD a jak pozná, že je poškozené příliš. Dětem to lze to vysvětlit hravou formou. V dnešní době už asi skoro nebudou znát CD a DVD, ale stejný princip platí i pro jiné nosiče, jakými jsou například QR kódy.  

Tento článek vychází z díla [Parity magic (csunplugged.org)](https://csunplugged.org/en/topics/error-detection-and-correction/unit-plan/parity-magic-junior/) a zachovává licenci [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.cs).

<!--more-->

## Pro koho je úloha určená

Úlohu jsem dělal s dětmi od druhé do páté třídy.

## Potřeby

- 15 až 20 minut
- kartičky reprezentující jednotlivé bity
    - ideálně černé a bílé
    - lze použít i žolíkové a to dvěma způsoby: Buď mají různobarevný rub, nebo použijeme líc a pak je jedna hodnota červená (srdcové a kárové bez rozlišení) a druhá černá (piky a trefy rovněž bez rozlišení).

## Postup

Zeptáme se dětí, zda se někdy setkaly s problémem škrábnutého DVD nebo poškozeného QR kódu. Naznačíme, že malé chyby dokáže počítač opravit. Větší chyby už neopraví, data nepřečte, ale ví, že jsou špatně. To je taky důležitý aspekt, umět odmítnout vadná data a nesnažit se je chybně interpretovat.

Náhodně rozdáme karty (bity) do čtverce 5&nbsp;x&nbsp;5, nebo ještě lépe necháme děti, aby je náhodně rozdaly sami. Překontrolujte, že jde opravdu o náhodné rozdělení a že se mezi řádky neopakuje nějaký vzorec.

![](/assets/2019-06-24/parity-cards-6x6-grid-step-1.png)

Nyní učitel přidá [paritní bity](https://cs.wikipedia.org/wiki/Paritn%C3%AD_bit) (sloupce i řádky) a to následujícím způsobem. Pokud je v řádku lichý počet černých karet, přidáme na konec černou kartu. Je-li sudý (včetně situace, kdy neobsahuje žádnou černou kartu), přidáme na konec bílou kartu. Analogicky provedeme se sloupci. V pravém dolním rohu nám vznikne paritní bit paritních bitů jako kontrola, že jsme sloupce i řádky přidali správně (počet paritních bitů, černých karet, v paritní sloupci a paritním řádku nemusí přesně souhlasit, ale souhlasit musí jejich parita, tedy to, zda je obojí sudé či liché).

Chcete-li [definici z wikipedie](https://cs.wikipedia.org/wiki/Paritn%C3%AD_bit):

> Lichá parita znamená lichý počet jedničkových bitů ve slově.

![](/assets/2019-06-24/parity-cards.gif)

Požádáme děti, aby, až odejdete za dveře, zaměnily **právě jednu kartu** za jinou barvu. Následně překontrolujete všechny paritní bity. Průnik sloupce a řádku s chybným paritním bitem identifikuje chybnou kartu. Měli byste být schopní identifikovat záměnu i v samotných paritních bitech.

Role si prohoďte. Učitel připraví základní čtverec, děti přidají paritní bity. Pak se otočí a učitel vymění právě jednu kartu. Děti hledají, která karta byla vyměněná.

 Nakonec všichni dohromady vyzkoušejte, co se stane, vyměníte-li dvě karty. Poznáte, že je v systému chyba, ale už nedokážete přesně říct, která karta je chybná (můžete přibližně hádat). Při otočení čtyřech karet se vám může stát, že všechny paritní bity budou sedět a chyba tedy zůstane neodhalená.
 
 ![](/assets/2019-06-24/karty.jpg)

# Didaktické poznámky

Pokud jste s dětmi doposud neprobírali binární čísla, bude potřeba tématu věnovat nějaký čas. Rovněž mladším dětem bude pravděpodobně potřeba vysvětlit koncept _lichý/sudý_.

V návodu je uvedeno, že máte kontrolovat, zda se mezi řádky neopakuje nějaký vzorec. Osobně jsem s tím problém neměl. Podle [Parity Magic pro pokročilé](https://csunplugged.org/en/topics/error-detection-and-correction/unit-plan/parity-magic/) může mít obrazec i jiné rozměry, například: 5&nbsp;x&nbsp;9 nebo 6&nbsp;x&nbsp;4 ale už ne 3&nbsp;x&nbsp;4. Počet řádku a sloupců musí být obojí sudé, anebo obojí liché.

Čistě didakticky je asi nejméně rušivé, když pracujete pouze s černými a bílými kartami (to vyzkouším příště). Vzal jsem zavděk žolíkovými kartami, jelikož jsem šetřil čas na přípravu. S žolíkovými kartami je nejspíš lepší pracovat s rubem, ale měl jsem dvě stejné sady. Na druhou stranu varianta s lícem vypadá jako lepší karetní trik. Odvedení pozornosti má i světlou stránku a to, že se nepokoušíte hledat v tom kimovku. Tedy zapamatovat si rozložení i bez paritních bitů. (Pro jistotu jsem dětem vyměnil víc karet, myšleno hodnoty, ale barvu jsem změnil jen u jedné.)

Děti jsem nabádal, aby úlohu ukázaly doma rodičům právě jako karetní trik. Což ale nikdo neudělal. Domnívám se, že ty mladší tomu v hodině s dopomocí rozuměly, ale nebyly schopné samostatně úlohu zopakovat. 

Tento článek vychází z díla [Parity magic (csunplugged.org)](https://csunplugged.org/en/topics/error-detection-and-correction/unit-plan/parity-magic-junior/) a zachovává licenci [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.cs).