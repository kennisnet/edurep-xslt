<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2"
	xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd">
<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	<xsl:include href="edurep://validate"/>

	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>NME</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>lom</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:apply-templates select="//lom:lom"/>
	</xsl:template>

	<xsl:template match="lom:lom">
		<xsl:copy>
			<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
			<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
			<!-- Mapping begrippenkader -->
			<xsl:call-template name="collectionMapping"/>
			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
			<xsl:call-template name="dependAccessRightsOnTechnical"/>
		</xsl:copy>
	</xsl:template>

    <!-- default copy -->
	<xsl:template match="@*|node()">
		<!-- Velden valideren -->
		<xsl:call-template name="validateValue"/>
	</xsl:template>

	<!-- set restricted when matching specific technical information, otherwise open -->
	<xsl:template name="dependAccessRightsOnTechnical">
		<xsl:choose>
			<xsl:when test="contains(//lom:lom/lom:technical/lom:format/text(), 'non-digital')">
				<xsl:call-template name="ensureAccessrights">
					<xsl:with-param name="taxons" select="'RestrictedAccess::beperkte toegang||'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="contains(//lom:lom/lom:technical/lom:location/text(), 'anmec.nl')">
				<xsl:call-template name="ensureAccessrights">
					<xsl:with-param name="taxons" select="'RestrictedAccess::beperkte toegang||'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="contains(//lom:lom/lom:technical/lom:location/text(), 'voedseleducatie.nl')">
				<xsl:call-template name="ensureAccessrights">
					<xsl:with-param name="taxons" select="'RestrictedAccess::beperkte toegang||'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="ensureAccessrights">
					<xsl:with-param name="taxons" select="'OpenAccess::open toegang||'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>

