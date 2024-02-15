Morcore2Esuites op Haven installeren
====================================

In deze readme wordt uitgelegd hoe deze koppeling op Haven (Kubernetes) geinstalleerd kan worden.

Voor we beginnen
================

Morcore2Esuites in een koppeling tussen Morcore en Esuites, gebouwd met het [Frank!Framework](https://github.com/frankframework/frankframework).

We zullen voor de deployment de [Frank!Framework Helm Chart](https://frankframework.github.io/charts/frankframework) gebruiken. Hiervoor is de [Helm](https://helm.sh/) package manager nodig.

> [!NOTE]
> Deze stappen omschijven hoe een deployment met de hand kan worden gedaan. Voor GitOps kan tussen de regels doorgelezen worden om de juiste informatie eruit te halen.

Helm
----

[Helm](https://helm.sh/) moet geïnstalleerd zijn om de Chart te kunnen gebruiken. Raadpleeg de Helm [documentatie](https://helm.sh/docs/)  om te beginnen.

Registry
--------

De Chart die we gaan gebruiken (`frankframework`) bevind zich op de [frankframework registry (`https://frankframework.github.io/charts`)](https://frankframework.github.io/charts)

Om de Chart te gebruiken moet eerst de registry zijn toegevoegd. Dat kan met dit commando:

```shell
helm repo add frankframework https://frankframework.github.io/charts
```

Installatie
===========

De Chart die we gebruiken voor de deployment heet `frankframework`. Voordat we deze installeren moet deze eerst naar wens worden aangepast.

Configureer de Helm Chart
-------------------------

Values
------

Om over een te komen met de huidige infra moet de Helm Chart worden geconfigureerd. Denk aan database verbinding en authenticatie.

Deze services kunnen worden ingesteld via de `values.yaml`. Alle mogelijke values staan beschreven op GitHub en de site: [charts/charts/frankframework at master - frankframework/charts (github.com)](https://github.com/frankframework/charts/tree/master/charts/frankframework)

Het maakt niet uit waar het `values.yaml` bestand wordt aangemaakt, zolang deze gebruikt wordt bij het installatie commando.

### Frank!Configuratie

Er zijn verschillende manieren om een configuratie in het Frank!Framework te krijgen, maar de meest doorsnee manier is door een Docker image te bouwen, waar deze in gekopieerd word. De Docker image wordt gebaseerd op [frankframework/frankframework](https://hub.docker.com/r/frankframework/frankframework). Dit is een "kale" instantie van het Frank!Framework. Door de configuratie in `/opt/frank/configurations/` te zetten wordt de image een complete Frank!.

Voor Morcore2Esuites hebben we al een image gebouwd. Deze is te vinden op [Packages - WeAreFrank! (github.com)](https://github.com/orgs/wearefrank/packages?repo_name=morcore2esuites).

Om deze te gebruiken met de Helm Chart moet dat in de Values worden gespecificeerd. Dat ziet er dan zo uit:

```yaml
image:
  registry: ghcr.io
  repository: wearefrank/morcore2esuites
  tag: main
```

### DTAP

De DTAP-stage moet worden gezet om de juiste functionaliteiten van het Framework in te schakelen. In de `values.yaml` kan deze worden gevonden onder `frank.dtap.stage`.

[The DTAP stage and setting properties --- Frank!Manual 1.0 documentation (frank-manual.readthedocs.io)](https://frank-manual.readthedocs.io/en/latest/deploying/dtapAndProperties.html)

### Properties

Om de instellingen van de configuratie of het Frank!Framework te veranderen, kunnen properties worden gezet. Dit kan in de `frank.properties` in een `yaml` structuur worden genoteerd.

De Morcore2Esuites heeft een aantal properties nodig. Deze staan in dit geval in de deployment specifics.

[morcore2esuites/classes/DeploymentSpecifics.properties at main - wearefrank/morcore2esuites (github.com)](https://github.com/wearefrank/morcore2esuites/blob/main/classes/DeploymentSpecifics.properties)

Een voorbeeld van extra properties die voor het Frank!Framework ingesteld kunnen worden is prometheus.

[frankframework/core/src/main/resources/AppConstants.properties at c7bce1841f03f1f6584242aadf008a7ce4d1522d - frankframework/frankframework (github.com)](https://github.com/frankframework/frankframework/blob/c7bce1841f03f1f6584242aadf008a7ce4d1522d/core/src/main/resources/AppConstants.properties#L225)

### Database

De database verbinding moet momenteel via Tomcat (de applicatieserver) geregeld worden. Dat gaat met een `context.xml`. Deze kun je zelf aanleveren in de Docker image, of deze kan via de Helm Chart gegenereerd worden. Deze keuze kan worden gemaakt met de waarde  `connections.create` in de `values.yaml`. Als deze waarde op `true` staat, wordt de `context.xml` gegenereerd. Een voorbeeld van de database configuratie ziet er als volgt uit:

```yaml
connections:
  create: true
  jdbc:
    - type: postgresql
      host: postgresql
      database: frank
      username: ${database/username}
      password: ${database/password}
```

Om het wachtwoord niet in de Yaml te hoeven zetten kan deze met een template worden ingevult in runtime.

### Secrets en credentials

Om secrets in runtime te injecreten wordt in het framework de credential provider gebruikt. Deze credentials wordt door de credention provider uit een bestand uitgelezen.

Dit bestand kan als secret gemaakt worden. In dat ene bestand staan dan alle credentials. Het is momenteel niet mogelijk om meerdere credential bestanden aan te geven. De inhoud van de secret zou er zo uit kunnen zien (uiteraard in base64):

```yaml
data:
  credentials.properties:
    database/username=postgres
    database/password=postgres

```

Hier is meer info te vinden over credentials.

[Credentials --- Frank!Manual 1.0 documentation (frank-manual.readthedocs.io)](https://frank-manual.readthedocs.io/en/latest/deploying/credentials.html)

In de `values.yaml` moet deze secret worden meegegeven onder `frank.credentials` en ziet er dan zo uit:

```yaml
frank:
  credentials:
    secret: credentials
    key: credentials.properties
```

Vervolgends kunnen de credentials overal toegepast worden, ook de authAlias die nodig is voor het wachtwoord van een certificaat.

### Certificaten

Het is mogelijk om certificaten stores als truststores en keystores te mounten in de pod.

Deze moeten al als secret aanwezig zijn in een van deze formaten: PKCS12, PEM, JKS, JCEKS.

De configuratie in de `values.yaml`zou er ongeveer zo uit moeten zien:

```yaml
frank:
  security:
    certificateStores:
      - secretName: keystore
        key: keystore.jks
        resourceUrl: relevantName.jks
```

Voor Morcor2Esuites moeten deze worden ingesteld voor de mTLS. De trust- en keystore moeten worden ingestelt via de properties.

Daarnaast moeten ook certificaten op de ingress worden ingesteld voor binnenkomend verkeer.

Dit is een voorbeeld van de properties in de Values:

```yaml
frank:
  properties:
    MorCore:
      keystore: "relevantName.jks"
      keystoreType: "JKS"
      keystoreAuthAlias: "relevantName"
      # cert name in keystore
      keystoreAlicertNameas: "certname"
      keystoreAliasAuthAlias: "certnameAlias"
      keystoreAliasPassword: ""
      truststore: ""
      truststoreAuthAlias: ""
      truststorePassword: ""
      truststoreType: ""
```

Resultaat
---------

```yaml
image:
  registry: ghcr.io
  repository: wearefrank/morcore2esuites
  tag: main

frank:
  dtap:
    stage: "" # verander naar correcte dtap stage
  credentials:
    secret: "" # secret naam waar de credentials in staan
    key: "" # key in de data van de secret waat alle credentials onder zitten
  security:
    certificateStores:
      - secretName: "" # secret naam van de key/truststore
        key: "" # key of bestandsnaam
        resourceUrl: "" # bestemmingsnaam waar de keystore mee gevonden kan worden vannuit de configuratie
  properties:
    MorCore:
      taak:
        API:
          root-url: ""
      keystore: ""
      keystoreType: ""
      keystoreAuthAlias: "" 
      keystorePassword: ""
      keystoreAlias: ""
      keystoreAliasAuthAlias: ""
      keystoreAliasPassword: ""
      truststore: ""
      truststoreAuthAlias: ""
      truststorePassword: ""
      truststoreType: ""
    Esuites:
      ESB:
        root-url: ""
      keystore: ""
      keystoreType: ""
      keystoreAuthAlias: ""
      keystorePassword: ""
      keystoreAlias: ""
      keystoreAliasAuthAlias: ""
      keystoreAliasPassword: ""
      truststore: ""
      truststoreAuthAlias: ""
      truststorePassword: ""
      truststoreType: ""

connections:
  create: true # genereer context.xml
  jdbc:
    - type: postgresql # type database
      host: example.local # hostname
      database: database # database voor de Frank!
      username: ${database/username}
      password: ${database/password}

# voorbeeld van de ingres die via de Chart kan worden gemaakt
ingress:
  enabled: true
  className: nginx
  annotations:
    cert-manager.io/cluster-issuer: cluster-issuer
    # Enable client certificate authentication
    nginx.ingress.kubernetes.io/auth-tls-verify-client: "on"
    # Create the secret containing the trusted ca certificates
    nginx.ingress.kubernetes.io/auth-tls-secret: "default/ca-secret"
    # Specify the verification depth in the client certificates chain
    nginx.ingress.kubernetes.io/auth-tls-verify-depth: "1"
    # Specify an error page to be redirected to verification errors
    nginx.ingress.kubernetes.io/auth-tls-error-page: "http://www.mysite.com/error-cert.html"
    # Specify if certificates are passed to upstream server
    nginx.ingress.kubernetes.io/auth-tls-pass-certificate-to-upstream: "false"
  hosts:
    - host: example.local
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls:
    secretName: tls-certificate
    hosts:
      - example.local

```

Helm Chart Installeren
----------------------

De Chart kan worden geïnstalleerd met het volgende commando:

```shell
helm install my-frankframework frankframework/frankframework -f values.yaml
```

> [!TIP]
> Voor vragen kan contact worden opgenomen met het Gemeente Team van WeAreFrank!
