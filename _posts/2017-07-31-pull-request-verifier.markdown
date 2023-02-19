---
layout: post
title:  "Pull request verifier"
date:   2017-07-31
categories: [software development]
disqusId: 191
image: "/assets/2017-07-31/1267371838.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2017-07-31/1267371838.png" /></div>Koukám, že už je to čtyři roky, co jsem se tu zamýšlel nad tím, že [mi chybí *code review*](/software%20development/2013/08/18/kde-me-tlaci-bota-code-review.html). Od té doby jsem se já i náš obor trochu posunuli. Se [Softwarovým Samurajem jsme používali *branch-by-feature*](http://www.sw-samuraj.cz/2014/08/mercurial-strategie-branch-by-feature.html) (i když už pak nedopsal, že jsme to později vylepšili o plugin [hg-flow](https://bitbucket.org/yinwm/hgflow/wiki/UserManual)). K dokonalosti chybělo pár drobností. Dost věcí z [*code review checklistu*](http://www.sw-samuraj.cz/2014/07/code-review-checklist.html) jsme kontrolovali manuálně, jako například formátování, pokrytí testy či postřehy, které by odhalila statická analýza kódu (PMD, FindBugs…). Je to otravné a vyčerpávající, takže už se tolik nesoustředíte na věci jako design, logování atd. Navíc *build* běžel až nad *develop* větví, takže se mohlo stát, že jste sice krásně schválili *pull request*, ale ten po *zamergování* shodil *build*. Jak to vylepšit?

<!--more-->

## Jenkins a BitBucket

Pro Jenkins existuje [Bitbucket Pull Request Builder Plugin](https://github.com/nishio-dens/bitbucket-pullrequest-builder-plugin). Díky němu si můžete nastavit *build*, který se spustí nad každým *pull requestem* v Bitbucketu. Rovněž zkontroluje statickou analýzu kódu (pokrytí testy, PMD, FindBugs, Checkstyle a duplicity kódu), jejíž konfigurací se teď zabývat nebudu. Pokud jsou všechna pravidla splněna, tak pak *pull request* jako jakýkoliv jiný *reviewer* schválí.

![](/assets/2017-07-31/bitbucket.png)

_Schválený pull request v Bitbucketu_

### Konfigurace

Používáte-li *feature branche* ve tvaru `feature/bitcoint-payment`, tak nastavíte masku na `*/${sourceBranch}`. Vhodné je zapnout volbu `Cancel outdated jobs`, která zajistí to, že nový *commit* zruší již běžící *build* nad danou větví (zbytečně se tak nezatěžuje server). Může se stát, že build selže, přestože je kód v pořádku, třeba kvůli chybějící závislosti v *maven repository*. V takovém případě do komentáře *pull requestu* v Bitbucketu napíšete to, co je nakonfigurované v `Comment phrase to trigger build` a *build* se spustí znovu. V našem případě je to.

> test this please

U statické analýzy můžete nastavit práh (počet porušení pravidel), kdy má *build* selhat (červený) či se má označit za nestabilní (žlutý). V ideálním případě by to měla být nula, ale to se ne vždy daří. Buď máte pravidla, která nedodržujete, a pak by stálo za to je zrevidovat, nebo pracujete s *legacy* kódem, který sice zlepšujete, ale po malých krůčcích. Jenkins porovnává počet nových chyb vůči předchozímu *buildu*, což nemusí vždy být ta samá *feature branch*. V takovém případě se může stát, že opravíte jednu chybu, ovšem zavlečete jinou, přesto čísla zůstanou stejná. A to mi přijde škoda.

![](/assets/2017-07-31/jenkins.png)

_Nastavení prahu pro Checkstyle_

Jako vylepšení můžete nakonfigurovat, že se má Jenkins před buildem pokusit o lokální *merge*, který se nedostane do *remote repository*. To pomůže zavčasu odhalit nekonzistenci mezi zdrojovou a cílovou větví.

Plugin [nemá podporu webhook](https://github.com/nishio-dens/bitbucket-pullrequest-builder-plugin/issues/12), takže se *build* spouští přes klasický *cron trigger* (aktivní čekání). 

Existuje [Violation Comments to Bitbucket Server Plugin](https://wiki.jenkins.io/display/JENKINS/Violation+Comments+to+Bitbucket+Server+Plugin), který umí vkládat komentáře do *pull requestu* přímo ke kódu, ale funguje jen pro *standalone Bitbucket Server*. Nicméně dá se žít i bez něj, prostě se prokliknete na daný *build* a chyby si dohledáte na Jenkinsu.

## Jenkins a GitHub
Pochopitelně se někteří budou ptát, jak je to s podporou GitHubu. Osobně nemám vyzkoušené, ale očekávám, že postup bude analogický. Podělte se o své zkušenosti v komentáři pod článkem. Můžete se podívat třeba na [GitHub pull request builder plugin](https://wiki.jenkins.io/display/JENKINS/GitHub+pull+request+builder+plugin)

## Pár poznámek k Gitu

Pokud používáte *feature branche*, určitě jste v historii Gitu viděli spoustu čar, kterým mnozí říkají „nádraží“, a někdy není přehledné zjistit odkud kam vedou. Osobně rád často *commituju* svoje meziřešení, abych měl stabilní kroky, ke kterým se můžu vracet, čímž čáry prodlužuju. Pro potřeby *code review* to nevadí, ale před finálním mergem do develop větve takzvaně *squashnu*: sloučím všechny *commity* do jednoho (výjimečně do více, má-li to význam držet v historii). K tomu používám interaktivní rebase.

`git rebase -i develop`

Nakonec v *remote repository* musíte přepsat historii pomocí

`git push --force-with-lease`

## Závěr

Bez *pull request verifieru* bych si už svoje *workflow* nedokázal představit. Programátor dostane včas zpětnou vazbu a *reviewer*, kterého jsme tímto pluginem rozhodně nechtěli nahradit, má víc prostoru prozkoumat ty aspekty, které ještě neumíme zautomatizovat.

## Související
* [Kde mě tlačí bota - code review](/software%20development/2013/08/18/kde-me-tlaci-bota-code-review.html)
* [Mercurial, strategie branch-by-feature](http://www.sw-samuraj.cz/2014/08/mercurial-strategie-branch-by-feature.html)
* [Code review checklist](http://www.sw-samuraj.cz/2014/07/code-review-checklist.html)