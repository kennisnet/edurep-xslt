<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="yes" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>Schooltv</xsl:text>
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
	
		<xsl:if test="child::oai_lom:educational/oai_lom:context/oai_lom:value/oai_lom:langstring[node() = 'PO']">
			<!-- Voeg educational level classificatie toe op basis van typicalagerange -->
			<xsl:variable name="typicalAgeRangeValue" select="child::oai_lom:educational/oai_lom:typicalagerange/oai_lom:langstring"/>			
			<!-- Bepaal de minimum en maximum leeftijd in typicalagerange -->
			<xsl:choose>
				<xsl:when test="contains($typicalAgeRangeValue, '+')">					
					<xsl:call-template name="addEducationLevelClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '+')"/>
						<xsl:with-param name="maximumValue" select="'99'"/>
					</xsl:call-template>
					<xsl:call-template name="addObkClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '+')"/>
						<xsl:with-param name="maximumValue" select="'99'"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$typicalAgeRangeValue = '*'">
					<xsl:call-template name="addEducationLevelClassification">
						<xsl:with-param name="minimumValue" select="0"/>
						<xsl:with-param name="maximumValue" select="99"/>
					</xsl:call-template>
					<xsl:call-template name="addObkClassification">
						<xsl:with-param name="minimumValue" select="0"/>
						<xsl:with-param name="maximumValue" select="99"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="contains($typicalAgeRangeValue, '-*')">
					<xsl:call-template name="addEducationLevelClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '-')"/>
						<xsl:with-param name="maximumValue" select="99"/>
					</xsl:call-template>
					<xsl:call-template name="addObkClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '-')"/>
						<xsl:with-param name="maximumValue" select="99"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="contains($typicalAgeRangeValue, '*')">
					<xsl:call-template name="addEducationLevelClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '*')"/>
						<xsl:with-param name="maximumValue" select="99"/>
					</xsl:call-template>
					<xsl:call-template name="addObkClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '*')"/>
						<xsl:with-param name="maximumValue" select="99"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="contains($typicalAgeRangeValue, '-')">
					<xsl:call-template name="addEducationLevelClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '-')"/>
						<xsl:with-param name="maximumValue" select="substring-after($typicalAgeRangeValue, '-')"/>
					</xsl:call-template>
					<xsl:call-template name="addObkClassification">
						<xsl:with-param name="minimumValue" select="substring-before($typicalAgeRangeValue, '-')"/>
						<xsl:with-param name="maximumValue" select="substring-after($typicalAgeRangeValue, '-')"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="addEducationLevelClassification">
						<xsl:with-param name="minimumValue" select="$typicalAgeRangeValue"/>
						<xsl:with-param name="maximumValue" select="$typicalAgeRangeValue"/>
					</xsl:call-template>
					<xsl:call-template name="addObkClassification">
						<xsl:with-param name="minimumValue" select="$typicalAgeRangeValue"/>
						<xsl:with-param name="maximumValue" select="$typicalAgeRangeValue"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
  </xsl:copy>
</xsl:template>



