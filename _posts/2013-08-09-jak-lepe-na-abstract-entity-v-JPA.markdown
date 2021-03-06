---
layout: post
title:  "Jak lépe na abstract entity v JPA"
date:   2013-08-09
categories: [software development]
disqusId: 137
tags: [JPA]
image: "/assets/2013-08-09/db.png"
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2013-08-09/db.png" /></div>Absolvoval jsem svůj doposud <a href="http://www.sw-samuraj.cz/2013/07/hledam-do-sveho-tymu-java-vyvojare.html">nejlepší technický pohovor</a> (ne, v <a href="/item/106">Google přijímací pohovor rozhodně lepší nebyl</a>). Nikdo nedělal ramena s asymptotickou složitostí apod. Ba právě naopak to bylo velmi inspirující. Kromě toho, že jsem pochytil takové drobnosti jako unixový příkaz <a href="http://www.computerhope.com/unix/tree.htm">tree</a>, jsem se hlavně přiučil, jak psát lépe abstract entity v JPA. SoftWare Samuraj měl pochopitelně k mému kódu zvídavé otázky a podnětné připomínky, které mě přiměly se na kód znovu podívat a zamyslet se.
<!--more-->

Měl jsem abstraktní entitu s abstraktním getterem a setterem pro primární klíč, ale bez samotné deklarace fieldu, protože v každé tabulce se sloupec jmenoval jinak.

{% gist banterCZ/6164789 %}

Samotné mapování lze překrýt pomocí anotace <a href="http://docs.oracle.com/javaee/6/api/javax/persistence/AttributeOverride.html">AttributeOverride</a>. Zbývá ještě dořešit to, že každá entita má vlastní databázovou sekvenci. Ovšem i to lze nastavit.

{% gist banterCZ/6164973 %}

Řekněte sami, není to takhle hezčí?

Ještě doplním, že více <i>AttributOverride</i> je možné sdružit do <a href="http://docs.oracle.com/javaee/6/api/javax/persistence/AttributeOverrides.html">AttributeOverrides</a>. K překrytí asociací analogicky použijete <a href="http://docs.oracle.com/javaee/6/api/javax/persistence/AssociationOverride.html">AssociationOverride</a> a <a href="http://docs.oracle.com/javaee/6/api/javax/persistence/AttributeOverrides.html">AttributeOverrides</a>.