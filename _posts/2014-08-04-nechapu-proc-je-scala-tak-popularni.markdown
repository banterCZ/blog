---
layout: post
title:  "Nechápu, proč je Scala tak populární"
date:   2014-08-04
categories: [software development]
item: 153
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2014-08-03/20140803-scala_logo.png" /></div>Nechápu, 
proč je <a 
href="en.wikipedia.org/wiki/Scala_(programming_language)">Scala</a> tak populární. Samozřejmě jsem koketoval s myšlenkou, že se Scalu naučím. Ale rozmyslel jsem si to, aniž bych se v ní pokusil cokoliv napsat (dokonce ani Hello World). Tento příspěvek jsem pojal jako obhajobu, proč se Scale nehodlám věnovat. Jak už psal Paul Graham v kritickém příspěvku <a href="/item/131">Přebal Javy</a>: „<em>Musíte se naučit posuzovat podle vnějších znaků a určit, které technologie stojí za váš čas.</em>“. Vzal jsem na vědomí, <a href="/item/150" />proč není tak rozšířené Groovy</a>, ale co se Scaly týče, tak souhlasím s tím, co bylo napsáno v knize <a href="http://amzn.to/1oGdeho">Seven Languages in Seven Weeks</a>, ze které budu citovat.
<!--more-->

<blockquote>Scala představuje naprosté kacířství pro funkcionální programátory a ryzí požehnání pro Java programátory
.</blockquote><blockquote>Přísně vzato, Scala není čistě funkcionální programovací jazyk, stejně jako C++ není čistě objektově orientovaný.</blockquote><blockquote>Když bylo objektově orientované paradigma nové, dav nemohl přijmout Smalltalk, protože to byla příliš nová teorie. Potřebovali jsme jazyk, který by jim dovolil pokračovat v procedurálním programování a nechal je experimentovat s objektově orientovanými myšlenkami. Díky C++ mohly vedle sebe žít objektově orientované triky spolu s existujícími procedurálními rysy jazyka C. Výsledkem bylo, že lidé mohli začít používat nové triky ve starém kontextu.</blockquote><blockquote>Syntaxe Scaly mi přijde trochu akademická a nesnadná pro oči.</blockquote><blockquote>Problém je, že přepínat ze Scaly do Javy a zpět stojí víc úsilí, než by mělo.</blockquote><blockquote>Použil bych Scalu ke zlepšení produktivity, kdybych měl významné investice do Java programů nebo programátorů. Rovněž bych zvažoval Scalu pro aplikace, které mají značné výkonnostní požadavky potřebující concurrency. Komerčně cílí tento Frankenstein velmi dobře, protože představuje most a zahrnuje významnou programátorskou komunitu.</blockquote>Pokud někdo touží programovat funkcionálně, ale je nucen zůstat u JVM, proč nezvolí <a href="http://en.wikipedia.org/wiki/Clojure">Clojure</a>?

<blockquote>Clojure a Java se navzájem zoufale potřebují. <a href="http://en.wikipedia.org/wiki/Lisp">Lisp</a> potřebuje trh, který může Java virtual machine nabídnout, a Java komunita potřebuje seriózní modernizaci a injekci zábavy.</blockquote>

{% twitter https://twitter.com/leonardo_borges/statuses/494768624880459778 %}

Akumulátor test
------

V souvislosti s Javou 8 jsem připomínal úlohu <a href="/item/152">akumulátor test</a>. Porovnejte s řešením ve <a href="http://rosettacode.org/wiki/Accumulator_factory#Scala">Scale</a>, <a href="http://stackoverflow.com/questions/8442524/writing-an-accumulator-function-in-clojure">Clojure</a> a v <a href="/item/152">Javě 8</a>.

{% gist banterCZ/158e55d1f05de6fc58f2 %}

{% gist banterCZ/7cfc45683e1b4b03a965 %}

Trendy
------

Na závěr mé dva oblíbené zdroje grafů (Nevěřím žádné statistice, kterou jsem sám nezfalšoval – jakkoliv je to <a href="http://cs.wikiquote.org/wiki/Winston_Churchill#Podvr.C5.BEen.C3.A9_cit.C3.A1ty">podvržený citát</a>) a to <a href="http://www.google.com/trends/explore#q=scala%2C%20groovy%2C%20clojure%2C%20jython&cmpt=q">Google Trends</a> a pracovní server <a href="http://www.indeed.com/jobanalytics/jobtrends?q=groovy%2C+scala%2C+jython%2C+clojure+&l=">Indeed.com</a>.

<script type="text/javascript" src="//www.google.com/trends/embed.js?hl=en-US&q=scala,+groovy,+clojure,+jython&cmpt=q&content=1&cid=TIMESERIES_GRAPH_0&export=5&w=500&h=330"></script>

<a href="http://www.indeed.com/jobanalytics/jobtrends?q=groovy%2C+scala%2C+jython%2C+clojure+&l="><img src="http://www.indeed.com/trendgraph/jobgraph.png?q=groovy%2C+scala%2C+jython%2C+clojure+" /></a>

A jaký je váš vztah ke Scale?