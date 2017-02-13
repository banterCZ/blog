---
layout: post
title:  "Rozlišujte prostředí"
date:   2012-06-03
categories: [software development]
disqusId: 100
---
Tentokrát jeden tip z řady triviálních, nicméně ďábel je skrytý v detailech. Najděte deset rozdílů.
<a href="/assets/2012-06-03/20120603-environment_production.png"><img src="/assets/2012-06-03/20120603-environment_production.png" 
style="width:50%"/></a><a href="/assets/2012-06-03/20120603-environment_localhost.png"><img 
src="/assets/2012-06-03/20120603-environment_localhost.png" 
style="width:50%"></a>

Tak dobře, rozdíl je pouze jeden. Přesto nestalo se vám někdy, že stále refrešujete stránku, už jste restartovali i server, ale změna v kódu ne a ne se projevit? Kolik času přijde vniveč, než si uvědomíte (případně než vám kolega řekne), že zíráte na produkční prostření místo na localhost?
<!--more-->

Řešení
------

Situace je komplikovanější, pokud jste uvědomělí a máte prostředí několik (vývojové, test, předprodukční a samotné produkční). Řešení je vskutku snadné, stačí jen chtít. Každé prostředí (kromě produkčního) vizuálně rozlište. Nemyslím pouze v patičce, ale hlavně něčím, co vás doslova trkne.

<a href="/assets/2012-06-03/20120603-environment_production.png"><img src="/assets/2012-06-03/20120603-environment_production.png" 
style="width:50%"/></a><a href="/assets/2012-06-03/20120603-environment_localhost_highlighted.png"><img 
src="/assets/2012-06-03/20120603-environment_localhost_highlighted.png" 
style="width:50%"></a>

Podobný přístup se mi osvědčil i v případě, kdy máte víc windows serverů, na které se připojujete přes remote desktop. Když máte otevřených spojení několik, lehce se zamotáte. Analogicky změňte barvu pozadí plochy.

Anketa
------

<script type="text/javascript" charset="utf-8" src="http://static.polldaddy.com/p/6283118.js"></script>
<noscript><a href="http://polldaddy.com/poll/6283118/">Rozlišujete prostředí?</a></noscript>

Výsledky předchozí ankety
------

V předchozí anketě ke dni zveřejnění tohoto příspěvku odpovědělo 86 respondentů. Pouze 46,5&nbsp;% <a href="/item/99">nedrátuje properties do warka</a>.