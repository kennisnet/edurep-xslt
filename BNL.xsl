<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

  <xsl:include href="edurep://repositoryToVdexMapping"/>
  <xsl:include href="edurep://validate"/>
  
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>BNL</xsl:text>
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
  </xsl:copy>
</xsl:template>
  
<xsl:template match="lom:contribute[child::lom:role/lom:value/lom:langstring = 'content provider']">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
   <xsl:element name="lom:contribute">
     <xsl:element name="lom:centity">
       <xsl:element name="lom:vcard">
         <xsl:text>BEGIN:VCARD 
VERSION:3.0  
FN:Bibliotheek.nl  
N:Bibliotheek.nl  
END:VCARD</xsl:text>
       </xsl:element>
     </xsl:element>
     <xsl:element name="lom:role">
       <xsl:element name="lom:source">
         <xsl:element name="lom:langstring">
           <xsl:attribute name="xml:lang">
             <xsl:text>x-none</xsl:text>
           </xsl:attribute>
           <xsl:text>http://purl.edustandaard.nl/vdex_lifecycle_contribute_role_lomv1p0_20060628.xml</xsl:text>
         </xsl:element>
       </xsl:element>
       <xsl:element name="lom:value">
         <xsl:element name="lom:langstring">
           <xsl:attribute name="xml:langstring">
             <xsl:text>x-none</xsl:text>
           </xsl:attribute>
           <xsl:text>publisher</xsl:text>
         </xsl:element>
       </xsl:element>
     </xsl:element>
   </xsl:element> 
  
</xsl:template>

    <!-- default copy -->
  <xsl:template match="@*|node()">
    <!-- Velden valideren -->
    <xsl:call-template name="validateValue"/>
</xsl:template>

</xsl:stylesheet>

