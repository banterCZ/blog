---
layout: post
title:  "SOAP Stateful Web Service - Java/C#"
date:   2015-06-11
categories: [software development]
disqusId: 163
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://commons.wikimedia.org/wiki/File:SOAP.svg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/SOAP.svg/150px-SOAP.svg.png" /></a></div>Vzpomínám si na historku, kterou mi vyprávěl můj bratranec, toho času majitel stavební firmy. Vyhodil z kabiny bagristu, který tvrdil, že to nejde, sedl si tam sám a ukázal, že to jde. Tohle já jsem naposledy neudělal, takže alespoň tímto článkem to chci odčinit.

Webové služby obvykle využívají HTTP protokol, který je bezstavový. Jeho stavovost dokážeme zajistit pomocí session. Když zajistíme stavovost protokolu, dokážeme zajistit i stavovost webové služby. Tak jako vám v USA neprodají střelnou zbraň okamžitě, ale musíte přijít až za několik dní, abyste s ní v afektu nespáchali zločin, i tady je potřeba se důkladně zamyslet, zda jo to dobrý nápad. Řekněme, že my jsme pádný důvod měli.
<!--more-->

Java server
------

Není obtížné najít <a href="http://docs.oracle.com/cd/E12839_01/web.1111/e13734/stateful.htm#WSADV234">návod na Java stateful web service server</a>. Nicméně je nešikovný v tom, že si manuálně musíte spravovat svůj objekt v <em>HttpSession</em>, ke které se musíte dostat přes <em>WebServiceContext</em>. Jsem vnitřně přesvědčen, že to jde vždycky udělat lépe a šlo to i tentokrát. Ostatně na co máme <em>SessionScope</em> a dependency injection?

{% gist banterCZ/8c9b3c972d65fa4659f6 %}

Java klient
------

Aby klient s takovou službou dokázal fungovat, stačí v Javě podle návodu jednoduše přidat následující.

<pre>((BindingProvider)port).getRequestContext().put(BindingProvider.SESSION_MAINTAIN_PROPERTY, true);</pre>

C# klient
------

V C# to bylo složitější z toho důvodu, že jsem jako javista dostal odpověď, že to nejde. Propracoval jsem se ke klíčovému slovu <a href="https://msdn.microsoft.com/en-us/library/system.net.cookiecontainer%28v=vs.110%29.aspx">CookieContainer</a>, ale to znamenalo vracet se ke starší verzi jejich frameworku. Alespoň nás to přivedlo na stopu a ke konečnému řešení už byl jen krůček. Programově nastavíte následovně. Zle pochopitelně zapnout i v xml konfiguračním souboru bindingu.

{% gist banterCZ/4c1e3db25ed968270918 %}

SoapUI klient
------

K testování webových služeb nejspíš používáte nástroj SoapUI. A ani tam není stavová webová služba problém. Stačí si do hlaviček session přidat. Pro ilustraci přikládám screeshoty.

![](/assets/2015-06-11/20150611-SoapUI_cookie_get.png)

![](/assets/2015-06-11/20150611-SoapUI_cookie_set.png)

<a name="contract-first"></a>

Contract First
------

Architektonická odbočka. Stále ještě ne všichni vzali za své, že správný způsob tvoření webových služeb je <em>contract first</em>, tedy sepsat wsdl (kontrakt) a z toho teprve generovat kód. V oblibě je pro programátory pohodlnější varianta: nabušit kód a z toho mi přece něco vyleze.

Spring framework považuji za úžasnou školu softwarového designu. Prohlašují, že jediný správný způsob je <em>contract first</em>, a proto Spring přístup <em>code first</em> vůbec nepodporuje. Vybírám argumenty z jejich dokumentace, konkrétně kapitoly <a href="http://docs.spring.io/spring-ws/site/reference/html/why-contract-first.html">Why Contract First</a>.

<a href="https://www.flickr.com/photos/bantercz/6681363273/"><img src="https://farm8.staticflickr.com/7018/6681363273_1d50dda3dd.jpg" /></a>

Nejdůležitějším úkolem webových služeb je jejich interoperabilita: podpora více platforem jako Java, .NET, Python, PHP atd., které mají různé knihovny, takže je potřeba používat něco, co mají společného, a tím je XML. Třeba <em>TreeMap</em> nemá v XML žádný standard a každý jazyk by si to generoval po svém. Nemluvě o datu. Další třešničkou jsou třeba cyklické grafy, které by v XML vedly k rekurzi.

Pokud generujete wsdl z kódu, jak zaručíte, že se vám kontrakt nezmění? Občas je potřeba rozhraní služby změnit. V Javě pak typicky vytvoříme intefrace <em>MyService2</em> a k tomu implementaci. Stará služba musí pochopitelně ještě běžet kvůli klientům, kteří doposud nezmigrovali.

V <em>contract first</em> přístupu je slabá vazba (looser coupling) mezi kontraktem a implementací, což nám umožňuje mít obě verze v jedné třídě. Můžeme například použít XSLT transformace staré zprávy do nové.

Stejně jako má ORM problémy s mapováním relačních databází na objekty, tak podobné problémy má i XML. Věci nejsou tak jednoduché, jak se zdají. Je velký rozdíl mezi hierarchickou strukturou XML a grafovým Java modelem. V XSD lze rozšířit data tak, že zavedete nějaké restrikce, třeba regulární výraz ke stringu, něco takového vám Java neumožní.