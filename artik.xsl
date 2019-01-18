<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:ieee="http://ltsc.ieee.org/xsd/LOM"
	xsi:schemaLocation="http://ltsc.ieee.org/xsd/LOM http://standards.ieee.org/reading/ieee/downloads/LOM/lomv1.0/xsd/lomLoose.xsd">

	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	<xsl:include href="edurep://validate"/>

	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>artik</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>ieee</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:apply-templates select="//ieee:lom"/>
	</xsl:template>

	<xsl:template match="ieee:lom">
		<xsl:copy>
			<!--<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>-->
			<xsl:attribute name="xsi:schemaLocation">http://ltsc.ieee.org/xsd/LOM http://standards.ieee.org/reading/ieee/downloads/LOM/lomv1.0/xsd/lomLoose.xsd</xsl:attribute>

			<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
			<!-- Mapping begrippenkader -->
			<xsl:call-template name="collectionMapping"/>
			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
			<xsl:call-template name="ensureAccessrights">
				<xsl:with-param name="taxons" select="'OpenAccess::open toegang||'"/>
			</xsl:call-template>
		</xsl:copy>
	</xsl:template>

    <!-- default copy -->
	<xsl:template match="@*|node()">
		<!-- Velden valideren -->
		<xsl:call-template name="validateValue"/>
	</xsl:template>

</xsl:stylesheet>

