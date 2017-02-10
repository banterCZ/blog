---
layout: post
title:  "Spring Certifikace"
date:   2015-07-15
categories: [software development]
item: 164
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><img src="http://static.springsource.org/images/spring_green_on_white_160x90.png" /></div>Jak mám Spring rád a všude ho chválím, tak co se týče jejich certifikace, přijde mi, že to se svou nenažraností přehnali. Je normální, že programátorská zkouška stojí kolem 250 dolarů, ale podmiňovat to účastí na povinném, drahém kurzu, se mi zdá příliš. Naštěstí jedna z výhod práce v korporacích je, že na taková školení prostředky jsou. Sepsal jsem pár poznámek ze školení, které jsem absolvoval, i Spring certifikace, kterou jsem právě složil.
<!--more-->

Školení
------

Samotné školení probíhalo online a trvá čtyři dny (náročné na pozornost, zíval i školitel), ale troufnu si tvrdit, že spíš potřebujete čtyři roky praxe. Podle mého názoru si mohli odpustit dlouhý úvod, obecný popis JPA, JMS, security, mocků... (to přeci musí každý senior programátor umět) a místo toho věnovat víc prostoru proxy nebo hierarchickým kontextům. Na druhou stranu jsem někde četl (pravděpodobně to byla novinářská poučka), že by se neměly přeceňovat znalosti a podceňovat inteligence publika. Čekal bych víc o <a href="https://spring.io/blog/2015/04/03/how-spring-achieves-compatibility-with-java-6-7-and-8">podpoře Java 8</a>. A poslední výtka, Java, i Spring, spějí k annotation hell. Naštěstí ukazují i xml, kterému osobně dávám přednost.

Příklady měli připravené pro cvičené opice, plné TODO, které jste měli doplnit. Přesto, kdo neumí s Eclipse nebo Mavenem, případně vidí Spring poprvé v životě, nemůže stíhat. Ovšem má možnost vypracovat je jako domácí úkoly, protože jsou k dispozici řešení. Prezentovali materiály už se Springem 4.1, ale my dostali jen verzi 4.0 

Celkově mi školení přišlo výrazně kvalitnější než ta od Oraclu. Nejen materiály, ale hlavně tím, že školitel byl zkušený odborník.

Co jsem se naučil
------

Podepsal jsem <a href="https://en.wikipedia.org/wiki/Non-disclosure_agreement">NDAčko</a>, že neprozradím, co bylo za otázky v testu. Nicméně chtěl bych se podělit o pár svých poznámek, ze kterých jsem se na certifikaci učil.

Jedna z klíčových tříd, respektive rozhraní, ve Springu je <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/beans/factory/config/BeanFactoryPostProcessor.html">BeanFactoryPostProcessor</a>. Tento post procesor může modifikovat definici bean. Nejznámější implementací je nejspíš <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/context/support/PropertySourcesPlaceholderConfigurer.html">PropertySourcesPlaceholderConfigurer</a>. Oproti tomu <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/beans/factory/config/BeanPostProcessor.html">BeanPostProcessor</a> (přichází na řadu až po BeanFactoryPostProcessoru) může modifikovat instance bean před nebo i poté, co jsou inicializované. Jako příklad implementace uveďme <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/context/annotation/CommonAnnotationBeanPostProcessor.html">CommonAnnotationBeanPostProcessor</a>, který procesuje například anotace PostConstruct a PreDestroy. Pozor, PreDestroy se nevolá pro beany se scopem <em>prototype</em>. Navíc se volá jen v případě, kdy se JVM ukončí normálně. Pokud vás zajímá, jak toho dosáhli, podívejte se na <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/context/support/AbstractApplicationContext.html#registerShutdownHook--">AbstractApplicationContext#registerShutdownHook()</a>, kde se využívá <a href="http://docs.oracle.com/javase/8/docs/api/java/lang/Runtime.html#addShutdownHook-java.lang.Thread-">Runtime#addShutdownHook(Thread hook)</a>. V souvislosti s anotacemi, kterými můžete ověnčit definici beany, jsem úplně jsem zapomněl, že existuje anotace <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Required.html">Required</a>.

![](/assets/2015-07-15/20150715-Spring - schema version.PNG)

_Schema version_

K životnímu cyklu aplikačního kontextu ještě 
poznámka, že 
<em>annotation
 injection</em> se provede před <em>xml injection</em>. Obě metody lze totiž kombinovat a tohle pořadí vám umožňuje konfiguraci knihoven, jejíchž zdrojový kód nemáte pod kontrolou, ale potřebovali byste překrýt jejich konfiguraci definovanou anotacemi. K injektování prototype do singletonů slouží tzv. <a href="http://java.dzone.com/articles/method-injection-spring">lookup method</a>. V xml konfiguraci nemusíte u schématu uvádět verzi, použije se poslední, což vám usnadní upgrade.

