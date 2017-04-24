---
layout: post
title:  "Statický web s Jekyll"
date:   2017-04-24
categories: [software development]
disqusId: 188
image: "/assets/2017-04-24/jekyll-notext-light-transparent.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="/assets/2017-04-24/jekyll-notext-light-transparent.png" /></div>

Tento blog píšu už nějakých deset let. Tenkrát sice už existoval WordPress, ale z nějakého důvodu jsem zvolil redakční systém [Nucleus](https://en.wikipedia.org/wiki/Nucleus_CMS), který už je dnes úplně mrtvý. Divím se, že mi za ta léta blog nikdo nehacknul (nebo o tom alespoň nevím). S příchodem [Let's Encrypt](https://letsencrypt.org/) jsem si říkal, že by kovářova kobyla nemusela chodit bosa a že bych taky mohl přejít na _https_, ale nechtělo se mi šťourat v PHP. Jednou jsem narazil na [deset nejlepších statických generátorů stránek](https://www.netlify.com/blog/2016/05/02/top-ten-static-website-generators/), na nějakou dobu jsem si odkaz založil a nakonec se rozhodl do toho říznout. Takže tento blog je dnes staticky generovaný pomocí [Jekyll](http://jekyllrb.com/) a hostovaný na CDN [Netlify](https://www.netlify.com).

<!--more-->

Už dříve si lidé (a Google) stěžovali, že se moje stránky nedají moc číst na mobilu, tak jsem se na začátek spustil audit [Testmysite.io](http://testmysite.io) a výsledky nebyly vůbec lichotivé, vlastně byly dost tristní.

![](/assets/2017-04-24/testmysite_io_before.png)
_Stav před_

Jekyll
-------

První weby byly statické. Mně z dynamičnosti neplynula žádná výhoda. Web to zpomalovalo a hrozilo mi bezpečnostní riziko. Podrobněji vše rozebírá článek [Why Static Website Generators Are The Next Big Thing](https://www.smashingmagazine.com/2015/11/modern-static-website-generators-next-big-thing/).

Zbývalo vybrat generátor statických stránek a nejsympatičtější mi přišel [Jekyll](http://jekyllrb.com/). Při migraci se potvrdilo, že to byla dobrá volba. Dobrá dokumentace, fungující komunita a ani Ruby pro mě nebylo překážkou.

Netlify
-----

Již zmiňovaný článek srovnávající [deset nejlepších statických generátorů stránek](https://www.netlify.com/blog/2016/05/02/top-ten-static-website-generators/) byl na stránkách [Netlify](https://www.netlify.com), poskytovatele [CDN (Content delivery network)](https://cs.wikipedia.org/wiki/Content_delivery_network), který se mi zalíbil. Navíc se vejdu do programu _zdarma_.

Jistě se ptáte, proč jsem nezvolil [GitHub Pages](https://pages.github.com/). Ty totiž [nemají způsob, jak konfigurovat _301 redirect_](https://help.github.com/articles/redirects-on-github-pages/). Dalo by se to možná obejít [pluginem pro http refresh](https://github.com/jekyll/jekyll-redirect-from), ale to mi nepřišlo tak elegantní, systémové a ani se mi nechtělo zkoušet, jak se k tomu staví vyhledávače. 

Výrazné zlepšení připisuji i HTTP/2, pro jehož nastavení jsem nemusel dělat vůbec nic. K problematice doporučuji [HTTP/1.1 vs. HTTP/2: A Performance Analysis](https://www.slideshare.net/LoadImpact/http11-vs-http2-a-performance-analysis) a pokračování [Part 2 - performance](https://daniel.haxx.se/http2-velocity-NYC-oct2015/img11.html).

Pluginy
------

Použil jsem následující pluginy

* [jekyll-paginate](https://github.com/jekyll/jekyll-paginate) - stránkování
* [jekyll-gist](https://github.com/jekyll/jekyll-gist) - vkládá gist
* [jekyll-twitter-plugin](https://github.com/rob-murray/jekyll-twitter-plugin) - vkládá tweety
* [jekyll-archives](https://github.com/jekyll/jekyll-archives) - konfigurovatelný archiv, používám kategorie
* [i18n_filter](https://github.com/nelsonsar/jekyll-i18n-filter) - lokalizuje datum zveřejnění článků
* [jekyll-hyphenate_filter](https://github.com/grzm/jekyll-hyphenate_filter) - vkládá dělitelnou mezeru

HTTPS
------

Na stránkách [jakpsatweb.cz](https://www.jakpsatweb.cz) vyšel pěkný článek, [jak již fungující stránky převést na protokol https](https://www.jakpsatweb.cz/https.html) s podrobným návodem. Není to žádná věda, ale přesto se hodí seznam věcí, na co nezapomenout. Jedná se třeba o obrázky z jiných stránek, které musíte také vkládat s https adresou. Vše pak zkontrolujete pomocí nástroje [JitBit SSL Check](https://www.jitbit.com/sslcheck/). Na Netlify nakonec jen zaškrtnete, že chcete HTTPS, a je to. 

![](/assets/2017-04-24/testmysite_io_after.png)
_Stav poté je mnohem lepší_

Co mi ještě nefunguje
------

Dělení článků jen pomocí kategorií je možná příliš hrubé a asi by se hodily tagy. Je to jen otázka konfigurace.

Mnohem větší výzvou jsou [pevné (nedělitelné) mezery](http://www.liteera.cz/slovnik/pevna-mezera). Vzpomněl jsem si, jak jsem sázel bakalářku v LaTexu. Používali jsme program [vlna](http://www.fit.vutbr.cz/~martinek/latex/czech.html#03), který do textu nedělitelné mezery vkládal (v syntaxi LaTeXu je to právě vlna, ~). Potřeboval bych vytvořit plugin pro Jekyll, který vkládá nedělitelné mezery podle českých pravidel. Dobrý námět na vedlejší projekt a způsob, jak se naučit Ruby.
 
Poslední věc, kterou jsem ještě nezmigroval, jsou komentáře. U novějších článků už jsem používal Disqus, kde byla migrace snadná (šlo jen o změnu url), ale ty nejstarší mám pouze v databázi. Import se mi zdá příliš komplikovaný až nemožný (jestli to někdo umíte, dejte prosím vědět).

Zdrojové kódy
-----

[Zdrojové kódy blogu jsou k dispozici na GitHubu](https://github.com/banterCZ/blog/).

Závěr
------
Staticky generovaný web je pro trochu technicky zdatného člověka vhodný „redakční systém“, není potřeba všude nasazovat WordPress. Jekyll je dobrá volba generátoru a Netlify vyhovující hosting.