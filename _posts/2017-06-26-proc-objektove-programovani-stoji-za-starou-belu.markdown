---
layout: post
title:  "Proč stojí objektové programování za starou belu"
date:   2017-06-26
categories: [software development]
disqusId: 190
tags: [překlad]
---

Překlad článku [Why OO Sucks](http://harmful.cat-v.org/software/OO_programming/why_oo_sucks), který napsal [Joe Armstrong](https://twitter.com/joeerl). S jeho [laskavým svolením](https://twitter.com/joeerl/status/877411016807731200) jsem text přeložil do češtiny (překlad uvolňuji pod [licencí Creative Commons by-nc-sa](http://creativecommons.org/licenses/by-nc-sa/3.0/cz/)).

Když mi poprvé představili myšlenku OOP (objektově orientované programování), tak jsem byl skeptický, ale nevěděl jsem proč. Prostě jsem jen cítil, že je to špatně. OOP se stalo velmi populárním (později vysvětlím proč) a jeho kritika byla něco jako _klení v kostele_. OOP se stalo něčím, co každý slušný jazyk musel mít.

<!--more-->

Jak se Erlang stával populárnějším, ptali se nás: „Je Erlang objektově orientovaný?“ Pochopitelně správná odpověď byla: „Samozřejmě, že ne!“, ale neříkali jsem to nahlas. Takže jsme vymysleli důmyslnou odpověď, která měla zanechat dojem, že Erlang je (tak trochu) objektově orientovaný (když budete hodně mávat rukama) ale ne doopravdy (pokud jste poslouchali, co jsme ve skutečnosti říkali, a pečlivě četli drobné písmo).

Vzpomínám si na úvodní přednášku, kterou tehdy měl ředitel francouzské IBM na sedmém ročníku konference IEEE Logic programming v Paříži. IBM prolog přidal spoustu objektově orientovaných rozšíření. Na moji otázku proč, odpověděl:

> Naši zákazníci chtěli objektově orientovaný prolog, tak jsme udělali objektově orientovaný prolog.

Jak snadné, bez výčitek svědomí, bez sebezpytování, bez ptaní se: „Je to správná věc?“

## Proč stojí objektové programování za starou belu
Moje zásadní námitky k OOP se týkají základních myšlenek. Některé z nich vyjmenuji a přidám k nim svoje námitky.

### Námitka 1 - Datové struktury a funkce by se neměly míchat
Objekty svazují funkce a datové struktury v nedělitelné jednotky. Domnívám se, že jde o základní chybu, protože datové struktury a funkce patří do úplně odlišných světů. Proč?

* Funkce něco dělají. Mají vstupy a výstupy. Tyto vstupy a výstupy jsou datové struktury, které jsou modifikované funkcemi. Ve většině jazycích jsou funkce vytvořeny sekvencí imperativů: „Udělej tohle a pak tohle…“ Abyste porozuměli funkcím, musíte porozumět pořadí, v jakém věci vykonají.
* Datové struktury prostě jsou. Nedělají vůbec nic. Jsou ve své podstatě deklarativní. _Porozumění_ datové struktuře je mnohem snazší než _porozumění_ funkci.

Funkce jsou vnímány jako černé skříňky, které transformují vstup do výstupu. Jestliže  rozumím vstupu a výstupu, tak rozumím funkci. _To ovšem neznamená, že zvládnu funkci napsat._

Funkcím obvykle _porozumíme_ pozorováním, že jsou věcmi v počítačovém systému, jejichž úkolem je transformovat datové struktury typu T1 do datové struktury typu T2.


**Jelikož jsou funkce a datové struktury úplně odlišné živočišné druhy, je zásadní chybou zamykat je do jedné klece.**

### Námitka 2 - Všechno musí být objekt

Vezměme si  _čas_. V OOP jazycích musí _čas_ být objekt. Ale v ne-OOP jazycích je _čas_ instancí datového typu. Například v Erlangu je mnoho různých variant času, který může být jasně a jednoznačně specifikovaný následujícím způsobem:

    -deftype day() = 1..31.
    -deftype month() = 1..12.
    -deftype year() = int().
    -deftype hour() = 1..24.
    -deftype minute() = 1..60.
    -deftype second() = 1..60.
    -deftype abstime() = {abstime, year(), month(), day(), hour(), min(), sec()}.
    -deftype hms() = {hms, hour(), min(), sec()}.
    ...

Všimněte si, že tyto definice nepatří žádnému konkrétnímu objektu. Jsou všudypřítomné a datové struktury reprezentující čas můžou být zpracovány jakoukoliv funkcí v systému.

Neexistují žádné související metody.

### Námitka 3 - V OOP jsou definice datových typů rozprostřené úplně všude

V OOP patří definice datových typů objektům, takže nemůžu najít všechny definice datových typů na jednom místě. V Erlangu nebo C můžu definovat všechny své datové typy v jediném hlavičkovém souboru nebo data dictionary. V OOP to nejde - datové typy jsou rozprostřené všude možně.

Dovolte mi uvést příklad. Předpokládejme, že chci definovat všudypřítomnou datovou strukturu. *Všudypřítomný* datový typ je datový typ, který se objevuje _na všech místech_ v systému. 

Jak lisp programátoři již dlouhou dobu vědí, je lepší mít menší počet všudypřítomných datových typů a velké množství malých funkcí, které s nimi pracují, než mít velký počet datových typů a malé množství funkcí, které s nimi pracují.

Všudypřítomná datová struktura je něco jako spojový seznam, pole nebo hash tabulka či pokročilejší objekt jako čas, datum nebo soubor.

V OOP si musím vybrat nějaký základní objekt, ve kterém všudypřítomnou datovou strukturu definuju. Všechny ostatní objekty, které chtějí tuto datovou strukturu použít, musí dědit od tohoto objektu. Předpokládejme, že chci vytvořit něco jako objekt _čas_. Kam patří a do jakého objektu?

### Námitka 4 - Objekty mají private stav

Stav je příčinou všeho zla. V jednotlivých funkcích s vedlejším efektem bychom se mu měli vyhnout. Zatímco v programovacích jazycích je stav nežádoucí, tak reálný svět jím oplývá. Velmi mě zajímá stav mého bankovního účtu, a když si vložím nebo vyberu peníze, tak očekávám, že stav mého bankovního účtu bude správně upraven.

Stav existuje v reálném světě. Co by tedy měly programovací jazyky poskytnou, aby s ním šlo pracovat?

* OOP říká: „Skryj stav před programátorem.“ Stav je skrytý a viditelný jen přes funkce. 
* Konvenční programovací jazyky (C, Pascal) říkají, že viditelnost proměnných se stavem je kontrolována pravidly oblasti platnosti (scope) jazyka. 
* Čistě deklarativní jazyky říkají, že stav neexistuje.

Globální stav systému vstupuje do všech funkcí a ze všech funkcí vystupuje. Mechanismy jako monády (pro funkcionánlí jazyky) a [DCG](https://en.wikipedia.org/wiki/Definite_clause_grammar) (logické jazyky) jsou použity ke skrytí stavu před programátory, takže mohou programovat, _jako kdyby na stavu nezáleželo_, ale pokud by to bylo nutné, tak mají ke stavu plný přístup.

Možnost _skrýt stav před programátorem_, kterou vybralo OOP, je tou nejhorší možnou. Místo toho, aby stav odhalili a pokusili se najít způsob, jak minimalizovat potíže s ním spojené, tak ho skryjí.

## Proč bylo OOP tak populární?

* Důvod 1 - Domnívali jsem se, že je snadné se ho naučit.
* Důvod 2 - Domnívali jsem se, že znovupoužitelnost kódu bude snazší.
* Důvod 3 - Byl kolem toho humbuk.
* Důvod 4 - Vytvořilo to nové odvětví softwarového průmyslu.

Nevidím důkaz pro 1 a 2. Důvody 3 a 4 se zdají být hnací silou této technologie. Jestliže technologie jazyka je tak špatná, že vytvoří nové průmyslové odvětví, aby vyřešila problémy, které sama způsobila, tak to musí být dobrý nápad pro chlápky, kteří chtějí vydělat peníze.

To je skutečná hnací síla OOP.

## Související

* [Přebal javy](/software%20development/2013/05/23/prebal-javy.html)