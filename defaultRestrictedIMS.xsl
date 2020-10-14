<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2"
	xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>
	<xsl:include href="edurep://validate"/>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>lom_ims</xsl:text>
	</xsl:variable>

    <xsl:template match="/">
		<xsl:apply-templates select="//lom_ims:lom"/>
    </xsl:template>

	<xsl:template match="lom_ims:lom">
		<xsl:copy>
			<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
			<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
			<!-- add access rights -->
			<xsl:call-template name="ensureAccessrights">
				<xsl:with-param name="taxons" select="'RestrictedAccess::beperkte toegang||'"/>
			</xsl:call-template>
		</xsl:copy>
	</xsl:template>

    <!-- default copy -->
	<xsl:template match="@*|node()">
		<!-- Velden valideren -->
		<xsl:call-template name="validateValue"/>
	</xsl:template>

</xsl:stylesheet>
