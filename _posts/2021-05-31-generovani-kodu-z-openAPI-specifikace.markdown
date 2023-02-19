---
layout: post
title:  "Generování kódu z OpenAPI specifikace"
date:   2021-05-31
categories: [software development]
disqusId: 238
image: "/assets/2021-05-31/server-client.png"
---

<div style="float: left; margin: 0.5em 1em 0.5em 0em; text-align: center;"><img src="/assets/2021-05-31/server-client.png" /></div>

Minule jsem se věnoval [Úskalí API](/software%20development/2021/04/28/uskali-API.html) se zaměřením na binární kompatibilitu a tvorbu rozšíření. API se přidržme, tentokrát jakožto rozhraní mezi komponentami v podobě webových služeb. Budeme mluvit o RESTu, OpenAPI specifikaci, proč nejdřív popisovat API a proč a jak generovat kód (s přiloženým příkladem).

<div style="clear:both"></div>
<!--more-->

## Nejdřív API

Pohodlný způsob je něco naimplementovat a pak si nechat popis API vygenerovat. Osobně jsem zastáncem přístupu _API first_, tedy nejdřív sepsat API a pak teprve začít implementovat. Zdánlivě nás to zdrží v počátku, ale celkově by nám to mohlo pomoc v tom, že implementaci nebudeme pracně několikrát přepisovat. Ale hlavně jde o to, že se konzument a producent API dohodnout na kontraktu, kterým spolu hodlají komunikovat a oba můžou začít pracovat nezávisle. Jak byste u generovaného API kontrolovali a popisovali změny, jak uhlídáte zpětnou kompatibilitu?

## Proč generovat kód

