---
layout: post
title:  "Spring, JSP a IndexOutOfBoundsException"
date:   2013-02-20
categories: [software development]
disqusId: 122
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="https://docs.spring.io/images/spring_green_on_white_160x90.png" /></div>Po nějaké době praxe řešíte většinu problému rutinně, metodou kouknu a vidím. Občas je to ovšem zásek, se kterým na první pohled netušíte, jak pohnout. Tohle je jeden z takových. Měli jsme JSP formulář, který fungoval rok bez chyby. Renderoval se v pořádku, ale binding začal házet <a href="http://docs.oracle.com/javase/6/docs/api/java/lang/IndexOutOfBoundsException.html">IndexOutOfBoundsException</a>. Ale přitom na modelu byl field typu <i>java.util.List</i> Už máte řešení? Tak to asi znáte Spring jako své boty.
<!--more-->

Řešení
------
Pes je zakopaný v <a href="http://static.springsource.org/spring/docs/3.0.x/api/org/springframework/validation/DataBinder.html#setAutoGrowCollectionLimit(int)">DataBinder.html#setAutoGrowCollectionLimit(int)</a> a jeho výchozím nastavení na 256 kvůli prevenci OutOfMemoryErrors.

{% gist banterCZ/4754235 %}