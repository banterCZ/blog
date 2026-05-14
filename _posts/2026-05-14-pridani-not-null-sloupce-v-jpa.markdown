---
layout: post
title:  "Přidání not-null sloupce v JPA"
date:   2026-05-14
categories: [software development]
disqusId: 286
tags: [JPA]
image: "/assets/2026-05-14/db.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2026-05-14/db.png" /></div>

Ani v dnešním světě AI nerezignuju na architekturu nebo právě proto na ní lpím o to víc.
Stroje vám možná dokážou odpovídat, ale zatím ještě se musíte umět správně ptát.
Tentokrát se chci zaměřit na situaci, jak za použití JPA rozvíjet existující datový model a přitom nerezignovat na integritní omezení.

<div style="clear:both"></div>
<!--more-->

## Úvod

Mějme situaci, kdy potřebujeme přidat databázový sloupec.
Dává smysl, aby byl _not-null_, ale co s existujícími záznamy?
Někdy lze vložit rozumnou výchozí hodnotu, někdy hodnotu s přiměřeným úsilím dopočítat, jindy zase vložit záslepku.
Co když mi ale vyhovuje _null_ pro existující záznamy, ale nové řádky už chci striktně validovat?


## Řešení

V databázi přidáme nový sloupec, ale ponecháme ho jako _nullable_.

Na databázové úrovni tedy integritní omezení neudržíme, ale pojďme to vyřešit na aplikační vrstvě, kde používám JPA se Spring Boot.
Využijme _bean validation_ a označíme field jako `jakarta.validation.constraints.NotNull`.

Začnou se nám kupit problémy, ale ty zvládneme vyřešit.
Vytváříte-li databázové schéma z java tříd (zejména pro testovací H2), promítají se validační pravidla přímo do databáze.
To vypneme následující property.

```properties
spring.jpa.properties.hibernate.validator.apply_to_ddl=false
```

Nyní můžeme načíst existující řádky, kde je sloupec `null` a zároveň nebudeme moci vložit nové řádky, které by porušovaly validační pravidlo.
Nicméně narazíme na další problém, že validace se spouští i při updatu záznamu, ať už explicitního či _dirty checku_.
Nevzádáme to a využíváme ještě validační skupiny.

```properties
spring.jpa.properties.jakarta.persistence.validation.group.pre-persist=cz.zvestov.blog.jpa.NotNullOnCreate
```

A filed onznačíme jako

```java
@NotNull(groups = NotNullOnCreate.class)
```

Celý projekt naleznete na [GitHubu](https://github.com/banterCZ/blog-example-jpa-not-null).

## Závěr

Zvládneme načíst existující záznam, upravit jiný sloupec a uložit.
Zároveň nám to zabrání vložit nový záznam s `null` hodnotou tohoto sloupce.

Pozorný čtenář si všimne, že nám vypadla validace pro případ, kdybychom chtěli aktualizovat _not-null_ hodnotu na `null`, to by nám teď prošlo.
Za domácí úkol se můžete zamyslet, jak by se mohl upravit _setter_, abychom této situaci zabránili.
