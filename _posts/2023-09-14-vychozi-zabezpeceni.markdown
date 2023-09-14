---
layout: post
title:  "Výchozí zabezpečení"
date:   2023-09-14
categories: [software development]
disqusId: 261
image: "/assets/2023-09-14/1549143844.png"
tags: [Java, security, Spring]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2023-09-14/1549143844.png" /></div>

Bývalý kolega mě na jaře pozval na setkání [OWASP Czech Republic](https://owasp.org/www-chapter-czech-republic/).
Zaujala mě tam především [krádež session na Seznam.cz (Marek Tóth)](https://marektoth.cz/blog/dalsi-kradez-session-na-seznamu/).
A pak ještě popis výchozího zabezpečení některých systémů, což mi připomnělo moji vlastní zkušenost, o kterou bych se s vámi tentokrát chtěl podělit.
Je známo, že bezpečnost a uživatelská/programátorská přívětivost jdou proti sobě.
Je otázkou, kde najít vhodnou hranici.
Odvážím si tvrdit, že se nám v konkrétním případě nakonec podařilo najít pěkné řešení.

<div style="clear:both"></div>
<!--more-->


## Úvod

Předesílám, že věc se udála před lety, všude je to již dávno opravené a reálně zneužitelné to nebylo.
Implementovali jsme [OpenID Connect](https://auth0.com/docs/authenticate/protocols/openid-connect-protocol) protokol.
Pro naše vyprávění je podstatné, že v rámci toho se vydává podepsaný JSON Web Token (JWT).
A pro podpis potřebujete privátní klíč.
Mám rád přístup, který upřednostňuje konvence před konfigurací.
A taky, když vývojáři rozběhají projekt za minuty a ne dny.
Zkrátka na classpath byl testovací klíč a v instalační příručce pokyny, že si máte v produkci vygenerovat vlastní.
Ovšem žádná ruční brzda, která by vás zastavila.
A co se nestalo?
Hádáte správně, v produkci použili testovací klíč.
(Pro zvídavé čtenáře, na samotný útok zdaleka nestačí, [křížově se kontroluje ještě UserInfo](https://openid.net/specs/openid-connect-core-1_0.html#Overview)).
Úkol zněl jasně, pro testování se vyhnout složité konfiguraci a zároveň ochránit produkci.


## Řešení

Ukážeme si řešení za použití [podmíněné konfigurace ve Spring Boot](https://reflectoring.io/spring-boot-conditionals/).
Byť je omezené na konkrétní framework, tak principy jsou obecně použitelné.
Záměrně se vyhýbám kryptografickému API a používám nějaké tajemství (secret).

Popišme si tři případy použití:
1. Bez konkrétního zásahu do konfigurace aplikace nenastartuje. Pro produkci bezpečné, pro vývoj nepohodlné.
2. Při zapnutí Spring profilu `dev` se vygeneruje náhodné tajemství. Pro vývoj pohodlné, pro produkci bezpečné.
   Jednak logujeme WARN ale hlavně tajemství se neukládá a po restartu aplikace se generuje nové
   (co kdyby někdo zapnul `dev` na produkci a WARN ho nezastavil).
3. Pro prostředí vyžadující stabilitu i po restartu (nemusí jít pouze o produkci) konfigurujeme zdroj tajemství ze souboru
   (ideálně například z [HSM](https://en.wikipedia.org/wiki/Hardware_security_module), ale to je mimo rozsah tohoto článku).

```java
@Configuration
public class SecretConfiguration {

    @Bean
    @ConditionalOnProperty(prefix = "cz.zvestov.secret", name = "type", havingValue = "file")
    @ConditionalOnMissingBean(type = "cz.zvestov.defaultsecret.SecretService")
    SecretService fileSecretService(@Value("${cz.zvestov.secret.file.path}") Path path) {
        return new FileSecretService(path);
    }

    @Bean
    @Profile("dev")
    @ConditionalOnMissingBean(type = "cz.zvestov.defaultsecret.SecretService")
    SecretService devSecretService() {
        return new DevSecretService();
    }
}
```

Anotace [@ConditionalOnProperty](https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/autoconfigure/condition/ConditionalOnProperty.html) zajistí konfiguraci jen v případě definované potřebné property.
Anotace [@Profile](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/context/annotation/Profile.html) nám podmiňuje konfiguraci pro konkrétní profil.
Anotace [@ConditionalOnMissingBean](https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/autoconfigure/condition/ConditionalOnMissingBean.html) nám zajistí, že konfigurujeme nanejvýš jednu beanu.
Pakliže byste potřebovali řídit pořadí vyhodnocení, můžete sáhnout po anotaci [@Order](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/core/annotation/Order.html).
Nechám na čtenářích k posouzení případ, kdy máte definovaný profil `dev` a zároveň i property, kterou zapínáte načítání ze souboru. 

Rozhraní `SecretService` má v našem příkladu dvě implementace, `DevSecretService` a `FileSecretService`, ale to už je takové drobné programátorské cvičení.
[Celý ukázkový projekt naleznete na GitHubu](https://github.com/banterCZ/default-secret).


## Závěr

Napsat do dokumentace, že si máte v produkci změnit výchozí heslo, nestačí.
Zároveň bychom měli myslet na pohodlí programátorů.
Ukázali jsme si způsob, jak lze dosáhnout obojího při zachování bezpečnosti.


## Související

- [Pomalý SecureRandom](/software%20development/2020/10/19/pomaly-SecureRandom.html)
