---
layout: post
title:  "Kapitáne, potřebujeme víc klíčových slov"
date:   2019-02-27
categories: [software development]
disqusId: 211
image: "/assets/2019-02-27/johnny-automatic-key-1.png"
tags: [překlad, Java]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2019-02-27/johnny-automatic-key-1.png" /></div>Z architektonického hlediska mě zaujal příspěvek na fóru OpenJDK [We need more keywords, captain!](http://mail.openjdk.java.net/pipermail/amber-spec-experts/2019-January/000945.html), který napsal Brian Goetz. S jeho laskavým svolením překládám do češtiny. Varoval mě, že to bylo bohužel chápáno jako návrh na přidání nových funkčností, ale zamýšlel se spíš nad tím, jak úspěšně pokračovat v rozvoji jazyka.
 
8\. ledna 2019

Tento dokument navrhuje možný krok, který nám získá nějaký prostor v nekonečném problému, kdy management klíčových slov vrtí ocasem psa, jímž je programovací model.

<!--more-->

## Kapitáne, potřebujeme víc klíčových slov

Java má fixní sadu _klíčových slov_ (JLS 3.9), která se nesmějí používat jako identifikátory. Tato sada zůstala léta stabilní (z dobrých důvodů) s výjimkou `assert` přidaného ve verzi 1.4, `enum` přidaného ve verzi 5 a `_` přidaného ve verzi 9. Navíc máme i několik _rezervovaných identifikátorů_ (`true`, `false` a `null`), které se chovají skoro jako klíčová slova.

Jak čas plynul a jazyk se vyvíjel, tak návrháři jazyka čelili výzvě: Sada klíčových slov představená ve verzi 1.0 je sotva vhodná k vyjádření všech věcí, které bychom kdy chtěli v našem jazyce vyjádřit. Máme několik nástrojů, jak to řešit.

* Eminentní doména. Vezměte slova, která byla dříve identifikátory, a udělejte z nich klíčová slova, jako jsme to udělali s `assert` ve verzi 1.4.
* Recyklujte. Použijte existující klíčové slovo pro něco, co nebylo nikdy zamýšleno (jako `default` pro hodnoty anotací nebo defaultní metody).
* Fungujte bez nich. Najděte způsob jak vybrat syntaxi, která nevyžaduje nové klíčové slovo, jako `@interface` pro anotace místo `annotation`, nebo funkci vůbec nedělejte.
* Kouř a zrcadla. Vytvořte iluzi klíčových slov závislých na kontextu skrze různé jazykové veletoče (omezená klíčová slova, rezervovaná jména typů).

V každé situaci jsou na stole všechny tyto možnosti, ale většinou není žádná z nich úplně dobrá. Nedostatek rozumných možností pro rozšíření syntaxe jazyka hrozí tím, že se stane významnou překážkou ve vývoji jazyka.

#### Proč „prostě“ nevytvořit nová klíčová slova?

Přestože by bylo teoreticky možné v příští verzi Javy udělat z `i` klíčené slovo, tak by to skoro určitě rozbilo každý program na světě, jelikož `i` je zcela běžně používáno jako identifikátor. (Když bylo přidáno klíčové slovo `assert` ve verzi 1.4, tak to rozbilo každý testovací framework). Náklady na zotavení z takové nekompatibilní změny se liší. Zneplatnění jména lokální proměnné je lokální oprava, ale zneplatnění jména veřejného typu nebo metody rozhraní může být fatální.

Navíc klíčová slova, která bychom chtěli zavést nejraději, jsou často populární jako identifikátor (např. `value`, `var`, `method`), což vede k ještě pravděpodobnější kolizi. I v případech, kdy je kandidát na klíčové slovo používán zřídka, můžeme chtít zachovat zpětnou kompatibilitu. Ovšem jména, která budou kolidovat s malou pravděpodobností (např. `usually_but_not_always_final`), nebudou taková, která bychom chtěli v našem jazyce. Tohle není způsob, po kterém bychom ve skutečnosti sahali často. Laťka musí být nastavena vysoko.

#### Proč „prostě“ nežít s klíčovými slovy, které máme?

