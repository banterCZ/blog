---
layout: post
title:  "Úskalí API"
date:   2021-04-28
categories: [software development]
disqusId: 237
image: "https://live.staticflickr.com/1829/28383345897_82344aff94_m.jpg"
---

<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><a href="https://www.flickr.com/photos/brickbroadcasting/28383345897/in/datetaken/"><img src="https://live.staticflickr.com/1829/28383345897_82344aff94_m.jpg" /></a><br /><a href="https://www.flickr.com/photos/brickbroadcasting/">Brick Broadcasting </a><br />(<a href="https://creativecommons.org/licenses/by-nc/2.0/">CC BY-NC 2.0</a>)</div>

Psal jsem o tom, [v čem se liší servisní firma od produktové](/software%20development/2019/10/22/servisni-versus-produktova-firma.html) a že [produktové firmy mají jistá úskalí](/software%20development/2020/05/30/uskali-produktove-firmy.html). Jedním z nich je [zpětná kompatibilita](/software%20development/2019/12/09/zpetna-kompatibilita.html). A mluvíme-li o zpětné kompatibilitě, jistě v tom bude hrát roli API.

Pravidelní čtenáři vědí, že jeden z důvodů, proč píšu tento blog, je čistě sobecký: Díky tomu si utřídím myšlenky. Je možné, že až se k nim za pár let vrátím, sám sobě se vysměju. Jindy mi to pomáhá dohledat si návod. A co si dnes myslím o API?

<div style="clear:both"></div>
<!--more-->

