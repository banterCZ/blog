---
layout: post
title:  "TDD jako podvojné účetnictví"
date:   2014-10-20
categories: [software development]
disqusId: 155
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="http://www.amazon.com/gp/product/0132350882/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0132350882&linkCode=as2&tag=blog0752-20&linkId=EGVITLM3K6XSR5CM"><img border="0" src="https://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=0132350882&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=blog0752-20" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=blog0752-20&l=as2&o=1&a=0132350882" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></div>Narazil jsem na pět let starý blog post <a href="http://unhandled-exceptions.com/blog/index.php/2009/02/15/uncle-bob-tdd-as-double-entry-bookkeeping/comment-page-3/">Uncle Bob: TDD As Double-Entry Bookkeeping</a>, kde je přepis části videozáznamu diskuze ohledně TDD. Konkrétně citát Robert C. Martina, autora knihy <a href="http://amzn.to/1wkixFY">Clean Code</a>. Byl tak laskav, že <a href="https://twitter.com/unclebobmartin/status/524168266668072960">neměl námitek proti překladu</a>.
<!--more-->

<blockquote style="clear:both">Software je pozoruhodně citlivá disciplína. Když sáhnete do spodní vrstvy kódu a změníte jeden bit, můžete tím shodit software. Jděte do paměti a pohrávejte si náhodně s jedním bitem a velmi pravděpodobně vyvoláte nějakou formu havárie. Velmi, velmi málo systému je takto citlivých. Můžete vyrazit na jeden z tamtěch mostů, začít odmontovávat šrouby a pravděpodobně nespadnou. Mohl bych vytáhnout pistoli a začít náhodně střílet a pravděpodobně bych nezabil příliš mnoho lidí. Mohl bych jich pár zranit — ale víte — můžete schytat kulku do nohy nebo do plíce a nejspíš přežijete. Lidé jsou odolní — přežijí ztrátu nohy a tak dále. Mosty jsou odolné — přestojí ztrátu součástek. Ale software není vůbec odolný: změna jediného bitu a — BUM! - spadne. Velmi málo disciplín je takto citlivých.

Ale existuje další disciplína a tou je <em>účetnictví</em>. Správná chyba ve správný čas ve správné tabulce — tahle jednociferná chyba může zničit firmu a poslat pachatele do vězení. Jak účetní zvládají takovou citlivost? No, mají disciplínu. A jedna ze základních disciplín je podvojné účetnictví. Vše je řečeno dvakrát. Každá transakce je vložena dvakrát — jednou na stranu <em>má dáti</em> a jednou na stranu <em>dal</em>. Tyto dvě transakce sledují oddělené matematické cesty dokud neskončí v tomto skvělém odčítání na účetní rozvaze, které musí vést k nule.<sup>[<a href="#1">1</a>]</sup>

To je test-driven development: podvojné účetnictví. Vše je řečeno dvakrát&nbsp;—&nbsp;jednou na straně testů a jednou na straně produkčního kódu a vše se vykoná v běhu, který vede buď k zelené nebo červené čáře stejně jako nula na účetní rozvaze. Zdá se, že je to pro nás dobrý postup: přiznat a zvládnout tuto citlivost naší disciplíny.</blockquote>

Související články
------

* <a href="/item/142">Stavebnictví versus softwarové inženýrství</a>
* <a href="/item/112">Jak přesvědčit, že je správné psát testy</a>

Poznámky
------

<a name="1"></a>[1] Účetní říkala, že to moc nedává smysl, ale nechtěl jsem do toho mistrovi moc zasahovat. Prý je ustálený obrat: „Rozvaha musí být vyrovnaná“, ale myslím, že pro nás programátory je srozumitelnější ten popis s nulou.