---
layout: post
title:  "Monitoring"
date:   2017-02-22
categories: [software development]
disqusId: 186
image: "https://openclipart.org/image/300px/svg_to_png/245804/Cctv-sketch-camera-2016040654.png"
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://openclipart.org/detail/245804/Cctv-sketch-camera"><img src="https://openclipart.org/image/300px/svg_to_png/245804/Cctv-sketch-camera-2016040654.png" /></a></div>
U zákazníka jsme měli nasazené řešení (sestávající se z několika málo desítek komponent), ke kterému jsme poskytovali _second level support_. Selhání byť jediné komponenty mohlo způsobit zastavení celé produkce. Identifikace toho, která komponenta zapříčinila výpadek, bylo zbytečně zdlouhavé. Nehledě k tomu, že jsme nedokázali problémy dostatečně předvídat. Zákazník zcela logicky začal požadovat monitoring celého řešení.

Velkou část minulého roku jsem tak strávil s monitoringem. Nepovažuji se v dané problematice za odborníka (podle [kompetenční matice](http://sijinjoseph.com/programmer-competency-matrix/) bych to viděl tak na n<sup>2</sup>), ale minimálně si chci napsat pár poznámek pro sebe, abych vše nezapomněl. Měl jsem zahrnout monitorování do [Joel Test 2.0]({{ site.baseurl }}{% post_url 2015-10-22-joel-test-2.0 %}), protože si dnes už nedokážu představit provozovat komplexní systém bez monitoringu.

Chci se nejprve obecně věnovat problematice monitoringu a pak konkrétní implementaci a to [Nagios](https://www.nagios.org/), respektive [Eyes of Network](https://www.eyesofnetwork.com), které nad Nagiosem staví.

<!--more-->

<div style="clear:both"></div>

Úvod do monitorování
------
Co to je monitoring? Z mého pohledu jde o sledování a hlášení kritických chyb, nebo ještě lépe včasné varování, pokud se nějaká chyba blíží. Mezi základní kritéria si můžete představit volné místo na disku či operační paměti, čas do vypršení certifikátu, ping, telnet... Představivosti se meze nekladou. Mám vyzkoušené, že analýza toho, co monitorovat a jaký nastavit _threshold_ (práh, hranice) zabere mnohem víc času než samotná implementace, která je v podstatě jednoduchá. Platí, že měření by nemělo ovlivnit měření či v lékařské terminologii vyjádřeno _primum non nocere_ (především neškodit).

Technologie
------

![](/assets/2017-02-22/monitoring_job_trends.png)

_[Job trends na Indeed.com](https://www.indeed.com/jobtrends/q-nagios-q-zabbix-q-solarwinds.html)_

U samotného výběru technologie jsem nebyl, šlo o politické rozhodnutí, ale myslím, že (zpětně viděno) šlo o dobré rozhodnutí. Byla vybrána technologie __Eyes Of Network__ (dále jen EoN) postavená na technologii __Nagios__, která je de facto průmyslovým standardem. Jedná se o open-source řešení (pod licencí GPL2, se kterou ovšem můžete někde v komerční sféře mít problémy, ale neměli byste, protože k EoN budete nejspíš přistupovat jen jako k _black-box_). Distribuované jako CentOS image. Projekt sponzoruje firma APX, u které si můžete objednat konzultanty. Jediná nevýhoda je, že je to francouzský kód, takže občas na mě v logu nebo některých návodech vykoukla francouzština.

![](/assets/2017-02-22/EysOfNetwork_architecture.png)

_[Architektura Eyes of Nework, zdroj: www.eyesofnetwork.com](https://www.eyesofnetwork.com/)_

Nagios
------

Pár termínů, se kterými se setkáte v Nagiosu. __Host__ je cokoliv, s čím se domluvíte přes TCP. __Service__ je logická entita, která běží na hostu (pozor, nezaměňovat za windows service).

_![](/assets/2017-02-22/nagios_hard_soft_state.png)_

Nagios rozlišuje tzv. _hard_ a _soft state_. Jde o to, že když se zatoulá jeden ping, tak aby vás to zbytečně neděsilo či dokonce nebudilo. Indikuje-li se chyba, výrazně se zkrátí interval kontroly a teprve když se chyba potvrdí, přepne se do _hard state_.

_[Hard/soft state, zdroj: JBsWiki (cc-by-sa 3.0)](http://www.jbackes.de/wiki/doku.php?id=nagios_mit_dynamischem_check-intervall)_

SNMP
------

[SNMP (Simple Network Management Protocol)](https://cs.wikipedia.org/wiki/Simple_Network_Management_Protocol) je protokol pro správu sítí, ale my ho můžeme využít i pro monitoring, aniž bychom museli instalovat nějaké agenty (o nich později). Můžete tak monitorovat třeba místo na disku, volnou operační paměť...

Potřebujete, aby vám na monitorovaném stroji běžela windows služba SNMP (pokud ne, musíte si [_featuru_ přidat](http://www.ireasoning.com/articles/setup_snmp_service.php)). Službu si musíte nastavit. Bude vás zajímat především _community name_, stačí přístup _READ ONLY_. Dobré omezit na IP adresu monitorovacího serveru. Ano vím, lze podvrhnout, ale jednak jsme zapnuli _READ ONLY_ režim a jednak doufám, že vaše síť má ochranu proti [ARP poisoning](https://cs.wikipedia.org/wiki/ARP_spoofing). Každopádně vyšší verze SNMP už umí i TLS (nezkoušel jsem).

Lokální Pluginy
------

Pro Nagios existuje kvanta pluginů, takže dost možná nebudete muset psát žádný vlastní. Ale i kdyby, tak [psát vlastní Nagios plugin je triviální](https://nagios-plugins.org/doc/guidelines.html). Můžete použít libovolný programovací či skriptovací jazyk, vystačíte si s pár status kódy a formátováním textu. Ty již hotové jsou často Perlu, ale když pluginy pouze spouštíte, tak vás to nemusí děsit. To jen připomínka, kdybyste se v nich chtěli vrtat. 

Namátkou jmenujme pár, se kterými se nejspíš setkáte. Předně
[check_snmp](https://www.monitoring-plugins.org/doc/man/check_snmp.html) je potřeba pro monitorování SNMP (podrobnosti viz výše). S pluginem [check_http](https://www.monitoring-plugins.org/doc/man/check_http.html) můžete kontrolovat HTTP status kódy, (ne)přítomnost konkrétního textu, platnost certifikátů... Pro monitorování Oracle databáze slouží [check_oracle_health](https://exchange.nagios.org/directory/Plugins/Databases/Oracle/check_oracle_health/details). Pozornosti javistů by neměl uniknout plugin [check_jmx](https://exchange.nagios.org/directory/Plugins/Java-Applications-and-Servers/check_jmx/details).

Vzdálené pluginy
------

Předchozí pluginy se volají přímo z monitorovacího serveru. Můžete ovšem potřebovat kontrolovat něco lokálně na daném hostu, ať už kvůli tomu, že potřebujete přímý přístup na systém či daný protokol neproleze firewallem.

K tomu slouží [NRPE (Nagios Remote Plugin Executor)](https://exchange.nagios.org/directory/Addons/Monitoring-Agents/NRPE--2D-Nagios-Remote-Plugin-Executor/details),
protokol založený na TCP/IP. Pomocí pluginu [check_nrpe](https://exchange.nagios.org/directory/Addons/Monitoring-Agents/NRPE--2D-Nagios-Remote-Plugin-Executor/details) provoláte na hostu agenta.

### NSCLIENT

Nejznámější agentem je [NSClient++](https://www.nsclient.org/) pro operační systémy MS Windows. Díky němu můžete volat VB skripty, BAT, EXE a v neposlední řadě [PowerShell](https://cs.wikipedia.org/wiki/Windows_PowerShell).

![](/assets/2017-02-22/nsclient.png)

_zdroj: [nsclient.org](https://docs.nsclient.org/tutorial/)_

### JNRPE

Existuje i Java klient [JNRPE](http://www.jnrpe.it/). Pokud [implementujete vlastní plugin v Javě](http://www.jnrpe.it/cms/index.php/tutorials/nagios/jnrpe/7-creating-plugins-with-java-part1) (návod bohužel zmizel!), tak se s každý checkem nespouští separátní JVM.

Nagvis
------
Díky [Nagvis](https://www.nagvis.org/), který je součástí EoN, si můžete monitorovanou platformu vhodně vizualizovat. Jako pozadí si vyberete libovolný obrázek a pak nataháte bubliny, které reprezentují jednotlivé _service_ nebo _host_.

![](/assets/2017-02-22/nagvis.jpg)

_zdroj: [nagvis.org](https://www.nagvis.org/screenshots)_

Zkušenosti
------

EoN podporuje šablony (template), takže je dobré je využívat, abyste si ušetřili práci. Lze tak nadefinovat třeba šablonu pro Windows host, která bude zahrnovat kontrolu rozhraní (např. [Hyper-V](https://cs.wikipedia.org/wiki/Hyper-V)), ping, disku a operační paměti. To se bude kontrolovat na každém hostu, ale přidáte si specifické kontroly pro daný host a jednotlivé service. 

Kde se musí monitoring autentizovat, je kvůli bezpečnosti potřeba použít speciálního uživatele s omezenými právy. Ukázka pro databázi Oracle.
 
{% gist banterCZ/d1bf570f8db428bcca8ae6a072644074 %}

Dost se mi osvědčil [PowerShell](https://cs.wikipedia.org/wiki/Windows_PowerShell). Ne že bych skripty raději nepsal v Groovy, ale PowerShell je v podstatě na každé windows mašině.

Co jsme v první fázi neřešili, protože bychom na tom analyticky strávili dost času, jsou notifikace a eskalace. Systém může posílat třeba SMS nebo e-maily, přičemž pokud ten, kdo drží službu, neopraví chybu do nějaké doby, tak se upozorní například jeho nadřízený. Zase je to víc o byznys procesech. 

Škálování bych se nebál. Naše nasazení mělo řádově stovky kontrol. Ale chlapci z APX tvrdili, že (jestli si dobře pamatuji), v Airbus továrně na vrtulníky mají 20 tisíc kontrol.

Závěr
------

Pokud pouze nedodáváte hotové řešení, ale rovněž ho i provozujete, rozhodně bych po nějakém, byť minimálním monitoringu sáhnul. Za sebe můžu říct, že [Nagios](https://www.nagios.org/) v podání [Eyes of Network](https://www.eyesofnetwork.com/) byla dobrá volba a že i placená podpora od APX v případě složitějšího systému stojí za zvážení.

Edit
------

Martin Stiborský mě na twitteru upozornil na [Incinga](https://www.icinga.com/), jedná se o [fork Nagiosu](http://freesoftwaremagazine.com/articles/nagios_and_icinga/). Podle dema vypadá pěkně a responzivně (hlavně ve srovnání s EoN). Při nějakém dalším monitoringu určitě zvážím, GUI mě nalákalo a téměř vše výše řečené tam bude platit taky.

{% twitter https://twitter.com/stibi/status/834873330700333058 hide_thread=true %}