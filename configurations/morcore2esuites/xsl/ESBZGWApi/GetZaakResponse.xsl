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
                        <xsl:value-of select="root/url" />
                    </href>
                </self>
                <taaktype>
                    <!-- TODO: On the T environment validate if this is the correct value. -->
                    <href>
                        <xsl:value-of select="root/zaaktype" />
                    </href>
                </taaktype>
                <melding>
                    <!-- TODO: See if Esuites returns this after storing. -->
                    <href>https://mor-core.tld/melding/1234-1234-1234</href>
                </melding>
                <communcatie>
                    <!-- TODO: See if Esuites returns this after storing. -->
                    <href>https://taakapplicatie.tld/taak/aaaa-bbbb-cccc/communcatie</href>
                </communcatie>
            </_links>
            <uuid>
                <xsl:value-of select="//uuid" />
            </uuid>
            <titel>
                <xsl:value-of select="//omschrijving" />
            </titel>
            <bericht>
                <xsl:value-of select="//toelichting" />
            </bericht>

            <!-- TODO: Make everything below this comment dynamic depending on what information
            Esuites returns. -->
            <additionele_informatie>
                <veld>lichtmast_nummer</veld>
                <waarde>2381-3</waarde>
            </additionele_informatie>
            <status>OPEN</status>
            <verloop>
                <ontvangstsdatum />
                <streefdatum />
                <plandatum />
                <start_behandeling />
                <afgesloten />
            </verloop>
            <communicatie>
                <gemaakt />
                <richting>Melding naar Taak</richting>
                <auteur>Jason Foo</auteur>
                <bericht>Wat is de status van deze reparatie</bericht>
            </communicatie>
            <communicatie>
                <gemaakt />
                <richting>Taak naar Melding</richting>
                <bericht>We wachten op een onderdeel, naar verwachting komt deze volgende week
                    binnen</bericht>
            </communicatie>
            <resultaat>
                <toegang>intern</toegang>
                <tekst />
                <fotos>https://....</fotos>
            </resultaat>
            <resultaat>
                <toegang>publiek</toegang>
                <tekst>Opgelost</tekst>
                <fotos>https://....</fotos>
            </resultaat>
        </root>
    </xsl:template>
</xsl:stylesheet>