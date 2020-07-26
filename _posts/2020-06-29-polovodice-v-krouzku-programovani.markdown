---
layout: post
title:  "Polovodiče v kroužku programování"
date:   2020-06-29
categories: [software development]
disqusId: 227
tags: [kroužek programování]
image: "/assets/2020-06-29/dioda_znacka.png"
---
<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2020-06-29/dioda_znacka.png" /></div>

V kroužku programování se snažím prvních deset minut věnovat nějaké aktivitě bez počítače. Jsou znalosti, na kterých byly počítače postavené a které by bylo vhodné znát. Mezi ně podle mě patří například binární kód případně povědomí o polovodičích. Těm jsme se zatím nevěnovali. Předesílám, že nejsme kroužek elektrotechniky a pájení a že děti jsou převážně z prvního stupně. Předpokládám od čtenářů povšechní vědomosti elektrotechniky. Nebudu zabíhat do detailů, spíš chci představit rámec, jak jsem téma polovodičů uchopil. Samotnou aktivitu jsem rozdělil do několika hodin.

<div style="clear:both"></div>
<!--more-->

## Teorie

Jedním z hledisek, podle kterých můžeme na látky pohlížet, je rozdělení na vodiče, nevodiče (izolanty) a polovodiče. Vodičem je například kov, jelikož obsahuje volné elektrony, které vedou elektrický proud. Nevodič je například plast. Děti položily zajímavou otázku, jak je to s vodou (bez přidané soly a volných iontů je to mizerní vodič, ale s napětím ze zásuvky už je to nebezpečné). A pak jsou tu ony polovodiče, které vedou elektrický proud jen někdy, za určitých podmínek. Jedná se například o křemík.

