
# Taakapplicatie API interface

Dit document beschrijft de API interface van een taakapplicatie.
Taakapplicaties zijn systemen als ProfilR/BehandlR, AfvalRIS, Ultimo en OpenZaak.
Sommige taakapplicaties zullen direct een interface aanbieden andere zullen via een adapter dit doen.

## Enums

### Status

Een taakapplicatie geeft een vereenvoudige genormaliseerde status uit voor taken. Binnen een taakapplicatie staat het de applicatie vrij meer complexere/uitgebreidere statussen te gebruiken.

| status | omschrijving |
| ---- | ---- |
| OPEN | Het uitvoeren van de taak is nog niet ingepland |
| BEHANDELING | Taak gepland of wordt uitgevoerd |
| AFGESLOTEN | Taak is afgesloten, er vind geen verdere behandeling meer plaats |

## GET /taaktypes

Geeft een lijst met de taaktypes die de applicatie ondersteund.

Path parameters:

    n.v.t.

Query parameters:

    n.v.t.

Request body:

    n.v.t.

Response:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    items:
        - _links:
              self:
                  href: https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz
          uuid: xxxx-yyyy-zzz
          omschrijving: Ophalen grofvuil groot
          toelichting: Grofvuil wordt opgehaald met een knijpkraan. Geschikt voor bijvoorbeeld grote kasten, koelkast, wasmachine.
          additionele_informatie: ~
        - _links:
              self:
                  href: https://taakapplicatie.tld/taaktypes/aaaa-ssss-dddd
          uuid: aaaa-ssss-dddd
          omschrijving: Repareren straatverlichting
          toelichting: Verlichting in lichtmast doet het niet. Niet gebruiken voor gevaarlijke situaties.
          additionele_informatie:
            - veld: lichtmast nummer
            - veld: werking gecontroleerd in observ

## GET /taaktypes/{uuid}

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| uuid | UUID van taaktype | ja |

Query parameters:

    n.v.t.

Request body:

    n.v.t.

Response:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    _links:
        self:
            href: https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz
    uuid: xxxx-yyyy-zzz
    omschrijving: Ophalen grofvuil groot
    toelichting: Grofvuil wordt opgehaald met een knijpkraan. Geschikt voor bijvoorbeeld grote kasten, koelkast, wasmachine.
    additionele_informatie: ~

## POST /taak

Hiermee kan een taak worden aangemaakt in de afhandel applicatie.

Path parameters:

    n.v.t.

Query parameters:

    n.v.t.

Request body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    melding: https://mor-core.tld/melding/1234-1234-1234
    taakopdracht: https://mor-core.tld/melding/1234-1234-1234/taakopdracht/5678-5678-5678
    taaktype: https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz
    titel: Reparatie verlichting 2381-3
    bericht: Graag oppakken
    additionele_informatie:
      - veld: lichtmast_nummer
        waarde: 2381-3

Response body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    _links:
        self:
            href: https://taakapplicatie.tld/taak/aaaa-bbbb-cccc
        melding:
            href: https://mor-core.tld/melding/1234-1234-1234
        taakopdracht:
            href: https://mor-core.tld/melding/1234-1234-1234/taakopdracht/5678-5678-5678
        taaktype:
            href: https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz
    uuid: aaaa-bbbb-cccc
    titel: Reparatie verlichting 2381-3
    additionele_informatie:
      - veld: lichtmast_nummer
        waarde: 2381-3
    streefdatum: 2023-03-30

## DELETE /taak/{uuid}

Hiermee kan worden aangegeven dat een taak geannuleerd/terug getrokken wordt.

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| uuid | UUID van taak | ja |

Query parameters:

    n.v.t.

Request body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    melding: https://mor-core.tld/melding/1234-1234-1234
    taakopdracht: https://mor-core.tld/melding/1234-1234-1234/taakopdracht/5678-5678-5678
    reden: Verkeerd toegewezen

Response body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

## GET /taak/{uuid}

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| uuid | UUID van taak | ja |

Query parameters:

    n.v.t.

Request body:

    n.v.t.

Response body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    _links:
        self:
            href: https://taakapplicatie.tld/taak/aaaa-bbbb-cccc
        taaktype:
            href: https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz
        melding:
            href: https://mor-core.tld/melding/1234-1234-1234
        communcatie:
            href: https://taakapplicatie.tld/taak/aaaa-bbbb-cccc/communcatie
    uuid: aaaa-bbbb-cccc
    titel: Reparatie verlichting 2381-3
    bericht: Graag herstellen
    additionele_informatie:
      - veld: lichtmast_nummer
        waarde: 2381-3
    status: OPEN

    verloop:
        ontvangstsdatum: 2023-03-15
        streefdatum: 2023-03-20
        plandatum: 2023-03-16
        start_behandeling: 2023-03-16
        afgesloten: 2023-03-17
    communicatie:
        - gemaakt: 2023-04-16 12:31:00
          richting: Melding naar Taak
          auteur: Jason Foo
          bericht: Wat is de status van deze reparatie
        - gemaakt: 2023-04-16 12:38:00
          richting: Taak naar Melding
          bericht: We wachten op een onderdeel, naar verwachting komt deze volgende week binnen
    resultaat:
      - toegang: intern
        tekst:
        fotos:
          - https://....
      - toegang: publiek
        tekst: Opgelost
        fotos:
          - https://....

## POST /taak/{uuid}/communicatie

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| uuid | UUID van taak | ja |

Query parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| sinds | datum tijd sinds wanneer de communicatie opgevraagd moet worden | nee |

Request body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    auteur: Jason Foo
    bericht: Wat is de status van deze reparatie

Response body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    _links:
        taak:
            href: https://taakapplicatie.tld/taak/aaaa-bbbb-cccc
    items:
        - uuid: 234-234-234
          gemaakt: 2023-04-16 12:31:00
          richting: Melding naar Taak
          auteur: Jason Foo
          bericht: Wat is de status van deze reparatie
