<xsl:stylesheet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" standalone="no"/>

    <xsl:template match="node()|@*">
      <xsl:copy>
         <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
    </xsl:template>

    <!-- rewrite edurep://sheet to sheet.xsl -->
    <xsl:template match="xsl:include">
        <xsl:choose>
            <xsl:when test="starts-with(./@href, 'edurep://')">
                <xsl:element name="xsl:include">
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat( substring-after(./@href, 'edurep://'), '.xsl')"/>
                        </xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
