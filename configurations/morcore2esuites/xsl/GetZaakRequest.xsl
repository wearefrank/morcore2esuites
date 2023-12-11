<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="uuid" />

    <xsl:template match="/">
        <root>
            <!-- TODO: Make dynamic. -->
            <url>string</url>
            <uuid>3fa85f64-5717-4562-b3fc-2c963f66afa6</uuid>
            <identificatie>string</identificatie>
            <bronorganisatie>string</bronorganisatie>
            <omschrijving>string</omschrijving>
            <toelichting>string</toelichting>
            <zaaktype>string</zaaktype>
            <registratiedatum>2023-12-11</registratiedatum>
            <verantwoordelijkeOrganisatie>string</verantwoordelijkeOrganisatie>
            <startdatum>2023-12-11</startdatum>
            <einddatum>2023-12-11</einddatum>
            <einddatumGepland>2023-12-11</einddatumGepland>
            <uiterlijkeEinddatumAfdoening>2023-12-11</uiterlijkeEinddatumAfdoening>
            <publicatiedatum>2023-12-11</publicatiedatum>
            <communicatiekanaal>string</communicatiekanaal>
            <productenOfDiensten>string</productenOfDiensten>
            <vertrouwelijkheidaanduiding>openbaar</vertrouwelijkheidaanduiding>
            <betalingsindicatie>nvt</betalingsindicatie>
            <betalingsindicatieWeergave>string</betalingsindicatieWeergave>
            <laatsteBetaaldatum>2023-12-11T08:51:19.639Z</laatsteBetaaldatum>
            <zaakgeometrie>
                <type>Point</type>
            </zaakgeometrie>
            <verlenging>
                <reden>string</reden>
                <duur>string</duur>
            </verlenging>
            <opschorting>
                <indicatie>true</indicatie>
                <reden>string</reden>
            </opschorting>
            <selectielijstklasse>string</selectielijstklasse>
            <hoofdzaak>string</hoofdzaak>
            <deelzaken>string</deelzaken>
            <relevanteAndereZaken>
                <url>string</url>
                <aardRelatie>vervolg</aardRelatie>
            </relevanteAndereZaken>
            <eigenschappen>string</eigenschappen>
            <status>string</status>
            <kenmerken>
                <kenmerk>string</kenmerk>
                <bron>string</bron>
            </kenmerken>
            <archiefnominatie>blijvend_bewaren</archiefnominatie>
            <archiefstatus>nog_te_archiveren</archiefstatus>
            <archiefactiedatum>2023-12-11</archiefactiedatum>
            <resultaat>string</resultaat>
        </root>
    </xsl:template>
</xsl:stylesheet>