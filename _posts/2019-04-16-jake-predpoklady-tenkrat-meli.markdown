---
layout: post
title:  "Jaké předpoklady tenkrát měli?"
date:   2019-04-16
categories: [software development]
disqusId: 213
image: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Comparison_computational_complexity.svg/200px-Comparison_computational_complexity.svg.png"
tags: [překlad]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://commons.wikimedia.org/wiki/File:Comparison_computational_complexity.svg"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Comparison_computational_complexity.svg/200px-Comparison_computational_complexity.svg.png" /></a></div> Na twitteru jsem zachytil [zajímavé vlákno](https://twitter.com/evolvable/status/1113031660637847552) od [Graham Lea (@evolvable)](https://threadreaderapp.com/user/evolvable). S laskavým svolením autora překládám do češtiny.

Dnes jsme měli incident na produkci. U obvykle ospalé webové aplikace vylétlo CPU na 100&nbsp;%. Nakonec jsme kontrolovali poslední změny kódu, o kterém jsme si mysleli, že způsobil chybu. Udělala programátorka něco hloupého? Patří k jedněm z našich nejlepších, takže je to dost nepravděpodobné, ale...

<!--more-->

Našli jsme kód, který iteroval přes dva listy a používal k tomu vnořený _for_ cyklus, což má složitost kartézského součinu: O(MN). Tento týden M i N vyskočily na čtyř až šestinásobek, takže funkce měla náhle zhruba 30 krát větší složitost než minulý týden. Myslím si snad, že je to špatný kód? Ne, nemyslím. Proč?

Kód byl napsaný v roce 2012, tedy před sedmi lety. V té době měl každý z obou listů kolem dvaceti prvků a plán, byznys plán, byl, že by mohly pomalu růst. Možná o pár nových užitečných prvků za rok.

Plán se ovšem změnil. Mělo se za to, že listy porostou o desítky prvků za rok. V roce 2012 měly kolem padesáti prvků, letos obsahovaly tisíce a vyskočily do desítek tisíc.

Kód je snadné spravit: celý obsah jednoho listu se sežvýkne do mapy a pak se jednou proiteruje druhý list, aby se našla shoda z mapy. Jednoduché.

Proč to tak neudělal programátor původně? Protože pro původní požadavky to bylo příliš komplexní. Vnořený cyklus byla ta nejsnazší věc, která mohla fungovat, a nebyl důvod se domnívat, že by to způsobilo problém.

Sakra, kód přežil 7 let nepředvídatelného růstu před tím, než způsobil problém. Kdo by tipoval, že bude za 7 let vůbec existovat? (Vím, že většina vývojářů si přeje, aby už tato webová aplikace zmizela 😝)

Před sedmi lety nemohl nikdo předvídat, že listy vyrostou do desítek tisíc. (Pořád nedává smysl, že se to stalo.) Psaní komplexního kódu, který by zvládl budoucí bezdůvodné možnosti, je plýtvání časem. 

Dobrá, možná v této konkrétní funkci by to bývalo ušetřilo čas. Ale sázet v každé řádce kódu na apokalyptickou budoucnost -&nbsp;což je to, co byste museli dělat, jelikož nevíte, který předpoklad se v budoucnu rozbije&nbsp;- je cesta k obrovskému plýtvání vývojářské produktivity.

Proto tleskám tomuto jednoduchému kódu. Byl založený na rozumném předpokladu a fungoval ještě léta po tom, co byl předpoklad porušen, než si někdo začal stěžovat. Tleskám vývojáři, že byl dost zralý na to, aby to vyřešil jen O(MN) funkcí. Je to agilní.

Je z toho ještě jedno ponaučení. Až budete příště ovlivnění nějakým _legacy_ kódem, tak si nemyslete: „Co si mysleli?!“ Raději se ptejte: „Jaké předpoklady tenkrát měli?“ Je to dobrý způsob, jak si vštěpit empatii k těm, kteří přišli před námi.

## Související

* [Tvůj kód může být elegantní](https://blog.zvestov.cz/software%20development/2014/02/18/tvuj-kod-muze-byt-elegantni.html)
