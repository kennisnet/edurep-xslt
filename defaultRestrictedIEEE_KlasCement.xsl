<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ieee="http://ltsc.ieee.org/xsd/LOM" version="1.0" xsi:schemaLocation="http://ltsc.ieee.org/xsd/LOM http://standards.ieee.org/reading/ieee/downloads/LOM/lomv1.0/xsd/lomLoose.xsd">

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
			<!--<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>-->
			<xsl:attribute name="xsi:schemaLocation">http://ltsc.ieee.org/xsd/LOM http://standards.ieee.org/reading/ieee/downloads/LOM/lomv1.0/xsd/lomLoose.xsd</xsl:attribute>

			<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
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

	<!-- Set language value 'none' to 'x-none' -->
	<!-- Remove vslue 'mul' or replace with 'nl', depending weither or not there's another language present -->
	<xsl:template match="ieee:language">
		<xsl:choose>
			<xsl:when test=". = 'none'">
				<xsl:element name="ieee:language">
					<xsl:text>x-none</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:when test=". = 'mul'">
				<xsl:choose>
					<xsl:when test="preceding-sibling::ieee:language or following-sibling::ieee:language"/>
					<xsl:otherwise>
						<xsl:element name="ieee:language">
							<xsl:text>nl</xsl:text>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="ieee:language">
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>



	<!-- Aggregationlevel element wordt vervangen door "3" -->
	<xsl:template match="ieee:aggregationLevel">
		<xsl:call-template name="IEEEvocabulary">
			<xsl:with-param name="element" select="concat($usedNamespace, ':aggregationLevel')"/>
			<xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
			<xsl:with-param name="value" select="'3'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- metadataSchema: Replace LOMnlv1.0 with LOMv1.0 -->
	<xsl:template match="ieee:metadataSchema">
		<xsl:element name="ieee:metadataSchema">
			<xsl:value-of select="'LOMv1.0'"/>
		</xsl:element>
	</xsl:template>	

	<!--format: Replace 'application/zip' with 'text/html' -->
	<xsl:template match="ieee:format">
		<xsl:choose>
			<xsl:when test=". = 'application/zip'">
				<xsl:element name="ieee:format">
					<xsl:text>text/html</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="ieee:format">
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- typicalAgeRange: Replace 'none' with 'x-none' -->
	<xsl:template match="ieee:typicalAgeRange">
		<xsl:element name="typicalAgeRange" namespace="http://ltsc.ieee.org/xsd/LOM">
			<xsl:element name="string" namespace="http://ltsc.ieee.org/xsd/LOM">
				<xsl:attribute name="language"><xsl:value-of select="'x-none'"/></xsl:attribute>
				<xsl:value-of select="child::ieee:string"/>
			</xsl:element>
	  	</xsl:element>
	</xsl:template>

	<!-- Remove classification -->
	<xsl:template match="ieee:classification"/>


</xsl:stylesheet>
