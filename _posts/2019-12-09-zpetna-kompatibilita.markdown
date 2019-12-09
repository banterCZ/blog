---
layout: post
title:  "Zpětná kompatibilita"
date:   2019-12-09
categories: [software development]
disqusId: 221
image: "https://live.staticflickr.com/65535/48371233611_092eeffb91_m.jpg"
---

<div style="float: left; margin: 0.5em 1em 1em 0em; text-align: center;"><a href="https://www.flickr.com/photos/131806380@N05/48371233611"><img src="https://live.staticflickr.com/65535/48371233611_092eeffb91_m.jpg" /></a><br/>Rob Hodgkins <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC BY-SA 2.0</a></div>Troufám si tvrdit, že [v produktové firmě](https://blog.zvestov.cz/software%20development/2019/10/22/servisni-versus-produktova-firma.html) budete řešit zpětnou kompatibilitu o něco víc než v servisní. Tím samozřejmě neříkám, že tam ji nemusíte řešit vůbec. Tak jsem se k tomu dostal alespoň já: Čím víc produktového přístupu, tím víc jsem přemýšlel o zpětné kompatibilitě. Dnes bych se chtěl zamyslet nad tím, co všechno může být zpětná kompatibilita, a ukázat to na dvou příbězích, jeden z našeho oboru a druhý si půjčím z letectví.
<div style="clear:both"></div>
<!--more-->

## Co to je zpětná kompatibilita

Co to vlastně je zpětná kompatibilita? Kdy měníte jednotlivá čísla MAJOR.MINOR.PATCH u [sémantického verzování](https://semver.org/lang/cs/)? Vztahujete to k binární kompatibilitě, kompatibilitě chování nebo obojí? K jakému modulu, balíčku nebo třídám? Na to si každý projekt asi musí odpovědět sám. [Symfony má pěkný popis toho, co považují za zpětnou kompatibilitu](https://symfony.com/doc/current/contributing/code/bc.html), přičemž si vyhrazují právo porušit zpětnou kompatibilitu při opravě bezpečnostní chyby.

## Softwarové inženýrství

Když jsem si uvědomil mezery ve svých znalostech, jak přistupovat ke kompatibilitě, sáhl jsem po knize Jaroslava Tulacha [Practical API Design](https://www.goodreads.com/review/show/2870967061?book_show_action=false&from_review_page=1). Nehodlám ji celou převyprávět, vydalo by to na samostatný příspěvek, nicméně chtěl bych vyzdvihnout kapitolu 3, část _Text Messages As APIs_, kde nám klade na srdce, abychom se vyvarovali situacím, kdy neexistuje jiná varianta k získání informací než parsování textové zprávy. Ukazuje to na příkladu JDK 1.3, kde se výstup `Exception.printStackTrace(OutputStream)` de facto stal součástí API. V Java 1.4 si chybu uvědomili a přidali metodu `getStackTrace()`, která vrací ty samé informace v lépe strukturovaném formátu. Ovšem staré aplikace stále spoléhaly na parsování textového výstupu, takže bylo potřeba držet textový formát nedotčený.

## Letectví

Na jOpenSpace 2019 František Řezáč ve své přednášce [Mosty, katastrofy a bytecode](https://youtu.be/-3BCl8DTd0U) tvrdil, že je v pořádku inspirovat se z jiných oborů, ale že používání příměrů je zrádné. Mnohokrát jsem pro srovnání utekl ke stavebnictví či k armádě, takže tentokrát sáhnu jinam a to k letectví.

Letectví se ze svých chyb poučilo, za každým bezpečnostním předpisem, i když se vám zdá nesmyslný, hledejte nehodu či dokonce ztrátu lidských životů. Přemýšleli jste někdy, proč po vás chtějí palubní průvodčí, abyste při vzletu nebo při přistání vytáhli sluneční clonu nahoru? Jde o to, aby při případné havárii měli rozhled a dokázali správně evakuovat letadlo. Napadá vás, proč nefunkční palubní rozhlas je důvodem k nepovolení vzletu? Byla jednou jedna nehoda, kterou rozhlas sice nezpůsobil, ale kdyby býval fungoval, mohlo třeba zemřít méně lidí.

Nebudu se věnovat příběhu [Boeing 737 Max](https://www.nytimes.com/2019/04/08/business/boeing-737-max-.html), byť je v mnoha ohledech velmi poučný. Vezmu si na pomoc knihu [Letecké katastrofy a jejich vyšetřování](https://audioteka.com/cz/audiobook/letecke-katastrofy-a-jejich-vysetrovani), kapitolu 6 - Fatální omyl, která mi utkvěla právě kvůli přesahu do softwarového inženýrství a tématu zpětné kompatibility. Boeingu 737-400 [British Midland let 092](https://en.wikipedia.org/wiki/Kegworth_air_disaster) se vzňal motor, což je situace, kvůli které letadlo hned spadnout nemusí. Posádka přešla na novější stroj (z verze 737-300) teprve před třemi měsíci. Podle zápachu kouře v kokpitu se domnívali, že vysadil pravý motor. Firma Boeing ale od verze 737-400 systém ventilace změnila, vzduch pro ventilaci kabinu pilotů i cestujících byl odebírán z obou motorů. V důsledku porušení zpětné kompatibility tedy vypnuli funkční motor, což nakonec vedlo k tomu, že se zřítili. Ovšem nebyla to jen chyba posádky (palubní průvodčí mohli informovat piloty, co vidí z okénka). Navíc ohledně poškození téměř nového motoru byla na vině konstrukční vada.

## Související

* [Boeing’s 737 Max: 1960s Design, 1990s Computing Power and Paper Manuals (The New York Times)](https://www.nytimes.com/2019/04/08/business/boeing-737-max-.html)
* [Symfony - Our Backward Compatibility Promise](https://symfony.com/doc/current/contributing/code/bc.html)

