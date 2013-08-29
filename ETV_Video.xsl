<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="yes" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>ETV_Video</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>oai_lom</xsl:text>
	</xsl:variable>

<xsl:template match="/">
  <xsl:apply-templates select="//oai_lom:lom"/>
</xsl:template>

<xsl:template match="oai_lom:lom">
  <xsl:copy>
    <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
    <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
	<!-- Mapping begrippenkader -->
	<xsl:call-template name="collectionMapping"/>
  </xsl:copy>
</xsl:template>
	
	
	<!-- Aggregationlevel standaard op 2 -->
	<xsl:template match="oai_lom:aggregationlevel/oai_lom:value/oai_lom:langstring">
		<xsl:element name="oai_lom:langstring">
			<xsl:attribute name="xml:lang">
				<xsl:text>x-none</xsl:text>
			</xsl:attribute>
			<xsl:text>2</xsl:text>
		</xsl:element>
	</xsl:template>
	
	
	<!-- Format 'application/x-mplayer2' naar 'video/mp4' en 'application/octet-stream' naar 'video/x-flv' -->
	<xsl:template match="oai_lom:format">
	<xsl:choose>
		<xsl:when test="node() = 'application/x-mplayer2'">
			<xsl:element name="oai_lom:format">
				<xsl:text>video/mp4</xsl:text>
			</xsl:element>			
		</xsl:when>
		<xsl:when test="node() = 'application/octet-stream'">
			<xsl:element name="oai_lom:format">
				<xsl:text>video/x-flv</xsl:text>
			</xsl:element>
		</xsl:when>
		<xsl:when test="node() != ''">
			<xsl:copy>
				<xsl:apply-templates select="node()"/>
			</xsl:copy>
		</xsl:when>
		<xsl:otherwise>
			<xsl:element name="oai_lom:format">
				<xsl:text>video/x-flv</xsl:text>
			</xsl:element>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
	
	<!-- De waardes 'Ja' en 'ja' vervangen door 'yes' in copyrightandotherrestrictions  -->
<xsl:template match="oai_lom:copyrightandotherrestrictions/oai_lom:value/oai_lom:langstring">
	<xsl:choose>
		<xsl:when test="node() = 'Ja' or node() = 'ja'">
			<xsl:element name="oai_lom:langstring">
				<xsl:attribute name="xml:lang">
					<xsl:text>x-none</xsl:text>
				</xsl:attribute>
				<xsl:text>yes</xsl:text>
			</xsl:element>
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy>
				<xsl:apply-templates select="@*|node()"/>
			</xsl:copy>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


    <!-- default copy -->
<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>

