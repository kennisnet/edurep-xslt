<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2"
	xmlns:oai="http://www.openarchives.org/OAI/2.0/"
	xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd">

<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<!--<xsl:include href="edurep://repositoryToVdexMapping"/>-->
	<xsl:include href="edurep://validate"/>
	
	 <!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>edurep_delen</xsl:text>
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
   <!-- <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>-->
  	<xsl:apply-templates select="lom:general"/>
  	<xsl:apply-templates select="lom:lifecycle"/>
  	<xsl:apply-templates select="lom:metametadata"/>
  	<xsl:apply-templates select="lom:technical"/>
  	<xsl:apply-templates select="lom:educational"/>
  	<xsl:apply-templates select="lom:rights"/>
  	<xsl:apply-templates select="lom:relation"/>
  	<xsl:apply-templates select="lom:annotation"/>
  	<xsl:apply-templates select="lom:classification"/>
	<!-- Voeg een classificatie voor educational level toe als die er niet is (obv lom/educational/context veld) -->
	<xsl:call-template name="addEducationalLevel"/>
	<!-- Mapping begrippenkader -->
  	<!-- <xsl:call-template name="collectionMapping"/> -->
  	<!-- Maak een classificatie voor de validatie -->
  	<!--<xsl:call-template name="buildClassification"/>-->
	<!-- add access rights, open for all until this can be managed with BME individually -->
	<xsl:call-template name="ensureAccessrights">
		<xsl:with-param name="taxons" select="'OpenAccess::open toegang||'"/>
	</xsl:call-template>
  </xsl:copy>
