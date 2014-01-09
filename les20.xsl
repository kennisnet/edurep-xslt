<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://ltsc.ieee.org/xsd/LOM http://ltsc.ieee.org/xsd/lomv1.0/lom.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	<xsl:include href="edurep://validate"/>
	
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>les20</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>czp</xsl:text>
	</xsl:variable>
	
<xsl:param name="vdex_role" select="'http://purl.edustandaard.nl/vdex_lifecycle_contribute_role_lomv1p0_20060628.xml'"/>

<xsl:template match="/">
  <xsl:apply-templates select="//czp:lom"/>
</xsl:template>

<xsl:template match="czp:lom">
  <xsl:copy>
    <xsl:attribute name="xsi:schemaLocation">http://ltsc.ieee.org/xsd/LOM http://ltsc.ieee.org/xsd/lomv1.0/lom.xsd</xsl:attribute>
    <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
	<!-- Mapping begrippenkader -->
	<xsl:call-template name="collectionMapping"/>
  </xsl:copy>
</xsl:template>

<!-- Default copy of all nodes -->
	<xsl:template match="@*|node()">
		<!-- Velden valideren -->
		<xsl:call-template name="validateValue"/>
	</xsl:template>

<!-- Add or replace publisher with value 'LES 2.0' -->
<xsl:template match="czp:lifecycle">
	<xsl:choose>
		<xsl:when test="child::czp:contribute[child::czp:role/czp:value/czp:langstring='publisher']">
			<xsl:copy>
    			<xsl:apply-templates select="@*|node()"/>
  			</xsl:copy>
		</xsl:when>
		<xsl:otherwise>
		<xsl:element name="czp:lifecycle">
			<xsl:apply-templates/>			
				<xsl:element name="czp:contribute">
					<xsl:call-template name="vocabulary-element">
						<xsl:with-param name="element_name" select="'czp:role'"/>
						<xsl:with-param name="vocabulary" select="$vdex_role"/>
						<xsl:with-param name="value" select="'publisher'"/>
						<xsl:with-param name="valueLanguage" select="'x-none'"/>
					</xsl:call-template>
					<xsl:element name="czp:centity">
						<xsl:call-template name="elemental">
							<xsl:with-param name="element_name">
								<xsl:text>czp:vcard</xsl:text>
							</xsl:with-param>
							<xsl:with-param name="value">
								<xsl:text disable-output-escaping="yes">BEGIN:VCARD
VERSION:3.0
N:LES 2.0
FN:LES 2.0
ORG:LES 2.0
END:VCARD</xsl:text>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:element>
				</xsl:element>	
			</xsl:element>			
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="czp:vcard[ancestor::czp:contribute/czp:role/czp:value/czp:langstring='publisher']">
	<xsl:element name="czp:vcard">
		<xsl:text disable-output-escaping="yes">BEGIN:VCARD
VERSION:3.0
N:LES 2.0
FN:LES 2.0
ORG:LES 2.0
END:VCARD</xsl:text>
	</xsl:element>
</xsl:template>

<!-- Set value cost to 'no' 
<xsl:template match="czp:rights/czp:cost/czp:value/czp:langstring">
	<xsl:element name="czp:langstring">
		<xsl:attribute name="xml:lang">
			<xsl:text>x-none</xsl:text>
		</xsl:attribute>
		<xsl:text>no</xsl:text>
	</xsl:element>
</xsl:template>-->


<!-- Template for adding vocabulary element -->
<xsl:template name="vocabulary-element">
	<xsl:param name="element_name"/>
	<xsl:param name="vocabulary"/>
	<xsl:param name="value"/>
	<xsl:param name="valueLanguage"/>
	<xsl:element name="{$element_name}">
		<xsl:call-template name="elemental">
			<xsl:with-param name="element_name" select="'czp:source'"/>
       		<xsl:with-param name="value" select="$vocabulary"/>
			<xsl:with-param name="withLangstring" select="'true'"/>
			<xsl:with-param name="langstringLaguage" select="'x-none'"/>
		</xsl:call-template>
		<xsl:call-template name="elemental">
			<xsl:with-param name="element_name" select="'czp:value'"/>
       		<xsl:with-param name="value" select="$value"/>
			<xsl:with-param name="withLangstring" select="'true'"/>
			<xsl:with-param name="langstringLaguage" select="$valueLanguage"/>
		</xsl:call-template>
	</xsl:element>
</xsl:template>

<!-- Template for adding langstring element -->	
<xsl:template name="langstring">
	<xsl:param name="value"/>
	<xsl:param name="language"/>
	<xsl:element name="langstring">
		<xsl:attribute name="xml:lang"><xsl:value-of select="$language"/></xsl:attribute>
		<xsl:value-of select="$value"/>
	</xsl:element>
</xsl:template>

<!-- Template for adding an element (with name and value) -->	
<xsl:template name="elemental">
	<xsl:param name="element_name"/>
	<xsl:param name="value"/>
	<xsl:param name="withLangstring"/>
	<xsl:param name="langstringLaguage"/>
	<xsl:element name="{$element_name}">
		<xsl:choose>
			<xsl:when test="$withLangstring = 'true'">
				<xsl:call-template name="langstring">
					<xsl:with-param name="value" select="$value"/>
					<xsl:with-param name="language" select="$langstringLaguage"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>