P-N přechod jsem si nechal pro sebe, nebylo cílem je zahltit či dokonce odradit. Opět připomínám, že se mi osvědčila [Usborne - Dětská encyklopedie vědy a techniky](https://www.goodreads.com/review/show/2805859856?book_show_action=false&from_review_page=1), ale můžete ukázat obrázky podle svého uvážení.

## Stavebnice

U nás na škole je mezi dětmi populární stavebnice [Boffin](http://www.boffin.cz/). Co jsem měl tu možnost vidět, jedná se o velmi povedenou stavebnici. Jediné co bych jí vytknul, je cena. Chápu, že neplatíte nominální cenu součástek, nýbrž vývoj a didaktickou podporu, přesto jsem svým dětem hledat alternativu. I proto, že Boffin mají ve škole.

![](/assets/2020-06-29/stavebnice.jpg){:.center}

Na AliExpressu jsem hledal klíčové slovo STEM ([_Science, technology, engineering, and mathematics_](https://en.wikipedia.org/wiki/Science,_technology,_engineering,_and_mathematics)) a našel [tuhle stavebnici](https://www.aliexpress.com/item/33001866830.html?spm=a2g0s.9042311.0.0.4db24c4dqyfNtb). Návod samozřejmě není v češtině (za mě výhoda), ale je to s Boffinem dokonce kompatibilní. Pro potřeby tohoto cvičení jsem ovšem potřeboval Boffin, jelikož ta čínská stavebnice tranzistor neobsahuje.

## Dioda

Nejjednodušším polovodičem je dioda, která vede (stejnosměrný) proud pouze jedním směrem. Zapojení byste stejně ukazovali asi na nějakém světle, tudíž si můžeme dovolit sáhnout po speciálním (ale hojném) typu diody a to LED (_Light-Emitting Diode_) neboli světelné diodě (můžete slyšet označení LED dioda, ale puristé by to [odmítli jako pleonasmus](https://www.interval.cz/clanky/hrichy-pro-sileneho-korektora-piseme-nejen-v-cestine-ale-take-spravne-cesky/)).

Ukázka je velmi snadná. Zapojení žárovky nezáleží na orientaci dílu, zato u světelné diody ano.

![](/assets/2020-06-29/dioda_zapojeni.jpg)

Když jsem fotografie kroužku sdílel v komunitě lektorů, dostalo se mi připomínek, jak to, že je dioda zapojená na přímo na 3&nbsp;V. Vlastně mě to ani nenapadlo, tak nějak jsem automaticky čekal, že rezistor je součástí. A taky že ano, viz snímek z rozborky. A co teď didakticky s tím? Jak jsem uvedl v úvodu, nejsme kroužek elektrotechniky, tak mě to netrápí. Díl by asi mohl obsahovat schématickou značku diody i rezistoru, ale pro přehlednost asi vynechali. Možná by to bylo i matoucí. Myslím si, že ideálním řešením by byla schématická značka podle skutečného zapojení a součástka viditelná i bez rozebírání.

![](/assets/2020-06-29/dioda_vnitrek.jpg)

## Tranzistor

Úvod předchozí hodiny jsem věnoval diodě a teď je tedy řada na tranzistoru. Jedná se o další polovodičovou součástku, spínač spínaný napětím. Je vhodné si nejprve sestavit obvod s klasickým spínačem a pak ho nahradit tranzistorem.

Tranzistor se používá i v zesilovačích. To je vhodné pro zajímavost zmínit, ale my se této oblasti věnovat nebudeme. Nicméně souvislost tu přeci jen nějaká je a to, že pro spínání nám stačí velmi malý proud, což si ukážeme na úloze rozsvícení LED prstem, který jsem vzal v knize [Hradla, volty, jednočipy (Martin Malý)](https://knihy.nic.cz/files/edice/hradla_volty_jednocipy.pdf), kapitola 7.2

![](/assets/2020-06-29/dioda_zapojeni_prst.png){:.center}
_Zdroj: Hradla, volty, jednočipy (Martin Malý)_

> ty dvě kolečka vlevo symbolizují dvě dotykové, které budeme prstem spojovat
> ...
> Zkuste se dotknout – a co? Nesvítí, že? A když ty plošky spojíte třeba hřebíkem, tak to funguje.

![](/assets/2020-06-29/tranzistor_zapojeni.png){:.center}
_Zdroj: Hradla, volty, jednočipy (Martin Malý)_

> „Malý proud“ teče z kladného pólu téže baterie do senzoru, tam protéká vaším prstem, zpátky do druhého pólu senzoru, odtamtud do báze tranzistoru, a přes emitor ven a do baterie.

![](/assets/2020-06-29/tranzistor.jpg)

Pozor! Pokyn pro vyučující: Mluvíme tu o malém proudu, což je zajištěno právě odporem prstu. Připojíte-li bázi na přímo, poteče proud převážně touto větví, jelikož LED má předřazený rezistor. Vytvořili byste tak spojení na krátko a hrozilo by, že součástku nenávratně poškodíte.

Vyobrazené zapojení využívá tranzistor NPN. PNP by se spínal záporným napětím. Podrobnosti jsou nad rámec tohoto článku a doporučuji případně nahlédnout do odkazované literatury.

## Relé

Tady jsem trochu cestoval v prostoru a čase. Relé není polovodič a předcházelo tranzistorům. Na hodině jsem nezvládl ukázat, jelikož vypukla krize s virem Covid-19. Hledal jsem součástku, kde by bylo vidět do střev. Na AliExpressu jsem [nenašel nic lepšího než tohle](https://www.aliexpress.com/item/33031804721.html?spm=a2g0s.9042311.0.0.6b014c4donGmjP). Potíž je, že vyžaduje napětí 12&nbsp;V, což je víc než s čím běžně pracuje Boffin. Aby si člověk přibalil trafo.

![](/assets/2020-06-29/rele.jpg)

V zásobě mám nápad, že relé věnuji celou hodinu a prostě si ho vlastnoručně vyrobíme. Ale jak říkám, zatím to není vyzkoušené.

## Závěr

Děti mají celkem jasnou představu, co je to vodič a izolant. Snadno přijmou i téma polovodičů. Což se ukázalo na hodině, kdy už jsme se chtěli věnovat tranzistorům, byly schopné spolužákům, kteří minule chyběli, diodu vysvětlit sami. Bez praktické ukázky by to bylo teoretizování k ničemu. Děti práce se stavebnicí baví.  

## Související

- [Hradla, volty, jednočipy (Martin Malý)](https://knihy.nic.cz/files/edice/hradla_volty_jednocipy.pdf)