Znovu použitá klíčová slova ve více kontextech jsou častým jevem v programovacích jazycích (včetně Javy, kde například (zne)užíváme `final` pro _not mutable_, _not overridable_ a _not extensible_). Občas je použití existujícího slova v novém kontextu přirozené a rozumné, ale obvykle to není naše první volba. Časem rostou požadavky kladené na naše klíčová slova, což může vyústit ve směšné tvary. Nikdo nechce používat `null final` jako negaci `final`. (Možná si myslíte, že je to příliš směšné, ale během JEP 325 jsme dostali seriózně znějící návrh použít `new switch` k popisu switche s odlišnou sémantikou. Očekávám, že by za deset let následovalo `new new switch`.)

Samozřejmě jeden ze způsobů, jak žít bez nových klíčových slov, je zcela zastavit vývoj jazyka. Přestože si někteří myslí, že je to dobrý nápad, tak by bylo hloupé udělat to pro nedostatek tokenů. Jsme přesvědčení, že Java má před sebou dlouhý život a vývojáři jsou natěšení na nové vlastnosti, které jim umožní psát lépe vyjádřitelný a spolehlivější kód.

#### Proč „prostě“ neudělat klíčová slova závislá na kontextu?

Klíčová slova závislá na kontextu (a jejich kamarádi jako rezervované typy identifikátorů) můžou na první pohled vypadat jako kouzelná hůlka. Nechají nás vytvořit iluzi přidání nových klíčových slov, aniž bychom rozbili existující programy. Výhody ovšem zakrývají velkou komplexitu a zkreslení.

Každá gramatická pozice má vlastní příběh; kontextuální klíčová slova, která můžou být použitá jako modifikátory (např. `readonly`), mají více významů než ta, která jsou použita v kódu (např. výraz `matches`). Proces výběru kontextuálního klíčového slova není jednoduché přidání do gramatiky; každé jedno vyžaduje analýzu současných ale i budoucích možných interakcí. Podobné je to u recyklace tokenů. Například jsme mohli obhájit použití `var` jako jména typu, protože jmenné konvence jsou tak široce dodržovány. V neposlední řadě může kontextuální klíčové slovo v určité syntaktické pozici klást požadavky na pozdější rozšíření syntaxe.

Kontextuální klíčová slova vytváří komplexitu pro specifikaci, kompilátory a IDE. S jedním nebo dvěma speciálními příklady dokážeme celkem žít, ale kdyby byly speciální příklady hojnější, tak by to pravděpodobně vedlo k větším nákladům na údržbu nebo většímu počtu bugů. Přestože je snadné říct: „To není můj problém,“ tak ve skutečnosti je to problém všech. IDE musí často uhodnout zda použití kontextuálního klíčového slova je klíčové slovo nebo identifikátor. Nemusí mít zrovna dost informací, takže potřebuje víc vstupů. Což znamená horší zvýraznění, automatické doplňování či možnosti refaktorování. Tyto problémy se rychle stanou problémy všech.

Takže i když jsou kontextuální klíčová slova jedním z nástrojů, měly bychom je rovněž používat zřídka.

#### Proč je to problém?

Kromě zřejmých následků (humpolácká syntaxe, komplexita, bugy) existují zrádnější skryté náklady ve formě zkreslení. Náhodný detail v managementu klíčových slov vystavuje návrh jazyka neustálému riziku zkreslení.

Za zkreslení by se dalo považovat použití `@interface` pro anotace místo `annotation`. Popisné jméno místo kombinace interpunkce a klíčového slova by lidem jistě usnadnilo seznámení s anotacemi.

Dalším příkladem je množina modifikátorů (`public`, `private`, `static`, `final` atd.), která není kompletní. Není způsob, jak říct “not final” nebo “not static”. To znamená, že nejsme schopni vytvořit proměnné nebo třídy, které jsou automaticky `final`, nebo fieldy automaticky `static`, protože neexistuje způsob, jak výchozí chování změnit. Přestože můžou existovat důvody ospravedlňující lokální suboptimální výchozí chování (jako třeba globální konzistence), tak chceme tato rozhodnutí dělat vědomě, ne je nechat na náhodném detailu managementu klíčových slov. Je v pořádku rozhodnout se vynechat funkcionalitu z důvodu jednoduchosti, nikoliv však z toho důvodu, že nemáme způsob, jak zavést danou sémantiku.

Z vnějšku se to tak možná nezdá, ale je to neustálý problém ve vývoji jazyka a daň, kterou všichni přímo či nepřímo platíme.

