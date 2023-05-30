---
layout: post
title:  "Microbit lavinový vyhledávač"
date:   2023-05-30
categories: [software development]
disqusId: 258
image: "/assets/2023-05-30/272425.png"
tags: [kroužek programování, microbit]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2023-05-30/272425.png" /></div>

Na [kroužku programování](/tag/krou%C5%BEek-programov%C3%A1n%C3%AD) se snažím používat i hardwarové „hračky“.
Není to nezbytné, ale dle mého to dokáže hodiny zpestřit.
Zároveň však platí, že se vám pak může víc věcí pokazit.
Osobně se z toho nehroutím, beru to tak, že selhání lze i didakticky využít.
Z dnešního nepřeberného množství pomůcek (kromě ceny) preferuji takové, ke kterým existuje dostatek metodických materiálů a nebo aktivní komunita.
To microbit bohatě splňuje.
Vybírat můžete z mnoha úloh.
Na poslední hodinu jsem si z jejich stránek zvolil [Proximity Beacon](https://microbit.org/projects/make-it-code-it/proximity-beacon/)
(česky asi nejlépe rádiové měření vzdálenosti)
a celé prezentoval jako [lavinový vyhledávač](https://skitourguru.com/clanek/24-lavinovy-vyhledavac).

<div style="clear:both"></div>
<!--more-->


## Úvod

Normálně jsem spíš studený čumák a improvizace není moje parketa, ale děti jsou vděční diváci a člověk před nimi nemá takové zábrany.
S příběhem jde všechno líp.
Lavinový vyhledávač jsem sice nikdy v ruce neměl, ale tuším jak funguje, takže jsem princip dokázal popsat
a úlohu [Proximity Beacon](https://microbit.org/projects/make-it-code-it/proximity-beacon/) na zápletku napasovat. 
Řešení jsme stihli a chvíli hráli ve třídě na shovku.
Nicméně k lavinovému vyhledávači tomu ještě notný kousek chybí.
Vysílač a přijímač jsou totiž samostatné programy.

Aby přístroj fungoval jako lavinový vyhledávač, tak musí ve výchozím nastavení pracovat jako vysílač
a při pátrací akci si ho ti nezavalení dokážou přepnout na přijímač.
Takhle jsem to dětem zadal, ale vyřešit jsme nestihli, takže jsem si dodělal za domácí úkol.


## Řešení

Takto vypadá řešení naprogramované v blokovém schématu.

![](/assets/2023-05-30/code.png)

Lze testovat i na simulátoru

![](/assets/2023-05-30/simulator.png)

- [Stáhněte si HEX soubor](/assets/2023-05-30/microbit-lavinovy-vyhledavac.hex)
- [Otevřete v MakeCode](https://makecode.microbit.org/_AEp4su4cxdYK)

Všimněte si, že oproti řešení [Proximity Beacon](https://microbit.org/projects/make-it-code-it/proximity-beacon/) mapujeme signál na 25 hodnot místo 9
a získáváme tak větší přesnost měření.

Pozorujte, co se stane, budete-li hledat více než jednoho zavaleného.
Můžu vám prozradit, že to funguje.
Funkci označení „MARK“ (zaslepení nalezeného signálu) si nechám někdy na příště nebo na laskavé čtenáře.

Na operačním systému Windows pozoruji problém s nahráváním souborů na microbit jako na disk (USB Mass Storage).
Pravděpodobně kvůli antiviru.
Pomáhá [spárovat zařízení a připojit přes WebUSB](https://makecode.microbit.org/device/usb/webusb).
Pokud nahrání selže, na microbitu se vytvoří soubor `FAILED`, ale na samotném zařízení to není vidět na první pohled.
I proto je v lavinovém vyhledávači implementovaná blikající LEDka, indikující jednak funkčnost programu, jednak mód, ve kterém zrovna pracuje.


## Závěr

Ukázali jsme si, jak úlohu [Proximity Beacon](https://microbit.org/projects/make-it-code-it/proximity-beacon/) navléknout na povídání o lavinovém 
vyhledávači a jak řešení vylepšit, abyste dokázali jediný program přepínat mezi módem vysílač a módem přijímač.
Řešení lze dále rozvíjet například o funkci zaslepení nalezeného signálu.
Zatím jsme se vůbec nezabývali směrovou šipkou a omezili se pouze na měření vzdálenosti.


## Související

- [Hudba s Microbitem](/software%20development/2020/03/24/hudba-s-microbitem.html)