</xsl:template>

	<!-- edurepdelen add 2 fields after update from bme
		the (non-)namespace conflicts with namespace of api added records
		making them invalid upon entering edurep -->
	<!-- the following 2 rules fix this (non-namespaced fields inherit the oai namespace) -->
	<xsl:template match="lom:metametadata/oai:contribute">
	</xsl:template>

	<xsl:template match="lom:lifecycle/lom:contribute[child::lom:role/lom:value/lom:langstring = 'publisher']/oai:date">
		<xsl:element name="lom:date">
			<xsl:element name="lom:datetime">
				<xsl:value-of select="//lom:lifecycle/lom:contribute[child::lom:role/lom:value/lom:langstring = 'publisher']/oai:date/oai:datetime"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<!-- Vervang video bestandsformaat als de catalogentry één van de onderstaande URL's bevat -->
	<xsl:template match="lom:format">
		<xsl:element name="lom:format">
			<!-- only touch video formats -->
			<xsl:choose>
				<xsl:when test="contains(node(), 'video/')">
					<!-- collect all uri's in one string to use contain on -->
					<xsl:variable name="uris">
						<xsl:apply-templates select="//lom:general/lom:catalogentry[child::lom:catalog = 'URI']/lom:entry/lom:langstring"/>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="contains($uris, 'youtube.com') or contains($uris, 'youtu.be')">
							<xsl:text>video/vnd.youtube.yt</xsl:text>
						</xsl:when>
						<xsl:when test="contains($uris, 'vimeo.com')">
							<xsl:text>video/x-flv</xsl:text>
						</xsl:when>
						<xsl:when test="contains($uris, 'player.omroep.nl') or contains($uris, 'download.omroep.nl')">
							<xsl:text>video/x-flv</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="node()"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="node()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>

	<xsl:template match="//lom:general/lom:catalogentry[child::lom:catalog = 'URI']/lom:entry/lom:langstring/text()">
		<!-- concat without delimeter, it also adds it to the catalogentries -->
		<xsl:value-of select="concat(.,'')"/>
	</xsl:template>


	<xsl:template match="lom:educational">
		<xsl:element name="lom:educational">
			<xsl:apply-templates select="child::lom:interactivitytype"/>
			<xsl:apply-templates select="child::lom:learningresourcetype"/>
			<xsl:apply-templates select="child::lom:interactivitylevel"/>
			<xsl:apply-templates select="child::lom:semanticdensity"/>
			<xsl:apply-templates select="child::lom:intendedenduserrole"/>
			<xsl:choose>
				<!-- Als er al een context elemenent is dan wordt deze teruggeplaatst en gebeurt er verder niets -->
				<xsl:when test="child::lom:context">
					<xsl:apply-templates select="child::lom:context"/>
				</xsl:when>
				<xsl:otherwise>
					<!-- Verzamel alle educational level termen -->
					<xsl:variable name="educationalLevelList">
						<xsl:for-each select="ancestor::lom:lom/lom:classification[child::lom:purpose/lom:value/lom:langstring = 'educational level']/lom:taxonpath/lom:taxon/lom:id">
							<xsl:value-of select="node()"/><xsl:text>||</xsl:text>
						</xsl:for-each>
					</xsl:variable>
					
					
					
					<!-- Vertaal de educational level termen naar een lijst met termen voor het context veld -->
					<xsl:variable name="contextList">
						<xsl:call-template name="educationalLevelToContext">
							<xsl:with-param name="edLevelList">
								<xsl:value-of select="$educationalLevelList"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					
					<!-- Maak de context elementen aan op basis van de contextList -->
					<xsl:call-template name="createContextElement">
						<xsl:with-param name="contextList">
							<xsl:value-of select="$contextList"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="child::lom:typicalagerange"/>
			<xsl:apply-templates select="child::lom:difficulty"/>
			<xsl:apply-templates select="child::lom:typicallearningtime"/>
			<xsl:apply-templates select="child::lom:description"/>
			<xsl:apply-templates select="child::lom:language"/>
		</xsl:element>
	</xsl:template>


	<!-- Vertaal OBK educational level termen naar een lijst met context termen. Dubbelingen worden voorkomen -->
	<xsl:template name="educationalLevelToContext">
		<xsl:param name="edLevelList"/>
		<xsl:param name="contextList"/>
		
		<xsl:variable name="currentEdLevel">
			<xsl:value-of select="substring-before($edLevelList, '||')"/>
		</xsl:variable>
		
		<xsl:variable name="newContextList">
			<xsl:value-of select="$contextList"/>
			<xsl:if test="$currentEdLevel != ''">
				
				<xsl:choose>
					<!-- SBaO -->
					<xsl:when test="$currentEdLevel = 'e05b5eb1-6a65-4f45-9556-79b25cd91da8'">
						<xsl:choose>
							<xsl:when test="contains($contextList, 'SBaO')"/>
							<xsl:otherwise>
								<xsl:text>SBaO||</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<!-- SO -->
					<xsl:when test="$currentEdLevel = 'e7f1c08f-08fb-48ab-be8e-c131b1bce54a'">
						<xsl:choose>
							<xsl:when test="contains($contextList, 'SO')"/>
							<xsl:otherwise>
								<xsl:text>SO||</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<!-- PO -->
					<xsl:when test="$currentEdLevel = '512e4729-03a4-43a2-95ba-758071d1b725' or $currentEdLevel = '82ca4442-246c-44b3-a562-7b101793feb4' or $currentEdLevel = 'c007e4dd-a3d4-4f33-902d-778e3bbeeddb' or $currentEdLevel = '25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4' or $currentEdLevel = '5c072b3f-7f58-40ee-9799-27981f0a6b2b' or $currentEdLevel = 'bc213214-b83d-4673-b9c1-8fdaa63d6d56' or $currentEdLevel = 'abfb190f-e814-46f5-a9cc-ebd53f04018e' or $currentEdLevel = 'a4813bb6-cf63-4594-af56-6afb321723d8' or $currentEdLevel = '95138558-9f65-4888-8ea3-8acce5eea273'">
						<xsl:choose>
							<xsl:when test="contains($contextList, 'PO')"/>
							<xsl:otherwise>
								<xsl:text>PO||</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<!-- VO -->
					<xsl:when test="$currentEdLevel = '2a1401e9-c223-493b-9b86-78f6993b1a8d' or $currentEdLevel = 'a3ddbe60-8478-4204-b769-6f5e9f4cbca2' or $currentEdLevel = '78f5cabe-6649-4dc3-84bf-36d82c6c2d31' or $currentEdLevel = 'eaa0c07f-193e-4be5-8dc6-a00bbfc7a446' or $currentEdLevel = 'af3ecd88-a654-4458-9c5b-1e1f7d09f463' or $currentEdLevel = '70af3752-c6ad-43d9-aa0c-9ff099931f8a' or $currentEdLevel = 'cb61531d-61eb-4412-a52f-ca065ca37e39' or $currentEdLevel = 'c7942bb1-bf4f-409f-bc98-9a0b02f175dc' or $currentEdLevel = '50746437-08f3-4559-8af3-3fa6e05d1a44' or $currentEdLevel = '9716fc83-479c-48da-be13-2fdd74e3b692' or $currentEdLevel = 'e56a05b1-a9af-432f-a7ac-b7401d8e95fb' or $currentEdLevel = '45403807-f052-4e09-a95c-b2e1c10c6c89' or $currentEdLevel = '8ae2af2d-890e-49d6-95cb-3619acb5c2cf' or $currentEdLevel = '05d90293-e675-44f4-bcd7-1f67161f6734' or $currentEdLevel = '49af771b-6d9e-4d8f-bcaf-ac9cc9ee753e' or $currentEdLevel = 'ee1eada7-7866-45e6-b1d8-b7062a8fe08a' or $currentEdLevel = '12e85a55-b3ae-4e7f-a2a0-d645f4c573bf' or $currentEdLevel = '30ce6ff5-d654-4a97-a6d4-9c8936f87ca6' or $currentEdLevel = 'f61c889e-4731-4321-802d-c7e86081499c' or $currentEdLevel = 'e72dacdd-968b-40ac-ad2c-8bd14c24e89f' or $currentEdLevel = '54edd410-2315-4eb3-a573-0e1cd59184fd' or $currentEdLevel = '90a5a228-e8de-473d-84cc-a915bf6107dd' or $currentEdLevel = 'e51e6137-05d4-45ca-aed0-6e91551257d4' or $currentEdLevel = '84f30df0-f194-435e-98c8-c4559756ec24' or $currentEdLevel = 'ad9872e5-edc4-4a62-9ee7-ba7daceba2e0' or $currentEdLevel = 'ac188375-0a1a-4984-ac80-14d04a086a19' or $currentEdLevel = '17da6976-2f1b-4214-a471-168f469d7e04' or $currentEdLevel = 'b924d4ad-65a1-41dc-b704-c7786eb4aec0' or $currentEdLevel = 'e2026706-0829-4a4c-b726-9409b6f407e1' or $currentEdLevel = 'f2513775-3d54-423b-803b-15e06a8c89a8' or $currentEdLevel = '85d15c83-e2b4-4359-8475-a355591aaa1a'">
						<xsl:choose>
							<xsl:when test="contains($contextList, 'VO')"/>
							<xsl:otherwise>
								<xsl:text>VO||</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<!-- BVE -->
					<xsl:when test="$currentEdLevel = 'caa97efc-a713-41ea-a845-1534ca65eac9' or $currentEdLevel = 'f3ac3fbb-5eae-49e0-8494-0a44855fff25' or $currentEdLevel = 'a598e56e-d1a6-4907-9e2c-3da64e59f9ae' or $currentEdLevel = '00ace3c7-d7a8-41e6-83b1-7f13a9af7668' or $currentEdLevel = '654931e1-6f8b-4f72-aa4b-92c99c72c347' or $currentEdLevel = '8beca7eb-95a5-4c7d-9704-2d2a2fc4bc65' or $currentEdLevel = '431f5942-4c61-42a5-b33d-638b82e0c4f6' or $currentEdLevel = 'a05ae1d7-8868-46e8-a4ed-eb6da166499d' or $currentEdLevel = '6219cc2d-2545-4893-84a0-30395794f2f4' or $currentEdLevel = 'e0a398b0-838b-409e-807a-f0f587dfd7c7' or $currentEdLevel = 'de5e9d28-7c80-4167-8d34-74520a55c27d' or $currentEdLevel = '655a4e1f-c9cf-464b-868e-f8aa2c813b89'">
						<xsl:choose>
							<xsl:when test="contains($contextList, 'BVE')"/>
							<xsl:otherwise>
								<xsl:text>BVE||</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<!-- HBO -->
					<xsl:when test="$currentEdLevel = 'be140797-803f-4b9e-81cc-5572c711e09c' or $currentEdLevel = 'f33b30ee-3c82-4ead-bc20-4255be9ece2d' or $currentEdLevel = 'de952b8b-efa5-4395-92c0-193812130c67'">
						<xsl:choose>
							<xsl:when test="contains($contextList, 'HBO')"/>
							<xsl:otherwise>
								<xsl:text>HBO||</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<!-- WO -->
					<xsl:when test="$currentEdLevel = 'bbbd99c6-cf49-4980-baed-12388f8dcff4' or $currentEdLevel = '18656a7c-95a5-4831-8085-020d3151aceb' or $currentEdLevel = '2998f2e0-449d-4911-86a2-f4cbf1a20b56'">
						<xsl:choose>
							<xsl:when test="contains($contextList, 'WO')"/>
							<xsl:otherwise>
								<xsl:text>WO||</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
				</xsl:choose>
				
			</xsl:if>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="substring-after($edLevelList, '||') != ''">
				<xsl:call-template name="educationalLevelToContext">
					<xsl:with-param name="edLevelList">
						<xsl:value-of select="substring-after($edLevelList, '||')"/>
					</xsl:with-param>
					<xsl:with-param name="contextList">
						<xsl:value-of select="$newContextList"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$newContextList"/>
			</xsl:otherwise>
		</xsl:choose>
		
		
	</xsl:template>


	<!-- Voeg een educationale level classificatie toe indien niet aanwezig (obv lom/educational/context) -->
	<xsl:template name="addEducationalLevel">
		<xsl:if test="not(//lom:lom/lom:classification/lom:purpose/lom:value/lom:langstring = 'educational level') and //lom:lom/lom:educational/lom:context/lom:value/lom:langstring != '' and //lom:lom/lom:educational/lom:context/lom:value/lom:langstring != 'VVE' and //lom:lom/lom:educational/lom:context/lom:value/lom:langstring != 'bedrijfsopleiding'">
			<xsl:element name="lom:classification">
				<xsl:element name="lom:purpose">
					<xsl:element name="lom:source">
						<xsl:element name="lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:element name="lom:value">
						<xsl:element name="lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>educational level</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:taxonpath">
					<xsl:element name="lom:source">
						<xsl:element name="lom:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>http://purl.edustandaard.nl/begrippenkader</xsl:text>
						</xsl:element>
					</xsl:element>
					<xsl:for-each select="//lom:lom/lom:educational/lom:context">
						<xsl:element name="lom:taxon">
							<xsl:element name="lom:id">
								<xsl:choose>
									<xsl:when test="child::lom:value/lom:langstring = 'SBaO'">
										<xsl:text>e05b5eb1-6a65-4f45-9556-79b25cd91da8</xsl:text>
									</xsl:when>
									<xsl:when test="child::lom:value/lom:langstring = 'SO'">
										<xsl:text>e7f1c08f-08fb-48ab-be8e-c131b1bce54a</xsl:text>
									</xsl:when>
									<xsl:when test="child::lom:value/lom:langstring = 'PO'">
										<xsl:text>512e4729-03a4-43a2-95ba-758071d1b725</xsl:text>
									</xsl:when>
									<xsl:when test="child::lom:value/lom:langstring = 'VO'">
										<xsl:text>2a1401e9-c223-493b-9b86-78f6993b1a8d</xsl:text>
									</xsl:when>
									<xsl:when test="child::lom:value/lom:langstring = 'BVE'">
										<xsl:text>caa97efc-a713-41ea-a845-1534ca65eac9</xsl:text>
									</xsl:when>
									<xsl:when test="child::lom:value/lom:langstring = 'HBO'">
										<xsl:text>be140797-803f-4b9e-81cc-5572c711e09c</xsl:text>
									</xsl:when>
									<xsl:when test="child::lom:value/lom:langstring = 'WO'">
										<xsl:text>bbbd99c6-cf49-4980-baed-12388f8dcff4</xsl:text>
									</xsl:when>
								</xsl:choose>								
							</xsl:element>
							<xsl:element name="lom:entry">
								<xsl:element name="lom:langstring">
									<xsl:attribute name="xml:lang">
										<xsl:text>nl</xsl:text>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when test="child::lom:value/lom:langstring = 'SBaO'">
											<xsl:text>Speciaal basisonderwijs</xsl:text>
										</xsl:when>
										<xsl:when test="child::lom:value/lom:langstring = 'SO'">
											<xsl:text>Speciaal onderwijs</xsl:text>
										</xsl:when>
										<xsl:when test="child::lom:value/lom:langstring = 'PO'">
											<xsl:text>Primair onderwijs</xsl:text>
										</xsl:when>
										<xsl:when test="child::lom:value/lom:langstring = 'VO'">
											<xsl:text>Voortgezet onderwijs</xsl:text>
										</xsl:when>
										<xsl:when test="child::lom:value/lom:langstring = 'BVE'">
											<xsl:text>Beroepsonderwijs en Volwasseneneducatie</xsl:text>
										</xsl:when>
										<xsl:when test="child::lom:value/lom:langstring = 'HBO'">
											<xsl:text>HBO</xsl:text>
										</xsl:when>
										<xsl:when test="child::lom:value/lom:langstring = 'WO'">
											<xsl:text>WO</xsl:text>
										</xsl:when>
									</xsl:choose>
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:element>
			
		</xsl:if>
	</xsl:template>


	<!-- Maak context elementen aan op basis van de lijst met termen -->
	<xsl:template name="createContextElement">
		<xsl:param name="contextList"/>
		
		<xsl:if test="substring-before($contextList, '||') != ''">
			<xsl:element name="lom:context">
				<xsl:element name="lom:source">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">
							<xsl:text>x-none</xsl:text>
						</xsl:attribute>
						<xsl:text>http://purl.edustandaard.nl/vdex_context_czp_20060628.xml</xsl:text>
					</xsl:element>
				</xsl:element>
				<xsl:element name="lom:value">
					<xsl:element name="lom:langstring">
						<xsl:attribute name="xml:lang">
							<xsl:text>x-none</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="substring-before($contextList, '||')"/>						
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		
		<xsl:if test="substring-after($contextList, '||') != ''">
			<xsl:call-template name="createContextElement">
				<xsl:with-param name="contextList">
					<xsl:value-of select="substring-after($contextList, '||')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		
		
	</xsl:template>
	
	
    <!-- default copy -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
		<!-- Velden valideren -->
		<!--<xsl:call-template name="validateValue"/>-->
	</xsl:template>

</xsl:stylesheet>