{% twitter https://twitter.com/ridercz/status/1378068637743992834 %}

## API versus SPI

Čtěte Tulacha, tam to všechno je! Pokud se necítíte na celou knihu [Practical API Design](https://www.goodreads.com/review/show/2870967061?book_show_action=false&from_review_page=1), mrkněte alespoň na jednotlivé články, například [APIvsSPI](http://wiki.apidesign.org/wiki/APIvsSPI). Termín API je možná příliš obecný a spoustu problémů, alespoň v našem případě, plyne z toho, že se dostatečně nerozlišuje (případně dokonce míchá) client API (či jen prostě API) a SPI (Service Provider API, provider API). Řekněme, že programujete nějaký systém, do kterého lze dopsat vlastní pluginy. Plugin může volat funkčnost systému přes API. Rozšíření, které bude volané systémem, předepisuje právě SPI (můžeme také nazvat _extension point_).

Tady by chtělo příklad a hned problémový. `java.util.List` je obvykle API, které chcete volat, ale pro implementátory třídy `ArrayList` to bylo SPI.

## Jak se z toho nezbláznit

Jako ideální stav se mi jeví mít oddělený repositář, nebo alespoň release cyklus samotného systému, API i SPI. Mám chuť říct, že nám to umožní vydávat verze zcela nezávisle, ovšem omezení rozsahu vzájemně kompatibilních verzí potřebujete hlídat v kouzelné tabulce zvané _compatibility matrix_.

## Poučení ze SOLID

K druhému z [návrhových principu SOLID](https://zdrojak.cz/clanky/navrhove-principy-solid/), tedy OCP (Open-Closed Principle) se stále propracovávám.

> Třídy by měly být otevřené pro rozšiřování, ale uzavřené pro změny.

V našem případě, kdy se produkt tvořil (a k dokončení bylo daleko), kladli všichni nějaké požadavky, které nebylo možné v dané čase uspokojit, takže systém nebyl vhodně uzavřený pro změny, nebylo jasně definované API ani SPI, proto kdekdo sahal na co se mu zlíbilo a dědil od tříd, které našel. Ostatně bez toho by nic nedodali. K tomu se vystavilo spoustu _protected_ metod, nikoliv však _final_, aby hrály roli API, nýbrž roli SPI (mohli si je překrýt).

Na zásadní změny (i vhledem ke zpětné kompatibilitě) nebylo ani pomyšlení. Začali jsme tedy uzavírat. _Protected_ metody jsme téměř přestali psát, zato jsme hojně sahali po modifikátoru _final_. Implementace jsme začali psát _package private_ (protože jinak je někdo mohl mylně považovat za SPI). Přidání argumentu do konstruktoru je binárně zpětně nekompatibilní změna, museli byste jich podporovat více současně, takže je nahrazujeme _buildery_.

Se servisní částí firmy se špičkujeme, oni nás mají za profesory. Ale kdo bude API roky udržovat, co?

Zavření pro změny bychom tedy měli, ale co teď s otevřeností pro rozšiřování? Chtěl bych ukázat dvě možnosti.

### Rozhraní k implementaci

V rámci SPI můžeme definovat rozhraní vhodné k implementaci, které systém volá s definovaným kontextem. Dependency injection posbírá všechny instance, nebo jen podle určitého klíče, záleží na vás. Spring třeba umí vyhledat beanu určité třídy a daného jména. Můžete implementace registrovat ve svém systému dynamicky jinak či pouze staticky, představivosti se meze nekladou, .

### Události

Volnějším kontraktem jsou události. Ne nadarmo je programovací jazyk Erlang (a nejen on) postavený na [zasílání zpráv (message passing)](https://en.wikipedia.org/wiki/Message_passing).

Přidržím se svého světa Spring frameworku a jeho `ApplicationEvent`. Je potřeba si uvědomit, zda je pro vás žádoucí, aby listener mohl výjimkou shodit byznys logiku v místě, kde je událost publikovaná (asi spíš ne). Dále zda chcete událost za každou cenu nebo až v případě, kdy úspěšně doběhla i logika po publikování, tedy po commitu. K tomu slouží `TransactionPhase.AFTER_COMMIT` přepínač u `@TransactionalEventListener`, kde zachytáváme interní události našeho systému a publikujeme události, které jsou součástí SPI a u kterých je garantované, že jsou publikované až po commitu. [Pozor, má to taky svoje mouchy](https://blog.pragmatists.com/spring-events-and-transactions-be-cautious-bdb64cb49a95).

V odkazovaném článku upozorňují na _Domain Driven Design_, že nemáme posílat jen `userId`, ale celého uživatele respektive stav v daném okamžiku, protože v případě konzumace události už to může být úplně jinak. Dodávám: Ať daný objekt není JPA entita, přece nemusíte opakovat stejnou chybu jako my.

## Java Interface

Přidání metody do java rozhraní je zpětně nekompatibilní změna. Java 8 zavedla výchozí implementace _default methods_ asi hlavně proto, aby vyřešili zpětnou kompatibilitu například u kolekcí. Nabízí se použít funkčnost i pro naše SPI (u API to problém není). Znovu Jaroslav Tulach, tentokrát [DefaultMethods](http://wiki.apidesign.org/wiki/DefaultMethods), kde proti tomu brojí. Vyřešíte tak binární kompatibilitu (ne vždy), s chováním je to horší. Uznává použití u listener adapterů.

Osobně jsem se možná příliš upínal k nafukování stávajících rozhraní. Hodí se zvážit, zda nemůžete založit nové rozhraní, což nevylučuje, že se nakonec nesejdou v jedné implementační třídě.

Nekompatibilní změnou je pochopitelně i odebrání metody či změna signatury. Stávající metody je potřeba zachovat a mít na paměti, že je stále někdo může volat. Nejprve je nutné označit za _deprecated_ a poskytnout návod, jak zmigrovat na nový kód.


## Závěr

Důsledně rozlišujte a oddělujte API a SPI. Včas uzavřete pro změny a najděte si vhodný způsob pro rozšiřování. Naučte se systematicky pracovat s označováním kódu za _depracated_. Za živelným vývojem se jen obtížně dělá tlustá čára.


## Související

- [Servisní versus produktová firma](/software%20development/2019/10/22/servisni-versus-produktova-firma.html)
- [Úskalí produktové firmy](/software%20development/2020/05/30/uskali-produktove-firmy.html)
- [Zpětná kompatibilita](/software%20development/2019/12/09/zpetna-kompatibilita.html)
- [JPA a asynchronní logování](/software%20development/2018/09/21/jpa-a-asynchronni-logovani.html)
- [Practical Advice to Good API Design](https://levelup.gitconnected.com/practical-advice-to-good-api-design-fa857fa569a1)
- [APIvsSPI](http://wiki.apidesign.org/wiki/APIvsSPI)
- [DefaultMethods](http://wiki.apidesign.org/wiki/DefaultMethods)
- [Spring events and transactions — be cautious!](https://blog.pragmatists.com/spring-events-and-transactions-be-cautious-bdb64cb49a95)
- [Modularita 1: Ekonomie](https://calavera.info/v3/blog/2017/02/26/modularita-1.html)
