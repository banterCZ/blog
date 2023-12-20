---
layout: post
title:  "Spring, REST a e-mail jako parametr"
date:   2013-02-09
categories: [software development]
disqusId: 120
tags: [Spring, regex]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="https://docs.spring.io/images/spring_green_on_white_160x90.png" /></div>Denně jako vývojáři řešíme jeden problém za druhým. O většině si nejspíš myslíte, že nestojí za samostatný článek na blog (což není pravda). Mezi takové, které jsem odsunul do pozadí, by patřil i tento, pokud by se ovšem na to samém nepozastavil i kolega. Jde o to, že když používáte Spring spolu s RESTovým url a chcete používat e-mail jako parametr,<br/> například <a href="http://localhost:8080/users/jmeno.prijmeni@firma.domena">http://localhost:8080/users/jmeno.prijmeni@firma.domena</a>, tak kód vyžaduje drobnou úpravu.
<!--more-->

Při implementaci překvapí, že místo e-mailu dostanete jen substring. Jsme empiričtí programátoři, takže čteme dokumentaci, jen když nám něco nejde. Ale kde a co v tomto případě hledat? Klíčem je anotace <a href="http://static.springsource.org/spring/docs/3.1.x/javadoc-api/org/springframework/web/bind/annotation/RequestMapping.html">@RequestMapping</a>, konkrétně se tam mluví o <a href="http://static.springsource.org/spring/docs/3.1.x/javadoc-api/org/springframework/web/bind/annotation/PathVariable.html">@PathVariable</a>

> By default, the URI template will match against the regular expression [^\.]

Vidíte to tam? Bonmot praví, že máme-li problém a rozhodneme se ho řešit regulárním výrazem, máme problémy rázem dva.

Řešení
------
{% gist banterCZ/4705498 %}