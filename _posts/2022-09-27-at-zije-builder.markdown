---
layout: post
title:  "Ať žije builder"
date:   2022-09-27
categories: [software development]
disqusId: 251
image: "/assets/2022-09-27/296899.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2022-09-27/296899.png" /></div>

[Zpětná kompatibilita](/software%20development/2019/12/09/zpetna-kompatibilita.html) je něco, co mě poslední roky na jednu stranu děsilo, ale na druhou stranu i bavilo (protože překonávání překážek).
Například přidání argumentu do konstruktoru je binárně zpětně nekompatibilní změna, musíte totiž současně zachovávat i ty již existující.
Při druhém a dalším přidání `@Deprecated` si začínáte uvědomovat, že tudy cesta nevede.
Jedním z nástrojů, který člověka dokáže vytáhnout z bryndy, je _builder_.

<div style="clear:both"></div>
<!--more-->


## Úvod

Když říkám _builder_, tak tím nemyslím původní [návrhový vzor builder](https://cs.wikipedia.org/wiki/Builder).

> Návrhový vzor oddělující konstrukci složitých objektů od jejich reprezentace

Nýbrž to, o čem Josua Bloch píše ve své knize [Effective Java](https://www.goodreads.com/book/show/34927404-effective-java) (což mi připomíná, že bych si ji měl přečíst znovu; ještě mám na blogu políčeno na práci s výjimkami).
Konkrétně brojí proti teleskopickému konstruktoru, tedy takovému, kterému přibývají parametry.
Kromě toho parametry stejného typy lze nedopatření snadno prohodit.
Použití POJO a _setterů_ vyžaduje více volání, během kterých lze obtížně zaručit validní stav objektu, a navíc neumožňuje vytvořit _immutable object_.

A teleskopické nejsou jen konstruktory, ale i metody.
Změna signatury metody je pochopitelně binárně zpětně nekompatibilní.
Možná i proto [Uncle Bob v knize Clean Code](/software%20development/2016/07/28/clean-code.html) prosazoval monadické funkce.
Funkce s jediným parametrem, který se vytváří přes builder, je lábuž nejen z pohledu zpětné kompatibility.

Ukažme si to na vyumělkovaném příkladu.
Řekněme, že máme e-shop, ve kterém chceme odeslat zásilku.

```java
void shipOrder(Item item, int amount, Address address);
```

Nově potřebujeme zasílat dárkové balení.
Okamžitý nápad je přidat parametr `boolean isPresent`, což jednak rozbíjí zpětnou kompatibilitu, jednak [se jedná o antipattern](https://martinfowler.com/bliki/FlagArgument.html). 

Soustřeďme se však na zpětnou kompatibilitu.
Pakliže máme.

```java
void shipOrder(ShipOrderRequest request);
```

A voláme metodu.

```java
var request = ShipOrderRequest.builder()
    .item(item)
    .amount(amount)
    .build();

service.shipOrder(request);
```

Tak přidání parametru metody lze udělat zpětně kompatibilně.


## Implementace

Ukázka, jak může vypadat implementace třídy `User` s _builderem_.

```java
public class User {

    private final String username;

    private final String email;

    private final String phone;

    User(final Builder builder) {
        this.username = builder.username;
        this.email = builder.email;
        this.phone = builder.phone;
    }

    public static Builder builder(final String username) {
        return new Builder(username);
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public static final class Builder {

        // required parameter
        private final String username;

        // optional parameters with default values
        private String email = null;
        private String phone = null;

        /**
         * Non-public constructor to prevent direct instantiation.
         */
        Builder(final String username) {
            this.username = username;
        }

        public Builder email(final String value) {
            this.email = value;
            return this;
        }

        public Builder phone(final String value) {
            this.phone = value;
            return this;
        }

        public User build() {
            return new User(this);
        }
    }
}
```

Instanci pak vytvoříte následovně.

```java
var user = User.builder("chuck_norris")
    .email("chuck.norris@example.com")
    .build();
```

Předně si povšimněte konstruktoru třídy, kam jako parametr vstupuje jediný parametr a to builder.
Statická metoda vytvářející builder nemusí mít žádný parametr a nebo může, pakliže některý z nich považujete za povinný (v našem případě `username`).

Náš příklad můžeme dále vylepšovat.
Dejme tomu, že chceme mít vyplněný alespoň jeden kontakt.

```java
public User build() {
    if (phone == null || email == null) {
        throw new IllegalStateException("Either phone or email has to be set");
    }
    return new User(this);
}
```


## Názvosloví

Stejné chyby, stejné známky.
Neučte se z kódu, který vytvořily `jaxb` generátory.
Viděli byste metody jako `#withUsername(String)`, což evokuje, že se vytváří kopie přes `#clone()`, ale to se neděje.
Příklad si můžete vzít spíš z novějšího API, co se děje, voláte-li metodu s prefixem _with_, namátkou `java.time.LocalDateTime#withMinute(int)`.


## Dědičnost

S trochou snahy a přemlouvání generik lze zajistit i dědičnost.

```java
class User {

    private final String username;

    private final String email;

    private final String phone;

    protected User(final Builder<?> builder) {
        this.username = builder.username;
        this.email = builder.email;
        this.phone = builder.phone;
    }

    public static Builder<?> builder(final String username) {
        return new Builder<>(username);
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public static class Builder<B extends Builder<B>> {

        // required parameter
        private final String username;

        // optional parameters with default values
        private String email = null;
        private String phone = null;

        /**
         * Non-public constructor to prevent direct instantiation.
         */
        Builder(final String username) {
            this.username = username;
        }

        @SuppressWarnings("unchecked")
        protected B self() {
            return (B) this;
        }

        public B email(final String value) {
            this.email = value;
            return self();
        }

        public B phone(final String value) {
            this.phone = value;
            return self();
        }

        public User build() {
            return new User(this);
        }
    }
}

class Customer extends User {

    private boolean vip;

    Customer(final Builder<?> builder) {
        super(builder);
        this.vip = builder.vip;
    }

    public static Builder<?> builder(final String username) {
        return new Builder<>(username);
    }

    public boolean isVip() {
        return vip;
    }

    public static class Builder<B extends Builder<B>> extends User.Builder<B> {

        private boolean vip;

        Builder(final String username) {
            super(username);
        }

        public B vip(final boolean value) {
            this.vip = value;
            return self();
        }

        @Override
        public Customer build() {
            return new Customer(this);
        }
    }
}
```


## Lombok

Máte chuť si ušetřit práci použitím [lombok Builder](https://projectlombok.org/features/Builder)?
Třída by mohla vypadat nějak takhle.

```java
@lombok.Builder
@lombok.Getter
public class User {

    @lombok.NonNull
    private final String username;

    private final String email;

    private final String phone;
}
```

Validaci povinného _fieldu_ zajistí anotace `@NotNull`, ale nutnost vyplnění alespoň jednoho kontaktu už tak elegantně nevyřešíte.

Nejvíc mi však vadí, že generuje právě teleskopický konstruktor.
Což můžete vidět, pakliže si zavoláte _delombok_.
Sice je _package private_, ale stejně.

```java
User(@lombok.NonNull String username, String email, String phone) {
    this.username = username;
    this.email = email;
    this.phone = phone;
}
```


## Závěr

Buildery jsem si oblíbil.
Píšu je ručně, bez Lomboku.
Problém není ani dědičnost.
Z exponovaných metod, které nepoužívají zastřešující _parameter object_, jsem nesvůj.
Neříkám, že sám tento přístup slepě razím všude, ale zkuste se nad tím zamyslet.


## Související

- [Úskalí API](/software%20development/2021/04/28/uskali-api)
- [Zpětná kompatibilita](/software%20development/2019/12/09/zpetna-kompatibilita.html)
- [Clean Code](/software%20development/2016/07/28/clean-code.html)
- [Jackson Deserialization and the Builder Pattern](https://www.grabanotherbyte.com/en/jackson/2020/11/13/jackson-builder-pattern.html)
