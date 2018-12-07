---
layout: post
title:  "Trocha architektury"
date:   2016-01-13
categories: [software development]
disqusId: 171
tags: [překlad, Uncle Bob]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://www.flickr.com/photos/spacexphotos/17170624642"><img src="https://c2.staticflickr.com/8/7624/17170624642_454b8ddb24_m.jpg" /></a><br/><a href="https://www.flickr.com/photos/spacexphotos/17170624642">SpaceX</a> (<a href="https://creativecommons.org/publicdomain/zero/1.0/">CC0 1.0</a>)</div>Zamýšlel jsem se nad tím, <a href="/item/169">jak by programátor mohl naložit s druhou dekádou své kariéry</a>. Jednou z možných pozic je i softwarový architekt. <a href="https://twitter.com/unclebobmartin/status/685198214346223616">S laskavým svolením Roberta C. Martina</a>, mimo jiné autora knihy <a href="http://amzn.to/1wkixFY">Clean Code</a>, přináším překlad jeho rozhovoru mistra s učněm o softwarové architektuře.
	
4\. ledna 2016	
	
Chci se stát softwarovým architektem.
<blockquote><em>To je pěkný cíl pro mladého softwarová vývojáře</em></blockquote>Chci vést tým a dělat všechna důležitá rozhodnutí o databázích, frameworcích, webových serverech a podobných věcech.
<blockquote><em>Uf. Takže se vůbec nechceš stát softwarovým architektem.</em></blockquote>
<!--more-->

Ovšem že chci. Chci být někdo, kdo dělá všechna důležitá rozhodnutí.
<blockquote><em>To je v pořádku, ale nevyjmenoval jsi důležitá rozhodnutí. Zmínil jsi ta irelevantní.</em></blockquote>Co tím myslíš? Databáze není důležité rozhodnutí? Víš kolik za ně utrácíme?
<blockquote><em>Pravděpodobně příliš. A ne, databáze není jedno z nejdůležitějších rozhodnutí.</em></blockquote>Jak to můžeš říct? Databáze je srdce systému. Je to místo, kde jsou všechna data organizovaná, setříděná, zaindexovaná a přístupná. Bez nich bych žádného systému nebylo!
<blockquote><em>Databáze je pouze IO zařízení. A zrovna poskytuje užitečné nástroje pro třídění, dotazování a reportování, ale to je pro architekturu systému jen pomocné.</em></blockquote>Pomocné? To je šílené.
<blockquote><em>Ano, pomocné. Byznys pravidla tvého systému můžou z těchto nástrojů nějak profitovat, ale tyto nástroje pro ně nejsou podstatné. Pokud bys musel, mohl bys je nahradit jinými nástroji, ale tvá byznys pravidla by zůstala stále stejná.</em></blockquote>No jo, ale musel bych je naprogramovat znovu, protože používají nástroje původní databáze.
<blockquote><em>Tak to je tvůj problém.</em></blockquote>Co tím myslíš?
<blockquote><em>Tvůj problém je to, že věříš, že byznys pravidla záleží na nástrojích databáze. Nezáleží. Nebo by alespoň neměla, pokud jsi vytvořil dobrou architekturu.</em></blockquote>To je šílený rozhovor. Jak můžu vytvořit byznys pravidla tak, že nepoužiju nástroje, které musí byznys pravidla použít.
<blockquote><em>Neřekl jsem, že nepoužijí nástroje databáze. Řekl jsem, že by na nich neměla záviset. Byznys pravidla by neměla vědět jakou konkrétní databázi používají.</em></blockquote>Jak získáš byznys pravidla, aniž bys o nich věděl?
<blockquote><em>Obrátil jsi závislost. Databáze musí záviset na byznys pravidlech. Ujisti se, že byznys pravidla nezávisí na databázi.</em></blockquote>Blábolíš.
<blockquote><em>Právě naopak, mluvím jazykem softwarové architektury. To je princip Dependency Inversion. <a href="https://www.zdrojak.cz/clanky/navrhove-principy-solid/">Třídy nižší úrovně abstrakce by měly záviset na třídách vyšší úrovně abstrakce</a>.</em></blockquote>Nesmysl! Vyšší úrovně abstrakce (předpokládám, že tím myslíš byznys pravidla) volají nižší úrovně abstrakce (předpokládám, že tím myslíš databázi). Takže vyšší úrovně abstrakce závisí na nižších úrovních abstrakce stejným způsobem, jako volající závisí na volaném. To přeci ví každý!
<blockquote><em>V běhu je to pravda. Ale při kompilaci chceme závislosti obrátit. Zdrojový kód vyšší úrovně abstrakce by neměl zmiňovat zdrojový kód nižší úrovně abstrakce.</em></blockquote>Ale no tak! Nemůžeš volat něco, aniž bysto to zmínil.
<blockquote><em>Samozřejmě že ne. O tom celém je objektová orientace.</em></blockquote>Objektová orientace je o vytváření modelů skutečného světa, je o kombinování dat a funkcí do soudržných objektů. Je o organizování kódu do intuitivní struktury.
<blockquote><em>To ti řekli?</em></blockquote>To ví každý, je to zřejmá pravda.
<blockquote><em>Bezpochyby. Bezpochyby. A přesto užitím principů objektové orientace můžeš skutečně zavolat něco, aniž bys to zmínil.</em></blockquote>Dobrá. Jak?
<blockquote><em>Víš, že objekty navržené objektově orientované si navzájem posílají zprávy?
</em></blockquote>Ano. Jistě.
<blockquote><em>A víš, že odesílatel zprávy nezná typ příjemce?</em></blockquote>Záleží na jazyku. V Javě zná odesílatel alespoň základní typ příjemce. V Ruby zná odesílatel alespoň to, že příjemce zvládne odeslanou zprávu zpracovat.
<blockquote><em>Pravda. Ale ani v jednou případě nezná odesílatel přesný typ příjemce.</em></blockquote>Jo. Jistě.
<blockquote><em>Takže odesílatel může zavolat funkci příjemce, aniž by znal přesný typ příjemce.</em></blockquote>Jo. Správně. Chápu. Ale odesílatel bude stále záviset na příjemci.
<blockquote><em>V běhu ano. Ale ne při kompilaci. Zdrojoví kód odesílatele nezmiňuje a ani nezávisí na kódu příjemce. Zdrojový kód příjemce ve skutečnosti závisí na zdrojovém kódu odesílatele.</em></blockquote>Ne! Odesílatel stále závisí na třídě, které zasílá zprávy.
<blockquote><em>Trocha zdrojového kódu to snad ozřejmí. Napíšu to v Javě. Nejprve balíček <code>sender</code>:</em></blockquote><pre><code>package sender;