![](/assets/2015-07-15/20150715-Spring - named pointcut.PNG)

_Named pointcut_

Je potřeba porozumět AOP. A to je dobře, protože 
se ve Spring frameworku hojně používá. Udělejte si jasno v termínech <em>join point</em>, <em>pointcut</em> (a jejich zápisu), <em>advice</em>, <em>aspect</em>, <em>target</em> a <em>weaving</em>. Je důležité znát i oba způsoby vytváření proxy: JDK pro interfacy a CGLib pro classy. Z použití AOP jsem si odnesl pěknou inspiraci <a href="http://josiahgore.blogspot.cz/2011/02/using-spring-aop-to-retry-failed.html">Using Spring AOP to Retry Failed Idempotent Concurrent Operations.</a> Pěkný „chyták“ i na zkušené programátory je situace, kdy metoda a() volá metodu b() na té samé třídě, tak se advice nezavolá (<a href="http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html#aop-understanding-aop-proxies">vysvětlení</a>). Užitečný je koncept named pointcut, který vám pomůže odstranit duplicity v konfiguraci, viz obrázek.

Obvykle jsem dělal s větším mírou abstrakce než <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/jdbc/core/JdbcTemplate.html">JdbcTemplate</a>, takže se hodilo zopakovat si rozdíl mezi <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/jdbc/core/RowMapper.html">RowMapper</a> (co řádek to objekt), <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/jdbc/core/RowCallbackHandler.html">RowCallbackHandler</a> (void) a <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/jdbc/core/ResultSetExtractor.html">ResultSetExtractor</a> (celý ResultSet najednou). Nikdy jsem zatím nevyužil <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/transaction/TransactionDefinition.html#PROPAGATION_NESTED">TransactionDefinition#PROPAGATION_NESTED</a>, tak mě ani nenapadlo, jak je to implementováno (jedna fyzická transakce s více safe pointy).

Spring 4 přináší ještě něco sofistikovanějšího než jsou profily a to <a href="http://www.javacodegeeks.com/2013/10/spring-4-conditional.html">anotaci Conditional</a>. Verze 4.1 má další anotační novinku, <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/context/jdbc/Sql.html">Sql</a>, pro spouštění skriptů v testech. Když už je řeč o testech, tak o anotaci <a href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/test/annotation/DirtiesContext.html">@DirtiesContext</a> jsem tušil, ale zatím nepoužil. <a href="http://docs.spring.io/spring/docs/current/spring-framework-reference/html/testing.html#testcontext-ctx-management-javaconfig">Třída anotovaná @Configuration může být přímo součástí testovací třídy</a>, ale musí být static.

Ke studiu můžete využít refcard <a href="http://jpalace.org/docs/refcard/refcard-2-spring4-dependency-injection-annotations.pdf">Spring&nbsp;4&nbsp;–&nbsp;Annotation-Driven
Dependency-Injection</a>. 	

Certifikace
------

Jak už jsem se rozčiloval, kvůli certifikaci musíte absolvovat povinné školení. Ale nebývalo tomu tak vždy. Existovalo něco, čemu říkali <a href="http://www.developersbook.com/certifications/spring/spring-certification-eligibility.php#2">Grandfather Criteria</a>, kdy stačilo doložit příspěvek na fóru, patch, článek na blogu nebo zapojení do user groupy.

Je možné si za 40 USD zakoupit <a href="https://www.springmockexams.com/">neoficiální ukázkové testy</a>. Hodily se mi, ale nutno podotknout, že přístup k nim je pouze on-line, mají tam (podle mě) chyby, nejde odtud kopírovat text a ani si dělat poznámky.

V oficiálním <a href="https://mylearn.vmware.com/lcms/web/portals/www/datasheets/pivotal_studyguide_corespring%284%29.pdf">study guidu</a> se dočtete (a je to pravda), že nezkouší ze jmen tříd a signatury metod. Rovněž tam naleznete seznam otázek, na které byste měli znát odpověď. Test trvá 90 minut a z 50 otázek jich musíte správně zodpovědět 38 (76%). Pokud má otázka více možností, nevíte bohužel kolik.

Související
------

* <a href="/item/120">Spring, REST a e-mail jako parametr</a>
* <a href="/item/127">JSF, Spring Security, Ajax Session Expired</a>
* <a href="/item/122">Spring, JSP a IndexOutOfBoundsException</a>
* <a href="/item/99">Nedrátujte konfiguráky do warka</a>
