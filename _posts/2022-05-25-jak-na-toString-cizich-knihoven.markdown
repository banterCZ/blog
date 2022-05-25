---
layout: post
title:  "Jak na toString cizích knihoven"
date:   2022-05-25
categories: [software development]
disqusId: 247
image: "/assets/2022-05-25/260761.png"
tags: [logování]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2022-05-25/260761.png" /></div>

Bylo celkem jisté, že při psaní [poznatků z logování](https://blog.zvestov.cz/software%20development/2022/04/29/poznatky-z-logovani.html) si nevzpomenu na všechno.
Jedna z nejnáročnějších a nejrizikovějších aktivit mi přijde integrace systémů.
Osvědčilo se mi logovat začátek volání a pak jeho výsledek (alespoň úspěch/neúspěch).
Než se vše odladí, ocenili byste možná podrobnější logování.
V lepším případě má systém klientskou knihovnu.
A to je problém, který mě přivedl k sepsání tohoto tipu.
Konkrétně jsem zrovna používal [jfrog artifactory java klienta](https://github.com/jfrog/artifactory-client-java).
Nechci je pomlouvat, spíš jako ukázka, že jsem si příklad nevycucal z prstu.
Ale nejsou ani první, ani poslední, kde jsem se s tím setkal.
Jde o to, že poskytují nějaké modelové třídy, ale bez `toString` metod.

<div style="clear:both"></div>
<!--more-->


## Úvod

Jak známo, výchozí implementace `toString` metody vrací název třídy a hash, například `User@41906a77`, což nám s integrací zrovna dvakrát nepomůže.
Doplnit si implementaci je snadné, ovšem za předpokladu, že máte zdrojové kódy pod kontrolou.
Můžete samozřejmě vyjmenovávat property pro každou konkrétní třídu a každou logovací zprávu, ale to se vám asi nechce.
V současné chvíli preferuji následující řešení, ke kterému mě přivedlo jak jinak než [Stack Overflow](https://stackoverflow. com/questions/29140402/how-do-i-print-my-java-object-without-getting-sometype2f92e0f4/67351224#67351224).


## Implementace

Využijeme [Apache Commons Lang](https://commons.apache.org/proper/commons-lang/)
a jejich [ReflectionToStringBuilder](https://commons.apache. org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/ReflectionToStringBuilder.html)
ve spojení s [RecursiveToStringStyle](https://commons.apacheorg/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/RecursiveToStringStyle.html).

Byť jsem psal, že díky parametrizovaným logovacím zprávám se lze většinou vyhnout testování úrovně logování, tak tady nejspíš chcete používat reflexi, jen když je to potřeba.
```java
if (logger.isTraceEnabled()) {
    logger.trace("Calling {}", ReflectionToStringBuilder.toString(request, SHORT_RECURSIVE_PREFIX_STYLE));
}
```

Mluvím o SLF4J. V [Log4j2 mají pěknou podporu pro lambdy](https://www.baeldung.com/log4j-2-lazy-logging), takže by šlo psát:
```java
logger.trace("Calling {}", () -> ReflectionToStringBuilder.toString(request, SHORT_RECURSIVE_PREFIX_STYLE));
```

A teď už celý příklad:

```java
import org.apache.commons.lang3.builder.RecursiveToStringStyle;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FooClass {

    private static final Logger logger = LoggerFactory.getLogger(FooClass.class);

    private static final ToStringStyle SHORT_RECURSIVE_PREFIX_STYLE = new FooClass.ShortRecursiveToStringStyle();

    public Object doSomeMojo(final Object request) {
        if (logger.isTraceEnabled()) {
            logger.trace("Calling {}", ReflectionToStringBuilder.toString(request, SHORT_RECURSIVE_PREFIX_STYLE));
        }
        final Object response = null; // call the 3rd party
        if (logger.isTraceEnabled()) {
            logger.trace("Got {}", ReflectionToStringBuilder.toString(response, SHORT_RECURSIVE_PREFIX_STYLE));
        }
        return response;
    }

    /**
     * The 3rd party library does not provide toString methods. Be careful not to log sensitive information!
     */
    private static final class ShortRecursiveToStringStyle extends RecursiveToStringStyle {

        private static final long serialVersionUID = 1L;

        ShortRecursiveToStringStyle() {
            this.setUseShortClassName(true);
            this.setUseIdentityHashCode(false);
        }
    }
}
```

Výstup v logu pak může vypadat takto:
`INFO FooClass - Calling User[email=chuck.norris@example.com,name=Chuck Norris]`


## Závěr

S malou dávkou úsilí lze dynamicky logovat i třídy knihoven třetích stran pomocí `toString` builderu využívajícího reflexi.
Kvůli výkonu můžete v SLF4J zvážit testování úrovně logování `if (logger.isTraceEnabled())`
nebo využít Log4j podpory pro lambdu `logger.trace("{}", () -> ...)`.

## Související

- [Poznatky z logování](https://blog.zvestov.cz/software%20development/2022/04/29/poznatky-z-logovani.html)
- [JPA a asynchronním logováním](https://blog.zvestov.cz/software%20development/2018/09/21/jpa-a-asynchronni-logovani.html)
- [Stack Overflow - How do I print my Java object without getting "SomeType@2f92e0f4"](https://stackoverflow. com/questions/29140402/how-do-i-print-my-java-object-without-getting-sometype2f92e0f4/67351224#67351224).)
