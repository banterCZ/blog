---
layout: post
title:  "Úloha od krabice ke krabici"
date:   2018-12-23
categories: [software development]
disqusId: 209
image: "/assets/2018-12-23/edison.jpg"
tags: [kroužek programování, Meet Edison]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2018-12-23/edison.jpg" /></div> Do kroužků programování doporučuji roboty [Meet Edison](https://meetedison.com/). A jaké úlohy s nimi lze dělat? [Železniční přejezd](/software%20development/2018/08/20/uloha-zeleznicni-prejezd.html) patří k těm složitějším, se kterou budou děti potřebovat pomoc. Pojďme si ukázat jednodušší úlohu, kterou zvládnou samostatně.

<div style="clear:both"></div>
<!--more-->

## Zadání

Naprogramujte robota tak, aby jel od krabice A ke krabici B, tam se otočil a jel zpět ke krabici A, kde začal. Programujte v prostředí [EdBlock](https://www.edblocksapp.com/)

<iframe width="560" height="315" src="https://www.youtube.com/embed/B6Qtu5gtTqg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Pro koho je úloha určená

Úlohu zvládnou děti od sedmi let. Úlohu vyřeší samostatně za 60 minut (byť lektor by měl sledovat, aby se někde příliš dlouho nezasekly).

## Potřeby

* robot Meet Edison
* dvě překážky (krabice) s nepříliš lesklým povrchem a vyšší než robot (oboje kvůli odrazům infračerveného světle)

## Didaktické poznámky

Zadání je úmyslně vágní. S citlivým přístupem lektora během tří fází sami objeví ideální řešení.

Prvně metodou pokus/omyl zjistí správnou vzdálenost krabice, respektive potřebnou dobu jízdy robota. Nejspíš přitom do krabice i narazí a tím ji posunou. Je dobré mít vzdálenost změřenou a vrátit krabici zpět na stejné místo, aby se nezměnily podmínky ostatním dětem, případně ji mít dostatečně zatíženou. Když vyřeší vzdálenost, budou se muset poprat ještě s otočkou. *EdBlock* totiž používá pro otočku rovněž čas, ale za vteřinu se otočí asi o 216&nbsp;stupňů. Opět metodou pokus/omyl se dostanou ke zjištění, že čelem vzad odpovídá **0,8&nbsp;vteřiny**. Tady pravděpodobně budou potřeba hned dva zásahy lektora. Jednak děti na malém stupni ještě neznají desetinná čísla a jednak Meet Edison používá anglický zápis s tečkou místo čárky, tedy `0.8`.

Zdánlivě děti úlohu splnily, takže upravím zadání tak, že jim dám dvě jiné krabice, které jsou od sebe jinak vzdálené než ty první. Otočku již mají zvládnutou, takže budou ladit „jen“ vzdálenost.

Nyní opět upravím zadání a to tak, že na jedno naprogramování musí projet obě trasy. Doposud se příliš fixovali na vzdálenost. Dám jim dost času na to, aby sami přišli na to, co je oběma trasám společné, že se mají otáčet u překážky. Můžu jim napovědět otázkou: „Jak je možné, že člověk nenarazí do zdi?“ Dále: „Má robot Edison oči?“ Pakliže děti prošly tím, že si zkoušely programovat robota přes čárové kódy, tak vědí, že robot umí poznat překážku pomocí infračerveného světla. Tím jsou na správné stopě a musí „jen“ najít ten správný blok.

Při hledání finálního řešení se můžete setkat ještě se dvěma následujícími problémy.

1. Robot Edison může mít tendenci krabici odstrkovat. Test, zda před sebou má nějakou překážku, se děje ve smyčce. Záleží tedy na tom, jak velký kus cesty urazí mezi jednotlivými testy.
2. Oproti prvnímu řešení z přesnou délkou trasy děti zjistí, že se robot neotočí, protože nemá na otočku prostor. V prvním řešení totiž nezastavil těsně u krabice ale v malém odstupu, který mu na otočku stačil. Je potřeba se dobrat k tomu, že stačí maličko couvnout.

## Řešení

Uvádím řešení v prostředí [EdBlock](https://www.edblocksapp.com/). Pokročilejší žáci, případně ti, co by stihli v hodině rychleji, mohou řešit v prostředí [EdScratch](https://edscratchapp.com).

![](/assets/2018-12-23/edison_krabice_reseni.png)

## Související

* [Konference učIT jinak](/software%20development/2018/05/15/konference-ucIT-jinak.html)
* [Hodina kódu s LightBot a Meet Edison](/software%20development/2017/12/11/hodina-kodu-s-lightbot-a-edison.html)
* [Úloha železniční přejezd](/software%20development/2018/08/20/uloha-zeleznicni-prejezd.html)
