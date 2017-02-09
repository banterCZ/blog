---
layout: post
title:  "Inherit javadoc"
date:   2013-08-05
categories: [software development]
item: 136
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://en.wikipedia.org/wiki/Java_(programming_language)#/media/File:Java_programming_language_logo.svg"><img src="https://upload.wikimedia.org/wikipedia/en/thumb/3/30/Java_programming_language_logo.svg/128px-Java_programming_language_logo.svg.png" /></a></div>Jak píšete javadoc u implementací rozhraní nebo u překrytých metod? Léta jsem používal výchozí generovaný javadoc v Eclipse

<pre>(non-Javadoc) @see</pre>, později jsem přešel na standardní

<pre>{@inheritDoc}</pre>
Nedávno jsem si na twitteru stěžoval, že v Intellij 
Idea není možné si potřebnou šablonu upravit. Připadám si jak z té historky, ve které dcera celý život pekla štrúdl tak, že vždy před vložením na plech zařízla patky, protože to tak pokaždé dělala i její matka. Předpokládala, že je to součást receptu, že to tak bude prostě lepší. Ovšem matka to dělalal proto, že měla malý plech a štrúdl by se jí tam celý nevešel.
<!--more-->

Zjistil jsem, že Idea má svůj důvod, proč šablonu nelze upravit; <a href="http://docs.oracle.com/javase/6/docs/technotes/tools/solaris/javadoc.html#inheritingcomments">javadoc se totiž kopíruje automaticky</a>, takže se lze bez tohoto balastu obejít. Jeden případ, kdy by se vám mohla direktiva

<pre>{@inheritDoc}</pre> hodit je ten, kdy chcete zkopírovat javadoc a přidat nějaký specifický popis. V ukázce je to metoda
<pre>add()</pre> Eclipse i Idea tohle chování podporují, ale javadoc vygenerovaný z příkazové řádky (ať už Mavenem či čistě z Javy) ho prostě přepíše - chová se stejně, jako by tam nebyl žádný
<pre>{@inheritDoc}</pre>

Kód
------

{% gist banterCZ/6140351 %}

Javadoc v IDE
------

![](/assets/2013-08-05/20130805-Idea.png)

HTML javadoc
------

![](/assets/2013-08-05/20130805-Sample.png)

![](/assets/2013-08-05/20130805-SampleImpl.png)

Empiricky zjištěno: Idea, Eclipse i generovaný javadoc u implementace rozhraní kopíruje javadoc ať už použijete konstrukci
<pre>(non-Javadoc) @see</pre>, případně 
<pre>{@inheritDoc}</pre> nebo dokonce vůbec nic, což je nakonec zdaleka nejlepší, ne?