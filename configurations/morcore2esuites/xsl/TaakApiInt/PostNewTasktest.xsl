<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns="http://www.w3.org/2013/XSL/json"   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<map>
<xsl:variable name="xmlns" select="'http://www.w3.org/2013/XSL/json'"/>
<!-- The variable xmlns can be used for further processing.  -->


<xsl:attribute name="xmlns"><xsl:value-of select="$xmlns"/></xsl:attribute>
<map>
<xsl:variable name="key" select="/map/map/@key"/>
<!-- The variable key can be used for further processing.  -->


<xsl:attribute name="key"><xsl:value-of select="$key"/></xsl:attribute>
<xsl:for-each select="/map/map/string">
<string>
<xsl:value-of   select="."/>
<xsl:variable name="key" select="./@key"/>
<!-- The variable key can be used for further processing.  -->


<xsl:attribute name="key"><xsl:value-of select="$key"/></xsl:attribute>
</string>
</xsl:for-each>
</map>
<xsl:for-each select="/map/map/string">
<string>
<xsl:value-of   select="."/>
<xsl:variable name="key" select="./@key"/>
<!-- The variable key can be used for further processing.  -->


<xsl:attribute name="key"><xsl:value-of select="$key"/></xsl:attribute>
</string>
</xsl:for-each>
<xsl:for-each select="/map/array">
<array>
<xsl:variable name="key" select="./@key"/>
<!-- The variable key can be used for further processing.  -->


<xsl:attribute name="key"><xsl:value-of select="$key"/></xsl:attribute>
</array>
</xsl:for-each>
</map>
</xsl:template>
</xsl:stylesheet>