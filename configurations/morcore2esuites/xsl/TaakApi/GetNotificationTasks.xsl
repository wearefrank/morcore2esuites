<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="uuid" />

    <xsl:template match="/">
        <root>
            <_links>
                <melding>
                    <href>
                        <xsl:value-of select="concat('https://mor-core.tld/melding/1234-5678',$uuid)" />
                    </href>
                </melding>
            </_links>
            <items>
                <_links>
                    <self>
                        <href></href>
                    </self>
                    <communicatie>
                        <href></href>
                    </communicatie>
                </_links>
                <uuid>
                    <xsl:value-of select="$uuid"/>
                </uuid>
                <taaktype></taaktype>
                <taakapplicatie></taakapplicatie>
                <bericht></bericht>
                <status></status>
                <laatst_ontvangen_update></laatst_ontvangen_update>
                <additionele_informatie>
                    <veld></veld>
                    <waarde></waarde>
                </additionele_informatie>
            </items>
        </root>
    </xsl:template>
</xsl:stylesheet>