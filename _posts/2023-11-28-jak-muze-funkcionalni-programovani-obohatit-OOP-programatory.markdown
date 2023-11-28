---
layout: post
title:  "Jak může funkcionální přístup obohatit OOP programátory"
date:   2023-11-28
categories: [software development]
disqusId: 263
image: "/assets/2023-11-28/202255.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2023-11-28/202255.png" /></div>

Na [jOpenSpace 2023](http://www.jopenspace.cz/) jsem se seznámil s Romanem Provazníkem.
(Určitě si pusťte jeho přednášku [Podcast DIY (téměř) zadarmo](https://www.youtube.com/watch?v=KJor3wfLoRM)).
Když jsem se dozvěděl, že ho pozvali kluci na [Google Developers Group Jihlava](https://gdg.community.dev/events/details/google-gdg-jihlava-presents-jak-muze-funkcionalni-pristup-obohatit-oop-programatory/), tak jsem tam s radostí vyrazil.
Mluvil o tom, jak může funkcionální přístup obohatit OOP programátory. 
Ne, nebojte, F# propagovat nebudu, ale jako Java programátor jsem si udělal pár poznámek. 

<div style="clear:both"></div>
<!--more-->


## Side Effect

Nesnáším _side effecty_ (s českým výrazem [vedlejší účinek](https://cs.wikipedia.org/wiki/Vedlej%C5%A1%C3%AD_%C3%BA%C4%8Dinek_(programov%C3%A1n%C3%AD)) jsem se nesžil).
Tady jsem si potvrdil své přesvědčení a navíc i inspiraci, jak kód lépe organizovat.

![](/assets/2023-11-28/IMG_6021.jpeg)

Ve funkcionálním světe tomu říkají _pure/inpure_. 
Nebo můžete znát [návrhový vzor CQRS (Command and Query Responsibility Segregation)](https://martinfowler.com/bliki/CQRS.html).
Prostě pojďme víc dbát na oddělení _read/write_ operací.

Naposledy jsem se nějakou chvíli zasekl na metodě `findPendingOperationsForUser`, která jen tak mimochodem někde v hloubi překvapivě označovala operace za expirované.


## Null

Osobně se snažím mít všechno _not-null_ a to, co je volitelné, jasně deklarovat jako `java.util.Optional`, aby API bylo předvídatelné a jasně rozlišitelné, co je povinné a co ne.


## Výjimky

Výjimky jsou pro výjimečné situace.
Nebudu tady házet špínu na kontrolované výjimky (_checked exception_).
Nabízím trochu smířlivější pohled z článku [Everything Bad in Java is Good for You](https://foojay.io/today/everything-bad-in-java-is-good-for-you/), kde tvrdí, že to není problém jazyka, ale API a že bychom je měli vyhazovat jen v případě, kdy je jasné, jak na ně zareagovat.

Nehledě na to, že [exception handling má negativní dopad na výkon](https://www.baeldung.com/java-exceptions-performance).

O tom, že rozbíjí _functional pipeline_ podrobně rozebírá třeba i Venkat v knize [Functional Programming in Java](https://pragprog.com/titles/vsjava2e/functional-programming-in-java-second-edition).
Jak vhodně chyby propagovat můžeme vidět například na API `reactor.core.publisher.Mono#error()`.
Už jsem se o tom někde zmiňoval a přiznám se znovu:
Na jednom projektu jsme to před lety přehnali s tím, že se velká část byznys logiky řídila výjimkami.
Dneska bych se už hodně inspiroval Reactorem. 


## Immutabilita

Rád bych v DTO objektech nově používal Java Records místo `lombok.Data`.
Kromě immutability bychom měli dostat i nějaký drobný výkonností bonus (ne na výplatě, ale v JVM), viz [Java Records are "Trusted" and Consequently Faster](https://minborgsjavapot.blogspot.com/2023/09/java-records-are-trusted-and.html).


## Závěr

Konvertita funkcionální programování se ze mě nestane.
Ovšem principy jsou přenositelné.
Nevím, třeba tady na blogu budete později číst moje nářky, jak jsem si s Java Records naběhl v knihovnách a frameworcích jako třeba Jackson nebo Hibernate.
Myslím, že bych mohl víc studovat [Project Reactor](https://projectreactor.io/) případně si konečně najít čas na kurz [Functional Programming Principles in Scala (Martin Odersky)](https://www.coursera.org/learn/scala-functional-programming) (ne kvůli Scale, ale kvůli těm principům).


## Související

- [Nechápu, proč je Scala tak populární](/software%20development/2014/08/04/nechapu-proc-je-scala-tak-popularni.html)
- [Proč stojí objektové programování za starou belu](/software%20development/2017/06/26/proc-objektove-programovani-stoji-za-starou-belu.html)
