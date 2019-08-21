---
layout: post
title:  "Parametrizovaný JUnit test"
date:   2014-02-05
categories: [software development]
disqusId: 146
tags: [JUnit]
image: "/assets/2014-02-05/1267371838.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2014-02-05/1267371838.png" /></div>Richard Šerý v článku <a href="http://www.aspectworks.com/2014/02/druha-obtizna-vec">Druhá obtížná věc</a> prohlašuje: „pište kód tak, aby ho pochopilo i malé děcko, senilní stařík či vy po deseti letech práce v korporaci“. V komentářích jste mě za podobu <a href="/item/113">unit testu pro validátor rodného čísla</a>, který ono krédo respektuje, téměř kamenovali. Zkusme tedy něco elegantnějšího: <a href="http://junit.org/javadoc/latest/org/junit/runners/Parameterized.html">parametrizovaný JUnit</a> test. Dle toho, co jsem viděl, se zatím testy tímto způsobem moc nepíšou. Jako další zlepšovák implementováno v Groovy.
<!--more-->

Zadání
------

Je dán validátor e-mailové adresy definován pomocí regulárního výrazu. Byl nahlášen bug - délka části před zavináčem nesmí být delší jak 64&nbsp;znaků. Známý bonmot praví: „Máte-li problém a rozhodnete se ho řešit regulární výrazem, máte problémy rázem dva“. Pro zajímavost (pro samotný test netřeba), použijeme funkcionalitu zvanou <a href="http://www.regular-expressions.info/lookaround.html">lookahead assertion</a>.

Test
------

Než do regulárního výrazu jakkoliv sáhnu, napíšu si test. Znamená to vymyslet několik validních a nevalidních hodnot. Ty pak lze použít v jednotlivých test metodách (těch je hodně). Nebo naopak napsat jedinou test metodu, kterou nakrmím testovacími daty v podobě tabulky, kde jeden sloupec jsou vstupní hodnoty a druhý sloupec očekávané výsledky. Toho dosáhneme právě runnerem  <a href="http://junit.org/javadoc/latest/org/junit/runners/Parameterized.html">org.junit.runners.Parameterized</a>

Groovy mi pomohlo v lepší práci s kolekcemi a načtení testovaného regulárního výrazu z properties souboru.

{% gist banterCZ/8822692 %}

Nebojte, i když máte jedinou testovací metodu, test runner poskytuje pěkný přehled 
jednotlivých 
případů. 
Tady je příklad, jak to vypadá v IntelliJ IDEA.

![](/assets/2014-02-05/20140205-idea.png)

Závěr
------

Parametrizovanými testy dokážete, jak elegantní kód píšete, ale otázkou zůstává, zda se ostatním nebude hůř číst a upravovat.

Mohl by vás zajímat související článek: <a href="http://www.dominik-mostek.cz/blog/junit-theories/">JUnit Theories</a> (Dominik Moštěk)