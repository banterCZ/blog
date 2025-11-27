---
layout: post
title:  "Ať žijí timeouty"
date:   2025-11-27
categories: [software development]
disqusId: 282
image: "/assets/2025-11-27/26203.png"
tags: [Java]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2025-11-27/26203.png" /></div>

Žil byl, nebo tedy právě spíš nebyl, jednou jeden timeout (ono jich vlastně nakonec chybělo dokonce víc).
Stalo se to už před nějakou dobou, tak snad je to částečně odžité.
Na testovacím prostředí všechno vyzkoušené a krásně funguje.
Z produkce jsou hlášené divné chyby, které postupně vedly až ke zhroucení komponenty.
Dlouho se mi nedařilo bug reprodukovat natož odhalit příčinu.
Nakonec jsme na to samozřejmě přišli, proto si zapisuju poučení.
Stejně jako v případě leteckých havárií, se sešlo víc věcí najednou.

<!--more-->
<div style="clear: both"></div>


## Expozice

Java backend provolával službu třetí strany přes REST API.
Daná servisní metoda běžela úmyslně v databázové transakci i s vědomím, že REST volání může trvání neúměrně prodloužit.
Nicméně konzistence dat byla v tomto případě naprosto klíčová.
Tak klíčová, že bylo dokonce nezbytné použít pesimistické zamykání databáze.


## Co by se asi tak mohlo pokazit

Tak já vám povím, co by se asi tak mohlo pokazit.

Upřímně, vůbec nemám rád aplikační servery, ale jednu věc jim nemůžu upřít.
Mívaly výchozí nastavení timeoutu databázové transakce.
[Spring má výchozí timeout -1](https://docs.spring.io/spring-framework/reference/6.2/data-access/transaction/declarative/txadvice-settings.html), tedy nekonečno.

[PostgreSQL nepodporuje lock na úrovni statementu a tudíž nefunguje Hibernate JPA hint](https://stackoverflow.com/a/76520564/204950) `spring.jpa.properties.jakarta.persistence.lock.timeout`.
Můžete to nastavit globálně pro celou databázi pomocí `ALTER DATABASE powerauth SET lock_timeout=10000;`, ale jednak to musíte vědět a jednak na to nesmíte zapomenout.

[Spring WebClient postavený na Reactoru nenastavuje response timeout](https://www.baeldung.com/spring-webflux-timeout), výchozí hodnota je nekonečno.


## Takže se to pokazilo

Nepřekvapivě tedy zásek na volání REST API vyžral celý db connection pool.
Když se něco může pokazit, tak se to zaručeně pokazí, a je naší zodpovědností to ošetřit.
Byla to tedy naše chyba, že jsme správně nastavili všechny timeouty.
To přišlo opravit.
Ale proč situace nastávala opakovaně?


## Co se vlastně pokazilo

Služba třetí strany běžela za [Azure Load Balancerem, který ukončoval idle TCP connection po čtyřech minutách](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-tcp-reset#configurable-tcp-idle-timeout).
K čemu tedy došlo na produkci jinému než při testu?

Provolá se REST API, naváže se nové TCP spojení, odbaví se request, a spojení se vrátí do poolu.
Má se znovu provolat REST API, vyzvedne se spojení z poolu, které nikdo víc jak čtyři minut nepoužil.
Spojení je vadné, ale pool se mylně domnívá, že je stále živé.
K naší smůle není nastavený timeout.
Tady se dostávám na tenký led síťování, kterému nerozumím.
Spojení pravděpodobně nevypadlo z poolu, protože nebyl zapnutý _TCP reset_, ale i kdyby byl, tak na něj stejně nemůžeme spoléhat.
Nabízí se ladit `keepAlive`, ale to nechávám zvídavému čtenáři k [nastudování](https://www.baeldung.com/spring-webflux-timeout),


## Závěr

Spring Boot není jediný a nebyl ani první, kdo razí přístup _convention over configuration_ a kdo přináší smysluplné výchozí hodnoty.
Tedy neměň, co nepotřebuješ.
Když není důvod něco specificky nastavovat, tak spoléhám na výchozí hodnoty.
Ale některé výchozí hodnoty jsou méně či více nebezpečné a je bezpodmínečně nutné vědět, co člověk dělá.


## Související

- [Baeldung - Set a Timeout in Spring WebClient](https://www.baeldung.com/spring-webflux-timeout)
- [Stack Overflow - How to set lock timeout in postgres - Hibernate](https://stackoverflow.com/a/76520564/204950)
- [javax.persistence.lock.timeout does not fully work with PostgreSQL](https://hibernate.atlassian.net/browse/HHH-16071)
- [Azure - Load Balancer TCP Reset and Idle Timeout](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-tcp-reset#configurable-tcp-idle-timeout)
