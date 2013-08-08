<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_rootv1p2p1" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" exclude-result-prefixes="oai_czp">
	
	<xsl:output method="xml" indent="yes"/>
	<xsl:strip-space elements="*"/>
	
	<xsl:param name="recordnr" select="1"/>

    <xsl:template match="/">
        <xsl:apply-templates select="(//oai_czp:lom)[$recordnr]"/>
    </xsl:template>

    <!-- copy into imsmd_v1p2 namespace -->
	<xsl:template match="oai_czp:lom">
		<xsl:element name="lom:{local-name()}">
			<!-- add schemaLocation attribute (may be removed after development, as validation is done internally) -->
			<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd</xsl:attribute>
			
			<!-- don't copy schemaLocation from default namespace (invalid) -->
			<xsl:copy-of select="@*[local-name() != 'schemaLocation']"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="oai_czp:general">
		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			
			<!-- copy elements in correct order -->
			<xsl:apply-templates select="oai_czp:identifier"/>
			<xsl:apply-templates select="oai_czp:title"/>
			<xsl:apply-templates select="oai_czp:catalogentry"/>
			<xsl:apply-templates select="oai_czp:language"/>
			<xsl:apply-templates select="oai_czp:description"/>
			<xsl:apply-templates select="oai_czp:keyword"/>
			<xsl:apply-templates select="oai_czp:coverage"/>
			<xsl:apply-templates select="oai_czp:structure"/>
			<xsl:apply-templates select="oai_czp:aggregationlevel"/>
		</xsl:element>
	</xsl:template>
	
<xsl:template match="oai_czp:catalogentry/oai_czp:entry">
		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			<xsl:element name="lom:langstring">
			  <xsl:attribute name="xml:lang">x-none</xsl:attribute>
        <xsl:value-of select="//oai_czp:catalogentry/oai_czp:entry/oai_czp:langstring"/>
			</xsl:element>
			
		</xsl:element>
	</xsl:template>	
	
	<xsl:template match="oai_czp:general/oai_czp:description">
		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			<lom:langstring xml:lang="nl"><xsl:value-of select="."/></lom:langstring>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="oai_czp:general/oai_czp:aggregationlevel">
		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			<lom:source>
				<lom:langstring xml:lang="x-none">LOMv1.0</lom:langstring>
			</lom:source>
			<lom:value>
				<lom:langstring xml:lang="x-none"><xsl:value-of select="."/></lom:langstring>
			</lom:value>
		</xsl:element>
	</xsl:template>

	<xsl:template match="oai_czp:lifecycle/oai_czp:version">
		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			<lom:langstring xml:lang="x-none"><xsl:value-of select="."/></lom:langstring>
		</xsl:element>
	</xsl:template>

	<xsl:template match="oai_czp:metametadata">
		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			
			<!-- copy elements in correct order -->
			<xsl:apply-templates select="oai_czp:identifier"/>
			<xsl:apply-templates select="oai_czp:catalogentry"/>
			<xsl:apply-templates select="oai_czp:contribute"/>
			<xsl:apply-templates select="oai_czp:metadatascheme"/>
			<xsl:apply-templates select="oai_czp:language"/>
		</xsl:element>
    <xsl:element name="lom:technical">
      <xsl:element name="lom:location">
        <xsl:value-of select="//oai_czp:catalogentry/oai_czp:entry/oai_czp:langstring"/>
      </xsl:element>
    </xsl:element>
    <xsl:element name="lom:rights">
      <xsl:element name="lom:cost">
        <xsl:element name="lom:source">
          <xsl:element name="lom:langstring">LOMv1.0</xsl:element>
        </xsl:element>
        <xsl:element name="lom:value">
          <xsl:element name="lom:langstring">no</xsl:element>
        </xsl:element>
      </xsl:element>
<!--      <xsl:element name="lom:copyrightandotherrestrictions">
        <xsl:element name="lom:source">
          <xsl:element name="lom:langstring">LOMv1.0</xsl:element>
        </xsl:element>
        <xsl:element name="lom:value">
          <xsl:element name="lom:langstring">no</xsl:element>
        </xsl:element>
      </xsl:element>-->
    </xsl:element>

	</xsl:template>

	
	<!-- delete metadata identifier, same as record identifier -->
<xsl:template match="oai_czp:metametadata/oai_czp:identifier"/>
<!--		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			<xsl:value-of select="oai_czp:entry/oai_czp:langstring"/>
		</xsl:element>
	</xsl:template>-->




	<!-- default copy into correct namespace -->	
	<xsl:template match="oai_czp:*">
		<xsl:element name="lom:{local-name()}">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>

