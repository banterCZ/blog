---
layout: post
title:  "Hromadný apt-get install"
date:   2013-12-02
categories: [software development]
disqusId: 144
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://openclipart
.org/detail/171762/terminal-by-lpr577-171762"><img src="https://openclipart.org/image/150px/svg_to_png/171762/1345126450.png" /></a></div>I s tím málo, co s <b>Linuxem</b> umím, si připadám efektivnější než s Windows. Pominu-li drobnosti jako to, že ve Windows scrollujete jen tam, kde je focus, tak nejdůležitější pro programátora je pochopitelně příkazová řádka. Bez Unixové si připadám, jako kdybych měl zlámané obě nohy. Dobře, existuje <a href="http://en.wikipedia.org/wiki/Cygwin">Cygwin</a>, ale to jsou jen berle, s těmi těžko budete skákat přes kaluže.

<div style="clear: both"></div>
S přibývajícími roky se obrušují hrany mých nekompromisních názorů: mám pochopení pro to, že je snazší spravovat síť s tisíci počítači, pokud máte jediný systém. Dal jsem Windows měsíc šanci a pak instaloval <b>Ubuntu</b> do virtuálu. Pokaždé doinstalovávám ty samé aplikace, tak jsem si poznačil skript. Třeba se vám bude taky hodit.
<!--more-->

{% gist banterCZ/7745912 %}

Správa souborů
------

<div style="float: right; margin: 0 0 1em 1em; text-align: center;"><a href="http://en.wikipedia.org/wiki/File:Midnight-commander.png"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Midnight-commander.png/221px-Midnight-commander.png" /></a><br />zdroj: <a href="http://en.wikipedia.org/wiki/File:Midnight-commander.png">wikipedia.org</a></div>
To, že mám rád příkazovou řádku, ještě neznamená, že jsem masochista a že soubory kopíruji jen pomocí <em>cp</em>. Pochopitelně používám <em>mc</em> - <a href="http://en.wikipedia.org/wiki/Midnight_Commander">Midnight Commander</a>. Pokud v příkazové řádce potřebujete vypsat adresářovou strukturu, tak kromě <em>ls</em> zkuste <a href="http://en.wikipedia.org/wiki/Tree_(Unix)">tree</a>.

Grafika
------

<a href="http://en.wikipedia.org/wiki/GNU_Image_Manipulation_Program">Gimp</a> - Photoshop pro chudé; na jednoduché úpravy à&nbsp;la malování je tu <a href="http://en.wikipedia.org/wiki/Xpaint">xpaint</a>.

Programování
------

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://www.amazon.com/gp/product/1934356980/ref=as_li_qf_sp_asin_il?ie=UTF8&camp=1789&creative=9325&creativeASIN=1934356980&linkCode=as2&tag=blog0752-20"><img border="0" src="https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1934356980&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=blog0752-20" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=blog0752-20&l=as2&o=1&a=1934356980" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></div>Základ jsou verzovací systémy. Obvykle si vystačím s svn, git a mercurial.

Jsi ostrý jen tak, jak je ostrý tvůj nůž. Jsi ostrý programátor jen tak, jak umíš <em>vim</em>. V tom již dlouhá léta vidím svou mezeru (jasně, vypnout ho umím). Zkouším vim s grafickým rozhraním; když se ztratíte, můžete použít myš. Instalujete balíček <em>vim-gnome</em>, spouštíte <em>gvim</em>. Za domácí úkol jsem si uložil přečíst knihu <a href="http://amzn.to/1dI7qBB">Practical Vim (The Pragmatic Programmers)</a>.

Dřív jsem ještě instaloval balíček <em>groovy</em>, ale přešel jsem na <a href="http://gvmtool.net/">GVM</a> - Groovy enVironment Manager pro Groovy a další nástroje na něm založené jako jsou Grails, Gradle a další. Umožňuje mít nainstalovaných více verzí najednou.

Systém
------

<a href="http://en.wikipedia.org/wiki/Ubuntu_Software_Center">Ubuntu Software Center</a> je <a href="http://cs.wikipedia.org/wiki/Osina">osina</a> v zadku. Není nad starý dobrý <a href="http://en.wikipedia.org/wiki/Synaptic_(software)">synaptic</a>. Ke konverzi balíčků z <em>*.rpm</em> do <em>*.deb</em> slouží <a href="http://en.wikipedia.org/wiki/Alien_(software)">alien</a>. 

Chcete mít příkazovou řádku vždy po ruce tak, jako ve hře Quake? Sáhněte po <a href="http://en.wikipedia.org/wiki/Guake">guake</a>. Interaktivní <em>top</em>, to je <a href="http://en.wikipedia.org/wiki/Htop">htop</a>. Na (nejen) http requesty je <a href="http://en.wikipedia.org/wiki/Curl">curl</a>.

Z operačních systémů nejvíce preferuji Mac OS, ze kterého ostatně Ubuntu poslední dobou nemálo opisuje (ačkoliv, když dva dělají totéž…). V podstatě opsali i <a href="http://en.wikipedia.org/wiki/Gnome-do">gnome-do</a>, což je ALT&nbsp;+&nbsp;F2 na steroidech.

V neposlední řadě potřebujete správce schránky <a href="http://en.wikipedia.org/wiki/Glipper">glipper</a>.

Co za programy si hned po instalaci Linuxu přidáváte vy?