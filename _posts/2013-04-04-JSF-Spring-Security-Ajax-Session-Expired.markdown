---
layout: post
title:  "JSF, Spring Security, Ajax Session Expired"
date:   2013-04-04
categories: [software development]
item: 127
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/20110510-jsf-logo.tiff/lossless-page1-200px-20110510-jsf-logo.tiff.png"></div>V <a href="/item/125">úvodu do PrimeFaces a JSF 2</a> jsem se zmínil, že používáte-li Spring Security, nepotřebujete managed beanu pro login, stačí <i>jen</i> submit javascriptem (POST request na url /j_spring_security_check). Mnohem zapeklitější je ošetření ajaxu nad vypršenou HTTP session. Nejspíš si říkáte, žádná věda. Spring Security mě prostě přesměruje na login. Taky že ano, ale v případě ajaxu dostanete jako <i>partial response</i> právě onen login formulář. View ho není schopné zpracovat a uživatel je zmaten, protože se nic neděje. Jak to vyřešit?
<!--more-->

Klíčovým bodem je implementace rozhraní <a href="http://static.springsource.org/spring-security/site/docs/3.1.x/apidocs/org/springframework/security/web/session/InvalidSessionStrategy.html">InvalidSessionStrategy</a>. Začneme tím jednodušším, pro <b>ne</b>ajaxový request zavoláme <a href="http://docs.oracle.com/javaee/6/api/javax/servlet/http/HttpServletResponse.html#sendRedirect(java.lang.String)">HttpServletResponse#sendRedirect(String)</a>. A jak vůbec ajaxový request rozlišit? V HTTP hlavičce <i>faces-request</i> dostanete hodnotu <i>partial/ajax</i>. Pak už stačí vytvořit xml odpověď s direktivou pro přesměrování.

Zbývá vyřešit několik drobností. Především ve web descriptoru musí být zaregistrován <a href="http://static.springsource.org/spring-security/site/docs/3.1.x/apidocs/org/springframework/security/web/session/HttpSessionEventPublisher.html">HttpSessionEventPublisher</a>, abyste vůbec dostávali eventy o vypršené session. Naši implementaci InvalidSessionStrategy injektujeme do filteru <a href="http://static.springsource.org/spring-security/site/docs/3.1.x/apidocs/org/springframework/security/web/session/SessionManagementFilter.html">SessionManagementFilter</a>, který zaregistrujeme na pozici
<pre>before=&quot;SESSION_MANAGEMENT_FILTER&quot;</pre>
Problém je, že jako vedlejší efekt samotného Ajax POSTu, se InvalidSessionStrategy volá na GET requesty způsobené nějakými obrázky (přestože je to cache hit - HTTP status 304 Not Modified). Stačí neaplikovat zabezpečení na resources (css, javascript a obrázky).
<pre>
&lt;sec:http pattern=&quot;/javax.faces.resource/**&quot; security=&quot;none&quot;/&gt;
</pre>

![](/assets/2013-04-04/20130403-ajax.png)

Provedete-li GET request a nejste-li autentizovaní, jste přesměrováni na login. Po úspěšném přihlášení jste ovšem opět přesměrováni, tentokrát na stránku, kterou jste původně žádali. To je standardní chování. Naše implementace má však potíž se zacyklením. Sice jste přesměrováni ale se stále stejnou, vypršenou, session. Vytvoříme tedy novou. 
<pre>
request.getSession(true);
</pre>

S ajaxovým POSTem je to složitější. Je potřeba uživatele informovat, že došlo k vypršení session s možností prokliku na view, kde byl naposled, ačkoliv původní kontext je ztracen. View dostaneme z referera: #{header['referer']}

Zde je kompletní konfigurace.

{% gist banterCZ/5160269 %}