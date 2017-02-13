---
layout: post
title:  "Stavebnictví versus softwarové inženýrství"
date:   2013-10-11
categories: [software development]
disqusId: 142
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://www.flickr.com/photos/bantercz/6017400352/in/set-72157627070334676"><img src="http://farm7.staticflickr.com/6026/6017400352_7b40388751_q.jpg" /></a></div>Máme <a href="http://en.wikipedia.org/wiki/Social_comparison_theory">tendenci neustále něco srovnávat</a>. I softwarové inženýrství srovnáváme. S <a href="/item/115">vojenstvím</a>, strojírenstvím nebo se stavebním inženýrstvím. Martin Fowler v článku <a href="http://www.martinfowler.com/articles/newMethodology.html">New Metodology</a>, který byste si měli rozhodně přečíst (i když je dlouhý), popisuje motivace a vznik agilních metodik a vyvozuje závěr, že pro softwarové inženýrství je takové srovnání zavádějící. Přeložil jsem několik vybraných odstavců a doplnil o svoje poznámky.
<!--more-->

Pamětihodnosti
------

<div style="float: right; margin: 0 0 1em 1em; text-align: center;"><a href="http://www.flickr.com/photos/josepha/8427411827/"><img style="" src="http://farm9.staticflickr.com/8371/8427411827_c5e950e3af_m.jpg" /></a><br/><a href="http://www.flickr.com/photos/josepha/8427411827/">Joseph (by-nc-sa 2.0)</a></div>Srovnání softwarového inženýrství a stavebnictví mi vrtá hlavou již dlouho. Lidstvo staví monumentální architektonická díla obřích rozměrů a odpovídajících rozpočtů jako například <a href="http://cs.wikipedia.org/wiki/Sagrada_Fam%C3%ADlia">Sagrada Família</a>. Po mnoho desetiletí na podobných stavbách dřou stovky dělníků. Po letech k těmto výtvorům zhlížíme, i kdyby to byly zříceniny. Srovnejte to s softwarovými projekty, které jste měli možnost vidět. Nemluvě o tom, že projekty jistě měly řádově nižší počet dělníků i samotný rozpočet. Nezřídka je to spíš hned od začátku <a href="http://cs.wikipedia.org/wiki/Slum">slum</a>, v lepším případě se z toho velmi brzy stane barabizna.

Shody a rozdíly
------

Mám za to (když <a href="/item/141">stavím dům</a>), že si můžu malé srovnání dovolit. Oproti softwarovému inženýrství má stavebnictví výhodu hmatatelné zpětné vazby. Ostatně, jak už psal <a href="https://twitter.com/jirifabian ">Jiří Fabián</a>, určité <a href="http://www.jirifabian.net/wordpress/?p=2167">agilní prvky mohou být shodné</a> - například iterace, malé dodávky oproti stavbě na klíč. V něčem se obory naopak diametrálně liší. Ve stavebnictví existuje profese rozpočtář. Spočítá vám, kolik bude stát kubík nosné zdi, jak práce tak materiál. Existují tabulky s údaji o pracnosti, díky čemuž víte, že směrná pracnost zdění <a href="http://www.wienerberger.cz/porotherm-425-t-profi.html">cihly POROTHERM 42,5 T Profi</a> je přibližně 0,93 hod/m<sup>2</sup> respektive 2,19 hod/m<sup>3</sup>. Zkuste říct, kolik bude stát login formulář. Když zákazníci šťourají do rozpočtu, přijde mi to, jako bych instalatéra podroboval křížovému výslechu, zda si je jistý, že svařováním skutečně stráví tolik a tolik času. Ne, jednoduše se s ním domluvím, že takovou investici si nemůžu dovolit, tak kde lze ušetřit.

Vybrané pasáže z článku
------

<blockquote>Obvyklou inspirací pro metodiky jsou inženýrské disciplíny jako strojírenství nebo stavebnictví. Tyto disciplíny zdůrazňují plánování předcházející samotné stavbě. Takoví inženýři budou pracovat se sérií výkresů, které přesně ukazují, co je potřeba postavit a jak věci zapadají do sebe. Mnoho designových rozhodnutí, jako například jak se vypořádat se zatížením mostu, je vyřešeno již ve fázi výkresů. Ty jsou předány různým skupinám, často z jiných firem, a předpokládá se, že podle nich budou stavět. V praxi se stavitelé setkají s nějakými problémy, ale ty jsou obvykle malé.</blockquote>

<blockquote>Návrh je obtížné předpovědět navíc vyžaduje drahé a tvůrčí lidi, naopak stavbu je snazší předpovědět. Jakmile máte návrh, můžete 
plánovat stavbu. Máte-li výkresy, lze se zabývat stavbou mnohem předvídatelnějším způsobem. Ve stavebnictví je samotná stavba větší jak náklady, tak časem, oproti návrhu a plánování.</blockquote>

