---
layout: post
title:  "Akumulátor test a Java 8"
date:   2014-06-24
categories: [software development]
item: 152
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://openclipart.org/detail/13230/lambda-by-anonymous"><img src="http://openclipart.org/image/149px/svg_to_png/13230/Anonymous_lambda.png" /></a></div>Paul Graham v článku <a href="http://www.paulgraham.com/icad.html">Revenge of the Nerds</a> (dostupný i <a href="http://web.archive.org/web/20031020133431/http://otaflegr.com/preklady/PomstaNerdu.html">český překlad</a>) píše, že kdybyste se Dilbertova šéfa zeptali, v čem naprogramovat software, tak vám odpoví: Java. Ale jazyky se svými schopnostmi liší. Ukazuje to sice na akademické a nepraktické úloze, která ovšem o jazycích leccos vypovídá. Úlohu jsem si připomněl v souvislosti s uvedením Javy 8. Zajímalo mě, jak obstojí.
<div style="clear: both"></div>
<!--more-->

Akumulátor
------

<blockquote>Chceme napsat funkci, která generuje akumulátory: funkci která vezme číslo <em>n</em> a vrátí funkci, která bere jiné číslo <em>i</em> a vrací <em>n</em> zvýšené o <em>i</em>.</blockquote>

Java
------

V Javě nebyla metoda <a href="http://en.wikipedia.org/wiki/First-class_citizen">first-class object</a> (nebo taky <em>citizen</em>), což ve stručnosti znamená, že nešlo předat metodu jako parametr jiné metodě. Pokud vám tahle vlastnost nechyběla, tak možná proto, že jste si to nikdy nezkusili.

Po všech těch odkladech jsem sázel, že tunel Blanka bude hotová dřív než Java&nbsp;8, ale naštěstí jsem se mýlil. Java&nbsp;8 přichází, kromě jiného, s lambda kalkulem, což není plnohodnotné <a href="http://en.wikipedia.org/wiki/Closure_(computer_programming)">closure</a>.

<blockquote>Closure mají přístup k proměnným mimo vlastní definici (proto se jim také říká uzávěry, anglicky <em>closures</em>, uzavírají totiž lexikální kontext funkce nebo metody, v níž jsou definovány).</blockquote> (<a href="http://babel.blog.root.cz/2011/07/20/lamba-vyrazy-uzavery-bloky/">Lambda výrazy, uzávěry, bloky</a>)

V Javě bohužel musí být lokální proměnné referencované z lambda výrazu definované jako <em>final</em> nebo alespoň efektivně final, což mě nepříjemně překvapilo, neboť jsem čekal, že s verzi 8 už dokážu napsat podobně elegantní řešení jako v Groovy. Mimochodem koncept closure byl implementován v jazyce <a href="http://en.wikipedia.org/wiki/Scheme_(programming_language)">Scheme</a> již v roce 1975.

Řešení
------

Níže naleznete řešení v Groovy, Javě 7 a Javě 8, ke kterému mi pomohly odpovědi na mou <a href="http://stackoverflow.com/questions/24082945/accumulator-test-java-8">otázku na stackoverflow.com</a>

{% gist banterCZ/a41a27a496ae792a21ea %}
