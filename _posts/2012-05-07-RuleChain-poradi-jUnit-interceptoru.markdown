---
layout: post
title:  "RuleChain - pořadí JUnit interceptorů"
date:   2012-05-07
categories: [software development]
disqusId: 98
---
Již dvakrát jsem psal o tom, jak na interceptor JUnit testů. Mojí motivací byly screenshoty Selenium testů, ale jen když selžou. Prvním způsobem je vlastní anotace <a href="http://www.aspectworks.com/2010/04/junit-anotace-afterfailure">@AfterFailure</a>, což mimo jiné vyžaduje i vlastní test runner. V pozdější verzi JUnit se objevila třída <a href="http://www.aspectworks.com/2010/07/junit-result-interceptor">TestWatchman</a> (již <em>deprecated</em>). Největší nevýhodou bylo, že se volá až po metodě anotované <a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/After.html">@After</a>. Což nevadí do té doby, než se rozhodnete v této metodě zavřít prohlížeč (výsledný screenshot je pak pochopitelně k ničemu). V JUnit verze&nbsp;4.10 byla naštěstí přidána mocná třída <a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/rules/RuleChain.html">RuleChain</a>.
<!--more-->

Nejen v případě Selenium testů použijeme implementace rozhraní <a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/rules/TestRule.html">TestRule</a> a to konkrétně třídy <a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/rules/ExternalResource.html">ExternalResource</a>, <a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/rules/TestWatcher.html">TestWatcher</a> a nakonec <a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/rules/RuleChain.html">RuleChain</a>, třída která určuje pořadí jednotlivých TestRule.

{% gist banterCZ/2594935 %}

Po spuštění příkladu dostanete následující výstup.

<pre>
start server
	before
		test a
	after
Screenshot of the failed test SampleTest#testA
stop server
start server
	before
		test b
	after
stop server
</pre>

JUnit nabízí víc možností než jen @Before, @Test a @After. Nezapomeňte se proto podívat i na ostatní implementace rozhraní TestRule.