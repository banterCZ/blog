---
layout: post
title:  "Starbucks nepoužívá dvoufázový commit"
date:   2018-03-12
categories: [software development]
disqusId: 200
image: "/assets/2018-03-12/jiangyi-99-coffee-machine.png"
tags: [překlad]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2018-03-12/jiangyi-99-coffee-machine.png" /></div>

Gregor Hohpe, autor knihy [Enterprise Integration Patterns](http://www.enterpriseintegrationpatterns.com/eaipatterns.html), napsal článek [Starbucks Does Not Use Two-Phase Commit](http://www.enterpriseintegrationpatterns.com/ramblings/18_starbucks.html), který ani po tolika letech neztratil na aktuálnosti. [S jeho laskavým svolením](https://twitter.com/ghohpe/status/969619522809315328) jsem článek přeložil do češtiny.

<div style="clear: both"></div>

**19. listopadu 2004**

## Hotto Cocoa o Kudasai

Právě jsem se vrátil z dvoutýdenního výletu do Japonska. Jednou z nejznámějších památek je velký počet kaváren Starbucks (スターバックス) obzvlášť kolem Shinjuku a Roppongi. Během čekání na své „Hotto Cocoa“ jsem začal přemýšlet nad tím, jak Starbucks zpracovává objednávky nápojů. Stejně jako většina jiných podniků jsou primárně zaměřeni na maximalizaci propustnosti objednávek. Víc objednávek znamená větší tržbu. A proto používají asynchronní zpracování. Když si objednáte, tak pokladní označí kelímek na kávu vaším jménem a zařadí ho do fronty. Fronta je úplně doslova fronta kelímků na kávu seřazených na vrchu kávovaru. Tato fronta odděluje pokladní a baristu a dovoluje pokladní dál přijímat objednávky, i když je barista zrovna zahlcený. Pokud začne být v kavárně rušno, tak jim to umožňuje nasadit víc baristů ve scénáři [Competing Consumer](http://www.enterpriseintegrationpatterns.com/CompetingConsumers.html).

<!--more-->

## Korelace

Starbucks získal výhody asynchronního přístupu, ale musí se ovšem vypořádat s problémy, které to přináší. Například korelace. Objednávky nápojů nejsou nutně zpracované v pořadí, v jakém přišly. To se může stát ze dvou důvodů. Za prvé různí baristé můžou používat jiné vybavení. Ochucené nápoje můžou zabrat víc času než káva. Za druhé baristé můžou připravovat několik nápojů v dávce, aby optimalizovali čas zpracování. Ve výsledku má Starbucks problém s korelací. Nápoje jsou doručeny mimo sekvenci a musí být přiřazeny správnému zákazníkovi. Starbucks problém vyřešil stejným vzorem, který používáme v _messaging_ architektuře – používají [korelační identifikátor](http://www.enterpriseintegrationpatterns.com/CorrelationIdentifier.html). Většina Starbucks v USA používá explicitní korelační identifikátor, takže napíše vaše jméno na kelímek a vyvolá vás, když je nápoj hotový. V jiných zemích korelují podle druhu nápoje

## Zpracování výjimek

Zpracování výjimek ve scénářích asynchronního _messagingu_ může být obtížné. Jestliže skutečný svět píše nejlepší příběhy, tak se možná můžeme něco naučit tím, že se podíváme, jak Starbucks řeší výjimky. Co udělají, když nemůžete zaplatit? Jestliže už byl nápoj vyrobený, tak ho vyhodí, jinak vytáhnout váš kelímek z _řady_. Pokud vám dají nesprávný nápoj nebo nejste spokojení, tak ho udělají znovu. Když se jim porouchá kávovar a nemůžou připravit váš nápoj, tak vám vrátí peníze. Každý z těchto scénářů popisuje jinou, přesto ale běžnou, strategii zpracování chyb: 

* **Odepsání** - Tato strategie zpracování je nejjednodušší ze všech: nedělejte nic. Nebo zrušte, co jste udělali. Může se to zdá jako špatný plán, ale v realitě byznysu může být tato volba akceptovatelná. Je-li ztráta malá, tak vyrobit řešení na korekci chyb může být dražší než nechat věci být. Pracoval jsem například pro několik poskytovatelů internetového připojení, kteří vybrali tento přístup, když došlo k chybě při vyúčtování. Ve výsledku mohl zákazník skončit s aktivní službou, za kterou nezaplatil. Ztráta zisku byla dost malá na to, aby byznysu dovolila tímto způsobem fungovat. Pravidelně pak pouštěli report, který detekoval takové bezplatné účty a zavíral je.
* **Zopakování** - Pokud selžou některé operace z velké skupiny (např. transakce), máme v podstatě dvě možnosti. Vrátit změny, které už se provedly, nebo zopakovat ty, které selhaly. Zopakování je možná varianta, pokud existuje reálná šance, že zopakování uspěje. Pokud je například porušené byznys pravidlo, tak je nepravděpodobné, že zopakování uspěje. Nicméně pokud je externí systém nedostupný, tak zopakování může uspět. Speciální případ je [Idempotent Receiver](http://www.enterpriseintegrationpatterns.com/IdempotentReceiver.html), kdy můžeme jednoduše opakovat všechny operace, jelikož bude ignorovat duplicitní zprávy.
* **Kompenzační akce** - Poslední možností je vrátit změny, které se už provedly, a uvést systém zpět do konzistentního stavu. Takové kompenzační akce fungují dobře například v účetních systémech, kde můžeme připsat peníze, které byly stržené.

Všechny tyto strategie se liší od dvoufázového commitu, který spoléhá na oddělené kroky přípravy a vykonání. Dvoufázový commit by v případě Starbucks znamenal čekat u pokladny s účtenkou v ruce a s penězi na stole, dokud by nápoj nebyl dokončen. Nakonec by peníze, účtenka a nápoj změnily ruce jedním vrzem. Ani pokladní ani zákazník by nemohli odejít, dokud by „transakce“ nebyla dokončená. Takový přístup by určitě zabil Starbucks, protože počet zákazníků, kteří můžou být obsloužení v určitém časovém intervalu, by dramaticky poklesl. To je dobrý příklad toho, že dvoufázový commit může život usnadnit, ale může uškodit toku zpráv (a tudíž škálování), jelikož se musí udržovat stavové transakční zdroje.

## Konverzace

Interakce v kavárně jsou dobrým příkladem jednoduchého, ale běžného, vzoru [konverzace](http://www.enterpriseintegrationpatterns.com/ramblings/09_correlation.html). Interakce mezi dvěma stranami (zákazník a kavárna) se skládají z krátkých synchronních interakcí (objednávka a platba) a delších asynchronních interakcí (výroba a obdržení nápoje). Tento typ konverzace je celkem obvyklý v objednávkových scénářích. Pokud například objednáváte na Amazonu, tak krátká synchronní interakce přiřadí číslo objednávky a všechny následné kroky (stržení peněz z karty, balení, doprava) probíhají asynchronně. Když se krok provede, tak jste notifikování e-mailem (asynchronně). Pokud se něco pokazí, Amazon obvykle kompenzuje (vrátí peníze na kartu) nebo zopakuje (pošle ztracené zboží).

Můžeme vidět, že skutečný svět je často asynchronní. Náš každodenní život se skládá z mnoha koordinovaných, ale asynchronních, interakcí (čtení a odpovídání na e-maily, kupování kávy atd.). To znamená, že architektura asynchronního _messagingu_ může často být přirozenou cestou, jak modelovat takovýto typ interakcí. Rovněž to znamená, že se často můžeme podívat na každodenní život, abychom navrhli úspěšné řešení _messagingu_. Domo arigato gozaimasu!
