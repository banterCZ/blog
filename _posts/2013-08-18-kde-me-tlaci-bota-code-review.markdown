---
layout: post
title:  "Kde mě tlačí bota - code review"
date:   2013-08-18
categories: [software development]
disqusId: 139
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://openclipart.org/detail/29647/quality-control:-rejected-by-stijnbern"><img src="https://openclipart.org/image/120px/svg_to_png/29647/QualityControl_rejected2.png" /></a></div>Mám poměrně jasnou představu, jak by měla vypadat organizace softwarového projektu. Mimo jiné dokola <a href="/item/112">přesvědčuji, že je potřeba psát testy</a> a instaluju nástroje na statickou analýzu kódu. Už to mám nacvičené. Ovšem čím dál tím víc mi chybí code review. Ještě jsem toto téma zatím uspokojivě neuchopil, ale minimálně jsem se zamyslel, jak bych z toho chtěl vybřednout, ačkoliv jsem tak ještě neučinil.
<!--more-->

Autoři knih mají korektory, účetní zase auditory, jen programátoři si myslí, že jsou bohové. Code review by mělo zachytit chyby (i když nemůžete čekat, že se podaří najít všechny). Dále kontroluje, že nový člen týmu chápe správně architekturu, používá správné komponenty, dodržuje konvence... V neposlední řadě se programátoři navzájem učí a to nejenom o samotném software, který píší, ale i o programování jako takovém.

Sáhl jsem po knize <a href="http://www2.smartbear.com/Best-Kept-Secrets-Code-Review.html">Best Kept Secrets of Peer Code Review</a> - zdarma poskytla firma <a href="http://smartbear.com/">SmartBear</a>, která stojí mimo jiné za <a href="http://en.wikipedia.org/wiki/SoapUI">SoapUI</a>. Nejspíš to berou jako podporu prodeje jejich nástroje na code review <a href="http://smartbear.com/products/software-development/code-review">Collaborator</a>.

Druhy code review
------

Podle nich lze rozdělit code review na několik typů:

* formální kontrola
* přes rameno
* e-mail
* s podporou nástrojů
* párové programování

Doposud jsem dělal review přes rameno, ad hoc, a cítil, že tomu něco chybí. Chybí tomu metriky a reporty, nelze ho procesně vynutit, můžete při něm přehlédnout změnu a v neposlední řadě se neověřuje oprava. S code review přes e-mail se nejspíš setkáte v open-source projektech. Největší nevýhodou je, že zabere třeba 5&nbsp;dní místo 30&nbsp;minut. Za code review lze považovat i párové programování. Dochází při něm k důkladné kontrole, ale chybí odstup, protože se oba na řešení podíleli. Zato formální kontrola vyžaduje svolat mítink, nicméně ostatní typy zvládnou odhalit stejné množství chyb za méně času. Oproti tomu code review s podporou nástrojů zavádí automatické metriky, eviduje historii... a především je proces vynutitelný. Každé má svoje - ovšem lepší něco než nic.

Chyba je něco, co chce ten, kdo dělá review, změnit. Chyby jsou dobré, ne špatné; neříkají nic o úrovni programátora (spíš o komplexnosti úlohy). Metriky by se neměly používat k hodnocení odměn, nikdo je pak pochopitelně nebude hlásit. Code review přináší do programování emoce, konkrétně pozitivní stres a úzkost, zda jsem napsal dost javadocu či zda jsem nemohl připsat test. Takový ego efekt, který vás ihned učiní lepším programátorem.

Čísla
------

Ve zmiňované knize <a href="http://www2.smartbear.com/Best-Kept-Secrets-Code-Review.html">Best Kept Secrets of Peer Code Review</a> je uvedená případová studie z firmy Cisco a z ní několik zajímavých čísel: Code review je efektivní dělat nanejvýš hodinu, ale minimálně pět minut, i kdyby na jediný řádek. Za onu hodinu byste neměli kontrolovat víc jak 200&nbsp;řádek kódu. Vychází 32&nbsp;chyb na&nbsp;1000&nbsp;řádek. Měli byste mít kontrolní seznam, na co se při kontrole zaměřit (což mi připomíná, že si chci přečíst knihu <a href="http://amzn.to/18CCVqj">The Checklist Manifesto</a>).

Pro code review hovoří i to, že chyby při něm odhalené, je levnější opravit, než chyby, které se dostanou do QA či dokonce až k zákazníkovi. SmartBear má na webu pěknou <a href="http://support.smartbear.com/articles/codecollaborator/roi-calculator/">kalkulačku ROI</a> (<a href="http://en.wikipedia.org/wiki/Return_on_investment">Return of investment</a>).

Code review a SCM
------

<div style="margin: 2em 1em 1em 0em; text-align: center;">
	<a href="http://git-scm.com/book/en/Distributed-Git-Distributed-Workflows#Dictator-and-Lieutenants-Workflow"><img src="https://git-scm.com/figures/18333fig0503-tn.png"></a><br />
	<a href="http://git-scm.com/book/en/Distributed-Git-Distributed-Workflows#Dictator-and-Lieutenants-Workflow">Pro Git, Scott Chacon</a> <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/">(CC) BY-NC-SA 3.0</a>
</div>
Největší bolest je pro mne to, že code review přichází zpětně, když už je kód v repositáři a lidem se už nechce měnit. Bez code review nemůže být úloha označena za naprogramovanou a předána testerům. Na druhou stranu chcete, aby kód byl někde verzovaný, ne jen v něčím workspace. Jenže toho s SVN těžko dosáhnete. Tím se dostáváme k distribuovaným systémům, ve kterých <a href="http://git-scm.com/book/en/Distributed-Git-Distributed-Workflows#Dictator-and-Lieutenants-Workflow">potřebné workflow lze realizovat</a>. Pomůžou vám v tom nástroje jako třeba <a href="https://code.google.com/p/gerrit/">Gerrit</a> pro Git. Existuje obdoba pro Mercurial?

Jak děláte code review vy?