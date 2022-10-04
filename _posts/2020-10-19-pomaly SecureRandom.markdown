---
layout: post
title:  "Pomalý SecureRandom"
date:   2020-10-19
categories: [software development]
disqusId: 230
tags: [Java, Linux, security]
image: "/assets/2020-10-19/dice-white.png"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2020-10-19/dice-white.png" /></div>

Pýcha předchází pád.
Nikdy nebudu (snad) tak bláhový, abych si troufal tvrdit, že rozumím bezpečnosti, protože hned potom by se mi to určitě vymstilo.
Ovšem přiznám se, že jednou z motivací psaní mého blogu je i čistě sobecká potřeba mít někde poznámky. Tímto problémem jsem strávil nějaký čas a přemýšlení, takže se dost možná někdy v budoucnu k příspěvku vrátím a připomenu si podrobnosti.

O co šlo? Přišla chyba, že vygenerovat dočasné heslo trvá 90 vteřin.

<div style="clear:both"></div>
<!--more-->

## Prvotní průzkum

Protože sedím v [produktové části firmy](https://blog.zvestov.cz/software%20development/2019/10/22/servisni-versus-produktova-firma.html), tak je prvním krokem zjistit, zda se jedná o produktový nebo až projektový kód.  

Mojí noční můrou opravy bugů je, když mi dojdou hypotézy. První myšlenka, ještě než jsem viděl logy, byla ohledně hashovací funkce [PBKDF2](https://en.wikipedia.org/wiki/PBKDF2), jestli to nepřehnali s počtem iterací. Ne vždycky se nám podaří napsat logy, které nám hned pomůžou (člověk je opraví, ale vyžaduje retest a ten někdy bohužel není možný). Tentokrát logy jasně ukazovaly, že se proces zastaví už při generování hesla, ještě před hashováním. A dočasné heslo se generovalo jen o délce osmi znaků. Důležitá informace byla, že generování hesla zkoušeli v integračním  testu a bušili do toho jak hluchý do vrat. Což je dobře. Klíčové bylo, že první hesla se vygenerovala bez viditelného zpozdění. A byl to Linuxový virtuální stroj.

## Příčina

Jasně, šup na Google a Stack Overflow, kde najdete třeba [How to deal with a slow SecureRandom generator?](https://stackoverflow.com/questions/137212/how-to-deal-with-a-slow-securerandom-generator) Podle mě je tohle ale jedna z otázek, kdy byste neměli jen zkopírovat řešení a jít dál. Tedy ono byste to asi neměli dělat nikdy, ale tady to platí několikanásobně.

### Random

Zdůrazním, že je důležité **nepoužívat** `java.util.Random` (ani na něj nepřepínat, pokud se vám zdá `java.util.SecureRandom` pomalý), jelikož se jedná o předvídatelný generátor. Defaultní konstruktor seeduje čas (obecně dobře předvídatelný) s těžko předvídatelnou hodnotou, která se mění s každou inicializací. Pokud by se ten generátor inicializoval jen jednou někdy na startu, tak když si já (jako korektní uživatel) nechám vygenerovat v noci několik desítek dočasný hesel po sobě, tak je dost pravděpodobné, že dokážu z vygenerovaných hesel dopočítat interní stav toho generátoru (který je pouze 48 bitový a používá velmi jednoduchou logiku). Respektive já to asi nedokážu, ale je hodně podstatně líp matematicky vzdělaných lidí, kteří by to pravděpodobně dokázali. Já vím, není to celé až tak moc pravděpodobné, ale já taky nejsem hacker a tohle je jen první rychlý nápad, jak to případně zneužít.

A hlavně věřte javadocu, kde se píše:

> Instances of `java.util.Random` are not cryptographically secure

### SecureRandom

Pro ladění jsme využili následující kratičký kód.

{% gist banterCZ/36712a9741fa7ff5a819e7009c148270 %}

Tím se pomalu dostávám k jádru pudla. Podívejme se do dokumentace [SecureRandom Implementations](https://docs.oracle.com/javase/8/docs/technotes/guides/security/SunProviders.html#SecureRandomImp), kde najdeme výčet použitých algoritmů a v jakém pořadí se na jakém operačním systému inicializují.

### /dev/urandom

A teď ta nejsložitější část podrobně popsaná v [Myths about /dev/urandom](https://www.2uo.de/myths-about-urandom/), tak abych to nepopletl. Na Linuxu jsou dva stejně kryptograficky kvalitní zdroje náhodný čísel a to `/dev/urandom` a `/dev/random`, který je ovšem blokující, kontroluje kvalitu entropie, a když ji nemá dost, tak čeká. Způsobilo nám to dva problémy. Jednak generování mnoha hesel entropii rychle „vyčerpávalo“, jednak entropie se někde sbírá a na virtuální strojích je tento sběr omezený. Nicméně zablokování na nedostatečné entropii se nám podařilo zreplikovat i v IDE na fyzickém našlapaném stroji.

Samozřejmě se nabízí otázka, proč jsou na Linuxu dvě možnosti. Opět vás odkážu na článek [Myths about /dev/urandom](https://www.2uo.de/myths-about-urandom/). Blokující zdroj se doporučuje volat po startu stroje, kdy ještě není nasbíraná dostatečná entropie, a nebo když generujete nějaké SSL klíče, a nebo když se bojíte NSA. Pro běžné použití byste si měli vystačit s neblokujícím zdrojem.

Zpět k javě. Výchozím algoritmem pro `SecureRandom` je na Linuxu `NativePRNG` namapovaný na blokující zdroj. Toto mapování lze v JVM změnit nastavením _system property_ `java.security.egd` ([Stack Overflow - What java.security.egd option is for?](https://stackoverflow.com/questions/58991966/what-java-security-egd-option-is-for/59097932#59097932)). Případně lze změnit algoritmus `SecureRandom` na `NativePRNGNonBlocking`, který ovlivní výběr zdroje, což byla v našem případě schůdnější varianta. Trochu se to komplikuje, pokud do toho budete míchat Windows stroje, kde takový algoritmus není.

Jedna **nezaručená spekulace**, o které se zmiňovali na fórech: algoritmus `SHA1PRNG` namapovaný na neblokující zdroj náhody by mohla být nejrychlejší varianta. Mně ovšem stačilo, že jsem se zbavil těch 90 vteřin.

### haveged

Ve Stack Overflow odpovědi zmiňují i démon [haveged](https://www.digitalocean.com/community/tutorials/how-to-setup-additional-entropy-for-cloud-servers-using-haveged). Pokud jsem to pochopil, tak funguje de facto úplně stejně jako `/dev/urandom`. Když má dostatek hardwarové entropie, tak generuje „zcela kvalitní náhodu“. Když nemá, tak generuje o něco „méně kvalitní náhodu“. Takže nedává smysl to používat, spolehnul bych se na `/dev/urandom`.

## Závěr

Generování hesel může trvat dlouhou (zejména na virtuální strojích), ale existuje bezpečný způsob, jak to řešit.
Používejte `dev/urandom`, respektive `NativePRNGNonBlocking`.
Používejte `java.util.SecureRandom` a vyhněte se `java.util.Random`.

Používáte-li `SecureRandom` ke generování kryptografického materiálu (klíčů, hesel atd.), je potřeba zvážit další faktory jako například bezpečnost proti kvantovým útokům či kvalita algoritmu, který generuje náhodné bity.
Pro tyto účely se spíš hodí použít Bouncy Castle knihovnu, která má svojí implementaci `SecureRandom` a její `DEFAULT` algoritmus postavený na `DRBG` (konkrétně [HashDRBGProvider](https://github.com/bcgit/bc-java/tree/master/core/src/main/java/org/bouncycastle/crypto/prng/drbg)).

## Související

- [Servisní versus produktová firma](https://blog.zvestov.cz/software%20development/2019/10/22/servisni-versus-produktova-firma.html)
- [Myths about /dev/urandom](https://www.2uo.de/myths-about-urandom/)
- [SecureRandom Implementations](https://docs.oracle.com/javase/8/docs/technotes/guides/security/SunProviders.html#SecureRandomImp)
- [Stack Overflow - How to deal with a slow SecureRandom generator?](https://stackoverflow.com/questions/137212/how-to-deal-with-a-slow-securerandom-generator)
- [Stack Overflow - What java.security.egd option is for?](https://stackoverflow.com/questions/58991966/what-java-security-egd-option-is-for/59097932#59097932)
- [NIST - Recommendation for Random Number Generation Using Deterministic Random Bit Generators](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-90Ar1.pdf)
