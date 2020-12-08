---
layout: post
title:  "Nesprávná abstrakce"
date:   2020-12-08
categories: [software development]
disqusId: 233
tags: [překlad]
image: "/assets/2020-12-08/88771.png"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2020-12-08/88771.png" /></div>

Příspěvek [The Wrong Abstraction](https://sandimetz.com/blog/2016/1/20/the-wrong-abstraction) vyšel na blogu Sandi Metz 20. ledna 2016. [S laskavým svolením](https://twitter.com/suzanbond/status/1302027304688902146) překládám do češtiny.

_Původně jsem následující text sepsala pro [svůj newsletter](http://www.sandimetz.com/subscribe), ale neustále mi o této myšlence chodily zprávy na twitteru, takže jsem článek nakonec otiskla na svém blogu. Tato verze byla lehce upravena._

Přemýšlela jsem o důsledcích „nesprávné abstrakci.“ Moje přednáška [all the little things](https://youtu.be/8bZh5LMaSmE) na RailsConf 2014 obsahovala část, kde jsem předpokládala:
<div style="clear:both"></div>

> duplicita je mnohem levnější než nesprávná abstrakce

A v závěru jsem [radila](https://youtu.be/8bZh5LMaSmE?t=2142)

> dávejte přednost duplicitě před nesprávnou abstrakcí

<!--more-->

Tato malá část z mnohem větší přednášky vyvolala překvapivě silnou reakci. Pár lidí tvrdilo, že jsem se zbláznila, ale mnohem víc jich vyjádřilo podobné mínění:

{% twitter https://twitter.com/pims/status/442010383725760512?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E442010383725760512%7Ctwgr%5E%7Ctwcon%5Es1_&ref_url=https%3A%2F%2Fsandimetz.com%2Fblog%2F2016%2F1%2F20%2Fthe-wrong-abstraction %}

Síla reakce mě přiměla uvědomit si, jak rozšířený a těžko řešitelný problém nesprávná abstrakce je. Začala jsem si klást otázky a došla k následujícímu vzoru:

1. Programátor A vidí duplicitu
2. Programátor A extrahuje duplicitu a pojmenuje ji.<br />
_To vytvoří novou abstrakci. Může se jednat o novou metodu nebo možná dokonce o novou třídu_.
3. Programátor A nahradí duplicitu novou abstrakcí.<br />_Paráda, kód je perfektní. Programátor A vesele odkvačí._
4. Čas plyne
5. Objeví se nový požadavek. Stávající abstrakce je _téměř_ perfektní.
6. Programátor B dostane za úkol tento požadavek implementovat.<br />
_Programátor B se cítí poctěn zachovat existující abstrakci, ale jelikož není pro každý případ úplně stejná, tak upraví kód tak, aby bral parametr, a upraví logiku podmíněně, aby dělala správnou věc na základě hodnoty onoho parametru._<br />
_Co bylo jednou univerzální abstrakcí, se teď chová jinak pro různé případy._
7. Objeví se další požadavek.<br />
_Programátor X._<br />
_Další přidaný parametr._<br />
_Další podmínka._<br />
_Opakuj dokud se kód nestane nesrozumitelným._<br />
8. V příběhu se objevíte zhruba tady a váš život se dramaticky obrátí k horšímu.

Existující kód na nás velmi silně působí. Jeho přítomnost dokazuje, že je jednak správný a jednak nutný. Víme, že tento kód reprezentuje vynaložené úsilí a jsme odhodlaní ho zachovat. Smutnou pravdou bohužel je, že čím je kód komplikovanější a nesrozumitelnější, tím větší úsilí vyžadovalo ho napsat. Tudíž pociťujeme větší tlak na jeho zachování ([klam utopených nákladů](https://psychologie.cz/klam-utopenych-nakladu/)). Jako kdyby nám podvědomí říkalo: „Panečku, to je tak matoucí. To muselo trvat věky napsat to správně. To je jistě velmi, ale velmi, důležité. Bylo by hřích veškeré úsilí nechat přijít vniveč.“

Ocitnete-li se v tomto příběhu v bodě 8 (viz výše), můžete cítit povinnost posunout se vpřed tak, že implementujete nový požadavek jako změnu existujícího kódu. Nicméně je to nemilosrdný boj. Kód už nereprezentuje jedinou společnou abstrakci, nýbrž se stal procedurou obtěžkanou podmínkami a slepenou jen množstvím vágně souvisejících myšlenek. Je to obtížné pochopit a snadné rozbít.

V podobné situaci se pokuste nerozhodovat podle utopených nákladů. Při vypořádání se s nesprávnou abstrakcí je nejrychlejší cestou vpřed právě krok vzad. Udělejte následující:

1. Znovu zaveďte duplicity. Vložte abstrahovaný kód zpátky všude tam, kde se volá.
2. V místě volání omezte podmnožinu vloženého kódu podle parametru, který se používal pro výběr logiky.
3. Smažte kód, který v místě volání není potřeba.

To odstraní jak abstrakci tak podmínky a zmenší kód v místě použití jen na to, co je opravdu potřeba. Když tímto způsobem přetočíte rozhodnutí zpět, tak můžete obvykle zjistit, že se zdánlivě volala sdílená abstrakce, ale vykonávat se mohl celkem jiný kód. Jakmile kompletně odstraníte starou abstrakci, můžete začít nanovo izolovat duplicity a znovu extrahovat abstrakce.

Viděla jsem problémy, kdy se lidé udatně snažili pohnout vpřed s nesprávnou abstrakcí, ale málokdy uspěli. Přidání nové funkcionality bylo neuvěřitelně obtížné a každý úspěch jen dál komplikoval kód, což přidání další funkcionality činilo mnohem obtížnější. Když změnili úhel pohledu z „musím zachovat investice do tohoto kódu“ na „tento kód dával nějakou dobu smysl, ale možná jsme se z něj naučili všechno, co jsme mohli“, tak sobě dali svolení abstrakce si znovu promyslet ve světle současných požadavků. Jakmile vložili kód, cesta vpřed byla najednou jasná, přidání nové funkcionality rychlejší a snazší.

A z toho plyne poučení: Nenechte se chytit do pasti představující klam utopených nákladů. Přistihnete-li se přidávat parametr a podmíněnou logiku do vašeho sdíleného kódu, tak vězte, že abstrakce je nesprávná. Možná byla na začátku správná, ale ty dny již minuly. Jestliže prokážeme, že abstrakce je nesprávná, tak je nejlepší strategií znovu zavést duplicity a nechat si vyjevit, co je správné. Přestože tu a tam dává smysl nashromáždit pár podmínek, abychom získali vhled do toho, co se děje, tak budete méně trpět, když nesprávnou abstrakci opustíte raději dříve než později.

Je-li abstrakce nesprávná, je nejrychlejší cestou vpřed krok vzad. To není ústup z boje, naopak postup správným směrem. Udělejte to. Učiníte tak svůj život lepším (i život těch, kteří přijdou po vás).


## Související

- Sandi Metz je autorkou knihy [99 Bottles of OOP](https://www.sandimetz.com/99bottles), [recenze na goodreads](https://www.goodreads.com/book/show/31183020-99-bottles-of-oop)
- [Zpětná kompatibilita](https://blog.zvestov.cz/software%20development/2019/12/09/zpetna-kompatibilita.html)
