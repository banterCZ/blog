---
layout: post
title:  "Zastav Lego Pybricks na čáře"
date:   2026-01-24
categories: [software development]
disqusId: 284
image: "/assets/2026-01-24/pybricks-logo.png"
tags: [kroužek programování, lego]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2026-01-24/pybricks-logo.png" /></div>

Stejně jako minulý rok se i letos zúčastníme soutěže [FIRST Lego League Challenge](/software%20development/2025/03/23/first-lego-league-challenge.html).
Tentokrát už jsme si vyzkoušeli [Pybricks](https://pybricks.com/).
Nečekejte ode mě shrnutí nebo nějakou recenzi, ale děti se mě zeptaly na jednu úlohu, kterou jsem v tom mumraji neodbavil okamžitou radou na místě.
Takže si plním za domácí úkol.
Jak zastavit Lego robota na černé čáře pomocí Pybricks?

<div style="clear:both"></div>
<!--more-->

![](/assets/2026-01-24/IMG_9414.jpeg){:.center}


## Pybricks

Již loni se nám Pybricks dostal do hledáčku, že bychom tím nahradili prostředí [Lego Spike](https://spike.legoeducation.com/).
Má nějaké zajímavé API jako například udržení rovného směru pomocí gyroskopu.
Varianta s Python kódem je zdarma, ale tím děti zatím trápit nechci.
Umožňuje používat i grafické bloky, na které jsou zvyklé, bohužel mi [licence nepřijde zrovna levná](https://pybricks.onfastspring.com/).
I když použijete bloky, projekt si vyexportujete do Pythonu, což může v učení pomoci.


## Zastavení

Úloha „zastav se na čáře“ je velmi praktická.
Ostatně na herní plánu je několik čar, které můžete (ale nemusíte) k orientaci využít.
Lego má barevný senzor a k němu existuje [Pybricks API](https://docs.pybricks.com/en/latest/pupdevices/colorsensor.html).

Neuvědomil jsem si, že přesnost měření barvy bude záviset na okolním osvětlení a při použití hodnoty odrazivosti nebude černá nikdy nula (přece jen něco odrazí).
Chvilku jsem debugoval, jaké hodnoty naměřím na různých površích.
Nakonec jsem pro sebe použil hodnotu 20 (20 % odrazivosti).

![](/assets/2026-01-24/pybricks_debug.png){:.center}

A pak už se k výslednému programu dostaneme poměrně přímočaře.
V blocích to může vypadat takto.

![](/assets/2026-01-24/pybricks_program.png){:.center}

V Pythonu takto.

{% gist banterCZ/c17931e17c3f1b34120e89869bf5e5bc %}

Všimněte si, že bloku pohybu lze v `then` nastavit, co dělat na konci bloku, což ovlivní, jak (ne)plynule pojede.
Stejně tak na konci nastavuji [způsob zastavení](https://docs.pybricks.com/en/latest/parameters/stop.html#Stop).


## Závěr

Pybricks nabízí pokročilejší funkce oproti Lego Spike prostředí.
Varianta psaní v Pythonu je zdarma, za grafické bloky si připlatíte.
Spouštění programů ve fyzickém světě dokáže vždycky něčím překvapit, třeba zjištěním, že i černá barva odrazí nějaké světlo.


## Související

- [FIRST Lego League Challenge](/software%20development/2025/03/23/first-lego-league-challenge.html)