<blockquote>Výkresy specifikují díly a to jak mají být dány dohromady. Rovněž slouží jako základ pro podrobný stavební plán, ze kterého můžou vzejít úkoly, které je potřeba udělat, a jaké mezi nimi existují závislosti. To umožňuje sestavit obstojný harmonogram a rozpočet. Také to podrobně říká, jak mají lidé na stavbě dělat svou práci. Stavba je méně intelektuálně náročná, zato je často náročnější na manuální zručnost.</blockquote>

<blockquote>Problém s návrhem v podobě UML atd. je to, že může dobře vypadat na papíře, ale až dojde na skutečnou implementaci, tak se mohou objevit vážné vady.</blockquote>

<blockquote>Dalším tématem je porovnání nákladů. Stavíte-li most, náklady na projektanty jsou kolem 10&nbsp;% celého rozpočtu, zbytek je samotná stavba. U softwaru je množství času stráveného kódováním mnohem a mnohem menší. McConnell navrhuje, že u velkých projektů je kódování a jednotkové testy pouze 15&nbsp;%. Téměř perfektně obrácený poměr ke stavbě mostu. I kdybyste považovali veškeré testování za stavbu, tak bude návrh stále 50&nbsp;% práce.</blockquote>

<blockquote>U softwaru je stavba tak levná, že lze téměř říct, že je zdarma. V softwaru je veškeré úsilí návrh, a ten vyžaduje tvůrčí a talentované lidi. Kreativní procesy nelze snadno plánovat, a proto může být předvídatelnost beznadějným cílem. V případě softwaru bychom se měli vyvarovat tradičním inženýrským metaforám. Jedná se o jiný druh aktivity, která potřebuje jiné procesy.</blockquote><blockquote>V každé problémovém projektu slyším refrén - vývojáři přijdou a říkají mi: „Potíž s tímto projektem je, že se požadavky stále mění.“ Na věci mě překvapuje, že to vůbec ještě někoho překvapuje. Při vývoji podnikového softwaru je pravidlem, že se požadavky mění. Otázkou je, co s tím uděláme.</blockquote><blockquote>Organizace jako NASA je klasickým příkladem, kdy softwarový vývoj může být předvídatelný. To vyžaduje spoustu času, procesů, velké týmy a stabilní požadavky. Jsou takové projekty jako raketoplány, ačkoliv si nemyslím, že by mnoho podnikového softwaru spadalo do této kategorie. Pro ně potřebujete jiný typ procesu.</blockquote><blockquote>Většina tvůrců metodik chce, aby jejich metodiky byly použitelné pro kohokoliv, takže nerozumí okrajovým podmínkám nebo je nepublikují. Což vede k tomu, že lidé používají metodiku za špatných okolností, jako například použití předvídatelné metodiky na nepředvídatelné situace.</blockquote><blockquote>Jednotlivci nejsou tak důležití, pouze role jsou. Pokud plánujete projekt tímto způsobem, tak nezáleží jakého dostanete analytika nebo testera, prostě víte, kolik jich potřebujete. To ovšem nastoluje otázku, zda jsou lidé zapojení do softwarového vývoj zaměnitelné součástky. Jedním z klíčových znakem agilních metodik je, že tento předpoklad odmítají.</blockquote><blockquote>Předvídatelné procesy vyžadují komponenty, které se chovají předvídatelně. Nicméně lidé nejsou předvídatelné komponenty. Lidé jsou nejdůležitějším faktorem softwarového vývoje.</blockquote><blockquote>Navzdory našemu nejlepšímu úsilí nejsme u softwaru schopni měřit tu nejjednodušší věc jako je produktivita.</blockquote>Ostatně na toto téma sepsal Martin Fowler samoastatný článek <a href="http://martinfowler.com/bliki/CannotMeasureProductivity.html">Cannot Measure Productivity</a>

<blockquote>Pokud měříte výkonnost, musíte brát v potaz všechny důležité činitele. Cokoliv bude chybět, povede k nevyhnutelnému důsledku, že dělníci zaměří své úsilí pouze k měřeným veličinám, i když to výrazně sníží jejich efektivitu práce. Tato dysfunkce měření je Achillovou patou managementu řízeného jen na základě měření.</blockquote>

Edit
------

Je chybou, že jsem nezmínil, že i softwarové inženýrství má své skvosty, ke kterým vzhlížíme. Patří mezi ně samozřejmě Stackoverflow. Denně vyřídí 148&nbsp;miliónu HTTP requestů, další podrobnosti v článku <a href="http://nickcraver.com/blog/2013/11/22/what-it-takes-to-run-stack-overflow/">What it takes to run Stack Overflow</a>