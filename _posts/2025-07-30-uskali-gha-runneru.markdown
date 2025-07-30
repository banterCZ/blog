---
layout: post
title:  "Úskalí GHA runneru"
date:   2025-07-30
categories: [software development]
disqusId: 278
image: "/assets/2025-07-30/275576.png"
tags: [CI]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2025-07-30/275576.png" /></div>

Měl jsem takovou tvůrčí krizi.
Můžu to alespoň svádět na dobu LLM.
Má dneska vůbec smysl něco tvořit?
Jenže stroje vám, zatím, odpoví jen na to, co jste se zeptali.
Proto čtu online články i časopisy, které mi rozšiřují obzor, protože mi podsouvají informace, na které bych se býval nezeptal.
Jednak mám puzení něco psát, jednak je blog z velké části deník pro mě samotného, jako si psal [Kocour Modroočko](https://cs.wikipedia.org/wiki/Z_den%C3%ADku_kocoura_Modroo%C4%8Dka), co všechno zažil (kdo neznáte zhudebněnou verzi s Dejdarem, pusťte si, je to poklad pro děti i dospělé).

Pojďme se rozehřát něčím jednoduchým až banálním.

Jeden z nejznámějších build nástrojů Jenkins se dříve konfiguroval jen klikáním v GUI.
Bylo to nepohodlné, špatně se to verzovalo, zálohovalo a možném code review ani nemluvě.
Naštěstí tu je s námi už nějakou dobu [Jenkinsfile](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/), který leží v repozitáři vedle zdrojového kódu.

Vedle toho existuje lákavá alternativa [GitHub Actions](https://docs.github.com/en/actions/get-started/quickstart) (dále jen GHA).
Představte si, že byste se nemuseli starat o vlastní build server, jaká pohoda.
Do jaké pasti byste se asi tak mohli dostat?

<!--more-->

<div style="clear: both"></div>


## Problém s GHA

Jenkins buildy jsme dávno přenesli na GHA.
Jeden z nich pouštěl baterii integračních testů vůči _dev_ prostředí.
Neříkám, že je to vzor hodný následování, ale v Jenkins to fungovalo a nějakou dobu i v GHA.

Pak začaly testy padat na `Connection timed out`.
Nějakou chvíli to ignorujete, prostě síť je nespolehlivá, ale testy musí být přeci zelené.

Z výše popsaného je patrné, že testy a server běží nezávisle na sobě.
I když je server v Azure a GHA je od Microsoftu, nic nezaručuje, že poběží ve stejném regionu.

Hypotézu je potřeba ověřit.


## Ověření hypotézy

Do konfigurace GHA přidáme

```yaml
steps:
  - name: Log runner IP and region
    run: |
      echo "Public IP:"
      curl -s https://ifconfig.me
      echo -e "\nRegion info (GeoIP):"
      curl -s https://ipinfo.io
```

Výsledek

```log
Public IP:
135.232.177.160
Region info (GeoIP):
{
  "ip": "135.232.177.160",
  "city": "Chicago",
  "region": "Illinois",
  "country": "US",
  "loc": "41.8500,-87.6500",
  "org": "AS8075 Microsoft Corporation",
  "postal": "60666",
  "timezone": "America/Chicago",
  "readme": "https://ipinfo.io/missingauth"
}
```

A sakra, dev server běží ve West Europe.
[Dle této diskuse region u GHA nastavit bohužel nelze](https://github.com/orgs/community/discussions/11727).

Nikdy se nedozvím, proč se to rozbilo až po čase. Možná Trump uvalil clo i na TCP spojení, nebo GitHub prostě jen čaroval s regiony runnerů.


## Řešení

Jak z toho ven?

- Připravit si [self-hosted runner](https://docs.github.com/en/actions/concepts/runners/self-hosted-runners), s tím ale padá ona výhoda, že se nechcete o nic starat.
- Přesunout server do jiného regionu (což se zase nemusí hodit pro jiné scénáře, kdy tam přistupujete z Evropy).
- Vytvořit další instanci jen pro testy (v regionu, kde dle logu runner s testy běží).
- Ideální, zato nejsložitější cesta, vytvořit image, který bude obsahovat jak server, tak testy, což zaručí, že všechno bude na jediném místě.


## Závěr

I když jste nečetli knihu [The Mythical Man-Month (Frederick P. Brooks)](/software%20development/2012/07/24/povestny-clovekomesic.html), jistě vám bude znám koncept [No Silver Bullet](https://en.wikipedia.org/wiki/No_Silver_Bullet).
Je lákavé, že se nemusíte o nic starat, ale když už se o něco postarat potřebujete, tak je to pak komplikované až nemožné.
