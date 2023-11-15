
## GET /melding/{meldingUuid}

Haal details van een melding op.

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| meldingUuid | UUID van melding | ja |

Query parameters:

    n.v.t.

Request body:

    n.v.t.

Response:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    _links:
        self:
            href: https://mor-core.tld/melding/1234-5678
    uuid: 1234-5678
    ...
    ...


## GET /melding/{meldingUuid}/taakopdracht

Bekijk alle uitgezetten taakopdrachten voor een melding

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| meldingUuid | UUID van melding | ja |

Query parameters:

    n.v.t.

Request body:

    n.v.t.

Response:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    _links:
        melding:
            href: https://mor-core.tld/melding/1234-5678
    items:
        _links:
            self:
                href:
            communicatie:
                href:
        uuid:
        taaktype:
        taakapplicatie:
        bericht:
        status:
        laatst_ontvangen_update:
        additionele_informatie:
            - veld:
              waarde:


## POST /melding/{meldingUuid}/taakopdracht

Hiermee kan de regie app OF een andere taakapplicatie een nieuwe taakopdracht maken (en dus een taak).
MorCore doet de communicatie met de taakapplicatie waar de nieuwe taak in moet komen.

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| meldingUuid | UUID van melding | ja |

Query parameters:

    n.v.t.

Request body:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    taaktype: https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz
    titel: Reparatie verlichting 2381-3
    bericht: Graag oppakken
    additionele_informatie:
      - veld: lichtmast_nummer
        waarde: 2381-3

Response:

    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    _links:
        self:
            href: https://mor-core.tld/melding/1234-5678/taakopdracht/672-334-abc
        melding:
            href: https://mor-core.tld/melding/1234-5678
    taakapplicatie:
    taak_url: https://taakapplicatie.tld/taak/aaa-bbbb-cccc/
    verstuurd:
    status:
    laatste_update_ontvangen:
    taaktype: https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz
    titel: Reparatie verlichting 2381-3
    bericht: Graag oppakken
    additionele_informatie:
      - veld: lichtmast_nummer
        waarde: 2381-3


## POST /melding/{meldingUuid}/taakopdracht/{taakOpdrachtUuid}/notificatie

Rapporteert dat een taak gewijzigd is aan de taakapplicatie kant. Geeft uitsluitend aan dat er
een wijziging is. MorCore haalt de taak vervolgens op bij de taakapplicatie.

Path parameters:

| naam | waarde | verplicht |
| ---- | ------ | --------- |
| meldingUuid | UUID van melding | ja |
| taakOpdrachtUuid | UUID van taakOpdracht | ja |

## Communicatie over taak

Ontvangt een bericht van de taakapplicatie

    POST /melding/{meldingUuid}/taakopdracht/{taakOpdrachtUuid}/communicatie

Query parameters:

    n.v.t.

Request body:

    n.v.t.

Response indien update kunnen ophalen:

    HTTP/1.1 204 OK

Response indien update niet opgehaald kon worden (taakapplicatie moet deze update opnieuw aanbieden):

    HTTP/1.1 500 Internal Server Error
    Content-type: application/json (t.b.v. leesbaarheid hieronder als YAML getoond)

    error: Taak informatie kan niet opgehaald worden