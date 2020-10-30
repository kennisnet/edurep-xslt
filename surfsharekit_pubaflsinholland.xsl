<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:ieee="http://ltsc.ieee.org/xsd/LOM"
	xsi:schemaLocation="http://ltsc.ieee.org/xsd/LOM http://ltsc.ieee.org/xsd/lomv1.0/lom.xsd">

	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>
	<xsl:include href="edurep://validate"/>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>ieee</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:apply-templates select="//ieee:lom"/>
	</xsl:template>

	<xsl:template match="ieee:lom">
		<xsl:copy>
			<xsl:attribute name="xsi:schemaLocation">http://ltsc.ieee.org/xsd/LOM http://ltsc.ieee.org/xsd/lomv1.0/lom.xsd</xsl:attribute>
			<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>

            <!-- Maak een classificatie Groene Vlaggetje -->
            <xsl:call-template name="buildClassificationGroeneVlaggetje"/>

			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
			<!-- add access rights -->
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

	<!-- Aggregationlevel element met foute waarde wordt vervangen door "2" -->
	<xsl:template match="ieee:aggregationLevel">
		<xsl:variable name="value" select="child::*[local-name() = 'value']"/>
			<xsl:choose>
				<xsl:when test="$value = '1' or $value = '2' or $value = '3' or $value = '4'">
					<xsl:copy>
						<xsl:apply-templates select="@*|node()"/>
					</xsl:copy>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="IEEEvocabulary">
						<xsl:with-param name="element" select="concat($usedNamespace, ':aggregationLevel')"/>
						<xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
						<xsl:with-param name="value" select="'2'"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
	</xsl:template>

	<!-- Als de element format ontbreekt, wordt deze toegevoegd met de waarde 'text/html' -->
	<xsl:template match="ieee:technical">
		<xsl:choose>
			<xsl:when test="ieee:format">
				<xsl:element name="ieee:technical">
					<xsl:for-each select="ieee:format">
						<xsl:element name="ieee:format">
							<xsl:value-of select="."/>
						</xsl:element>
					</xsl:for-each>
					<xsl:for-each select="ieee:location">
						<xsl:element name="ieee:location">
							<xsl:value-of select="."/>
						</xsl:element> 
					</xsl:for-each>
				</xsl:element> 
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="ieee:technical">
					<xsl:element name="ieee:format">
						<xsl:text>text/html</xsl:text>
					</xsl:element> 
					<xsl:for-each select="ieee:location">
						<xsl:element name="ieee:location">
							<xsl:value-of select="."/>
						</xsl:element> 
					</xsl:for-each>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


    <!-- groene vlaggetje wordt als classification toegevoegd -->
    <xsl:template name="buildClassificationGroeneVlaggetje">
	    <xsl:call-template name="classification">
	        <xsl:with-param name="purpose_value" select="'discipline'"/>
	        <xsl:with-param name="taxon_source" select="'http://purl.edustandaard.nl/begrippenkader'"/>
	        <xsl:with-param name="taxons" select="'5e86dc82-1981-48df-bbe5-abd4a9b3767b::Voedsel, natuur en leefomgeving||'"/>
	    </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
