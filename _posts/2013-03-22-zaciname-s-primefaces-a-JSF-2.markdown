---
layout: post
title:  "Začínáme s PrimeFaces a JSF 2"
date:   2013-03-22
categories: [software development]
disqusId: 125
tags: [JSF]
---
![](/assets/2013-03-22/20130322-primefaces_logo.gif)

Frontendové frameworky javovských webových aplikací, to je bolest. Sice se javisti 
vymezují 
třeba 
oproti Ruby on Rails, jak jsou rychlejší, ale pak to zabijí něčím takovým, jako jsou JavaServer Faces (JSF). Nic naplat, když chcete rychle vyvíjet z dostupných komponent, jsou JSF jednou z možností. Shrnuji pár poznatků, které vám pomůžou rychlejší rozjezd projektu s JSF a knihovnou komponent PrimeFaces. Uvítám i konfrontace zkušenějších kolegů. Nejedná se o podrobný návod, spíš rozcestník.
<!--more-->

Proč PrimeFaces
------

<a href="http://www.primefaces.org">PrimeFaces</a> jsou knihovna komponent pro JSF, pod licencí Apache 2.0 Nabízí se ještě konkurenti <a href="http://www.jboss.org/richfaces">RichFaces</a> a <a href="http://www.icesoft.org/">IceFaces</a>. Prohlédněte si <a href="http://www.primefaces.org/showcase">PrimeFaces ShowCase</a>. Jako výčet pozitiv na svých stránkách uvádějí: jediný jar bez závislostí, Spring Roo addon a hlavně graf z Google Trends.
<script type="text/javascript" src="//www.google.com/trends/embed.js?hl=en-US&q=richfaces,+icefaces,
+primefaces&tz=Etc/GMT-1&content=1&cid=TIMESERIES_GRAPH_0&export=5&w=600&h=380"></script>

Doporučuji ovšem srovnat s job trends.

<a href="http://www.indeed.com/jobtrends?q=primefaces%2C+richfaces%2C+icefaces&relative=1"><img src="https://www.indeed.com/trendgraph/jobgraph.png?q=primefaces%2C+richfaces%2C+icefaces&relative=1" /></a>

Proč ne PrimeFaces
------

Sice jsou PrimeFaces open source, ale bohužel s poslední verzí 3.5.0 ohlásili, že <a href="http://blog.primefaces.org/?p=2451">bugfixing je placený</a>. Major a minor verze (major.minor.bugfix) jsou nadále zdarma. Zaráží to s ohledem na takřka tři roky staré, neopravené, respektive prohlášené za opravené, chyby. Přitom nejde o žádný výjimečný případ použití, viz <a href="http://code.google.com/p/primefaces/issues/detail?id=1544#c23">LazyDataTable.setRowIndex throws arithmetic exception: division by 0</a>. Dále v extensions, konkrétně u dynamických formulářů, jsem nenašel ani řádek javadocu, asi si se mnou hraje na schovávanou

Spring
------

JSF od verze 2 přicházejí s ViewScope, nemusíte už plývat prostředky na Session scope managed beany. Pokud ovšem chcete, aby je spravoval Spring, tak si musíte <a href="http://www.harezmi.com.tr/spring-view-scope-for-jsf-2-users/">implementovat ViewScope sami</a>. Pozor, s ViewScope budete mít  problém, pokud se třeba rozhodnete <a href="http://balusc.blogspot.cz/2011/09/communication-in-jsf-20.html#ViewScopedFailsInTagHandlers ">v ui:include použít EL</a>.

Spring Security je realizováno webovým filtrem, login provádíte POST requestem na url <i>/j_spring_security_check</i> Jenže nechcete kvůli tomu mít manage beanu, že? Nepoužijete tedy <i>h:form</i>, ale normální html form a submit vyvoláte javascriptem. Spring Security a JSF to je vůbec téma na samostatný článek. Třeba o tom, <a href="/item/127">jak se řeší expirace session, tak aby to správně fungovalo i s ajaxem</a>.

404 Page Not Found
------

