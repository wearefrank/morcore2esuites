<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="uuid" />
    <xsl:param name="systemDate" />

    <xsl:template match="/">
        <root>
            <!-- TODO: Obtain from URL -->
            <zaak>string</zaak>
            <!-- TODO: Check which ones Esuites supports -->
            <statustype>EINDSTATUS</statustype>
            <datumStatusGezet>
                <xsl:value-of select="$systemDate" />
            </datumStatusGezet>
            <statustoelichting>string</statustoelichting>
        </root>
    </xsl:template>
</xsl:stylesheet>