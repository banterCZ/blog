---
layout: post
title:  "WebFlux a pastičky reaktivního programování"
date:   2026-08-22
categories: [software development]
disqusId: 288
tags: [Java, Spring]
image: "/assets/2026-08-22/reactor.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2026-08-22/reactor.png" /></div>

Ačkoliv vím, že [přepisování software je něco, co byste nikdy neměli dělat](/software%20development/2013/06/12/veci-ktere-byste-nemeli-nikdy-delat.html), tak jsme se i přesto do jednoho přepisu pustili.
Velmi důležité byly nároky na výkon a propustnost.
[Zkušenost Netflixu s virtuálními vlákny na Java 21](https://netflixtechblog.com/java-21-virtual-threads-dude-wheres-my-lock-3052540e231d) nás varovaly, že tuhle cestu zatím ještě zkoušet nechceme.
Situace se od té doby změnila, viz [JEP 491: Synchronize Virtual Threads without Pinning](https://openjdk.org/jeps/491)
Tehdy jsme učinili pokus s reaktivním programováním a WebFlux ve Spring Boot.
Udělal jsem si pár poznámek, které bych nerad ztratil někde v archivu, kde už se mi víc jak rok válí (tak snad to ještě nestačilo tolik zastarat).

<div style="clear:both"></div>
<!--more-->


## Úvod

Spring MVC používá _thread-per-request model_, kde každý požadavek je zpracováván jedním vláknem od začátku do konce.

Oproti tomu [WebFlux](https://docs.spring.io/spring-framework/reference/web/webflux.html) je založen na reaktivním, neblokujícím modelu zpracování požadavků.
Používá malý počet vláken (event-loop model).
Je-li celý řetězec zpracování neblokující, tak se tato vlákna neblokují čekáním na I/O, ale jsou uvolněna pro zpracování dalších požadavků.
Standardně staví na projektu [Reactor](https://projectreactor.io/) a jako výchozí runtime používá Netty.


## Databáze

Dřív se člověk mohl vymlouvat, že reaktivní programování stejně nemá cenu, když neexistují reaktivní databázové ovladače.
To už dávno neplatí, máme [R2DBC](https://r2dbc.io/) a i odpovídající [Spring Data](https://docs.spring.io/spring-data/relational/reference/r2dbc.html), ale přišlo mi, že jsou pořád trochu nedotažené.
Například [jsem nebyl schopný dosáhnout _Load aggregates with a single select_](https://stackoverflow.com/a/79579275/204950), tedy načíst celý agregát (i se všemi vazbami) jedním SQL SELECTem s JOINy, což by v JDBC normálně mělo být možné.


## Pooling

Při prvním spuštění výkonnostních testů jsme dostávali žalostné výsledky.
Když celý příběh zkrátím, tak z metrik vyplynulo, že se dlouho čeká na vykonání databázového dotazu, respektive už na samotné získaní spojení z poolu.
To bylo obzvláště divné, jelikož pool měl alokováno víc spojení, ale nikdy nebyla využitá všechna.
Tedy měli jsme alokováno 50 spojení, ale nikdy jich to nepoužilo všech dostupných 50 paralelně.

Hlavní příčinou bylo, že _colocation_ je ve výchozím nastavení zapnuté.
V JavaDoc se píše:

> true means that `EventLoopGroup` created for clients will reuse current local event loop if already working inside one

Přeloženo do lidštiny: To způsobí, že se znovu použije aktuální event loop a vede na pozorované nerovnoměrné rozložení zátěže.

Není to úplně špatně vymyšlené, protože to šetří přepínání kontextu a zlepšuje práci s cache, ale pro vysokou paralelní zátěž je to nevhodné.

Samozřejmě se to netýká jen poolu databázových spojení ale i HTTP.
Vyřešila to následující Java konfigurace.

```java
@Bean
public ConnectionFactoryOptionsBuilderCustomizer loopResourcesCustomizer() {
    logger.info("Configuring Netty Loop Resources for PostgreSQL R2DBC connection pool not using colocated event loop threads.");
    return builder -> builder.option(
            PostgresqlConnectionFactoryProvider.LOOP_RESOURCES,
            LoopResources.create("pg-pool", LoopResources.DEFAULT_IO_SELECT_COUNT, LoopResources.DEFAULT_IO_WORKER_COUNT, true, false)
    );
}

@Bean
public NettyServerCustomizer nettyServerCustomizer() {
    logger.info("Configuring Netty Loop Resources for HTTP connection pool not using colocated event loop threads.");
    return httpServer -> httpServer
            .runOn(LoopResources.create("reactor-http", LoopResources.DEFAULT_IO_SELECT_COUNT, LoopResources.DEFAULT_IO_WORKER_COUNT, true, false));
}
```

Výstup z monitoringu ilustruje moment, kdy aplikace konečně začne využívat plnou kapacitu poolu.
Růžová (acquired) je stabilně na maximu (kolem 50), to je to, čeho jsme potřebovali dosáhnout.
Pool je plně vytížený a aplikace dokonce žádá o více spojení, než má k dispozici, což ukazuje tyrkysová (pending), která vystřeluje až ke 200. Aplikace má tedy velkou frontu čekajících požadavků na databázová spojení, ale to už stačí jen navýšit kapacitu poolu (samozřejmě s ohledem na to, co unese infrastruktura).

![](/assets/2026-08-22/monitoring.png)


## Závěr

Řešení s reaktivním programování zafungovalo a prošlo výkonnostními testy.
Konstrukty mi přišly neintuitivní (reaktivní programování je pro běžného Java programátora změna paradigmatu) a knihovny stále nepodporovaly scénáře, které bych očekával, že už budou dávno hotové.
Pokud nepotřebujete _backpressure_, zkusil bych dnes dát virtuálním vláknům šanci.


## Související

- [Thread Dumps and Project Loom (Virtual Threads)](https://blog.jetbrains.com/idea/2025/12/thread-dumps-and-project-loom-virtual-threads/)
- [Virtual Threads after JDK 24: What Changed for Production Java](https://www.infoq.com/articles/virtual-threads-after-jdk24/)
- [Virtual Thread Pinning (If You’re on JDK 21–23)](https://jvogel.me/posts/2026/java-is-fast-your-code-might-not-be/#8-virtual-thread-pinning-if-youre-on-jdk-2123)
- [JEP 491: Synchronize Virtual Threads without Pinning](https://openjdk.org/jeps/491)
- [Virtual Threads With Java 24 - Will it Scale?](https://gaetanopiazzolla.github.io/java/2025/06/18/virtualthreads-java24.html)
- [Java's reactive connection pooling performance caveat](https://piotrd.hashnode.dev/javas-reactive-connection-pooling-performance-caveat#heading-problem-reproduction)
