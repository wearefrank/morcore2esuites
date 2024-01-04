<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="esuitesReference" />
    <xsl:param name="currentDate" />

    <xsl:template match="/">
        <root>
            <zaak>
                <xsl:value-of select="$esuitesReference" />
            </zaak>
            <statustype>AFGESLOTEN</statustype>
            <datumStatusGezet>
                <xsl:value-of select="$currentDate" />
            </datumStatusGezet>
            <statustoelichting>string</statustoelichting>
        </root>
    </xsl:template>
</xsl:stylesheet>