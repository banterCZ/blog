---
layout: post
title:  "Dejte sbohem javax"
date:   2023-01-26
categories: [software development]
disqusId: 255
image: "https://upload.wikimedia.org/wikipedia/commons/8/8f/Nuvola_mimetypes_java_jar.png"
tags: [Java, Maven]
---

<div style="float: left; margin: 0 1em 1em 0; text-align: center;"><a href="https://commons.wikimedia.org/wiki/File:Nuvola_mimetypes_java_jar.png"><img src="https://upload.wikimedia.org/wikipedia/commons/8/8f/Nuvola_mimetypes_java_jar.png" /></a></div>

Jednou za čas dostanu uklízecí mánii.
Tentokrát mě k tomu dokopal _aplikáč_, kde nefungovalo něco, co v pohodě běželo na _servlet containeru_.
Odpustím si plivání síry, protože pořádek v tom úplně nebyl. 
Problém měl dvě části.
Kdysi už jsem psal o tom, že věci jako [servlet API do waru nepatří](https://blog.zvestov.cz/software%20development/2015/08/19/jak-je-velky-vas-war.html).
To je sice poměrně jasné, ale i tak se člověk dokáže nachytat.
Pak je tu trochu větší past a to, že [Java EE (aka javax) je mrtvá, nově už jako Jakarta EE](https://blogs.oracle.com/javamagazine/post/transition-from-java-ee-to-jakarta-ee). 

<div style="clear:both"></div>
<!--more-->


## Úvod

Doporučuji vaší pozornosti článek [Transition from Java EE to Jakarta EE](https://blogs.oracle.com/javamagazine/post/transition-from-java-ee-to-jakarta-ee),
ale abych to trochu předžvýkal.
Java EE jako například `javax.servlet-api` byla v Oracle repozitářích.
Kód se přesunul do _open source_.
Zůstal _java package name_ (v prvních verzí, později se rovněž mění), ale změnil se _maven group ID_ z `javax.*` na `jakarta.*`. 
To sice dává jasně najevo rozdíl, ale zároveň to umožňuje používat oba artefakty současně.
Navíc, a to je horší, to umožňuje mít závislosti odlišných verzí.
Používáte-li například [Spring Boot BoM](https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-dependencies/2.7.8/spring-boot-dependencies-2.7.8.pom),
tak ten definuje obě sady artefaktů, ale co se týče verzí, tak vám alespoň napovídá.

Následuje ukázka rozdílu v definici maven závislosti `servlet-api`.

### Javax

```xml
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>${servlet-api.version}</version>
</dependency>
```

### Jakarta

```xml
<dependency>
    <groupId>jakarta.servlet</groupId>
    <artifactId>jakarta.servlet-api</artifactId>
    <version>${jakarta-servlet.version}</version>
</dependency>
```


## Cíl

Chceme se tedy zbavit všech závislostí `javax.*`.
Včetně `com.sun.mail` a `com.sun.xml.bind`.
K `javax.cache` jsem nenašel `jakarta` alternativu.
Přibalíte (_maven scope_ `compile`) jen ty závislosti, které jsou nutné.
Podle toho, kam nasazujete.
Třeba `servlet-api` nepatří ani na _servlet container_.

Pro nižší verze `jakarta` artefaktů nemusíte měnit _java importy_.
Tedy že budete stále používat `javax.servlet.http.HttpServletRequest` a teprve později přejdete na `jakarta.servlet.http.HttpServletRequest`.


## Bezpečnostní pojistky

Ani sebelepší code review nezaručí, že vám pořádek vydrží.
Můžete si tam knihovny zavést i neúmyslně přes tranzitivní závislosti.
Pojistkou může být šikovně nastavený [maven enforcer plugin](https://maven.apache.org/enforcer).
Konkrétně [konfigurace zakázaných závislostí](https://maven.apache.org/enforcer/enforcer-rules/bannedDependencies.html).

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-enforcer-plugin</artifactId>
    <version>${maven-enforcer-plugin.version}</version>
    <executions>
        <execution>
            <id>enforce-banned-dependencies</id>
            <goals>
                <goal>enforce</goal>
            </goals>
            <configuration>
                <rules>
                    <bannedDependencies>
                        <excludes>
                            <!-- Force switching to Jakarta EE -->
                            <exclude>javax.*</exclude>
                            <!-- already on application server or servlet container -->
                            <exclude>jakarta.servlet:jakarta.servlet-api:*</exclude>
                            <exclude>jakarta.servlet.jsp:jakarta.servlet.jsp-api:*</exclude>
                            <!-- replaced by jakarta -->
                            <exclude>com.sun.mail</exclude>
                            <exclude>com.sun.xml.bind</exclude>
                        </excludes>
                        <includes>
                            <!-- Jakarta API are allowed to be provided -->
                            <include>jakarta.*:*:jar:*:provided</include>
                            <!-- Not yet migrated to Jakarta -->
                            <include>javax.cache:*</include>
                        </includes>
                    </bannedDependencies>
                </rules>
            </configuration>
        </execution>
    </executions>
</plugin>
```


## Závěr

Java EE aka _javax_ je mrtvá, ať žije Jakarta.
Je nebezpečné mít obě závislosti současně, zejména s ohledem na možnou rozdílnost verzí.
Ukázali jsme si, jak můžete nakonfigurovat _maven plugin_, který vám závislosti bude hlídat.


## Související

- [Jak velký je váš war](https://blog.zvestov.cz/software%20development/2015/08/19/jak-je-velky-vas-war.html)
- [Transition from Java EE to Jakarta EE](https://blogs.oracle.com/javamagazine/post/transition-from-java-ee-to-jakarta-ee)
- [Konflikt tranzitivních závislostí](https://blog.zvestov.cz/software%20development/2015/04/29/konflikt-tranzitivnich-zavislosti.html)
