<xsl:stylesheet xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>
	
	<xsl:include href="edurep://repositoryToVdexMapping"/>
	<xsl:include href="edurep://validate"/>
	
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>metaplus</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>czp</xsl:text>
	</xsl:variable>
	
	<xsl:template match="/">
		<xsl:apply-templates select="//czp:lom"/>
	</xsl:template>


	<xsl:template match="czp:lom">
		<xsl:copy>
		<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd</xsl:attribute>
    		<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
			<!-- Mapping begrippenkader -->
			<xsl:call-template name="collectionMapping"/>
			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
		</xsl:copy>
	</xsl:template>


	<!-- Default copy of all nodes -->
	<xsl:template match="@*|node()">
		<!-- Velden valideren -->
		<xsl:call-template name="validateValue"/>
	</xsl:template>

</xsl:stylesheet>

