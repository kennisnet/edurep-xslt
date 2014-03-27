<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:lom="http://ltsc.ieee.org/xsd/LOM" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://ltsc.ieee.org/xsd/LOM http://ltsc.ieee.org/xsd/lomv1.0/lom.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="no"/>	
	
	<xsl:include href="edurep://validate"/>

<xsl:param name="vdex_aggregationlevel" select="'http://purl.edustandaard.nl/vdex_aggregationlevel_czp_20060628.xml'"/>
<xsl:param name="vdex_classification_purpose" select="'http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml'"/>
<xsl:param name="vdex_classification_educationallevel" select="'http://purl.edustandaard.nl/vdex_classification_educationallevel_czp_20071115.xml'"/>
<xsl:param name="vdex_context" select="'http://purl.edustandaard.nl/vdex_context_czp_20060628.xml'"/>
<xsl:param name="vdex_learningresourcetype" select="'http://purl.edustandaard.nl/vdex_learningresourcetype_czp_20060628.xml'"/>
<xsl:param name="vdex_intendedenduserrole" select="'http://purl.edustandaard.nl/vdex_intendedenduserrole_lomv1p0_20060628.xml'"/>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>lom</xsl:text>
	</xsl:variable>


<xsl:template match="/">
  <xsl:apply-templates select="//lom:lom"/>
</xsl:template>

<xsl:template match="lom:lom">
  <xsl:copy>
    <xsl:attribute name="xsi:schemaLocation">http://ltsc.ieee.org/xsd/LOM http://ltsc.ieee.org/xsd/lomv1.0/lom.xsd</xsl:attribute>
  	<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
  	<!-- Maak een classificatie voor de validatie -->
  	<xsl:call-template name="buildClassification"/>
  </xsl:copy>
</xsl:template>

    <!-- default copy -->
	<xsl:template match="@*|node()">
		<!-- Velden valideren -->
		<xsl:call-template name="validateValue"/>
</xsl:template>

<!-- Set language value 'none' to 'x-none' -->
<!-- Remove vslue 'mul' or replace with 'nl', depending weither or not there's another language present -->
<xsl:template match="lom:language">
	<xsl:choose>
		<xsl:when test=". = 'none'">
			<xsl:call-template name="elemental">
      			<xsl:with-param name="element_name" select="'language'"/>
      			<xsl:with-param name="value" select="'x-none'"/>
    		</xsl:call-template>
		</xsl:when>
		<xsl:when test=". = 'mul'">
			<xsl:choose>
				<xsl:when test="preceding-sibling::lom:language or following-sibling::lom:language"/>
				<xsl:otherwise>
					<xsl:call-template name="elemental">
      					<xsl:with-param name="element_name" select="'language'"/>
      					<xsl:with-param name="value" select="'nl'"/>
    				</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="elemental">
      			<xsl:with-param name="element_name" select="'language'"/>
      			<xsl:with-param name="value" select="."/>
    		</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Set value aggregationlevel to 3 -->
<xsl:template match="lom:aggregationLevel">
    <xsl:call-template name="vocabulary-element">
      <xsl:with-param name="element_name" select="'aggregationLevel'"/>
		  <xsl:with-param name="vocabulary" select="$vdex_aggregationlevel"/>
			<xsl:with-param name="value" select="'3'"/>
    </xsl:call-template>
</xsl:template>

<!-- Replace LOMnlv1.0 with LOMv1.0 -->
<xsl:template match="lom:metadataSchema">
    <xsl:call-template name="elemental">
      <xsl:with-param name="element_name" select="'metadataSchema'"/>
      <xsl:with-param name="value" select="'LOMv1.0'"/>
    </xsl:call-template>
</xsl:template>


<xsl:template match="lom:typicalAgeRange">
	<xsl:element name="typicalAgeRange" namespace="http://ltsc.ieee.org/xsd/LOM">
    	<xsl:call-template name="langstring">
      		<xsl:with-param name="value" select="child::lom:string"/>
      		<xsl:with-param name="language" select="'x-none'"/>
    	</xsl:call-template>
  	</xsl:element>
</xsl:template>
			


<!-- Remove classification -->
<xsl:template match="lom:classification"/>

<!-- Template for adding vocabulary element -->
<xsl:template name="vocabulary-element">
	<xsl:param name="element_name"/>
	<xsl:param name="vocabulary"/>
	<xsl:param name="value"/>
	<xsl:element name="{$element_name}" namespace="http://ltsc.ieee.org/xsd/LOM">
		<xsl:call-template name="elemental">
			<xsl:with-param name="element_name" select="'source'"/>
       <xsl:with-param name="value" select="$vocabulary"/>
		</xsl:call-template>
		<xsl:call-template name="elemental">
			<xsl:with-param name="element_name" select="'value'"/>
			<xsl:with-param name="value" select="$value"/>
		</xsl:call-template>
	</xsl:element>
</xsl:template>

<!-- Template for adding langstring element -->	
<xsl:template name="langstring">
	<xsl:param name="value"/>
	<xsl:param name="language"/>
	<xsl:element name="string" namespace="http://ltsc.ieee.org/xsd/LOM">
		<xsl:attribute name="language"><xsl:value-of select="$language"/></xsl:attribute>
		<xsl:value-of select="$value"/>
	</xsl:element>
</xsl:template>

<!-- Template for adding an element (with name and value) -->	
<xsl:template name="elemental">
	<xsl:param name="element_name"/>
	<xsl:param name="value"/>
	<xsl:element name="{$element_name}" namespace="http://ltsc.ieee.org/xsd/LOM">
		<xsl:value-of select="$value"/>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>

