---
layout: post
title:  "Java proxy: Od psa k transakčnímu psovi"
date:   2021-01-28
categories: [software development]
disqusId: 234
tags: [překlad]
image: "/assets/2021-01-28/190624.png"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2021-01-28/190624.png" /></div>

Mitchell Bösecke napsal zajímavý příspěvek [Java Proxies: From Dog to TransactionalDog](https://www.mitchellbosecke.com/post/java-proxies-from-dog-to-transactionaldog), s laskavým svolením autora ho překládám do češtiny. Ne že bych se považoval za odborníka na proxy, ale patří k tématům, o kterých se bavím se senior vývojáři u pohovoru. Byť je článek notně zjednodušený a je určen spíše začátečníkům, divili byste se, kolik lidí z praxe by mělo problém koncept proxy vysvětlit.
<div style="clear:both"></div>
28\. prosince 2020

Nechtěl jsem se učit proxy v Javě, ale všechny nástroje softwarového vývoje je používají, takže bez důkladného pochopení toho, na čem staví, bylo nemožné s nimi pracovat. Tyto knihovny třetích stran vskutku zastřely mou mysl a doháněly mě k zoufalství. Pojďme spolu stvořit psa Frankensteina.

<!--more-->

## Co to je proxy?

Proxy (zástupce) je návrhový vzor, kdy nahradíme skutečný objekt takovým objektem, který tak jenom vypadá a jeho chování napodobuje. Tento podvrh akceptuje všechny vaše požadavky, přidá nějakou extra prácičku a pošle požadavek dál ke skutečnému objektu. Pokud je to správně zařízeno, tak ani nepoznáte, že jste měli co do činění s proxy.

Java implementuje třídu jménem `java.lang.reflect.Proxy`, která dělá přesně tohle.

## Proč bych měl vytvářet proxy?

Pracovně programuji deset let a vlastně jsem nikdy nevytvořil proxy. Takže by se mohlo zdát, že nejsou potřeba. Knihovny třetích stran je však používají, aby vám _ulehčily_ život, ale způsobuje to spoustu zmatků, proto se ujistěte, že se je pořádně naučíte. Na konci si ukážeme konkrétní případy použití.

## Příklad

Všechny školní příklady jsou rozhraní zvíře (Animal) s implementacemi pes a kočka (Dog, Cat). Úplně to nesnáším, protože si pod tím v práci nepředstavím nic smysluplného. Ale to ani pod proxy.


```java
interface Animal {
    void makeNoise();
}

class Dog implements Animal {
    public void makeNoise(){
        System.out.print("haf!");
    }
}

```

Otestujme tento triviální nesmysl.

```java
Animal dog = new Dog();
dog.makeNoise(); // vypíše "haf!", hodný pejsek
```

Nyní vytvořme proxy objekt kolem našeho psa, aniž bychom měli nějaký konkrétní důvod. Tato proxy zachytí volání každé metody a vypíše `INTERCEPTED` před tím, než zavolá původní metodu. Java vyžaduje, abychom implementovali divný `InvocationHandler`, který tuto logiku obslouží.

```java
class AnimalHandler implements InvocationHandler {

    private final Animal originalAnimal;

    public AnimalHandler(Animal originalAnimal) {
        this.originalAnimal = originalAnimal;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Exception {
        System.out.print("INTERCEPTED ");
        method.invoke(originalAnimal, args); // zavolá původní metodu
        return null;
    }
}
```

Pak vytvoříme našeho proxy psa Frankensteina.

```java
// vytvoří proxy s logikou AnimalHandler
Animal proxyDog = (Animal) Proxy.newProxyInstance(Animal.class.getClassLoader(),
		new Class[]{Animal.class}, new AnimalHandler(dog));

proxyDog.makeNoise(); // vypíše "INTERCEPTED haf!", ujetý pes
```

Zvládli jsme to. _Zaobalili_ jsme naši skutečnou implementaci psa do proxy. Každé zavolání metody na proxy psovi zachytí náš _AnimalHandler_ a vykoná svojí logiku před tím, než deleguje požadavek na skutečného psa skrytého vespod.

Podívejme se blíž na proměnnou `proxyDog`. Jakého je typu? Původně byla inicializována jako `Animal` ale je i instancí `Dog`?

```java
System.out.println(dog.getClass()); // com.mitchellbosecke.Dog
System.out.println(proxyDog.getClass()); // com.sun.proxy.$Proxy0

System.out.println(dog instanceof Animal); // true
System.out.println(proxyDog instanceof Animal); // true

System.out.println(dog instanceof Dog); // true
System.out.println(proxyDog instanceof Dog); // false! cože?
```

Nechte mě vysvětlit, co se tu stalo. Za běhu se vytvořila zcela nová, předtím neexistující, třída jménem `$Proxy0`, která je potomkem třídy `Animal` a imituje třídu `Dog`, ale vlastně se o psa nejedná. Přestože proxy není skutečným psem, tak má vnitřní proměnou, na kterou všechny požadavky deleguje (poté co provede vlastní logiku). Tady je pár užitečných diagramů.

![](/assets/2021-01-28/6e44b0_0e25f7771b974766b0469b5f346c6482_mv2.webp)

Z toho plyne poučení, že musíte mít společné rozhraní, které může proxy sdílet s původním objektem. V&nbsp;tomto případě je to rozhraní `Animal`. Bez tohoto rozhraní by nic z toho nefungovalo.

(Poznámka překladatele: ano, tady je jedno z mnoha zjednodušení, ale problematika cglib či javassist by celý článek značně zesložitila)

## Příklady použítí

### Spring Data JPA

Použijete-li anotaci `@Transactional` nad komponentou, kterou přes `@Autowired` použijete někde jinde, tak Spring tajně nainjektuje proxy původního objektu. Tato proxy zachytí požadavky a začne novou databázovou transakci.

### Spring Security

Použijete-li anotaci `@PreAuthorize` nad servisou, kterou přes `@Autowired` použijete někde jinde, tak Spring tajně nainjektuje proxy původního objektu. Tato proxy zachytí požadavky a zkontroluje zabezpečení předtím než zavolá skutečnou metodu na původním objektu.

### Hibernate

Když získáte objekt z databáze, tak vám Hibernate tajně vrátí proxy původního objektu. Používá to k implementaci lazy-loadingu: Načítání potřebných dat později, když nad proxy zavoláte getter.

## Závěr

Pravděpodobně si nikdy nebudete vytvářet vlastní proxy, ale je důležité porozumět tomu, jak je mnoho běžných knihoven zdánlivě tajně používá, abyste se nenechali oklamat, že pracujete se skutečným objektem. Tak teď už víte, jak kouzlo funguje.

## Související

- [StackOverflow - What is the difference between JDK dynamic proxy and CGLib?](https://stackoverflow.com/questions/10664182/what-is-the-difference-between-jdk-dynamic-proxy-and-cglib)