## Potřebujeme nový zdroj kandidátů na klíčová slova

Pokaždé když jsme konfrontováni s tímto problémem, máme nutkavou potřebu vsadit si na jednu ze špatných voleb, jelikož přichází jen jednou za čas. Nicméně ve frontě stojí další požadavky, takže očekávám, že to bude pokračovat s určitou pravidelností, proto bych byl raději připraven. Vzhledem k tomu, že tyto současné možnosti jsou problematické a není žádná nejméně problematická pro všechny situace, kloním se k tomu, pokusit se rozšířit množinu lexikálních forem, které můžou být použité jako klíčová slova. 

Jako příklad, který neberte vážně, se podívejte na konvenci, kterou jsme používali pro experimentální funkčnosti, kdy jsme přidávali prefix ve formě dvou podtržítek jako například `__ByValue` v prototypu Valhalla. (Běžně to děláme v návrzích funkčnosti a prototypech především jako znamení, že toto klíčové slovo je zástupný výraz pro pozdější syntaktické rozhodnutí, ale taky protože dovoluje jednoduchou implementaci, která bude velmi nepravděpodobně kolidovat s existujícím kódem.) Mohli bychom například vykrojit prostor identifikátorů začínajících podtržítkem jako rezervovaná pro klíčová slova. To samozřejmě není krásné a taky to znamená, že bychom míchali klíčová slova s podtržítkem a bez podtržítka. Nejedná se tedy o seriózní návrh. Spíš příklad kroku, který hledáme.

Mám ale seriózní návrh. Dovolme klíčová slova se spojovníkem, kde jedno nebo více slov už je klíčovým slovem nebo rezervovaným identifikátorem. Na rozdíl od omezených klíčových slov nám to přináší mnohem méně problémů při syntaktické analýze, jelikož například `non-null` si nemůžeme splést s výrazem odčítání. Lexikální analyzátor dokáže s fixním dopředným vyhledáváním vždy říct, zda `a-b` znamená tři tokeny nebo jeden. To nám dává mnoho prostoru pro vytváření nových a méně konfliktních klíčových slov. A tyto klíčová slova pravděpodobně budou dobrými jmény, protože mnoho chybějících konceptů, které chceme přidat, popisuje vztah k existujícím jazykovým konstruktům jako například `non-null`. 

Tady je několik příkladů, kde by tento přístup mohl plodit důvěryhodné kandidáty. (poznámka: žádný z nich není návrh, jedná se toliko o ilustrativní seznam toho, jak by tento mechanismus mohl formovat klíčová slova, která by v určité možné budoucnosti mohla být užitečná a lepší než alternativy, které máme dnes)

* `non-null`
* `non-final`
* `package-private` (výchozí přístup pro field, v současné době nedosažitelné)
* `public-read` (veřejně čitelné, privátně zapisovatelné)
* `null-checked`
* `type-static` (koncept potřebný ve Valhalla)
* `default-value`
* `eventually-final` (co teď navrhuje anotace `@Stable`)
* `semi-final` (alternativa k `sealed`)
* `exhaustive-switch` (kontrola úplnosti switche)
* `enum-class`, `annotation-class`, `record-class` (bývali jsme si je mohli vybrat jako alternativu k `enum` a `@interface`)
* `this-class` (k popisu class literálu aktuální třídy)
* `this-return` (častá žádost jak označit setter nebo builder, aby vracely `this`)

(Opět připomínám, že cílem není debatovat o žádném z těchto konkrétních příkladů, nýbrž ilustrovat, čeho bychom byli schopní s tímto mechanismem dosáhnout.)

Neznamená to, že bychom nemohli používat ostatní přístupy, byly-li by vhodné. Znamená to, že máme víc (méně obtížných) možností. Možností, která nám umožní dělat lepší rozhodnutí.

Určitě budou existovat další lexikální schémata, která umožní vytvořit nová klíčová slova, aniž by mrzačila existující kód. Tohle se zdá důvěryhodné a rozumně čitelné jak pro stroje, tak pro lidi.

#### „Ale to je ošklivé“

Část čtenářů jistě tuto myšlenku ihned zavrhne. Někomu se to bude zdát ošklivé. (Alespoň na první pohled. Mnoho těchto reakcí jsou snad přechodné odpovědi na neznámé.)