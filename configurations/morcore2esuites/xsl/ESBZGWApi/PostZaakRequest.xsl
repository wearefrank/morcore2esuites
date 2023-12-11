<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="uuid" />

    <xsl:template match="/">
        <root>
            <identificatie>string</identificatie>
            <bronorganisatie>string</bronorganisatie>
            <omschrijving>string</omschrijving>
            <toelichting>string</toelichting>
            <zaaktype><xsl:value-of select="//taaktype"/></zaaktype>
            <registratiedatum>2023-11-21</registratiedatum>
            <verantwoordelijkeOrganisatie>string</verantwoordelijkeOrganisatie>
            <startdatum>2023-11-21</startdatum>
            <einddatumGepland>2023-11-21</einddatumGepland>
            <uiterlijkeEinddatumAfdoening>2023-11-21</uiterlijkeEinddatumAfdoening>
            <publicatiedatum>2023-11-21</publicatiedatum>
            <communicatiekanaal>string</communicatiekanaal>
            <productenOfDiensten>string</productenOfDiensten>
            <vertrouwelijkheidaanduiding>openbaar</vertrouwelijkheidaanduiding>
            <betalingsindicatie>nvt</betalingsindicatie>
            <laatsteBetaaldatum>2023-11-21T14:25:35.511Z</laatsteBetaaldatum>
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
            <relevanteAndereZaken>
                <url>string</url>
                <aardRelatie>vervolg</aardRelatie>
            </relevanteAndereZaken>
            <kenmerken>
                <kenmerk>string</kenmerk>
                <bron>string</bron>
            </kenmerken>
            <archiefnominatie>blijvend_bewaren</archiefnominatie>
            <archiefstatus>nog_te_archiveren</archiefstatus>
            <archiefactiedatum>2023-11-21</archiefactiedatum>
        </root>
    </xsl:template>
</xsl:stylesheet>