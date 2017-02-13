---
layout: post
title:  "Jak velký je váš war"
date:   2015-08-19
categories: [software development]
disqusId: 166
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://commons.wikimedia.org/wiki/File:Nuvola_mimetypes_java_jar.png"><img src="https://upload.wikimedia.org/wikipedia/commons/8/8f/Nuvola_mimetypes_java_jar.png" /></a></div>Někdy mi přijde, že programátoři postrádají elementární znalosti, případně zdravý selský rozum. Dneska snad nikdo nepřibaluje do <em>waru</em> Servlet API, nebo alespoň čtenáři tohoto blogu ne. Nicméně i tak na vás může vybafnou <em>war</em> o velikosti 80&nbsp;MB. Na locale si toho možná ani nevšimnete, i když ani virtuální mašiny nemají nekonečné disky. Ovšem dostat takový build k zákazníkovi do Afriky, kde je dokonce problém po tamější síti stáhnout e-mail, vás zbytečně obírá o čas. Takže proč je <em>war</em> vůbec tak velký a co s tím dělat?
<!--more-->

Nejprve jsme tedy zkontrolovali triviality jako Servlet API a co teď? Co tam třeba dělá Hibernate, když vyvíjíte pro aplikační server (například JBoss)? Klidně si ho dejte do <em>test scope</em>, ale proč ho přibalujete? Tímto způsobem můžete projít celou Java EE specifikaci. 

Zbytečnosti
-------

Pak bych si prošel zbytek knihoven a zamyslel se, proč je vůbec potřebuji. Koukám třeba na vaadin závislosti a vidím <a href="http://mvnrepository.com/artifact/com.vaadin/vaadin-client/7.5.1">vaadin-client-7.x.x.jar</a>, zhruba 16MB, a sakra. Mrknu do dokumentace: „<a href="https://vaadin.com/book/vaadin7/-/page/getting-started.libraries.html">Neměli byste nasazovat.</a>“.

JBoss/Wildfly
-------

JBoss má <a href="https://docs.jboss.org/author/display/WFLY8/Implicit+module+dependencies+for+deployments">kopec implicitních modulů</a>, které sám zapíná podle určitých podmínek. Například <a href="http://resteasy.jboss.org/">Resteasy</a>, pokud objeví JAX-RS anotace.

Pak tu jsou často používané knihovny jako <em>httpclient</em>, který má skoro megabyte a v JBossu stejně je. Ten je ale potřeba <a href="https://docs.jboss.org/author/display/WFLY8/Class+Loading+in+WildFly">ručně zapnout</a>. Buď globálně ve <em>standalone.xml</em>, respektive v <em>domain.xml</em>. Nebo přímo z <em>waru</em></a>. A to v dependencies definovaných v manifestu (zajistí maven-war-plugin) nebo v <em>jboss-deployment-structure.xml</em>. Že se tak svazujete s JBossem? Ano, ale při případném přechodu (třeba na Tomcat) jen změníte <em>provided scope</em> na <em>compile</em>, ne? Námitku, že nechcete sledovat, jaká verze JBossu má jaké verze knihoven, neberu, jelikož jsou <a href="http://www.mastertheboss.com/jboss-frameworks/maven-tutorials/jboss-maven/using-wildfly-boms">dostupné BoM</a>.

Pokud budete skuteční psychopati ohledně velikosti <em>waru</em>, tak si můžete vytvořit moduly pro velké knihovny třetích stran, nahrát je k zákazníkovi jednou, a distribuovat minimalistický <em>war</em>, který bude obsahovat jen váš kód.

Bezpečnostní pojistky
-------

Tak jste si uklidili, gratuluji, ale ani code review nezaručí, že vám pořádek vydrží. Můžete si tam knihovny, kterých jste se už zbavili, opět neúmyslně zavést přes tranzitivní závislost. Pojistkou může být šikovně nastavený <a href="https://maven.apache.org/enforcer">enforcer plugin</a>. Jednak pro <a href="https://maven.apache.org/enforcer/enforcer-rules/bannedDependencies.html">zakázání určitých závislostí</a>, jednak i pro <a href="https://maven.apache.org/enforcer/enforcer-rules/requireFilesSize.html">kontrolu velikosti výsledného <em>waru</em></a>. U kontroly velikosti pozor, protože výchozí bindování pluginu je na fázi <em>validate</em>, kdy <em>war</em> ještě ani zdaleka není hotový. Konkrétně tuto exekuci tudíž musíte navázat na fázi <em>package</em>.

{% gist banterCZ/76232e9c0757de16c397 %}

Anketa
-------

A jak velký je váš war? Nebo je vám to šumák?

<script type="text/javascript" charset="utf-8" src="http://static.polldaddy.com/p/9032740.js"></script>
<noscript><a href="http://polldaddy.com/poll/9032740/">Jak velký je váš war?</a></noscript>