public class Sender {
  private Receiver receiver;

  public Sender(Receiver r) {
    receiver = r;
  }

  public void doSomething() {
    receiver.receiveThis();
  }

  public interface Receiver {
    void receiveThis();
  }
}
</code></pre><blockquote><em>Pak balíček <code>receiver</code>.</em></blockquote>

<pre><code>package receiver;

import sender.Sender;

public class SpecificReceiver implements Sender.Receiver {
  public void receiveThis() {
    //do something interesting.
  }
}
</code></pre><blockquote><em>Povšimni si, že balíček <code>receiver</code> závisí na balíčku <code>sender</code>. Rovněž si všimni, že <code>SpecificReceiver</code> závisí na <code>Sender</code>. Taky si všimni, že cokoliv v balíčku <code>sender</code> neví vůbec nic o balíčku <code>receiver</code>.</em></blockquote>Jo, ale podváděl jsi. Dal jsi rozhraní příjemce do třídy odesílatele.
<blockquote><em>Zelenáči, začínáš tomu rozumět.</em></blockquote>Rozumět čemu?
<blockquote><em>Principům architektury samozřejmě. Odesílatel vlastní rozhraní, které musí příjemci implementovat.</em></blockquote>No pokud to znamená, že musím používat vnořené třídy, tak...
<blockquote><em>Vnořené třídy jsou jen jedním způsobem, jak toho dosáhnout. Jsou i jiné.</em></blockquote>Dobrá, počkej. Co to má dělat s databázemi? Tím jsme naši konverzaci začali.
<blockquote><em>Podívejme se na další kód. Nejprve jednoduché byznys pravidlo.</em></blockquote><pre><code>package businessRules;

import entities.Something;

public class BusinessRule {
  private BusinessRuleGateway gateway;

  public BusinessRule(BusinessRuleGateway gateway) {
    this.gateway = gateway;
  }

  public void execute(String id) {
    gateway.startTransaction();
    Something thing = gateway.getSomething(id);
    thing.makeChanges();
    gateway.saveSomething(thing);
    gateway.endTransaction();
  }
}
</code></pre>Tohle byznys pravidlo toho moc nedělá.
<blockquote><em>To je jen příklad. Měl bys mnoho podobných tříd implementujících hodně různých byznys pravidel.</em></blockquote>Ok, a co je <code>Gateway</code> tentononc?
<blockquote><em>Poskytuje metody na získání dat použitých v byznys pravidle. Je implementován následovně:</em></blockquote><pre><code>package businessRules;

import entities.Something;

public interface BusinessRuleGateway {
  Something getSomething(String id);
  void startTransaction();
  void saveSomething(Something thing);
  void endTransaction();
}
</code></pre><blockquote><em>Všimni si, že je v balíčku <code>businessRules</code>.</em></blockquote>Jo ok. A co za třídu je <code>Something</code>?
<blockquote><em>Ta reprezentuje jednoduchý byznys objekt. Vložil jsem ji do balíčku jménem <code>entities</code>.</em></blockquote><pre><code>package entities;

public class Something {
  public void makeChanges() {
    //...
  }
}
</code></pre><blockquote><em>A konečně implementace <code>BusinessRuleGateway</code>. To je ta třída, která ví o aktuální databázi:</em></blockquote><pre><code>package database;

import businessRules.BusinessRuleGateway;
import entities.Something;

