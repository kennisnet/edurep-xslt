<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" 
  xmlns:oai="http://www.openarchives.org/OAI/2.0/" 
  xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" 
  xmlns="http://www.openarchives.org/OAI/2.0/" 
  version="1.0" 
  xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="no"/>

  <xsl:include href="edurep://repositoryToVdexMapping"/>
  <xsl:include href="edurep://validate"/>
  
	<!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>Leraar24_Video</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>lom</xsl:text>
	</xsl:variable>
	

<xsl:param name="vdex_aggregationlevel" select="'http://download.edustandaard.nl/vdex/vdex_aggregationlevel_czp_20060628.xml'"/>
<xsl:param name="vdex_classification_purpose" select="'http://download.edustandaard.nl/vdex/vdex_classification_purpose_czp_20060628.xml'"/>
<xsl:param name="vdex_classification_educationallevel" select="'http://download.edustandaard.nl/vdex/vdex_classification_educationallevel_czp_20071115.xml'"/>
<xsl:param name="vdex_context" select="'http://download.edustandaard.nl/vdex/vdex_context_czp_20060628.xml'"/>
<xsl:param name="vdex_learningresourcetype" select="'http://download.edustandaard.nl/vdex/vdex_learningresourcetype_czp_20060628.xml'"/>
<xsl:param name="vdex_intendedenduserrole" select="'http://download.edustandaard.nl/vdex/vdex_intendedenduserrole_lomv1p0_20060628.xml'"/>
<xsl:param name="vdex_lifecyclecontributerole" select="'http://download.edustandaard.nl/vdex/vdex_lifecycle_contribute_role_lomv1p0_20060628.xml'"/>

  <xsl:template match="/">
    <xsl:element name="lom:lom" namespace="http://www.imsglobal.org/xsd/imsmd_v1p2">
      <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
      <xsl:apply-templates select="//lom:general"/>
      <xsl:apply-templates select="//lom:lifecycle"/>
      <xsl:apply-templates select="//lom:metametadata"/>
      <xsl:apply-templates select="//lom:technical"/>
      <xsl:apply-templates select="//lom:educational"/>
      <xsl:apply-templates select="//lom:rights"/>
      <xsl:apply-templates select="//lom:relation"/>
      <xsl:call-template name="relationEmbed"/>
      <xsl:apply-templates select="//lom:annotation"/>
      <xsl:apply-templates select="//lom:classification"/>
      
      <!-- Mapping begrippenkader -->
      <xsl:call-template name="collectionMapping"/>
      <!-- Maak een classificatie voor de validatie -->
      <xsl:call-template name="buildClassification"/>
      
      
    </xsl:element>
  </xsl:template>
  
  
  <xsl:template match="czp:lifecycle/czp:contribute/czp:role/czp:source/czp:langstring">
    <xsl:element name="lom:langstring">
      <xsl:value-of select="$vdex_lifecyclecontributerole"/>
    </xsl:element>
  </xsl:template>
  

<!--<xsl:template match="czp:metametadata/czp:contribute"/>-->

<xsl:template match="czp:contribute/czp:centity/czp:vcard">
  <xsl:element name="lom:vcard">
    <xsl:text>BEGIN:VCARD
VERSION:2.1
FN:Leraar24
URL:http://www.leraar24.nl
END:VCARD</xsl:text>
  </xsl:element>
</xsl:template>


<xsl:template match="czp:duration/czp:datetime">
  <xsl:element name="lom:datetime">
    <xsl:call-template name="replace-string">
      <xsl:with-param name="text" select="."/>
      <xsl:with-param name="replace" select="':'"/>
      <xsl:with-param name="with" select="''"/>
    </xsl:call-template>
  </xsl:element>
</xsl:template>
  
  
  <!-- Verwijder fout gebruik van het identifier veld binnen relation -->
  <xsl:template match="lom:relation/lom:resource/lom:identifier"/>
  
  
  <!-- default copy -->
  <xsl:template match="@*|node()">
    <!-- Velden valideren -->
    <xsl:call-template name="validateValue"/>
  </xsl:template>


  <!-- Voeg een 'embed' relation veld toe -->
  <xsl:template name="relationEmbed">
    <xsl:element name="lom:relation">
      <xsl:element name="lom:kind">
        <xsl:element name="lom:source">
          <xsl:element name="lom:langstring">
            <xsl:attribute name="xml:lang">
              <xsl:text>x-none</xsl:text>
            </xsl:attribute>
            <xsl:text>http://purl.edustandaard.nl/relation_kind_nllom_20131211</xsl:text>
          </xsl:element>
        </xsl:element>
        <xsl:element name="lom:value">
          <xsl:element name="lom:langstring">
            <xsl:attribute name="xml:lang">
              <xsl:text>x-none</xsl:text>
            </xsl:attribute>
            <xsl:text>embed</xsl:text>
          </xsl:element>
        </xsl:element>
      </xsl:element>
      <xsl:element name="lom:resource">
        <xsl:element name="lom:catalogentry">
          <xsl:element name="lom:catalog">
            <xsl:text>URI</xsl:text>
          </xsl:element>
          <xsl:element name="lom:entry">
            <xsl:element name="lom:langstring">
              <xsl:attribute name="xml:lang">
                <xsl:text>x-none</xsl:text>
              </xsl:attribute>
              <xsl:text>https://www.leraar24.nl/api/video/</xsl:text><xsl:value-of select="substring-after(//lom:lom/lom:general/lom:catalogentry/lom:entry/lom:langstring,'http://www.leraar24.nl/video/')"/><xsl:text>/embedded</xsl:text>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
    
  </xsl:template>
  

<!-- From Evan Lenz at http://www.dpawson.co.uk/xsl/sect2/replace.html#d9701e61 -->
<xsl:template name="replace-string">
        <xsl:param name="text"/>
        <xsl:param name="replace"/>
        <xsl:param name="with"/>
        <xsl:choose>
                <xsl:when test="contains($text,$replace)">
                        <xsl:value-of select="substring-before($text,$replace)"/>
                        <xsl:value-of select="$with"/>
                        <xsl:call-template name="replace-string">
                                <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                                <xsl:with-param name="replace" select="$replace"/>
                                <xsl:with-param name="with" select="$with"/>
                        </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                        <xsl:value-of select="$text"/>
                </xsl:otherwise>
        </xsl:choose>
</xsl:template>

	
</xsl:stylesheet>

