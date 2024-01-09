<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="currentDate" />
    <xsl:param name="meldingInfo" />
    <xsl:param name="opdrachtInfo" />

    <xsl:template match="/">
        <root>
            <!-- TODO: On the T environment validate if uuid is used for idenification and if this
            is the correct value. -->
            <identificatie>
                <xsl:value-of select="//uuid" />
            </identificatie>
            <!-- TODO: On the T environment validate if this is the correct value. -->
            <omschrijving>
                <xsl:value-of select="//bericht" />
            </omschrijving>
            <!-- TODO: On the T environment validate if this is the correct value. -->
            <zaaktype>
                <xsl:value-of select="//taaktype" />
            </zaaktype>

            <!-- TODO: Make everything below this comment dynamic depending on what information
            Esuites returns. -->
            <toelichting>string</toelichting>
            <bronorganisatie>string</bronorganisatie>
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