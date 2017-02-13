---
layout: post
title:  "Validátor rodných čísel"
date:   2012-11-07
categories: [software development]
disqusId: 113
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://www.flickr.com/photos/bantercz/7678448648/in/photostream/"><img src="http://farm8.staticflickr.com/7274/7678448648_5f1dc5ae44_m.jpg" /></a></div>Téměř jistě jste se dostali k implementaci formuláře, na kterém se zadává rodné číslo. A jako každý vstup je i tento potřeba validovat. V lepším případě jste nekontrolovali pouze dělitelnost jedenácti, ostatně je to snad již dost profláklé a navíc je <a href="http://cs.wikipedia.org/wiki/Rodn%C3%A9_%C4%8D%C3%ADslo">formát rodného čísla</a> podrobně popsán na Wikipedii.

Z diskuse pod článkem <a href="/item/112">Jak přesvědčit, že je správné psát testy</a> vyplynulo, že nejlepší lobby za testy jsou reálné příklady. Zde je tedy unit test na validátor rodného čísla. Uvítám komentáře a připomínky, zda jsem na nějakou variantu nezapomněl. Případně rovnou <a href="git://gist.github.com/3979014.git">forkujte</a>. Zkuste pustit daný test vůči vašemu validátoru.
<!--more-->

{% gist banterCZ/3979014 RCValidatorTest.java %}