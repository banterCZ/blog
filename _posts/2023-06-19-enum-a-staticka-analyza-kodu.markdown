---
layout: post
title:  "Enum a statická analýza kódu"
date:   2023-06-19
categories: [software development]
disqusId: 259
image: "/assets/2023-06-19/1267371838.png"
tags: [Java]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2023-06-19/1267371838.png" /></div>

Je o mně známo, že jsem fanouškem [Junior Guru](https://junior.guru/).
Nejedná se jen o [příručku o hledání první práce v IT](/software%20development/2020/09/21/prirucka-o-hledani-prvni-prace-v-it.html), ale o celou podporující komunitu.
Rád bych se tam zapojit do mentoringu, ale kapacita mých dobrovolnických aktivit naráží na limity.
Nicméně měl bych jednu univerzální radu, kterou neustále opakuji a stále vídám i u lidí z praxe.
V učení neexistují rychlé zkratky, ovšem tohle můžete snadno začít používat a zrychlit tempo učení.
Tou tajemnou ingrediencí je statická analýza kódu.
Ukážeme si to na příkladu `enum`.

<div style="clear:both"></div>
<!--more-->


## Úvod

O statické analýze kódu jsem na blogu již několikrát psal, ale opakování není nikdy dost.

Nejen v Java světě mám na mysli nástroje [PMD](https://pmd.github.io/),
[Checkstyle](https://checkstyle.org/),
[SpotBugs](https://spotbugs.github.io/),
[SonarQube](https://www.sonarsource.com/products/sonarqube/),
[Coverity Scan](https://scan.coverity.com/) a mnohé další.
Nemluvě o radách, které vám dává samotné IDE.
Neříkám, ať si instalujete všechno a hned.
Doporučoval bych sledovat alespoň to, co vám poradí IntelliJ IDEA spolu s [SonarLint pluginem](https://plugins.jetbrains.com/plugin/7973-sonarlint).
Místopřísežně prohlašuji, že po letech programování se učím stále něco nového.
Nemyslím si, že byste měli rezignovat na čtení knih jako [Effective Java, Joshua Bloch](https://www.oreilly.com/library/view/effective-java-3rd/9780134686097/),
ale proč si nezapnout automatickou kontrolu, že?

Ještě bych chtěl dodat, že nejde o slepé následování pravidel.
Snažil jsem se naučit trochu fotografovat, tam jde taky o to osvojit si základní osvědčená pravidla kompozice a expozice.
Jasné, umělci pravidla porušují, ale vědí (alespoň intuitivně) proč to dělají a čeho tím dosáhnou. 


## Enum

Pojďme se podívat konkrétně na pravidlo [Enum values should be compared with `==`](https://rules.sonarsource.com/java/RSPEC-4551).
Připomeňme, že [operátor `==` porovnává reference (místo v paměti) zatímco k porovnání ekvivalence objektů slouží metoda `equals`](/software%20development/2022/12/29/autoatlas-javy.html#equals-a-hashcode).
Občas to dožene i ostřílené programátory.
Ano, stalo se to i mně.
Na svoji obhajobu uvádím, že to bylo v rámci refaktoringu a kompilátor si na to nestěžoval.
Tohle pravidlo by však podobné chybě dokázalo zabránit.

Jak pravidlo uvádí, použití `==` nad _enum_:

- vrací stejný výsledek porovnání (obsahu) jako `equals`
- je více _null-safe_ než `equals()`
- poskytuje kontrolu už v době kompilace (statickou) než kontrolu až za běhu

Následující kód se nezkompiluje. A i když změníte `String` za `Fruit`, tak za běhu nedostanete `NullPointerException`
(na rozdíl od `equals`, kde si musíte dávat pozor na pořadí, dávat konstanty na první místo nebo nejprve kontrolovat, zda proměnná není `null`).

```java
String currentFruit = null;
if (currentFruit == Fruit.APPLE) {
// ...
```


## Závěr

Doporučuji začít používat nějakou statickou analýzu kódu.
Sledujte, co vám to nadhodí.
Pravidla můžete selektivně odebírat či dokonce přidávat.
Zároveň lze měnit jejich závažnost.
Ze začátečníků to mávnutím kouzelného proutku profíky neudělá, ale učení může výrazně zrychlit.
Minimálně uděláte dojem s odevzdaným úkolem na pohovor (alespoň u mě 😉), když to nebude samý `warning`.
~~Ani profíci by tím nemuseli opovrhovat~~ (ne, to nebudou [zralí inženýři](https://zdrojak.cz/clanky/byti-seniornim-inzenyrem/)). 


## Související

- [Pull request verifier](/software%20development/2017/07/31/pull-request-verifier.html)
- [Pravidlo 30 – kdy jsou metoda, třída nebo subsystém příliš velké](/software%20development/2017/03/09/pravidlo-30-kdy-je-metoda-prilis-velka.html)
- [Příručka o hledání první práce v IT](/software%20development/2020/09/21/prirucka-o-hledani-prvni-prace-v-it.html)
- [Autoatlas Javy](/software%20development/2022/12/29/autoatlas-javy.html)
- [Jak býti seniorním inženýrem](https://zdrojak.cz/clanky/byti-seniornim-inzenyrem/)
