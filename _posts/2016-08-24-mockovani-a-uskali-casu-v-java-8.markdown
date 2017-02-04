---
layout: post
title:  "Mockování a úskalí času v Javě 8"
date:   2016-08-24
categories: [software development]
item: 179
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://openclipart.org/detail/234997/push-back-time"><img src="https://openclipart.org/image/200px/svg_to_png/234997/push_back_time.png" /></a></div>Adaptace nových verzí Javy jde pomalu. Dodnes vídám, že programátoři neumí či nechtějí používat <a href="http://docs.oracle.com/javase/7/docs/technotes/guides/language/catch-multiple.html">multi catch</a>, <a href="https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html">try-with-resources</a> a <a href="http://docs.oracle.com/javase/7/docs/technotes/guides/language/type-inference-generic-instance-creation.html">diamond operátor</a>. Jak chtít složitější posun, který přináší Java 8?

Ovšem sám nejsem bez viny. Java 8 už je tu víc jak dva roky. Při jejím uvedení jsem psal, jak obstojí v <a href="/item/152">Akumulátor testu</a>, ale na projektech ji naplno nevyužíváme. Rozhodl jsem se to napravit tím, že začnu používat <em>java.time.*</em> místo <em>java.util.Date</em>. Jednak kvůli API a taky proto, že jsou nové třídy immutable. Chtěl bych se podělit o to, jak jsem se při tom nachytal.
<!--more-->

java.timex
------

V příkladech testování a mockování času je uvedená třída <a href="http://docs.oracle.com/javase/8/docs/api/java/time/Instant.html">Instant</a>, ale potřeboval jsem převod do <a href="http://docs.oracle.com/javase/8/docs/api/java/time/LocalTime.html">LocalTime</a>. Jakožto empirický programátor (to jest zkouším, co mi nadhodí kontextová nápověda) píšu:
    
    LocalTime.from(Instant.now())
    
Jenže ouha

    java.time.DateTimeException: Unable to obtain LocalTime from TemporalAccessor:
    2016-08-22T20:40:05.875Z of type java.time.Instant

Našel jsem <a href="http://stackoverflow.com/a/23656930/204950">vysvětlení na Stack Overflow</a>. Doporučuji k přečtení celé, ale přináším alespoň výtah.

> Autoři specifikace JSR-310 nechtěli, aby lidé převáděli mezi strojovým a lidským časem přes statické metody from() v typech jako ZoneId, ZoneOffset, OffsetDateTime, ZonedDateTime atd. Pokud byste pečlivě studovali javadoc, je to tam výslovně specifikované. Místo toho použijte:
>
> OffsetDateTime#toInstant():Instant  
> ZonedDateTime#toInstant():Instant  
> Instant#atOffset(ZoneOffset):OffsetDateTime  
> Instant#atZone(ZoneId):ZonedDateTime
>
> Problém se statickými metodami from() je v tom, že jinak jsou lidé schopní převádět mezi Instant a například LocalDateTime, aniž by 
přemýšleli o časové zóně.

>Všechny statické metody from() jsou až příliš veřejné. Podle mého názoru jsou příliš snadno přístupné a měly by být raději odstraněny z 
veřejného API nebo by měly používat specifičtější parametr než TemporalAccessor. Slabou stránkou těchto metod je to, že lidé můžou při konverzi zapomenout na související časovou zónu, protože začnou dotaz s lokálním typem. Zvažte například:
LocalDate.from(anInstant) (v jaké časové zóně???)


Testování
------

Nebudu vás víc napínat teorií. Zde je příklad, kdy konfigurace je interval v hodinách (od do), přičemž na serveru běží strojový čas. Součástí příkladu je i test v Groovy.
 
{% gist /banterCZ/9520fc927c51b8798367cf2c24832a10 %}
 
Bean Validation
------

Závěrem ještě jeden zásek, proč je přechod na java.time.* složitější, a tím je chybějící podpora v Bean Validation. Jistě, můžete si validátory napsat sami, ale v Hibernate nejsou. Issue <a href="https://hibernate.atlassian.net/browse/HHH-8844">HHH-8844</a> se sice vztahuje k <em>hibernate-core</em>, ale může vysvětlit i validátor. Prostě drží zpětnou kompatibilitu k Javě 6. Ovšem svítá naděje v podobě <a href=" http://beanvalidation.org/news/2016/07/15/bean-validation-2-0-is-coming/">Bean Validation 2.0</a>