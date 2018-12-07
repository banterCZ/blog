---
layout: post
title:  "Pověstný člověkoměsíc"
date:   2012-07-24
categories: [software development]
disqusId: 105
tags: [kniha]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://www.amazon.com/gp/product/0201835959/ref=as_li_qf_sp_asin_il?ie=UTF8&camp=1789&creative=9325&creativeASIN=0201835959&linkCode=as2&tag=blog0752-20"><img border="0" src="https://ws.assoc-amazon.com/widgets/q?_encoding=UTF8&ASIN=0201835959&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=blog0752-20" ></a><img src="https://www.assoc-amazon.com/e/ir?t=blog0752-20&l=as2&o=1&a=0201835959" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></div>
Jeff Atwood, autor [stackoverflow.com](http://stackoverflow.com/), v jednom svém příspěvku na blogu napsal, že 
[vše co nyní umíte, bude za pět let zastaralé](http://www.codinghorror.com/blog/2006/03/everything-you-know-will-be-obsolete-in-five-years.html). Na příběhu 
Alenky v říši divů ilustruje, že když se učíte nové technologie, tak sice běžíte jak jen nejrychleji dovedete, ovšem pouze proto abyste 
zůstali na místě. Pokud se někam chcete posunout, musíte číst i něco, co nezastará, něco o lidském faktoru a designu. Na jeho [seznamu 
doporučené četby](http://www.codinghorror.com/blog/2004/02/recommended-reading-for-developers.html) hned na druhém místě figuruje kniha esejů 
[The Mythical Man-Month (Frederick P. Brooks)](http://amzn.to/SRkOFh). Takřka čtyřicet let staré dílo je stále aktuální. Můžeme si povzdechnout, že i po tak dlouhé 
době se softwarové inženýrství (a nejen to) nepoučilo. Sám název se trefuje do člověkoměsíce, do nebezpečné a zavádějící jednotky práce.
<!--more-->

Člověkoměsíc
------

Člověkoměsíc jako jednotka práce je nebezpečný a zavádějící především proto, že naznačuje, že lidé a měsíce jsou jednotky navzájem zaměnitelné. Ostatně [střílí si z toho i Dilbert](http://dilbert.com/strips/comic/2007-09-03/). Ovšem zaměnitelné jsou pouze za předpokladu minimální komunikace při mechanických pracích jako je 
sklizeň obilí nebo sběr bavlny, což se ani zdaleka nepodobá softwarovému inženýrství. Pracovníci na softwarovém projektu spolu potřebují komunikovat; tři kolegové třikrát více než dva, čtyři již vyžadují šestkrát tolik interakce než dva; podle vzorce n(n-1)/2. Nadto člověkoměsíce nijak nereflektují čas potřebný na zaškolení a zapracování nového programátora.

Tím se dostáváme k teorému zvanému Brooksův zákon, který říká, že přidáním lidské síly v pozdní fázi projektu paradoxně způsobíte to, že se projekt opozdí. Tak jako žena nosí dítě v lůně devět měsíců, tak nemůže devět žen donosit dítě za měsíc jediný.

Přesah, který v knize nenaleznete, jsou body (story pointy) - bezrozměrné jednotky, se kterými operují agilní metodiky jako je například Scrum.

Odhady
------

Programátoři jsou v podobné situaci jako kuchař, jemuž sice může majitel restaurace vnutit odhad, ale není již v jeho silách zvládnout samotné provedení. Omeleta, kterou vám slíbená do dvou minut zní skvěle, ale co když to nestihnou? Zákazník má dvě možnosti, počkat nebo ji sníst syrovou. Naši zákazníci jsou na tom stejně. Kuchař má ještě další možnost, zvýšit výkon sporáku - jednu stranu pak připálí a druhá zůstane syrová.

Opět vsuvka z agilních technik - odhady týmu je potřeba respektovat, product owner je neovlivňuje.

K odhadům snad ještě to, že okometricky zabere samotné kódování ⅙ času, design ⅓ a testy ½ (z toho ¼ jednotlivé komponenty a ¼ integrační testování). Navíc celkové náklady na údržbu činí typicky 40 procent nákladů na vývoj, někdy i více. A čím více uživatelů, tím více chyb najdou.

Krátce k termínům. Propásnete-li nějaký, vynasnažte se, ať ten příští splníte. Jinak to půjde s morálkou z kopce.

Management
------

Kvalita lidí a jejich organizace jsou pro úspěch projektu daleko důležitější než nástroje a technické postupy.

Přeřazení z technické pozice na odpovídající manažerskou pozici by nemělo doprovázet zvýšení platu a rozhodně by nemělo být prezentováno jako povýšení. Manažery je potřeba posílat na technické kurzy a senior technické pracovníky na kurzy manažerské. Ti, pokud talent dovolí, musí být připravování na to, aby technicky i emočně zvládli vést skupinu nebo měli potěšení z toho, že přiloží ruku k dílu programování.

Zajímavý postřeh se týká specifikace, před začátkem samotné implementace musí být přezkoumána její úplnost a srozumitelnost. Programátoři toho nejsou schopní. Pokud specifikaci nerozumí, vesele si najdou cestu skrze její mezery a nejasnosti.

Nebojte se neúspěchu
------

Je mnohem lepší být explicitní a mýlit se, než být vágní. První verze bývají sotva použitelné: příliš pomalé, příliš velké, obtížně použitelné, nebo všechno dohromady.