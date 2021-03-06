<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://validate"/>

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
			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
			<!-- ensure access rights -->
			<xsl:call-template name="dependAccessRightsOnLocation"/>
		</xsl:copy>
	</xsl:template>

    <!-- default copy -->
	<xsl:template match="@*|node()">
		<!-- Velden valideren -->
		<xsl:call-template name="validateValue"/>
	</xsl:template>

	<!-- match for /public in url and set open, else set restricted -->
	<xsl:template name="dependAccessRightsOnLocation">
		<xsl:choose>
			<xsl:when test="contains(//lom:lom/lom:technical/lom:location/text(), '/public/')">
				<xsl:call-template name="ensureAccessrights">
					<xsl:with-param name="taxons" select="'OpenAccess::open toegang||'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="ensureAccessrights">
					<xsl:with-param name="taxons" select="'RestrictedAccess::beperkte toegang||'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>