<!-- Voeg 'oude' classificatie toe -->
	<xsl:template name="addEducationLevelClassification">
		<xsl:param name="minimumValue"/>
		<xsl:param name="maximumValue"/>
		
		<!-- Voeg alleen een classificatie toe als minimum leeftijd een getal -->
		<xsl:if test="number($minimumValue &lt; 14) and number($minimumValue)">
			<xsl:element name="oai_lom:classification">
				<xsl:element name="oai_lom:purpose">
					<xsl:element name="oai_lom:source">
						<xsl:element name="oai_lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:element name="oai_lom:value">
						<xsl:element name="oai_lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>educationallevel</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="oai_lom:taxonpath">
					<xsl:element name="oai_lom:source">
						<xsl:element name="oai_lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/vdex_classification_educationallevel_czp_20071115.xml</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:element name="oai_lom:taxon">
						<xsl:element name="oai_lom:id">
							<xsl:text>PO</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="addOldValueTaxons">
						<xsl:with-param name="minimumValue">
							<xsl:value-of select="$minimumValue"/>
						</xsl:with-param>
						<xsl:with-param name="maximumValue">
							<xsl:value-of select="$maximumValue"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>


	<!-- Voeg OBK classificatie toe -->
	<xsl:template name="addObkClassification">
		<xsl:param name="minimumValue"/>
		<xsl:param name="maximumValue"/>

		<xsl:if test="number($minimumValue &lt; 14) and number($minimumValue)">
			<xsl:element name="oai_lom:classification">
				<xsl:element name="oai_lom:purpose">
					<xsl:element name="oai_lom:source">
						<xsl:element name="oai_lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:element name="oai_lom:value">
						<xsl:element name="oai_lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>educationallevel</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="oai_lom:taxonpath">
					<xsl:element name="oai_lom:source">
						<xsl:element name="oai_lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/begrippenkader</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:call-template name="constructTaxonElement">
						<xsl:with-param name="idValue" select="'512e4729-03a4-43a2-95ba-758071d1b725'"/>
						<xsl:with-param name="entryValue" select="'Primair onderwijs'"/>
					</xsl:call-template>
					<xsl:call-template name="addObkTaxons">
						<xsl:with-param name="minimumValue">
							<xsl:value-of select="$minimumValue"/>
						</xsl:with-param>
						<xsl:with-param name="maximumValue">
							<xsl:value-of select="$maximumValue"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:element>
			</xsl:element>
		</xsl:if>
	</xsl:template>


	<!-- Voeg taxons met oude waarden toe -->
	<xsl:template name="addOldValueTaxons">
		<xsl:param name="previousValue"/>
		<xsl:param name="minimumValue"/>
		<xsl:param name="maximumValue"/>

		<xsl:choose>
			<xsl:when test="$minimumValue = '4'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep1'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '5' and $previousValue = '4'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep2'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep3'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '5'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep1'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep2'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep3'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '6' and $previousValue = '5'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep4'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '6'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep2'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep3'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep4'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '7' and $previousValue = '6'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep5'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '7'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep3'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep4'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep5'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '8' and $previousValue = '7'"/>
			<xsl:when test="$minimumValue = '8'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep4'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep5'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '9' and $previousValue = '8'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep6'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '9'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep5'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep6'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '10' and $previousValue = '9'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep7'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '10'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep5'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep6'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep7'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '11' and $previousValue = '10'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep8'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '11'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep6'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep7'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep8'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '12' and $previousValue = '11'"/>
			<xsl:when test="$minimumValue = '12'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep7'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep8'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '13' and $previousValue = '12'"/>
			<xsl:when test="$minimumValue = '13'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'po_groep8'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>

		<xsl:if test="number($minimumValue) &lt; number($maximumValue)">
			<xsl:call-template name="addOldValueTaxons">
				<xsl:with-param name="previousValue" select="$minimumValue"/>
				<xsl:with-param name="minimumValue" select="number($minimumValue) + 1"/>
				<xsl:with-param name="maximumValue" select="$maximumValue"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>	
	
	
	<!-- Voeg OBK taxons toe -->
	<xsl:template name="addObkTaxons">
		<xsl:param name="previousValue"/>
		<xsl:param name="minimumValue"/>
		<xsl:param name="maximumValue"/>

		<xsl:choose>
			<xsl:when test="$minimumValue = '4'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'82ca4442-246c-44b3-a562-7b101793feb4'"/>
					<xsl:with-param name="entryValue" select="'PO groep 1'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '5' and $previousValue = '4'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'c007e4dd-a3d4-4f33-902d-778e3bbeeddb'"/>
					<xsl:with-param name="entryValue" select="'PO groep 2'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4'"/>
					<xsl:with-param name="entryValue" select="'PO groep 3'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '5'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'82ca4442-246c-44b3-a562-7b101793feb4'"/>
					<xsl:with-param name="entryValue" select="'PO groep 1'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'c007e4dd-a3d4-4f33-902d-778e3bbeeddb'"/>
					<xsl:with-param name="entryValue" select="'PO groep 2'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4'"/>
					<xsl:with-param name="entryValue" select="'PO groep 3'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '6' and $previousValue = '5'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'5c072b3f-7f58-40ee-9799-27981f0a6b2b'"/>
					<xsl:with-param name="entryValue" select="'PO groep 4'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '6'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'c007e4dd-a3d4-4f33-902d-778e3bbeeddb'"/>
					<xsl:with-param name="entryValue" select="'PO groep 2'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4'"/>
					<xsl:with-param name="entryValue" select="'PO groep 3'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'5c072b3f-7f58-40ee-9799-27981f0a6b2b'"/>
					<xsl:with-param name="entryValue" select="'PO groep 4'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '7' and $previousValue = '6'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'bc213214-b83d-4673-b9c1-8fdaa63d6d56'"/>
					<xsl:with-param name="entryValue" select="'PO groep 5'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '7'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4'"/>
					<xsl:with-param name="entryValue" select="'PO groep 3'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'5c072b3f-7f58-40ee-9799-27981f0a6b2b'"/>
					<xsl:with-param name="entryValue" select="'PO groep 4'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'bc213214-b83d-4673-b9c1-8fdaa63d6d56'"/>
					<xsl:with-param name="entryValue" select="'PO groep 5'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '8' and $previousValue = '7'"/>
			<xsl:when test="$minimumValue = '8'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'5c072b3f-7f58-40ee-9799-27981f0a6b2b'"/>
					<xsl:with-param name="entryValue" select="'PO groep 4'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'bc213214-b83d-4673-b9c1-8fdaa63d6d56'"/>
					<xsl:with-param name="entryValue" select="'PO groep 5'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '9' and $previousValue = '8'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'abfb190f-e814-46f5-a9cc-ebd53f04018e'"/>
					<xsl:with-param name="entryValue" select="'PO groep 6'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '9'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'bc213214-b83d-4673-b9c1-8fdaa63d6d56'"/>
					<xsl:with-param name="entryValue" select="'PO groep 5'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'abfb190f-e814-46f5-a9cc-ebd53f04018e'"/>
					<xsl:with-param name="entryValue" select="'PO groep 6'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '10' and $previousValue = '9'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'a4813bb6-cf63-4594-af56-6afb321723d8'"/>
					<xsl:with-param name="entryValue" select="'PO groep 7'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '10'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'bc213214-b83d-4673-b9c1-8fdaa63d6d56'"/>
					<xsl:with-param name="entryValue" select="'PO groep 5'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'abfb190f-e814-46f5-a9cc-ebd53f04018e'"/>
					<xsl:with-param name="entryValue" select="'PO groep 6'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'a4813bb6-cf63-4594-af56-6afb321723d8'"/>
					<xsl:with-param name="entryValue" select="'PO groep 7'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '11' and $previousValue = '10'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'95138558-9f65-4888-8ea3-8acce5eea273'"/>
					<xsl:with-param name="entryValue" select="'PO groep 8'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '11'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'abfb190f-e814-46f5-a9cc-ebd53f04018e'"/>
					<xsl:with-param name="entryValue" select="'PO groep 6'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'a4813bb6-cf63-4594-af56-6afb321723d8'"/>
					<xsl:with-param name="entryValue" select="'PO groep 7'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'95138558-9f65-4888-8ea3-8acce5eea273'"/>
					<xsl:with-param name="entryValue" select="'PO groep 8'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '12' and $previousValue = '11'"/>
			<xsl:when test="$minimumValue = '12'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'a4813bb6-cf63-4594-af56-6afb321723d8'"/>
					<xsl:with-param name="entryValue" select="'PO groep 7'"/>
				</xsl:call-template>
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'95138558-9f65-4888-8ea3-8acce5eea273'"/>
					<xsl:with-param name="entryValue" select="'PO groep 8'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$minimumValue = '13' and $previousValue = '12'"/>
			<xsl:when test="$minimumValue = '13'">
				<xsl:call-template name="constructTaxonElement">
					<xsl:with-param name="idValue" select="'95138558-9f65-4888-8ea3-8acce5eea273'"/>
					<xsl:with-param name="entryValue" select="'PO groep 8'"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>

		<xsl:if test="number($minimumValue) &lt; number($maximumValue)">
			<xsl:call-template name="addObkTaxons">
				<xsl:with-param name="previousValue" select="$minimumValue"/>
				<xsl:with-param name="minimumValue" select="number($minimumValue) + 1"/>
				<xsl:with-param name="maximumValue" select="$maximumValue"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="constructTaxonElement">
		<xsl:param name="idValue"/>
		<xsl:param name="entryValue"/>

		<xsl:element name="oai_lom:taxon">
			<xsl:element name="oai_lom:id">
				<xsl:value-of select="$idValue"/>
			</xsl:element>
			<xsl:if test="$entryValue != ''">
				<xsl:element name="oai_lom:entry">
					<xsl:element name="oai_lom:langstring">
						<xsl:attribute name="xml:lang">
							<xsl:text>x-none</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="$entryValue"/>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>	


    <!-- default copy -->
<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>