Nejdřív tedy napíšeme specifikaci. A pak ji přepíšeme do kódu. V tom snadno uděláte chybu (vyzkoušeno za vás). Jistě, jsou nějaké nástroje jako [Dredd](https://dredd.org/en/latest/) nebo mít baterii automatizovaných testů v [Newman (Postman)](https://learning.postman.com/docs/running-collections/using-newman-cli/command-line-integration-with-newman), které vám s tím můžou pomoci. S chybnou implementací je potíž, protože klienti někdy napíší svoji aplikaci podle chování serveru. Co ale změníte, abyste narovnali skutečnost, implementaci nebo specifikaci API? Co je kontrakt, vůči kterému držíte zpětnou kompatibilitu?

## Webové služby

Pamětníci vědí, že REST není jediný způsob, jak realizovat webové služby. Existuje ještě [SOAP](https://cs.wikipedia.org/wiki/SOAP) s popisem v podobě WSDL. Kromě toho, že je REST v módě, tak může mít menší nároky na (de)serializaci (JSON versus XML) a umožňuje využití HTTP cache. Tady mám potřebu ventilovat svoje zklamání, mám totiž dojem, že ani po letech, kdy tu s námi REST je, nedosahují nástroje pro generování kódu takové vyspělosti, na kterou jsme byli zvyklí ze světa SOAP (nebo už si to špatně pamatuju?). Například k dnešnímu dni má [openapi-generator otevřených téměř 2200 issues](https://github.com/OpenAPITools/openapi-generator/issues).

## Proč OpenAPI

Proč [OpenAPI](https://swagger.io/docs/specification/about/)? Jedná se o formát, který udržuje široký výbor, což je jistá záruka stability (a možné riziko neflexibility). Ano, jsem předpojatý, ale poté co Oracle koupil českou firmu Apiary (jinak klukům samozřejmě blahopřeju), tak jsem jejich [API Blueprint](https://apiblueprint.org/) škrtl ze svého výběru.

V rámci lepší organizace doporučuji organizovat OpenAPI specifikaci do více _yaml_ souborů. Na jednu stranu to prodlužuje konfiguraci generátoru, ale na druhou stranu nám to umožňuje generovaný kód rozdělit do java balíčků. Může se stát, že konzument API chce soubor jediný, nebo že chcete vygenerovat jedinou html dokumentační stránku (příklad slévání více souborů si necháme někdy na příště).

## Příklad generování z OpenAPI

Mým cílem je vygenerovat DTO objekty, přibalit je do _jar_ souboru, který byste pak použili jako závislost. Ukázat organizaci OpenAPI specifikaci do více _yaml_ souborů a jak vyřešit to, aby se některé DTO objekty negenerovaly do více balíčků. V neposlední řadě ukazuji, jak použít sdílené knihovny DTO objektů. Záleží na vaší situaci, ale dokážu si představit, že by jste například chtěli v celé platformě sdílet způsob stránkování nebo formát chybových hlášek.

Modelová situace je značně vyumělkovaná. V praxi byste třeba kvůli výkonu nevraceli celý navázaný objekt `$.pet.owner`, ale jen jeho identifikátor `$.pet.ownerId`. Pro ukázku sdíleného DTO objektu jsem zvolil adresu. Doufám, že je to ve prospěch čitelnosti.

Níže vidíte útržek konfigurace maven pluginu. Celý [příklad najdete na githubu](https://github.com/banterCZ/blog-example-openapi-generator).

```xml
<plugin>
    <groupId>org.openapitools</groupId>
    <artifactId>openapi-generator-maven-plugin</artifactId>
    <version>5.1.0</version>
    <configuration>
        <generatorName>jaxrs-spec</generatorName>
        <modelNameSuffix>Dto</modelNameSuffix>
        <generateApis>false</generateApis>
        <generateModelDocumentation>false</generateModelDocumentation>
        <generateSupportingFiles>false</generateSupportingFiles>
        <generateModelTests>false</generateModelTests>
        <configOptions>
            <hideGenerationTimestamp>true</hideGenerationTimestamp>
            <useBeanValidation>false</useBeanValidation>
            <!-- default value is src/main/java -->
            <sourceFolder>java</sourceFolder>
        </configOptions>
    </configuration>

    <executions>

        <execution>
            <id>generate-users</id>
            <goals>
                <goal>generate</goal>
            </goals>
            <configuration>
                <inputSpec>${basedir}/openapi/users.yaml</inputSpec>
                <modelPackage>cz.zvestov.blog.example.dto.user</modelPackage>
                <importMappings>
                    <importMapping>Address=cz.zvestov.blog.example.common.domain.AddressDto</importMapping>
                </importMappings>
            </configuration>
        </execution>

        <execution>
            <id>generate-pets</id>
            <goals>
                <goal>generate</goal>
            </goals>
            <configuration>
                <inputSpec>${basedir}/openapi/pets.yaml</inputSpec>
                <modelPackage>cz.zvestov.blog.example.dto.pet</modelPackage>
                <importMappings>
                    <importMapping>User=cz.zvestov.blog.example.dto.user.UserDto</importMapping>
                </importMappings>
            </configuration>
        </execution>

    </executions>
</plugin>
```

V rámci konfigurace je potřeba vybrat vhodný [generátor](https://github.com/OpenAPITools/openapi-generator/tree/master/docs/generators)

Generátory se dělí na klientské a serverové (a ne vždy je to zřejmé jen z názvu). Dle pozorování (a nakonec pochopitelně) klientské pro odpovědi negenerují _settery_. Chtěl jsem generovat pouze DTO pro server, sáhl jsem tedy po serverovém a co nejvíce technologicky agnostickém [jaxrs-spec](https://github.com/OpenAPITools/openapi-generator/blob/master/docs/generators/jaxrs-spec.md).

Dále je potřeba změnit výchozí hodnotu `sourceFolder`, což zajistí, aby se do _jar_ souboru dostaly vygenerované třídy (najdete je v adresáři `target/generated-sources/openapi/java`). Jsem proti tomu, aby se generované třídy verzovaly v git repozitáři. Kde je pak zdroj pravdy, když se to rozjede vůči specifikaci API? Výsledný _jar_ soubor si samozřejmě publikujte do maven repozitáře, ať ho někdo může použít jako závislost. Uznávám, dopouštíme se tady ústupku, protože v jednom git repozitáři máme OpenAPI specifikaci i konfiguraci generátoru, ale zjednoduší nám to práci, protože se v rámci buildu nemusíme starat o stahování specifikace. Pakliže se přidržíme toho, že vygenerovaný kód neverzujeme v gitu, tak s tím dokážu žít.

Je potřeba definovat tolik `execution`, kolik máte OpenAPI specifikací. To nám ale umožní pro každý soubor vybrat vlastní java balíček.

Povšimněte si konfigurace

`<importMapping>User=cz.zvestov.blog.example.dto.user.UserDto</importMapping>`

Specifikace [pets.yaml](https://github.com/banterCZ/blog-example-openapi-generator/blob/develop/blog-example-openapi-generator-dto/openapi/pets.yaml) odkazuje na schéma `User` ze souboru [users.yaml](https://github.com/banterCZ/blog-example-openapi-generator/blob/develop/blog-example-openapi-generator-dto/openapi/users.yaml), což je validní postup, ale vedlo by to ke generování dvou `UserDto` tříd, byť v jiném balíčku.

Obdobně zafunguje

`<importMapping>Address=cz.zvestov.blog.example.common.domain.AddressDto</importMapping>`

kde jsem chtěl ukázat použití sdíleného kódu. Třída se vezme ze závislosti a negeneruje se. Aby se vám podařilo projekt jednoduše sestavit, simuloval jsem závislost jako maven modul. V praxi by se nejspíš jednalo o samostatný projekt.

Pozorný čtenář si v příkladu všimne _optional_ závislostí `jackson-annotations`, `swagger-annotations` a `jakarta.annotation-api`. Jedná o dokumentační anotace použité ve vygenerovaných DTO třídách. Pro sestavení _jar_ souboru jsou potřeba, ale pakliže vygenerovaný kód použijete jako závislost, tak už je na _classpath_ nepotřebujete (pokud je nechcete v _runtime_ využívat přes reflexi).
Generování swagger anotací můžete vypnout následující konfigurační volbou.
```xml
<configOptions>
    <useSwaggerAnnotations>false</useSwaggerAnnotations>
</configOptions>
```

Celý [příklad najdete na githubu](https://github.com/banterCZ/blog-example-openapi-generator).

## Závěr

Zastávám přístup _API first_. Kód doporučuji generovat (ale neverzovat v gitu). Nástroje pro to jsou, ale člověk se trochu natrápí. Výsledný artefakt je k publikování do maven repozitáře a použití jako závislost.
