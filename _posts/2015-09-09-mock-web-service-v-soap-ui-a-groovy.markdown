---
layout: post
title:  "Mock Web Service v Soap UI a Groovy"
date:   2015-09-09
categories: [software development]
disqusId: 167
tags: [Groovy]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://en.wikipedia.org/wiki/File:Soapui-logo.png"><img src="https://upload.wikimedia.org/wikipedia/en/2/23/Soapui-logo.png" /></a></div>Dejme tomu, že se vaše platforma skládá z několika komponent komunikujících přes webové služby, ale některá z nich není ještě vyvinutá nebo je třeba kvůli omezení sítě nedostupná. Vy byste přesto potřebovali zkoušet integrovat. Co teď? Vytvořte si <a href="https://en.wikipedia.org/wiki/Mock_object">mock</a> v Soap&nbsp;UI a případě potřeby naskriptujte v Groovy.
<!--more-->

Chtěl bych ukázat případovou studii <a href="https://cs.wikipedia.org/wiki/Certifika%C4%8Dn%C3%AD_autorita">certifikační autority</a>, které přes SOAP pošlete <a href="https://en.wikipedia.org/wiki/Certificate_signing_request">Certificate signing request</a> (<em>CSR</em>) a ona vrátí podepsaný certifikát, což se bude dít voláním Open&nbsp;SSL z příkazové řádky. (Soap&nbsp;UI samozřejmě <a href="http://www.soapui.org/rest-testing-mocking/rest-service-mocking.html">podporuje i <em>mock</em> REST webových služeb</a>).

Statický response
------

Nebudu popisovat úplné základy <a href="http://www.soapui.org/">Soap&nbsp;UI</a>, předpokládám, že už jste ho někdy viděli, případně že se rychle zorientujete i díky <a href="https://www.youtube.com/watch?v=VwTOFsY4cWQ">tutoriálu</a>. Z WSDL vytvoříte <a href="http://www.soapui.org/getting-started/your-first-soapui-project.html">nový projekt</a>. Tady bych chtěl opět <a href="/item/163#contract-first">zdůraznit <em>contract first</em> přístup</a>. Pokud máte WSDL, tak vývojáři serveru ani klienta nejsou blokováni, na nic nečekají a můžou rovnou vyvíjet alespoň vůči <em>mocku</em>. V Soap&nbsp;UI projektu tedy vytvoříte <a href="http://www.soapui.org/getting-started/mock-services.html">mock service</a>.

<em>Mock</em> lze spouštět ručně ze Soap&nbsp;UI, z příkazové řádku nebo <a href="http://www.soapui.org/soap-mocking/deploying-mock-services-as-war-files.html">zabalit do <em>WARu</em></a> a nasadit na <em>servlet container</em>.

<iframe width="560" height="315" src="https://www.youtube.com/embed/VwTOFsY4cWQ" frameborder="0" allowfullscreen></iframe>

Dynamický response
------

Se statickým <em>response</em> si asi vždy nevystačíme. Můžete ho ovšem použít jako <em>template</em> a propsat ho požadovanými hodnotami.

![](/assets/2015-09-09/20150909-soap response.PNG)

Ovšem takhle vracíte stejnou <em>response</em> pro všechny <em>requesty</em>. Ale my máme pokaždé jiné <em>CSR</em>, které chceme podepsat.

![](/assets/2015-09-09/20150909-soap request.PNG)

Nicméně dokážeme ho rozparsovat díky následujícímu kódu.

![](/assets/2015-09-09/20150909-soapui parsing request.PNG)

Skriptování v Groovy
------

Soap&nbsp;UI má solidní dokumentaci UI i Groovy <a href="http://www.soapui.org/apidocs/index.html">API</a>, ale chybí jakýsi mezistupeň. Jak se v tom vyznat? V Soap&nbsp;UI je několik implicitních proměnných se zřejmým jménem. 

* log
* context
* requestContext
* mockRequest
* mockResponse

Vezměme si proměnou <em>mockRequest</em>, ta reprezentuje třídu <a href="http://www.soapui.org/apidocs/com/eviware/soapui/impl/wsdl/mock/WsdlMockRequest.html">WsdlMockRequest</a>, která má metodu <a href="http://www.soapui.org/apidocs/com/eviware/soapui/impl/support/AbstractMockRequest.html#getRequestContent()">#getRequestContent()</a>. V Groovy pak píšeme <pre>def content = mockRequest.requestContent</pre>
Nejsme pochopitelně omezeni Soap&nbsp;UI API, lze použít veškeré možnosti Groovy a volat tak i programy (jako v našem případě Open&nbsp;SSL) z příkazové řádky (díky <a href="http://docs.groovy-lang.org/latest/html/groovy-jdk/java/lang/String.html#execute()">String#execute()</a>).
		
Výsledný Groovy skript
------

Následuje výsledný skript, který z <em>requestu</em> rozparsuje <em>CSR</em>, pomocí Open&nbsp;SSL vytvoří certifikát a ten vrátí v <em>response</em>.

{% gist banterCZ/fc15206069fbd7f8583a %}

Kompletní Soap&nbsp;UI <a href="https://bitbucket.org/banterCZ/ws-mock-service-with-soap-ui">projekt je k dispozici na bitbucket</a>.