<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:param name="uuid"/>
        <root>
            <taaktype>
                <xsl:value-of select="concat('https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz',$uuid)"/>
            </taaktype>
            <titel>
                <xsl:value-of select="/root/titel"/>
            </titel>
            <bericht>
                <xsl:value-of select="/root/bericht"/>
            </bericht>
            <additionele_informatie>
                <veld>
                    <xsl:value-of select="/root/additionele_informatie/veld"/>
                </veld>
                <waarde>
                    <xsl:value-of select="/root/additionele_informatie/waarde"/>
                </waarde>
            </additionele_informatie>
        </root>
    </xsl:template>
</xsl:stylesheet>