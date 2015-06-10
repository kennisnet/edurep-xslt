<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<!--<xsl:include href="edurep://validate"/>-->
	<xsl:include href="edurep://repositoryToVdexMapping"/> 
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>NICL</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>oai_czp</xsl:text>
	</xsl:variable>

<xsl:template match="/">
  <xsl:apply-templates select="//oai_czp:lom"/>
</xsl:template>

<xsl:template match="oai_czp:lom">
  <xsl:copy>
    <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
    <!-- <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/> -->
	<xsl:apply-templates select="oai_czp:general"/>
	<xsl:apply-templates select="oai_czp:lifecycle"/>
	<xsl:apply-templates select="oai_czp:metametadata"/>
	<xsl:choose>
		<xsl:when test="oai_czp:technical">
			<xsl:choose>
				<!-- Ingevuld location veld -->
				<xsl:when test="child::oai_czp:technical/oai_czp:location != ''">
					<xsl:apply-templates select="oai_czp:technical"/>
				</xsl:when>	
				<!-- Leeg location veld -->
				<xsl:when test="child::oai_czp:technical/oai_czp:location = ''">
					<xsl:element name="oai_czp:technical">
						<xsl:element name="oai_czp:format">	
							<xsl:text>non-digital</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<!-- Ontbrekend location veld -->			
				<xsl:when test="child::oai_czp:technical and not(child::oai_czp:technical/oai_czp:location)">
					<xsl:element name="oai_czp:technical">
						<xsl:element name="oai_czp:format">	
							<xsl:text>non-digital</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<!-- Alle overige gevallen waarin bij format niet non-digital is ingevuld -->
				<xsl:when test="child::oai_czp:technical/oai_czp:format != 'non-digital'">
					<xsl:element name="oai_czp:technical">
						<xsl:element name="oai_czp:format">	
							<xsl:text>non-digital</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:when>
				<!-- Alle overige gevallen -->
				<xsl:otherwise>
					<xsl:apply-templates select="oai_czp:technical"/>
				</xsl:otherwise>
			</xsl:choose>			
		</xsl:when>
		<xsl:otherwise>
			<!-- Ontbrekend technical element -->
			<xsl:element name="oai_czp:technical">
				<xsl:element name="oai_czp:format">
					<xsl:text>non-digital</xsl:text>
				</xsl:element>
			</xsl:element>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="oai_czp:educational"/>
	<xsl:apply-templates select="oai_czp:rights"/>
  	<xsl:apply-templates select="oai_czp:relation"/>
  	<xsl:call-template name="newRelation"/>
	<xsl:apply-templates select="oai_czp:annotation"/>
	<xsl:apply-templates select="oai_czp:classification"/>
	<!-- Mapping begrippenkader -->
  	 <xsl:call-template name="collectionMapping"/> 
  	<!-- Maak een classificatie voor de validatie -->
  	<!--<xsl:call-template name="buildClassification"/>-->
  </xsl:copy>
