---
layout: post
title:  "Kniha Real-World Cryptography"
date:   2025-09-16
categories: [software development]
disqusId: 280
image: "/assets/2025-09-16/50090498.jpg"
tags: [kniha, security]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2025-09-16/50090498.jpg" /></div>
Kniha [Real-World Cryptography](https://www.goodreads.com/book/show/50090498-real-world-cryptography) od David Wong je to nejpřístupnější, co si můžete o kryptografii přečíst, alespoň co je mi známo.
Dostatečně jednoduchá, abych ji pochopil.
Dostatečně složitá, abych se k ní musel vrátit.
Dál byste v podstatě nemuseli číst tento příspěvek a mohli si jít knihu rovnou koupit.
Nicméně uvádím, jak jsem ke svému závěru došel.

<!--more-->
<div style="clear: both"></div>


## Úvod

Posledních dvanáct let se motám kolem software, který se více či méně týká počítačové bezpečnosti.
Aby bylo jasno, nejsem kryptolog a nikdy jím nebudu, ale podílel jsem se například na [vydávání biometrických pasů](/software%20development/2015/12/15/jak-funguje-biometricky-pas.html).
Každopádně se snažím v oboru celou dobu vzdělávat.
No a není to snadné.
Obor je to komplexní.
Že jste udělali chybu, se může projevit až později jako obrovský průšvih.
Když věci ladíte, někdy stačí jediný bit jinak a celé je to špatně, ale nevíte proč.


## Co jsem zatím četl

Naprostá nutnost je [Kniha kódů a šifer](https://www.goodreads.com/review/show/712097358) od Simon Singh (překlad Petr Koubský).
V roce 2022 vyšel dotisk (již 4. české vydání), tak by měla být k mání.
Je to populárně naučné, velmi čtivé.
Pracovně si s tím však nevystačíte.

Kdysi jsem četl [Java Cryptography](https://goodreads.com/book/show/634845.Java_Cryptography__Java_Series_) (Jonathan Knudsen).
Dnes už prehistorie z roku 1998, popisující _Java Cryptography Architecture_ (JCA) v Java 1.2
Dlouho jsem to neměl v ruce.
API asi ještě bude platit.
Ale úplně chybí knihovna [Bouncy Castle](https://www.bouncycastle.org/) a píše se tam ještě o SHA-1.

Sáhl jsem tedy po [Java Cryptography: Tools and Techniques](https://goodreads.com/book/show/42372440.Java_Cryptography_Tools_and_Techniques).
To je extrém z druhé strany, já bych to pojmenoval _Bouncy Castle Recipes_, tedy ukázky kódu, jak používat Bouncy Castle.
Chybí vysvětlení konceptů.
Pro mě těžko přístupné.
Zkrátka moc velký znalostní skok.


## Kurzy

Na Coursera jsem před lety absolvoval kurz [Cryptography I](https://www.coursera.org/course/crypto).
Očekávaná zátěž sedm hodin týdně.
Zvládal jsem jen teorii, praktické úlohy už ne.
Dan Boneh je skvělý lektor, kurz je kvalitní, ale dost zaměřený na formální matematiku, což možná není to, co právě hledáte.


## Real-World Cryptography

Konečně se dostávám ke knize Real-World Cryptography, kterou považuji za poklad.
Vyšla v nakladatelství Manning, což už je záruka samo o sobě.

> Většina zdrojů je poměrně náročná na matematiku a většina vývojářů, kteří se zabývají kryptografií, se nechce zabývat matematikou.

Didakticky mě velmi oslovila.
Staví znalosti od základních kamenů po složitější.
Přijde mi, že vysvětluje principy a vykládá jen tu nejnezbytnější matematiku.
Nezahlcuje, ale nechává prostor k dalšímu samostudiu.

Věnuje se dokonce kryptoměnám i FIDO2.
Vysvětluje protokol Signal (který používá i WhatsApp).
Popisuje i _post-quantum cryptography_, tedy kryptografii odolné vůči útoku za pomoci výpočetního výkonu kvantových počítačů.
Ač kniha vyšla v roce 2021, kdy tyto algoritmy ještě nebyly standardizované, nijak vás nesvede na scestí.

Dál obsah pitvat nebudu, můžete [si udělat představu sami](https://www.manning.com/books/real-world-cryptography).

> Chci, abyste si uvědomili, že jste v privilegované pozici.
> Kryptografie začala jako obor za zavřenými dveřmi, omezený pouze na členy vlády nebo akademiky udržované v tajnosti, a pomalu se stala tím, čím je dnes: vědou otevřeně studovanou po celém světě.


## Závěr

Doporučuji všem (nejen programátorům), kteří potřebují kryptografii nějak používat (což jsou stejně všichni).
Dostatečně jednoduchá, abych ji pochopil.
Dostatečně složitá, abych se k ní musel vrátit a pak pokračoval ve studiu jinde.


## Související

- [Jak funguje biometrický pas](/software%20development/2015/12/15/jak-funguje-biometricky-pas.html)
- [On-line studium na Coursera](/software%20development/2014/11/02/on-line-studium-na-coursera.html)
