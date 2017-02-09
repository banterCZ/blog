---
layout: post
title:  "Verzování a minifikace skriptů"
date:   2013-01-28
categories: [software development]
item: 118
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://commons.wikimedia.org/wiki/File:View-refresh.svg"><img src="http://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/View-refresh.svg/200px-View-refresh.svg.png" /></a></div>Už jste někdy opravili chybu tak, že jste odbyli testery nebo dokonce samotné uživatele se slovy „refrešni si browser“, „vymaž si cache“... ? To je výmluva na úrovni: můj domácí úkol mi sežral pes. Jistě, můžete přejmenovávat soubory nebo adresáře. Kdo by to ovšem dělal, že? Nehledě na možné zavlečení chyby. Ukáži vám způsob, jak verzovat JavaScripty a CSSka pomocí mavenu.
<!--more-->

U knihoven třetích stran, jako například jQuery, jména zachováme,. Tam je cachování žádoucí. Spolu s verzováním sloučíme více souborů do jednoho. Pro vývoj je sice kvůli lepší orientaci v kódu vhodné rozdělit logiku do několika souborů, ale v produkci nám to generuje zbytečné requesty na server. A v neposlední řadě byste mohli požadovat obfuskaci jakožto znesnadnění případného reversního inženýrství případně hackování.

Konfigurace
------

{% gist banterCZ/4658592 %}

Celý funkční <a href="https://github.com/banterCZ/minification">příklad na GitHubu</a>.

Závěr
------

Pevně věřím, že budu narážet na čím dál tím méně projektů, které zatím verzování skriptů neřeší. A jaký plugin používáte vy?

Anketa
------

<script type="text/javascript" charset="utf-8" src="http://static.polldaddy.com/p/6860671.js"></script>
<noscript><a href="http://polldaddy.com/poll/6860671/">Co vy a verzování skriptů</a></noscript>