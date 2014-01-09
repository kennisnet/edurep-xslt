<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="yes" encoding="UTF-8" standalone="no"/>

	<!-- <xsl:include href="edurep://repositoryToVdexMapping"/> -->
	 <!-- Collectienaam voor het koppelen van -->
	<!--<xsl:variable name="collectionName">
		<xsl:text>NICL</xsl:text>
	</xsl:variable>-->

	<!-- De door de collectie gebruikte namespace -->
	<!--<xsl:variable name="usedNamespace">
		<xsl:text>oai_czp</xsl:text>
	</xsl:variable>-->

<xsl:template match="/">
  <xsl:apply-templates select="//oai_czp:lom"/>
</xsl:template>

<xsl:template match="oai_czp:lom">
  <xsl:copy>
    <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
    <!-- <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/> -->
	<xsl:apply-templates select="oai_czp:general"/>
	<xsl:apply-templates select="oai_czp:lifecycle"/>
	<xsl:apply-templates select="oai_czp:metametadata"/>
	<xsl:choose>
		<xsl:when test="oai_czp:technical">
			<xsl:choose>
				<!-- Ingevuld location veld -->
				<xsl:when test="child::oai_czp:technical/oai_czp:location != ''">
					<xsl:apply-templates select="oai_czp:technical"/>
				</xsl:when>	
				<!-- Leeg location veld -->
				<xsl:when test="child::oai_czp:technical/oai_czp:location = ''">
					<xsl:element name="oai_czp:technical">
						<xsl:element name="oai_czp:format">	
							<xsl:text>non-digital</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<!-- Ontbrekend location veld -->			
				<xsl:when test="child::oai_czp:technical and not(child::oai_czp:technical/oai_czp:location)">
					<xsl:element name="oai_czp:technical">
						<xsl:element name="oai_czp:format">	
							<xsl:text>non-digital</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<!-- Alle overige gevallen waarin bij format niet non-digital is ingevuld -->
				<xsl:when test="child::oai_czp:technical/oai_czp:format != 'non-digital'">
					<xsl:element name="oai_czp:technical">
						<xsl:element name="oai_czp:format">	
							<xsl:text>non-digital</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<!-- Alle overige gevallen -->
				<xsl:otherwise>
					<xsl:apply-templates select="oai_czp:technical"/>
				</xsl:otherwise>
			</xsl:choose>			
		</xsl:when>
		<xsl:otherwise>
			<!-- Ontbrekend technical element -->
			<xsl:element name="oai_czp:technical">
				<xsl:element name="oai_czp:format">
					<xsl:text>non-digital</xsl:text>
				</xsl:element>
			</xsl:element>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="oai_czp:educational"/>
	<xsl:apply-templates select="oai_czp:rights"/>
	<xsl:apply-templates select="oai_czp:relation"/>
	<xsl:apply-templates select="oai_czp:annotation"/>
	<xsl:apply-templates select="oai_czp:classification"/>
	<!-- Mapping begrippenkader -->
	<!-- <xsl:call-template name="collectionMapping"/> -->
  </xsl:copy>
</xsl:template>

    <!-- default copy -->
<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>

