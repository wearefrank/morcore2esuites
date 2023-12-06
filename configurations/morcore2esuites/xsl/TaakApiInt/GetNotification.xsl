<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="uuid" />

    <xsl:template match="/">
        <root>
            <_links>
                <self>
                    <href>
                        <xsl:value-of select="/root/items/_links/self/href"/>
                    </href>
                </self>
            </_links>
            <uuid>
                <xsl:value-of select="/root/items/uuid"/>
            </uuid>
        </root>
    </xsl:template>
</xsl:stylesheet>