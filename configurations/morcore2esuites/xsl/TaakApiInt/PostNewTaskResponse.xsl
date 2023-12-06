<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <xsl:param name="uuid" />
    <root>
        <_links>
            <self>
                <href>
                    <xsl:value-of select="/root/_links/self/href"/>
                </href>
            </self>
            <melding>
                <href>
                    <xsl:value-of select="/root/_links/melding/href"/>
                </href>
            </melding>
        </_links>
        <taakapplicatie>
            <xsl:value-of select="/root/taakapplicatie"/>
        </taakapplicatie>
        <taak_url>
            <xsl:value-of select="concat('https://taakapplicatie.tld/taak/aaa-bbbb-cccc/',$uuid)"/>
        </taak_url>
        <verstuurd>
        </verstuurd>
        <status>
        </status>
        <laatste_update_ontvangen>
        </laatste_update_ontvangen>
        <taaktype>
            <xsl:value-of select="concat('https://taakapplicatie.tld/taaktypes/xxxx-yyyy-zzz',$uuid)" />
        </taaktype>
        <titel>
            <xsl:value-of   select="/root/titel"/>
        </titel>
        <bericht>
            <xsl:value-of   select="/root/bericht"/>
        </bericht>
        <additionele_informatie>
            <veld>
                <xsl:value-of   select="/root/additionele_informatie/veld"/>
            </veld>
            <waarde>
                <xsl:value-of   select="/root/additionele_informatie/waarde"/>
            </waarde>
        </additionele_informatie>
    </root>
    </xsl:template>
</xsl:stylesheet>