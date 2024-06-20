---
layout: post
title:  "Zjednodušený funkční model Enigma"
date:   2024-06-19
categories: [software development]
disqusId: 269
image: "/assets/2024-06-19/Enigma-logo.jpg"
tags: [kroužek programování]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2024-06-19/Enigma-logo.jpg" /></div>

Na kroužku programování se věnujeme i [aktivitám bez počítače](/software%20development/2021/11/22/vyuka-programovani-bez-pocitacu.html).
Patří mezi ně i kryptografie a [Caesarova šifra](https://cs.wikipedia.org/wiki/Caesarova_%C5%A1ifra).
Její princip i vysvětlení jsou snadné.
Názorně na ní lze ukázat i prolomení šifer.
Zde je hlavní problém konkrétně v tom, že se stejné písmeno šifruje vždy stejně, tudíž je dnes triviální ji prolomit frekvenční analýzou či hrubou silou.
Co dalšího tedy představit zvídavým žákům, aby to bylo zajímavé jak po technické stránce, tak se silným příběhem?
Jednoznačně [Enigma](https://cs.wikipedia.org/wiki/Enigma).
Ale jak jim to předat?

<div style="clear:both"></div>
<!--more-->


## Úvod

Příběh přístroje Enigma je velmi působivý.
Z populárně naučných zdrojů můžu doporučit zejména [Knihu kódů a šifer (Simon Singh)](https://www.goodreads.com/review/show/712097358) nebo film [Kód Enigmy](https://www.csfd.cz/film/283747-kod-enigmy/prehled/).

To bychom měli příběh.
Ale jak zjednodušeně představit technickou stránku?
Dlouho jsem to v hlavě nosil jen jako nápad, až jsem jednou na internetu zakopl o [papírovou Enigmu](https://mckoss.com/posts/paper-enigma/).
Hned jsem zatoužil použít ji v hodině.
Funkčně provedení odpovídá skutečnosti, ale vzhledově je zároveň stále daleko.
Nemám ambice shánět věrný model, ale nešlo by to přeci jen o něco lépe?


## 3D Model

Kromě jiných hraček do kroužku programování jsem si pořídil i 3D tiskárnu.
Vítám tedy každé praktické využití, kterým si člověk nákup ospravedlní.
Takže jsem strávil nějaký čas hledáním modelů Enigmy a nakonec našel [3D model zdarma](https://cults3d.com/en/3d-model/game/machine-enigma-escapetechno)
i stránku s [podrobnějším vysvětlením](http://wiki.franklinheath.co.uk/index.php/Enigma/Paper_Enigma).

Hlásím, že tisk funguje.
Dokonce jsem to zvládl i na Průša MINI.
Jen bylo potřeba hlavní osu ve sliceru rozříznout a po vytištění slepit.
Povšimněte si, že pro přesnější spasování dílů jsem si tam připravil konektory.

![](/assets/2024-06-19/enigma-slicer.png){:.center}

Plastové díly polepíte papírovými součástmi, které jsem v rámci prodloužení trvanlivosti přelepil ještě průhlednou lepenkou.
Výsledek pak vypadá následovně.
Znalci si povšimnou, že kromě rotorů je možné (nikoliv nutné) pracovat i s nastavením kroužků (dokonce umí i _plugboard_, ale stejně mi pro názornost nepřišel tak zásadní).

<iframe src="https://witter.cz/@banterCZ/111750284813006724/embed" class="mastodon-embed center" style="max-width: 100%; border: 0" width="400" allowfullscreen="allowfullscreen"></iframe><script src="https://witter.cz/embed.js" async="async"></script>


## Jak to funguje

Jak Enigma pracuje a jak byla prolomená je jednak mimo rozsah tohoto příspěvku, jednak o tom bylo již spoustu napsáno.

Jako úvod do problematiky doporučuji názorné video [How did the Enigma Machine work?](https://www.youtube.com/watch?v=ybkkiGtJmkM).

<iframe width="560" height="315" class="center" src="https://www.youtube.com/embed/ybkkiGtJmkM?si=2omaFC6-skTxB0lB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Práce s modelem je velmi pracná a zdlouhavá.
Doporučuji si každý krok poznačovat na papír, včetně nastavení rotorů, kdybyste si je omylem rozházeli.
Každopádně pro rychlé ověřování a další pokusy jsem velmi ocenil [online simulátor](https://mckoss.com/enigma-simulator-js/).


## Závěr

3D model Enigmy je funkční.
Vysvětlení není snadné, ale přijde mi, že je pro žáky stravitelné.
(De)šifrování je pracné, zdlouhavé a náchylné na lidskou chybu.
Manuálně otáčíte rotory, což by ve skutečnosti měla na starosti ozubená kola.
(Včetně sledování, zda nedošlo k přenosu na další rotor; je možné a do začátku vhodné zvolit příklady, kde to není potřeba.)
Prstem nebo očima sledujete vodiče, to by jinak okamžitě zařídil elektrický proud v obvodu.
Přesto všechno jsem rád, že jsem zařadil do svého repertoáru.


## Související

- [Výuka programování bez počítačů](/software%20development/2021/11/22/vyuka-programovani-bez-pocitacu.html)
- [How did the Enigma Machine work?](https://www.youtube.com/watch?v=ybkkiGtJmkM)
- [Enigma Machine Simulator](https://mckoss.com/enigma-simulator-js/)
- [Kniha kódů a šifer (Simon Singh)](https://www.goodreads.com/review/show/712097358)
- [The Paper Enigma](https://mckoss.com/posts/paper-enigma/)
- [Kód Enigmy](https://www.csfd.cz/film/283747-kod-enigmy/prehled/)
- [3D model Enigma zdarma](https://cults3d.com/en/3d-model/game/machine-enigma-escapetechno)
- [Vysvětlení práce s 3D modelem](http://wiki.franklinheath.co.uk/index.php/Enigma/Paper_Enigma)
- [Enigma na Wikipedii](https://cs.wikipedia.org/wiki/Enigma)
