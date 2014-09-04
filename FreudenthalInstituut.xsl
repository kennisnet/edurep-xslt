<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" 
	xmlns:oai="http://www.openarchives.org/OAI/2.0/" 
	xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" 
	xmlns="http://www.openarchives.org/OAI/2.0/" 
	version="1.0" 
	xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">

	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	<xsl:include href="edurep://validate"/>
	
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>FreudenthalInstituut</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>oai_lom</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
	  <xsl:apply-templates select="//oai_lom:lom"/>
	</xsl:template>

	<xsl:template match="oai_lom:lom">
	  <xsl:copy>
	    <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
	    <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
		<!-- Mapping begrippenkader -->
	  	<xsl:call-template name="collectionMapping"/>
	  	<!-- Maak een classificatie voor de validatie -->
	  	<xsl:call-template name="buildClassification"/>
	  </xsl:copy>
	</xsl:template>
	
	<!-- Relatie volgens nieuwe standaard toevoegen -->
	<xsl:template match="oai_lom:relation">
		<!-- Plaats huidige relation terug -->
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
		
		<!-- Maak nieuwe relation -->
		<xsl:element name="oai_lom:relation">
			<xsl:element name="oai_lom:kind">
				<xsl:element name="oai_lom:source">
					<xsl:element name="oai_lom:langstring">
						<xsl:attribute name="xml:lang">
							<xsl:text>x-none</xsl:text>
						</xsl:attribute>
						<xsl:text>http://purl.edustandaard.nl/relation_kind_nllom_20131211</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="oai_lom:value">
					<xsl:element name="oai_lom:langstring">
						<xsl:attribute name="xml:lang">
							<xsl:text>x-none</xsl:text>
						</xsl:attribute>
						<xsl:text>icon</xsl:text>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<xsl:element name="oai_lom:resource">
				<xsl:element name="oai_lom:catalogentry">
					<xsl:element name="oai_lom:catalog">
						<xsl:text>URI</xsl:text>
					</xsl:element>
					<xsl:element name="oai_lom:entry">
						<xsl:element name="oai_lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:value-of select="child::oai_lom:resource/oai_lom:catalogentry/oai_lom:entry/oai_lom:langstring"/>
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

