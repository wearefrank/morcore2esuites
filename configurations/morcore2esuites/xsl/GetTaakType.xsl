<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="uuid" />

    <xsl:template match="/">
    <root>
        <_links>
            <self>
                <href>
                    <xsl:value-of
                        select="concat('https://taakapplicatie.tld/taaktypes/aaaa-ssss-dddd',$uuid)" />
                </href>
            </self>
        </_links>
        <uuid>
        <xsl:value-of select="$uuid"/>
        </uuid>
        <omschrijving>Repareren straatverlichting</omschrijving>
        <toelichting>Verlichting in lichtmast doet het niet. Niet gebruiken voor gevaarlijke situaties.</toelichting>
        <additionele_informatie>~</additionele_informatie>
    </root>
    </xsl:template>
</xsl:stylesheet>