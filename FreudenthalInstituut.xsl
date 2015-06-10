<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
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
		<xsl:element name="oai_lom:lom" namespace="http://www.imsglobal.org/xsd/imsmd_v1p2">
			<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
			<xsl:apply-templates select="//oai_lom:general"/>
			<xsl:apply-templates select="//oai_lom:lifecycle"/>
			<xsl:apply-templates select="//oai_lom:metametadata"/>
			<xsl:apply-templates select="//oai_lom:technical"/>
			<xsl:apply-templates select="//oai_lom:educational"/>
			<xsl:apply-templates select="//oai_lom:rights"/>
			<xsl:apply-templates select="//oai_lom:relation"/>
			<xsl:apply-templates select="//oai_lom:annotation"/>
			<xsl:apply-templates select="//oai_lom:classification"/>
			
			<!-- Mapping begrippenkader -->
			<xsl:call-template name="collectionMapping"/>
			<!-- Maak een classificatie voor de validatie -->
			<xsl:call-template name="buildClassification"/>
			
			
		</xsl:element>
	</xsl:template>
	
	
	<xsl:template match="oai_lom:lifecycle">
		<xsl:element name="oai_lom:lifecycle">
			<xsl:apply-templates select="child::oai_lom:version"/>
			<xsl:apply-templates select="child::oai_lom:status"/>
			<!-- Normaliseren van bestaande publishers -->
			<xsl:for-each select="child::oai_lom:contribute[child::oai_lom:role/oai_lom:value/oai_lom:langstring = 'publisher']">
				<xsl:element name="oai_lom:contribute">
					<xsl:apply-templates select="child::oai_lom:role"/>
					<xsl:element name="oai_lom:centity">
						<xsl:element name="oai_lom:vcard">
							<xsl:choose>
								<xsl:when test="contains(child::oai_lom:centity/oai_lom:vcard,'null')">
									<xsl:text>BEGIN:VCARD 
VERSION:3.0  
N:Universiteit Utrecht, Freudenthal Instituut
ORG:Universiteit Utrecht, Freudenthal Instituut    
END:VCARD</xsl:text>
								</xsl:when>
								<!-- Afvangen van VCARDS met publishers (bijv. " Universiteit Utrecht, Freudenthal Instituut / AOC raad") -->
								<xsl:when test="contains(child::oai_lom:centity/oai_lom:vcard,'ORG: Universiteit Utrecht, Freudenthal Instituut /')"/>
								<xsl:when test="contains(child::oai_lom:centity/oai_lom:vcard,'ORG: Universiteit Utrecht')">
									<xsl:text>BEGIN:VCARD 
VERSION:3.0  
N:Universiteit Utrecht, Freudenthal Instituut
ORG:Universiteit Utrecht, Freudenthal Instituut    
END:VCARD</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="child::oai_lom:centity/oai_lom:vcard"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:element>
					</xsl:element>
					<xsl:apply-templates select="child::oai_lom:date"/>
				</xsl:element>
			</xsl:for-each>
			
			<!-- Alle vcards die een andere rol dan 'publisher' hebben ongewijzigd doorgeven -->
			<xsl:for-each select="child::oai_lom:contribute[child::oai_lom:role/oai_lom:value/oai_lom:langstring != 'publisher']">
				<xsl:apply-templates select="child::oai_lom:contribute"/>
			</xsl:for-each>
		
			<!-- Als er geen vcard voor een publisher is, dan deze toevoegen -->
			<xsl:if test=" not(child::oai_lom:contribute[child::oai_lom:role/oai_lom:value/oai_lom:langstring = 'publisher'])">
				<xsl:element name="oai_lom:contribute">
					<xsl:element name="oai_lom:role">
						<xsl:element name="oai_lom:source">
							<xsl:element name="oai_lom:langstring">
								<xsl:attribute name="xml:lang">
									<xsl:text>x-none</xsl:text>
								</xsl:attribute>
								<xsl:text>LOMv1.0</xsl:text>
							</xsl:element>
						</xsl:element>
						<xsl:element name="oai_lom:value">
							<xsl:element name="oai_lom:langstring">
								<xsl:attribute name="xml:lang">
									<xsl:text>x-none</xsl:text>
								</xsl:attribute>
								<xsl:text>publisher</xsl:text>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<xsl:element name="oai_lom:centity">
						<xsl:element name="oai_lom:vcard">
							<xsl:text>BEGIN:VCARD 
VERSION:3.0  
N:Universiteit Utrecht, Freudenthal Instituut
ORG:Universiteit Utrecht, Freudenthal Instituut    
END:VCARD</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:element>

	</xsl:template>
	
	
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
		<xsl:call-template name="validateValue"/>
</xsl:template>

</xsl:stylesheet>