public class MySqlBusinessRuleGateway implements BusinessRuleGateway {
  public Something getSomething(String id) {
    // use MySql to get a thing.
  }

  public void startTransaction() {
    // start MySql transaction
  }

  public void saveSomething(Something thing) {
    // save thing in MySql
  }

  public void endTransaction() {
    // end MySql transaction
  }
}
</code></pre><blockquote><em>Znovu si všimni, že byznys pravidla v běhu volají databázi, ale při kompilaci je to balíček <code>database</code>, který zmiňuje a závisí na balíčku <code>businessRules</code>.</em></blockquote>Ok, ok, myslím, že chápu. Prostě používáš polymorfismus, abys před byznys pravidly skryl implementaci databáze.
<blockquote><em>Ne, vůbec ne. Nepokoušíme se byznys pravidlům poskytnout všechny nástroje databáze. Raději mějme rozhraní byznys pravidel jen pro to, co potřebují. Implementace těchto rozhraní  může volat vhodný nástroj.</em></blockquote>Jo, ale když byznys pravidla potřebují všechny nástroje, pak je prostě musíš všechny dát do rozhraní <code>gateway</code>
<blockquote><em>Ach, vidím, že tomu stále ještě nerozumíš.</em></blockquote>Nerozumím čemu? Mně se to zdá naprosto jasné.
<blockquote><em>Každé byznys pravidlo definuje rozhraní jen pro přístup k tomu, co potřebuje.
</em></blockquote>Počkej. Cože?
<blockquote><em>Nazývá se to princip oddělení rozhraní (Interface Segregation Principle – ISP). Každá třída byznys pravidla použije z možností databáze pouze něco. A tak každé byznys pravidlo poskytne rozhraní, které k dané možnosti poskytuje přístup.</em></blockquote>Ale to znamená, že budeš mít spoustu rozhraní a spoustu malých tříd (implementujících tato rozhraní), které volají další databázové třídy.
<blockquote><em>Dobře. Zdá se, že tomu začínáš rozumět.</em></blockquote>Ale to je nepořádek a ztráta času. Proč bych to dělal?
<blockquote><em>Dělal bys to proto, abys udržel pořádek a ušetřil čas.</em></blockquote>Ale no tak. Je to jen spousta kódu.
<blockquote><em>Právě naopak. Jsou to důležitá architektonická rozhodnutí, která ti dovolí odložit irelevantní rozhodnutí.</em></blockquote>Co tím myslíš?
<blockquote><em>Pamatuješ, jak jsi říkal, že bys chtěl být softwarový architekt? Že chceš dělat opravdu důležitá rozhodnutí?</em></blockquote>Ano, to chci.
<blockquote><em>Mezi rozhodnutími, která jsi chtěl dělat, byly databáze, webové servery a frameworky.</em></blockquote>Jo a ty jsi říkal, že to nejsou důležitá rozhodnutí, že jsou irelevantní.
<blockquote><em>Správně, to jsou.  Důležitá rozhodnutí, která dělá softwarový architekt, jsou ta, která ti dovolí <strong>nedělat</strong> rozhodnutí o databázi, webových serverech a frameworcích. </em></blockquote>Ale nejprve tato rozhodnutí musíš udělat.
<blockquote><em>Ne, nemusíš. Vskutku chceš, aby ti bylo dovoleno udělat tato rozhodnutí mnohem později ve vývojovém cyklu, až když máš víc informací.</em></blockquote>
<blockquote><em>Běda architektovi, který předčasně rozhodne o databázi a pak zjistí, že souborový systém by býval stačil.</em></blockquote>
<blockquote><em>Běda architektovi, který předčasně rozhodne o webovém server a pak zjistí, že jediné, co tým opravdu potřeboval, bylo jednoduché socketové rozhraní.</em></blockquote>
<blockquote><em>Běda týmu, jehož architekt na ně předčasně uvalí framework, je aby zjistil, že framework poskytuje sílu, kterou nepotřebují, ale přidává omezení, se kterými nedokážou žít.</em></blockquote><blockquote><em>Požehnaný tým, jehož architekt poskytl prostředky, díky kterým můžou tato rozhodnutí odložit na dobu, kdy budou mít dost informací.</em></blockquote><blockquote><em>Požehnaný tým, jehož architekt je izoloval od pomalých a na zdroje náročných IO rozhraní a od frameworků, takže můžou vytvořit rychlé a odlehčené testovací prostředí.</em></blockquote><blockquote><em>Požehnaný tým, jehož architekt se stará o to, co má skutečně smysl, a odkládá věci, které ho nemají.</em></blockquote>Hloupost. Vůbec tě nechápu.
<blockquote><em>No snad za deset let nebo tak nějak... Pokud tou dobou nebudeš manažer.</em></blockquote>

Související
------

* <a href="http://www.dagblog.cz/2015/01/mytus-nekodujiciho-architekta_26.html">Roman Dagi Pichlík - Mýtus nekódujícího architekta</a>
* <a href="/item/155">Robert C. Martin - TDD jako podvojné účetnictví</a>