</xsl:template>


	<!-- Relation veld voor landingspagina -->
	<xsl:template name="newRelation">
		<!-- relation wordt alleen toegevoegd als technical/location leeg is en catalogentry begint met http://www.leermiddelenplein.nl/php/detail.php -->
		<xsl:variable name="catalogEntryContent" select="child::oai_czp:general/oai_czp:catalogentry[child::oai_czp:catalog = 'URI']/oai_czp:entry/oai_czp:langstring"/>
		
		<xsl:if test="(not(child::oai_czp:technical/oai_czp:location) or child::oai_czp:technical/oai_czp:location = '') and starts-with($catalogEntryContent, 'http://www.leermiddelenplein.nl/php/detail.php')">
			<xsl:element name="oai_czp:relation">
				<xsl:element name="oai_czp:kind">
					<xsl:element name="oai_czp:source">
						<xsl:element name="oai_czp:langstring">
							<xsl:attribute name="xml:lang">x-none</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/relation_kind_nllom_20131211</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:element name="oai_czp:value">
						<xsl:element name="oai_czp:langstring">
							<xsl:attribute name="xml:lang">x-none</xsl:attribute>
							<xsl:text>landingpage</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="oai_czp:resource">
					<xsl:element name="oai_czp:catalogentry">
						<xsl:element name="oai_czp:catalog">
							<xsl:text>URI</xsl:text>
						</xsl:element>
						<xsl:element name="oai_czp:entry">
							<xsl:element name="oai_czp:langstring">
								<xsl:attribute name="xml:lang">x-none</xsl:attribute>
								<xsl:value-of select="$catalogEntryContent"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>


	<!-- Aanpassing van het purpose type voor:
	6f847b13-4720-4640-85f0-670eb1b55bd8
	42937580-e88f-4784-9020-c60e5090e7ad
	3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0
	443a8d94-6845-465f-ac92-7697ee42a304
	-->
	
	<xsl:template match="oai_czp:classification[child::oai_czp:purpose/oai_czp:value/oai_czp:langstring = 'educational level']">		
		
		<xsl:element name="oai_czp:classification">
			<xsl:element name="oai_czp:purpose">
				<xsl:element name="oai_czp:source">
					<xsl:element name="oai_czp:langstring">
						<xsl:attribute name="xml:lang">
							<xsl:text>nl</xsl:text>
						</xsl:attribute>
						<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="oai_czp:value">
					<xsl:element name="oai_czp:langstring">
						<xsl:attribute name="xml:lang">
							<xsl:text>nl</xsl:text>
						</xsl:attribute>
						<xsl:text>educational level</xsl:text>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			
			<!-- Taxonpaden met oude VDEX waarden terugzetten -->
			<xsl:apply-templates select="child::oai_czp:taxonpath[child::oai_czp:source/oai_czp:langstring != 'http://purl.edustandaard.nl/begrippenkader']"/>
			
			<!-- OBK taxonpad zonder 'cluster' UUID's terugplaatsen -->
			<xsl:for-each select="child::oai_czp:taxonpath[child::oai_czp:source/oai_czp:langstring = 'http://purl.edustandaard.nl/begrippenkader']">
				<xsl:variable name="containsOtherUuid">
					<xsl:for-each select="child::oai_czp:taxon/oai_czp:id">
						<xsl:choose>
							<xsl:when test="node() = '6f847b13-4720-4640-85f0-670eb1b55bd8'"/>
							<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad'"/>
							<xsl:when test="node() = '3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0'"/>
							<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304'"/>
							<xsl:otherwise>
								<xsl:text>true</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:variable>
				
				<xsl:if test="contains($containsOtherUuid, 'true')">
					<xsl:element name="oai_czp:taxonpath">
						<xsl:element name="oai_czp:source">
							<xsl:element name="oai_czp:langstring">
								<xsl:attribute name="xml:lang">
									<xsl:text>nl</xsl:text>
								</xsl:attribute>
								<xsl:text>http://purl.edustandaard.nl/begrippenkader</xsl:text>
							</xsl:element>
						</xsl:element>
						<xsl:for-each select="child::oai_czp:taxon[child::oai_czp:id != '6f847b13-4720-4640-85f0-670eb1b55bd8' and child::oai_czp:id != '42937580-e88f-4784-9020-c60e5090e7ad' and child::oai_czp:id != '3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0' and child::oai_czp:id != '443a8d94-6845-465f-ac92-7697ee42a304']">
							<xsl:copy>
								<xsl:apply-templates select="@*|node()"/>
							</xsl:copy>
						</xsl:for-each>
					</xsl:element>
				</xsl:if>
			</xsl:for-each>
			
		</xsl:element>
				
		<xsl:if test="child::oai_czp:taxonpath/oai_czp:taxon/oai_czp:id = '6f847b13-4720-4640-85f0-670eb1b55bd8' or child::oai_czp:taxonpath/oai_czp:taxon/oai_czp:id = '42937580-e88f-4784-9020-c60e5090e7ad' or child::oai_czp:taxonpath/oai_czp:taxon/oai_czp:id = '3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0' or child::oai_czp:taxonpath/oai_czp:taxon/oai_czp:id = '443a8d94-6845-465f-ac92-7697ee42a304'">
			
			<xsl:element name="oai_czp:classification">
				<xsl:element name="oai_czp:purpose">
					<xsl:element name="oai_czp:source">
						<xsl:element name="oai_czp:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>nl</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:element name="oai_czp:value">
						<xsl:element name="oai_czp:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>nl</xsl:text>
							</xsl:attribute>
							<xsl:text>accessibility restrictions</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="oai_czp:taxonpath">
					<xsl:element name="oai_czp:source">
						<xsl:element name="oai_czp:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>nl</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/begrippenkader</xsl:text>
						</xsl:element>
					</xsl:element>
					
					<xsl:for-each select="child::oai_czp:taxonpath/oai_czp:taxon[child::oai_czp:id = '6f847b13-4720-4640-85f0-670eb1b55bd8' or child::oai_czp:id = '42937580-e88f-4784-9020-c60e5090e7ad' or child::oai_czp:id = '3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0' or child::oai_czp:id = '443a8d94-6845-465f-ac92-7697ee42a304']">
						<xsl:copy>
							<xsl:apply-templates select="@*|node()"/>
						</xsl:copy>
					</xsl:for-each>
					
				</xsl:element>
				
			</xsl:element>
		</xsl:if>
		
	</xsl:template>



    <!-- default copy -->
<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
	<!-- Valideer velden -->
	<!--<xsl:call-template name="validateValue"/>-->
</xsl:template>

</xsl:stylesheet>