Nepříjemně mě překvapilo, že se JSF nechovají jako webová aplikace, jak bych to od ní čekal. Pokud přistoupíte na adresu, která neexistuje, nicméně odpovídá mapování Faceletu, nedostanete http status kód <i>404 stránka nenalezena</i>, ale <i>500 vnitřní chyba serveru</i>. Je to kvůli výjimce <i>java.io.FileNotFoundException</i> Vyřeší to následující implementace filtru

{% gist banterCZ/4730442 %}

Logování
------

V době mavenu mi nepřijde jediný jar bez závislostí jako výhoda, spíš naopak. PrimeFaces používají java.util.logging, chcete-li tedy použít například slf4j, tak musíte do logging.properties přidat SLF4JBridgeHandler z <a href="http://mvnrepository.com/artifact/org.slf4j/jul-to-slf4j">jul-to-slf4j</a>

<pre>handlers = org.slf4j.bridge.SLF4JBridgeHandler</pre>

Ignorování komentářů
------

V souborech s definicí JSF view nelze používat scripletové komentáře no a html komentáře budou vidět ve výsledné stránce. Pokud nenastavíte facelet, aby je přeskakoval.
<pre>
&lt;context-param&gt;
	&lt;param-name&gt;javax.faces.FACELETS_SKIP_COMMENTS&lt;/param-name&gt;
	&lt;param-value&gt;true&lt;/param-value&gt;
&lt;/context-param&gt;
</pre>

Cancel
------

Storno tlačítko pro odchod z obrazovky překvapivě volá validace v případě jejich selhání vám nedovolí odejít. Vyřešíte nastavením atributu <i>immediate="true"</i>.
Pro reset formuláře má PrimeFaces šikovnou komponentu <a href="http://www.primefaces.org/showcase/ui/resetInput.jsf">resetInput</a>

Validace
------

Vstupní formulářové políčka mají atribut <i>maxlength</i> omezující maximální délku. To funguje, ale při stylu práce ctrl+c a ctrl+v vám nadbytečné znaky tiše ořízne. Řešením je validátor

<pre>&lt;f:validateLength maximum="254" for="myField" /&gt;</pre>

Nejspíš budete řešit i zobrazení validačních hlášek přes komponentu <a href="http://www.primefaces.org/showcase/ui/messages.jsf">messages</a> Globální rozchodíte jistě hned, ale nezapomeňte u command buttonu přidat atribut <i>update="form_id"</i>, který zajistí aktualizuje hodnoty zpráv u jednotlivých formulářových políček.

Verzování skriptů
------

Již dříve jsem psal, že máte <a href="/item/118">verzovat skipty</a>. Jsf zvolilo nešikovnou cestu přes adresáře. Např. /resources/css/1_0_2
Lze se tomu vyhnout (adresář neměnit), sice nepěkným, ale funkčním zápisem.
<pre>&lt;link 
href="#{request.contextPath}/javax.faces.resource/screen.css.xhtml?ln=css&amp;v=#{initParam['applicationVersion']}"
rel="stylesheet" type="text/css" /&gt;</pre>

Výkon
------

Spíš dříve než později si všimnete, že se gettery volají až příliš často. Pokud by managed beany byly obyčejné POJO, tak by to nevadilo, ale možná jste provolávali přes  servisní vrstvu databázi, ne? Takže si výsledek budete cachovat do fieldu, který je ale pak někdy potřeba přenačíst... Podrobněji <a href="http://stackoverflow.com/questions/2090033/why-jsf-calls-getters-multiple-times">Why JSF calls getters multiple times</a>.

Literatura
------

Papírově i pro kindle je dostupná kniha <a href="http://amzn.to/YrUWEt">PrimeFaces Cookbook</a>. Máte-li ji, přečtěte si, jinak můžete ušetřit a projít si jen <a href="https://github.com/ova2/primefaces-cookbook">příklady z knihy</a>.

Závěr
------

V JSF lze obyčejné formuláře nabušit rychle a PrimeFaces vám poskytnou pěkné komponenty. I když se zpoplatněním můžou přijít o popularitu. Narazíte-li na něco nestandardního, znamená to mnohdy zásek a složité dohledávání, jak věci fungují. V té chvíli blahořečíte JSP, i když jen do té doby, než byste tam měli ručně zapojovat podobný ajaxový šavlostroj. Ideální řešení prostě neexistuje.
