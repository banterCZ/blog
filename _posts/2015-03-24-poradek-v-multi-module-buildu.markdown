---
layout: post
title:  "Pořádek v multi-module buildu"
date:   2015-03-24
categories: [software development]
disqusId: 159
tags: [Maven]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://www.flickr.com/photos/seditiouscanary/1279041211"><img src="https://farm2.staticflickr.com/1156/1279041211_1dbc1e1473_m.jpg" /></a><br/><a href="https://www.flickr.com/photos/seditiouscanary/1279041211">Chris Nygaard (by-nc-nd 2.0)</a></div>Mám rád v dílně pořádek. Všechno má své místo, na které se musí vracet. Nářadí nesmíte dlouze hledat či o něj dokonce zakopávat. Nejlépe je uklízet hned a málo, než později a hodně, protože se vám do toho nebude chtít. Stejně to mám rád při programování. Mohl bych psát o víc sexy nástrojích jako Gradle, ale nejde si nevšimnout, že mnozí programátoři (ať už z nezájmu nebo nedostatku kázně) mají herberk i v hojně rozšířeném Mavenu. Chtěl bych ukázat, jak lze mít uklizeno v multi-module buildu. Jestli to zrovna vy nepotřebujete, tím lépe.
<div style="clear: both"></div>
<!--more-->

<h3 style="clear: both">Multi-module build</h3>
Nebudu popisovat, co to multi-module build je. Zaměřím se na několik nešvarů, se kterými jsem se setkal.

Předně v modulu nemusíte uvádět <em>groupId</em> ani <em>verzi</em>, převezme se z <em>parenta</em>, stačí pouze <em>artifactId</em>. Pochopitelně je můžete překrýt, ale máte k tomu důvod? Dost si takhle usnadníte třeba release.

Veškeré závislosti uvádějte v parentu v <em>dependencyManagementu</em> a ne rovnou v <em>dependencies</em>, ať se vám nerozjedou verze. Potřebuje-li pak nějaký modul konkrétní závislost, uvede v <em>dependencies</em> pouze <em>groupId</em> a <em>artifactId</em>. Verzi řídí <em>parent</em> pro všechny moduly.

Stejně jako lze mít uklizeno v dependencies, lze uklidit i v pluginech. Ukažme si to na příkladu <a href="http://maven.apache.org/plugins/maven-compiler-plugin/">compiler pluginu</a>. Pro určité <em>packagingy</em> tam je automaticky namapovaný, ale nejspíš budete potřebovat změnit <em>target</em> a <em>source</em> na něco vyššího než 1.5 Bylo by, když ne chybou, tak určitě neelegantní, definovat plugin přímo v parentu a nutit ho tak všem modulům, i těm, které ho vzhledem ke svému <em>packagingu</em> nepotřebují. Lze to vylepšit tak, že plugin definujete v <em>pluginManagementu</em> podobně jako závislosti v <em>dependencyManagementu</em>.

Ve všech těch parentech a transitivních závislostech se člověk snadno ztratí, takže můžete nakonec ověřit konfiguraci modulu pomocí <em>mvn <a href="http://maven.apache.org/plugins/maven-help-plugin/effective-pom-mojo.html">help:effective-pom</a></em>

BOM (bill of materials) a releasování si nechám na příště.

Ukázka
------

{% gist banterCZ/0628ced7227c62e5a0bc %}

Celý <a href="https://github.com/banterCZ/multi-module-sample">miniprojekt na githubu</a>.

Anketa
------

<script type="text/javascript" charset="utf-8" src="https://static.polldaddy.com/p/8753707.js"></script>
<noscript><a href="http://polldaddy.com/poll/8753707/">Co používáte za build nástroj</a></noscript>

Související
------

* <a href="/item/99">Nedrátujte konfiguráky do warka</a>
