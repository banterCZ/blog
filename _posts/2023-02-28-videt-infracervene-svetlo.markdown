---
layout: post
title:  "Vidět infračervené světlo"
date:   2023-02-28
categories: [software development]
disqusId: 256
image: "/assets/2023-02-28/321282.png"
tags: [kroužek programování, Meet Edison, Arduino]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2023-02-28/321282.png" /></div>

Mezi první úlohy, které zkoušíme s roboty [Meet Edison](/tag/meet-edison), patří program „vyhýbej se překážkám“
a řízení dálkovým ovladačem (třeba od televize).
To je příležitost vysvětlit si, jak to funguje pod pokličkou, a probrat tak infračervené světlo.

<div style="clear:both"></div>
<!--more-->

## Úvod

Z didaktického hlediska záleží na vás, co chcete všechno s dětmi probrat.
Neosvědčila se mi frontální přednáška.
Spíš sonduju, co vědí (rády se pochlubí) a následně to vhodně to rozvinu.

Když se řekne světlo, často máme na mysli viditelnou část elektromagnetického záření.
[Spektrum](https://cs.wikipedia.org/wiki/Elektromagnetick%C3%A9_spektrum) je však mnohem širší.

Nejblíže viditelnému světlu je nám neviditelné [ultrafialové záření](https://cs.wikipedia.org/wiki/Ultrafialov%C3%A9_z%C3%A1%C5%99en%C3%AD), kterému se víc věnovat nebudeme.
Z mnoha využití jmenujme například dezinfekci nebo kontrolu bankovek.

Na opačné straně viditelného světla najdeme [infračervené světlo](https://cs.wikipedia.org/wiki/Infra%C4%8Derven%C3%A9_z%C3%A1%C5%99en%C3%AD). 
Toho se prakticky využívá v [přístroji pro noční vidění](https://cs.wikipedia.org/wiki/Noktovizor)
(neodolám a musím zmínit článek o [uniformách americké armády](https://www.hyperstealth.com/camo-improvement/index.html), který popisuje, že maskování musí fungovat ve dne i v noci).
Dále se infračerveného světla využívá pro vyhledávání ohnisek požárů pomocí [termovize](https://cs.wikipedia.org/wiki/Termografie).
Povídání je vhodné doplnit obrazovým materiálem.
Je to divácky velmi atraktivní.

Pro potřeby kroužku programování nás nejvíc zajímá dálkové ovládání a detekce překážek.
Dálkové ovládání pomocí infračerveného světla pošle nějaké číslo, na které je namapovaná v přístroji určitá akce.
Až při přípravě tohoto příspěvku jsem si ze školy vzpomněl, že abyste signál odlišili od všudypřítomného infračerveného světla, tak ho musíte [modulovat](https://cs.wikipedia.org/wiki/Modulace) (to je informace spíš pro zvídavé lektory než pro děti). 
Pro vyhýbání překážek se využívá toho, že infračervené světlo se odráží, takže robot něco vyzáří a měří, co se mu vrátí. 

Pro názorné ukázky a ladění problémů se nám zrovna nehodí, že infračervené světlo není vidět.
Bohužel si ho ani nevyfotíme, jelikož fotoaparáty mají předřazený filtr, který infračervené světlo tlumí, protože čipy jsou na něj velmi citlivé.
Existuje [obor, který se soustředí na focení infračerveného světla](https://cs.wikipedia.org/wiki/Infra%C4%8Derven%C3%A1_fotografie).
Výsledné snímky vypadají například takto.

<a data-flickr-embed="true" data-header="true" data-footer="true" href="https://www.flickr.com/photos/nebulant/15344514603/in/photolist-pnWDAB-9jocq2-4t8w5H-2m58Ytt-mgFyn-qhqkqU-gwnjs-n6sWJ-RY3Y28-2nirBYV-5KhyXr-48iU6d-8xbqxi-at3sJA-2jPKGFL-4rne4w-S6pEbE-6PVzK3-3NzK5Z-5vPjNC-6BjeL6-2kZCaYJ-66mjMJ-REpZ3p-cJvXJA-2ny3q2u-6ZWPkr-2iLEyXr-2jNHjTN-2obq6CW-SP7KL5-2nthmNi-N8CD2W-4tcTq5-2jP452p-Rct1A7-UuGy6W-9juxWJ-U59xcC-SUoQJS-RxsbgJ-VtTtyV-23xzPmJ-J47GYs-2gjcrCn-WMX4pK-2mFzssT-cPbSZ1-9hLWC5-2mUQ3T7" title="Infrared"><img src="https://live.staticflickr.com/7465/15344514603_7c3d61d2cb_c.jpg" width="800" height="532" alt="Infrared"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

Jak je tedy možné „vidět“ infračervené světlo?
Můžeme si sestavit jednoduché Arduino udělátko.


## Arduino

Martin Javorek napsal článek [Jak si vypsat hodnotu, kterou ví jen robot Edison (pokus o debugging)](http://jaknato.programovanihrou.cz/edison/radar/),
který trochu předžvýkám a zjednoduším.
Ještě jsem našel podrobný anglický článek [How to Set Up an IR Remote and Receiver on an Arduino](https://www.circuitbasics.com/arduino-ir-remote-receiver-tutorial/).

Přeskočím [úvod do Arduina, který můžete najít jinde](https://bastlirna.hwkitchen.cz/zaciname-s-arduinem/).

Kromě Arduina budeme potřebovat doinstalovat knihovnu [IRremote](https://github.com/Arduino-IRremote/Arduino-IRremote)
a doslova za pár korun pořídit čidlo, například VS 1838B.


### Schéma zapojení

![](/assets/2023-02-28/schema.png)
_autor Martin Javorek_


### Popis nožiček senzoru VS 1838B

![](/assets/2023-02-28/VS_1838B.jpg)
_autor Martin Javorek_


### Zdrojový kód

Procházel jsem mnoho tutoriálů a chvíli mi trvalo, než jsem zjistil, že nefungují, protože knihovna lehce změnila svoje API.
V dokumentaci je to sice popsané, ale tam jsem hned nekoukal.

Funkční řešení pro verzi IRremote 4.0.0

```c
#include <IRremote.hpp>

const int RECV_PIN = 13;
IRrecv irrecv(RECV_PIN);

void setup() {
    Serial.begin(9600);
    irrecv.enableIRIn();
}

void loop() {
    if (IrReceiver.decode()) {
        IrReceiver.printIRResultShort(&Serial);
        IrReceiver.printIRSendUsage(&Serial); 
        irrecv.resume();
    }
}
```

Záznam pro stisk tlačítka pak může vypadat například takto (pro každé tlačítko něco jiného):

`Protocol=NEC Address=0x1000 Command=0x15 Raw-Data=0xEA151000 32 bits LSB first
Send with: IrSender.sendNEC(0x1000, 0x15, <numberOfRepeats>);`

![](/assets/2023-02-28/ovladac.jpeg)

Budeme-li sledovat Edisona, který se vyhýbá překážkám, tak můžeme číst něco podobného:

```
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=UNKNOWN Hash=0x0 2 bits (incl. gap and start) received
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11750us
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11750us
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=24200us
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11750us
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11750us
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=24300us
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11800us
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11800us
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11750us
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=RC5 Address=0x0 Command=0x40 Repeat gap=11750us
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
Protocol=UNKNOWN Hash=0x0 1 bits (incl. gap and start) received
```


## Meet Edison

Roboti Meet Edison si mezi sebou můžou posílat a přijímat signály pomocí infračerveného světla.
Na tom jsem postavil [úlohu železniční přejezd](/software%20development/2018/08/20/uloha-zeleznicni-prejezd.html).

Martin Javorek v článku [Jak si vypsat hodnotu, kterou ví jen robot Edison (pokus o debugging)](http://jaknato.programovanihrou.cz/edison/radar/)
empiricky namapoval signály na čísla.
Meet Edison protokol je popsaný v [Edison Infrared Communication Protocol](https://meetedison.com/content/support/Edison_Infrared_Communication_Protocol.pdf).
Knihovna IRremote tento protokol (zatím, pokud nikdo nedopíšete) nepodporuje.


## Závěr

Ukázali jsme si, co to je infračervené světlo a k čemu se prakticky používá.
Vyzkoušeli jsme si způsob, jak můžeme infračervené světlo vidět a sledovat, co se v éteru děje.
Pokročilé diagnostice robotů Meet Edison se budu možná věnovat někdy později.
Chtěl jsem si především připravit udělátko na demonstraci dálkového ovladače.


## Související

- [Jak si vypsat hodnotu, kterou ví jen robot Edison (pokus o debugging)](http://jaknato.programovanihrou.cz/edison/radar/)
- [Arduino-IRremote](https://github.com/Arduino-IRremote/Arduino-IRremote#receiving-ir-codes)
- [How to Set Up an IR Remote and Receiver on an Arduino](https://www.circuitbasics.com/arduino-ir-remote-receiver-tutorial/)
