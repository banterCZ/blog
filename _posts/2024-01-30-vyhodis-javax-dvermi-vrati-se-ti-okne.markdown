---
layout: post
title:  "Vyhodíš javax dveřmi, ale vrátí se ti oknem"
date:   2024-01-30
categories: [software development]
disqusId: 265
image: "https://commons.wikimedia.org/wiki/File:Nuvola_mimetypes_java_jar.png"
tags: [Java, Maven]
---
<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://commons.wikimedia.org/wiki/File:Nuvola_mimetypes_java_jar.png"><img src="https://upload.wikimedia.org/wikipedia/commons/8/8f/Nuvola_mimetypes_java_jar.png" /></a></div>

Před rokem jsem psal o tom, že máte [dát sbohem javax](/software%20development/2023/01/26/dejte-sbohem-javax.html).
Ale svět není tak růžový.
[Spring Bootu 2.x už skončila podpora zdarma](https://endoflife.date/spring-boot).
Spring Boot 3 vyžaduje [Spring Framework 6 a ten zase Jakarta EE 9](https://github.com/spring-projects/spring-framework/wiki/Upgrading-to-Spring-Framework-6.x).
Taková perlička, placený JBoss EAP k dnešnímu dni neumí Jakarta EE 9, neplacený WildFly ano.
A to už existuje Jakarta EE 10.
Ale to rozebírat nechci.
Už dříve jsme si ukázali, jak `javax` závislosti zakázat.
Když jsem připravoval release, tak jsem se vyděsil, že _enforcer plugin_ mám sice nastavený, ale přesto mi v kódu smrdí třeba `import javax.annotation.Nullable`.
Kde a proč se to tam vzalo?

<div style="clear:both"></div>
<!--more-->


## Guava

Abych to zkrátil, `javax` závislost jako _bean validation_ nebo _servlet_ se mi do artefaktu nedostaly, ale [_Guava_ si sebou táhne vlastní implementaci jsr305](https://github.com/google/guava/issues/2960) a tudíž můžete opravdu použít `import javax.annotation.Nullable`.
Disputace, zda potřebujete s moderní Javou záviset na Guavě, respektive návod, jak se jí zbavit si nechme na jindy.
Respektive může vám ji vnutit transitivně třeba [OWASP/java-html-sanitizer (jako bonus ve zranitelné verzi)](https://github.com/OWASP/java-html-sanitizer/pull/295) (kovářova kobyla, hlavně že v TOP 10 je _A06:2021 – Vulnerable and Outdated Components_) nebo například `google-api-client`.


## Enforcer Plugin

Naštěstí tu máme [enforcer plugin](https://maven.apache.org/enforcer/maven-enforcer-plugin/), který toho umí víc. Lze zakázat konkrétní importy, viz následující konfigurace.

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-enforcer-plugin</artifactId>
    <dependencies>
        <dependency>
            <groupId>de.skuzzle.enforcer</groupId>
            <artifactId>restrict-imports-enforcer-rule</artifactId>
            <version>2.5.0</version>
        </dependency>
    </dependencies>
    <executions>
        <execution>
            <id>enforce-banned-java-imports</id>
            <goals>
                <goal>enforce</goal>
            </goals>
            <configuration>
                <rules>
                    <RestrictImports>
                        <!--  https://github.com/google/guava/issues/2960  -->
                        <reason>Guava depends on jsr305, but we prefer jakarta in our code</reason>
                        <bannedImport>javax.annotation.**</bannedImport>
                    </RestrictImports>
                </rules>
            </configuration>
        </execution>
    </executions>
</plugin>
```

Celý projekt si můžete [stáhnout z GitHubu](https://github.com/banterCZ/blog-example-enforcer-import) a zkusit, že build skutečně selže.

```shell
mvn clean validate
```


## Závěr

Je vidět, že `javax` má tuhý kořínek a stále se chce někudy vecpat.
Ukázali jsme si další možnosti `enforcer pluginu`, který může fungovat jako taková ruční brzda a hlídat neposedné transitivní závislosti. 


## Související

- [Dejte sbohem javax](/software%20development/2023/01/26/dejte-sbohem-javax.html)
- [Jak velký je váš war](/software%20development/2015/08/19/jak-je-velky-vas-war.html)
- [Transition from Java EE to Jakarta EE](https://blogs.oracle.com/javamagazine/post/transition-from-java-ee-to-jakarta-ee)
- [Konflikt tranzitivních závislostí](/software%20development/2015/04/29/konflikt-tranzitivnich-zavislosti.html)
