---
layout: post
title:  "Regex refaktor"
date:   2023-12-20
categories: [software development]
disqusId: 264
image: "/assets/2023-12-20/regex.png"
tags: [regex]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2023-12-20/regex.png" /></div>

Dnešní IDE mají skvělou podporu pro [refaktorování](https://cs.wikipedia.org/wiki/Refaktorov%C3%A1n%C3%AD), ale občas si s nabízenými možnostmi nevystačím.
Naštěstí pořád je k dispozici _replace all_. 
To ovšem začne být zajímavě mocné, až když zapojíte [regulární výrazy](https://cs.wikipedia.org/wiki/Regul%C3%A1rn%C3%AD_v%C3%BDraz).
Fousatý vtip říká, že máte-li problém a rozhodnete se ho řešit regulárním výrazem, máte problémy rázem dva.
Mnozí z vás už jistě používáte ChatGPT či Copilot, ale já zatím lovil svoje poznámky.
Tak je pro jistotu zveřejňuji, abych je vždycky našel.

<div style="clear:both"></div>
<!--more-->

## Konkrétní případ použití

Asi jako každý programátor mám určité projevy [OCD](https://cs.wikipedia.org/wiki/Obsedantn%C4%9B-kompulzivn%C3%AD_porucha) a neučesaný kód mi nedá spát. 

Naposledy jsem šel kolem kódu s podobnými Spring anotacemi.

```java
@RequestMapping(value = "admin/users/{id}", method = RequestMethod.GET)
```

Spring Framework od verze 4.3 z roku 2016 umožňuje psát.

```java
@GetMapping(value = "/admin/users/{id}")
```

Respektive můžete dokonce zkrátit na následující.

```java
@GetMapping("/admin/users/{id}")
```

No jo, jenže v projektu byly desítky a stovky výskytů.
Co s tím?
Ano, zachrání nás regulární výrazy.

Zásadní schopnost jsou (v anglické terminologii) _capturing group_ a _backreference_ (česky _seskupování_ a _zpětné odkazování_).
Ohledně regulárních výrazů byly napsány celé knihy, tak se nechci pouštět na tenký led.
Osobně ladím regex pomocí nástroje [regexr.com](https://regexr.com/), který umí krásně vizualizovat a vysvětlovat.

Pojďme na konkrétní použití.
Hledaný výraz může být například:

```regexp
@RequestMapping\(value = "(.+?)", method = RequestMethod\.GET\)
```

A nahrazujeme za: 

```regexp
@GetMapping("$1")
```

Úpravu pro další HTTP metody jako POST a další nechám na laskavého čtenáře.


## Závěr

Nedaří-li se vám snadno napasovat _replace all_, nezapomeňte, že můžete zapojit regulární výrazy.
Seskupování a zpětné odkazování z hlavy nedávám, ale vím, že najdu ve svých poznámkách.


## Související

- [Spring, REST a e-mail jako parametr](/software%20development/2013/02/09/spring-rest-a-email-jako-parametr)
