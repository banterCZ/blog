---
layout: post
title:  "Podrobné logování rozhraní systémů"
date:   2022-11-29
categories: [software development]
disqusId: 253
image: "/assets/2022-11-29/333910.png"
tags: [logování, Spring]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2022-11-29/333910.png" /></div>

Integrace systémů je podle mé zkušenosti jedna z nejkomplikovanějších věcí ([kromě invalidace cache a pojmenování](https://martinfowler. com/bliki/TwoHardThings.html)).
Ne že by to byla raketová věda, ale existuje spoustu drobností, které se můžou rozsypat.
Pravděpodobnost, že se to stane, hraničí téměř s jistotou.
Jakmile věci vypustíte z rukou, těžko se ladí.
Stopujete pak pouze své logy.
Proto tímto apeluji, hlavně sám k sobě: „Loguj pořádně!“
Pojďme se podívat, jak ve Springu zapnout podrobnější výpis HTTP volání.

<div style="clear:both"></div>
<!--more-->


## Úvod

Švy, ve kterých jsou systémy napojené k sobě, jsou místa, kde to může drhnout víc než jinde.
Části se obvykle vyvíjejí samostatně a od první spasování snad ani nikdo nečeká, že by klaplo na první dobrou.
Ovšem je potřeba mít zpětnou vazbu, co a jak opravit.
Případně důkaz, že chyba není na vaší straně.
Nemusí se nutně jednat o systémy třetích stran.
Může to být jedna z mnoha vašich mikroslužeb.

Jako hlavní zásadu bych uvedl logovat okamžik před voláním jiného systému a pak výsledek.
Ať už neúspěch nebo chybu.
Samozřejmě dodat co největší kontext s přihlédnutím k [osobním údajům (PII)](https://cs.wikipedia.org/wiki/Osobn%C3%AD_%C3%BAdaj).
Pro první okamžiky integrace a testovací prostředí bychom měli mít možnost si zapnout podrobnější výpis bez ohledu na citlivost dat.


## Základní logování

Dejme tomu, že voláme službu, poskytující informace o uživateli.
Může vracet spoustu citlivých údajů jako datum narození, číslo sociálního pojištění a podobně.
Jako nutné, nikoliv postačující, minimum, vidím následující.

```console
2022-11-29 21:29:43.262  INFO --- [main] cz.zvestov.blog.UserConnector : Calling user detail for ID: 42
2022-11-29 21:29:43.345  INFO --- [main] cz.zvestov.blog.UserConnector : Got name='Joe Smith' for user ID: 42
```

A ano, píšu o takové trivialitě, protože se mi to podařilo opomenout.


## Spring

Pojďme si ukázat, jak lze nastavit podrobnější výpis HTTP volání ve _Spring_ frameworku.
Ten nám nabízí především dvě možnosti.
Jednak třídu `RestTemplate`, [která už od verze 5 není vyvíjena, pouze udržovaná](https://docs.spring. io/spring-framework/docs/current/javadoc-api/org/springframework/web/client/RestTemplate.html), 
jednak `WebClient` s podporou asynchronního zpracování.


### RestTemplate

Nastavme úroveň logování `org.springframework.web.client.RestTemplate` na `DEBUG`.

```console
2022-11-29 21:34:51.427  INFO --- [main] cz.zvestov.blog.UserConnector : Calling user detail for ID: 42
2022-11-29 21:34:51.447 DEBUG --- [main] o.s.web.client.RestTemplate   : HTTP GET http://localhost:8080/user/42
2022-11-29 21:34:51.484 DEBUG --- [main] o.s.web.client.RestTemplate   : Accept=[application/json, application/*+json]
2022-11-29 21:34:51.497 DEBUG --- [main] o.s.web.client.RestTemplate   : Response 200 OK
2022-11-29 21:34:51.500 DEBUG --- [main] o.s.web.client.RestTemplate   : Reading to [cz.zvestov.blog.User]
2022-11-29 21:34:51.510  INFO --- [main] cz.zvestov.blog.UserConnector : Got name='Joe Smith' for user ID: 42
```

To jsme si moc nepomohli, že?

Podle článku [Spring RestTemplate Request/Response Logging](https://www.baeldung.com/spring-resttemplate-logging) nastavíme použití `Apache HttpClient`.

```java
final RestTemplate restTemplate = new RestTemplate();
restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
```

Dále nastavíme úroveň logování `org.apache.http.wire` na `DEBUG`.

```console
2022-11-29 21:40:26.685  INFO --- [-main] cz.zvestov.blog.UserConnector : Calling user detail for ID: 42
2022-11-29 21:40:26.759 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 >> "GET /user/42 HTTP/1.1[\r][\n]"
2022-11-29 21:40:26.759 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 >> "Accept: application/json, application/*+json[\r][\n]"
2022-11-29 21:40:26.759 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 >> "Host: localhost:8080[\r][\n]"
2022-11-29 21:40:26.759 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 >> "Connection: Keep-Alive[\r][\n]"
2022-11-29 21:40:26.759 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 >> "User-Agent: Apache-HttpClient/4.5.13 (Java/19.0.1)[\r][\n]"
2022-11-29 21:40:26.759 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 >> "Accept-Encoding: gzip,deflate[\r][\n]"
2022-11-29 21:40:26.759 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 >> "[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "HTTP/1.1 200 [\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "Content-Type: application/json[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "Transfer-Encoding: chunked[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "Date: Tue, 29 Nov 2022 20:40:26 GMT[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "Keep-Alive: timeout=60[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "Connection: keep-alive[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "39[\r][\n]"
2022-11-29 21:40:26.761 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "{"id":"42","name":"Joe Smith","dateOfBirth":"1979-08-10"}[\r][\n]"
2022-11-29 21:40:26.779 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "0[\r][\n]"
2022-11-29 21:40:26.779 DEBUG --- [-main] org.apache.http.wire          : http-outgoing-0 << "[\r][\n]"
2022-11-29 21:40:26.779  INFO --- [-main] cz.zvestov.blog.UserConnector : Got name='Joe Smith' for user ID: 42
```

Ano, je to hrozně ukecané, ale nikdo přece neříká, že to máte mít puštěné pořád.


### WebClient

Podle článku [Logging Spring WebClient Calls](https://www.baeldung.com/spring-log-webclient-calls) pojďme nastavit použití `Netty HttpClient`.

```java
final HttpClient httpClient = HttpClient.create()
        .wiretap(UserConnector.class.getCanonicalName(), LogLevel.TRACE, AdvancedByteBufFormat.TEXTUAL);
final WebClient webClient = WebClient.builder()
        .clientConnector(new ReactorClientHttpConnector(httpClient))
        .build();
```

Dále nastavíme úroveň logování `cz.zvestov.blog.UserConnector` na `TRACE`.

```console
2022-11-29 21:49:48.252  INFO --- [           main] cz.zvestov.blog.UserConnector : Calling user detail for ID: 42
2022-11-29 21:49:48.783 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae] REGISTERED
2022-11-29 21:49:48.810 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae] CONNECT: localhost/127.0.0.1:8080
2022-11-29 21:49:48.815 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae, L:/127.0.0.1:65325 - R:localhost/127.0.0.1:8080] ACTIVE
2022-11-29 21:49:48.840 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae-1, L:/127.0.0.1:65325 - R:localhost/127.0.0.1:8080] WRITE: 93B GET /user/42 HTTP/1.1
user-agent: ReactorNetty/1.0.17
host: localhost:8080
accept: */*


2022-11-29 21:49:48.841 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae-1, L:/127.0.0.1:65325 - R:localhost/127.0.0.1:8080] FLUSH
2022-11-29 21:49:48.844 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae-1, L:/127.0.0.1:65325 - R:localhost/127.0.0.1:8080] WRITE: 0B
2022-11-29 21:49:48.845 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae-1, L:/127.0.0.1:65325 - R:localhost/127.0.0.1:8080] FLUSH
2022-11-29 21:49:48.846 TRACE --- [ctor-http-nio-2] cz.zvestov.blog.UserConnector : [cb7440ae-1, L:/127.0.0.1:65325 - R:localhost/127.0.0.1:8080] READ: 182B HTTP/1.1 200 
Content-Type: application/json
Transfer-Encoding: chunked
Date: Tue, 29 Nov 2022 20:49:48 GMT

39
{"id":"42","name":"Joe Smith","dateOfBirth":"1979-08-10"}
0


2022-11-29 21:49:48.908  INFO --- [           main] cz.zvestov.blog.UserConnector : Got name='Joe Smith' for user ID: 42
```

Ano, stejně jako případ `RestTemplate`, i tohle použití je hrozně ukecané, ale opět nikdo netvrdí, že je to řešení na stálo.

Pozorný čtenář si všimne, že v odkazovaném článku je kód

```java
.wiretap("reactor.netty.http.client.HttpClient", LogLevel.DEBUG, AdvancedByteBufFormat.TEXTUAL);
```

Zatím co já navrhuji

```java
.wiretap(UserConnector.class.getCanonicalName(), LogLevel.TRACE, AdvancedByteBufFormat.TEXTUAL);
```

To mi umožňuje vypínat a zapínat podrobný výpis s jemnější granularitou, ne pro všechna použití `HttpClient`.
Zanikne však zdroj dat.
Možná by šlo vyumělkovat na použití neexistující třídy `cz.zvestov.blog.UserConnector.HttpClient` pomocí:

```java
.wiretap(UserConnector.class.getCanonicalName() + ".HttpClient", LogLevel.TRACE, AdvancedByteBufFormat.TEXTUAL);
```

Chtěl bych každopádně zvýraznit možnost (oproti `RestTemplate`) volby úrovně logování `LogLevel.TRACE`.
Vídal jsem projekty, kde se nechávala úroveň `DEBUG` v prvních okamžicích i na produkčním prostředí a to tady pochopitelně nechceme.


## Závěr

Ukázali jsme si způsob, jak si můžete připravit možnost zapnout podrobnější výpis HTTP komunikace ve _Spring_ frameworku.
Mít možnost zvýšit úroveň logování bez změny binárek je k nezaplacení.
Bez podobných informací jste doslova slepí a nezbývá než jen hádat, co se na prostředí děje.
Hádám, že nakonec stejně člověk skončí u toho, že prosí o nasazení nové verze, kde už logování vylepšil.
A jak to řešíte vy (tedy pokud vám tam nedovolili napíchnout [Wireshark](https://wiki.wireshark.org/Home))?


## Související

- [Spring RestTemplate Request/Response Logging](https://www.baeldung.com/spring-resttemplate-logging)
- [Logging Spring WebClient Calls](https://www.baeldung.com/spring-log-webclient-calls)
- [Poznatky z logování](https://blog.zvestov.cz/software%20development/2022/04/29/poznatky-z-logovani.html)
