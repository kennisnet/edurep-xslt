<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	<xsl:include href="edurep://validate"/>
	
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>wikiwijs_repository</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>czp</xsl:text>
	</xsl:variable>

<xsl:template match="/">
  <xsl:apply-templates select="//lom:lom"/>
</xsl:template>

<xsl:template match="lom:lom">
  <xsl:copy>
    <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
   <!-- <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>-->
  	<xsl:apply-templates select="lom:general"/>
  	<xsl:apply-templates select="lom:lifecycle"/>
  	<xsl:apply-templates select="lom:metametadata"/>
  	<xsl:apply-templates select="lom:technical"/>
  	<xsl:apply-templates select="lom:educational"/>
  	<xsl:apply-templates select="lom:rights"/>
  	<xsl:apply-templates select="lom:relation"/>
  	<xsl:if test="child::lom:technical/lom:format = 'application/x-Wikiwijs-Arrangement'"> 	
  		<xsl:call-template name="formatRelations"/>
  	</xsl:if>
  	<xsl:apply-templates select="lom:annotation"/>
  	<xsl:apply-templates select="lom:classification"/>
	<!-- Mapping begrippenkader -->
  	<xsl:call-template name="collectionMapping"/>
  	<!-- Maak een classificatie voor de validatie -->
  	<xsl:call-template name="buildClassification"/>
  </xsl:copy>
</xsl:template>


	<!-- Vervang betsandsformaat als de catalogentry één van de onderstaande URL's bevat -->
	<xsl:template match="lom:format">
		<xsl:choose>
			<xsl:when test=" contains(//lom:general/lom:catalogentry[child::lom:catalog = 'URI']/lom:entry/lom:langstring, 'youtube.com')">
				<xsl:element name="lom:format">
					<xsl:text>video/x-flv</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:when test=" contains(//lom:general/lom:catalogentry[child::lom:catalog = 'URI']/lom:entry/lom:langstring, 'youtu.be')">
				<xsl:element name="lom:format">
					<xsl:text>video/x-flv</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:when test=" contains(//lom:general/lom:catalogentry[child::lom:catalog = 'URI']/lom:entry/lom:langstring, 'vimeo.com')">
				<xsl:element name="lom:format">
					<xsl:text>video/x-flv</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:when test=" contains(//lom:general/lom:catalogentry[child::lom:catalog = 'URI']/lom:entry/lom:langstring, 'player.omroep.nl')">
				<xsl:element name="lom:format">
					<xsl:text>video/x-flv</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:when test=" contains(//lom:general/lom:catalogentry[child::lom:catalog = 'URI']/lom:entry/lom:langstring, 'download.omroep.nl')">
				<xsl:element name="lom:format">
					<xsl:text>video/x-flv</xsl:text>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="lom:format">
					<xsl:value-of select="node()"/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Drie bestandsformaten worden toegevoegd voor wikiwijs arrangementen -->
	<xsl:template name="formatRelations">	
		<!-- Relation voor IMS content package -->
		<xsl:element name="lom:relation">
			<xsl:element name="lom:kind">
				<xsl:element name="lom:source">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>http://purl.edustandaard.nl/relation_kind_nllom_20131211</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:value">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>hasformat</xsl:text>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="lom:resource">
				<xsl:element name="lom:description">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>application/x-imscp+zip</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:catalogentry">
					<xsl:element name="lom:catalog">
						<xsl:text>URI</xsl:text>
					</xsl:element>
					<xsl:element name="lom:entry">
						<xsl:element name="lom:langstring">
							<xsl:attribute name="xml:lang">x-none</xsl:attribute>
							<xsl:value-of select="//lom:general/lom:catalogentry/lom:entry/lom:langstring"/><xsl:text>?p=imscp</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
		
		<!-- Relation voor epub -->
		<xsl:element name="lom:relation">
			<xsl:element name="lom:kind">
				<xsl:element name="lom:source">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>http://purl.edustandaard.nl/relation_kind_nllom_20131211</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:value">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>hasformat</xsl:text>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="lom:resource">
				<xsl:element name="lom:description">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>application/epub+zip</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:catalogentry">
					<xsl:element name="lom:catalog">
						<xsl:text>URI</xsl:text>
					</xsl:element>
					<xsl:element name="lom:entry">
						<xsl:element name="lom:langstring">
							<xsl:attribute name="xml:lang">x-none</xsl:attribute>
							<xsl:value-of select="//lom:general/lom:catalogentry/lom:entry/lom:langstring"/><xsl:text>?p=epub</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
		
		<!-- Relation voor PDF -->
		<xsl:element name="lom:relation">
			<xsl:element name="lom:kind">
				<xsl:element name="lom:source">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>http://purl.edustandaard.nl/relation_kind_nllom_20131211</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:value">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>hasformat</xsl:text>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="lom:resource">
				<xsl:element name="lom:description">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">x-none</xsl:attribute>
						<xsl:text>application/pdf</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:catalogentry">
					<xsl:element name="lom:catalog">
						<xsl:text>URI</xsl:text>
					</xsl:element>
					<xsl:element name="lom:entry">
						<xsl:element name="lom:langstring">
							<xsl:attribute name="xml:lang">x-none</xsl:attribute>
							<xsl:value-of select="//lom:general/lom:catalogentry/lom:entry/lom:langstring"/><xsl:text>?p=pdf</xsl:text>
						</xsl:element>
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

