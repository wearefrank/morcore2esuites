<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="uuid" />

    <xsl:template match="/">
        <zaak>string</zaak>
        <statustype>string</statustype>
        <datumStatusGezet>2023-11-21T08:25:41.255Z</datumStatusGezet>
        <statustoelichting>string</statustoelichting>
    </xsl:template>
</xsl:stylesheet>