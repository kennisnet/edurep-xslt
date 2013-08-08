<xsl:stylesheet xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:mrx="http://www.memorix.nl/memorix.xsd" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" standalone="no"/>

	<xsl:param name="default_language" select="'nl'"/>
	<xsl:param name="vdex_aggregationlevel" select="'http://purl.edustandaard.nl/vdex_aggregationlevel_czp_20060628.xml'"/>
	<xsl:param name="vdex_status" select="'http://download.edustandaard.nl/vdex/vdex_status_lomv1p0_20060628.xml'"/>
	<xsl:param name="vdex_contributerole" select="'http://purl.edustandaard.nl/vdex_lifecycle_contribute_role_lomv1p0_20060628.xml'"/>
	<xsl:param name="vdex_learningresourcetype" select="'http://purl.edustandaard.nl/vdex_learningresourcetype_czp_20060628.xml'"/>
	<xsl:param name="vdex_intendedenduserrole" select="'http://purl.edustandaard.nl/vdex_intendedenduserrole_lomv1p0_20060628.xml'"/>
	<xsl:param name="vdex_context" select="'http://purl.edustandaard.nl/vdex_context_czp_20060628.xml'"/>
	<xsl:param name="vdex_cost" select="'http://purl.edustandaard.nl/vdex_cost_lomv1p0_20060628.xml'"/>
	<xsl:param name="vdex_copyrightandotherrestrictions" select="'http://purl.edustandaard.nl/copyrightsandotherrestrictions_nllom_20110411'"/>
	<xsl:param name="vdex_kind" select="'http://purl.edustandaard.nl/vdex_relation_kind_lomv1p0_20060628.xml'"/>
	<xsl:param name="vdex_relationkind" select="'http://purl.edustandaard.nl/vdex_relation_kind_lomv1p0_20060628.xml'"/>


	<!--
	<xsl:param name="vdex_structure" select="'http://download.edustandaard.nl/vdex/vdex_structure_lomv1p0_20060628.xml'"/>
	<xsl:param name="vdex_relationkind" select="'http://purl.edustandaard.nl/vdex_relation_kind_lomv1p0_20060628.xml'"/>
	<xsl:param name="vdex_classification_purpose" select="'http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml'"/>
	<xsl:param name="vdex_classification_educationallevel" select="'http://download.edustandaard.nl/vdex/vdex_classification_educationallevel_czp_20071115.xml'"/>
	-->

	<xsl:template match="/">
		<xsl:element name="czp:lom" namespace="http://www.imsglobal.org/xsd/imsmd_v1p2">
			<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd</xsl:attribute>

			<!-- General -->
			<xsl:element name="czp:general">
				<!-- Title -->
				<xsl:choose>
					<xsl:when test="//dc:description/text()">
						<xsl:choose>
							<xsl:when test="string-length(//dc:description) &lt; 80">
								<xsl:call-template name="langstring-element">
									<xsl:with-param name="element_name" select="'czp:title'"/>
									<xsl:with-param name="value" select="//dc:description"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="langstring-element">
									<xsl:with-param name="element_name" select="'czp:title'"/>
									<xsl:with-param name="value" select="concat(substring(//dc:description, 1, 80), '...')"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="//dc:title and //dc:format">
						<xsl:call-template name="langstring-element">
							<xsl:with-param name="element_name" select="'czp:title'"/>
							<xsl:with-param name="value">
								<xsl:value-of select="//dc:format"/>
								<xsl:text> van </xsl:text>
								<xsl:value-of select="//dc:title"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="langstring-element">
							<xsl:with-param name="element_name" select="'czp:title'"/>
							<!-- verplicht -->
							<xsl:with-param name="value" select="'zonder titel'"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>

				<!-- Catalogentry -->
				<xsl:call-template name="czp-catalogentry">
					<xsl:with-param name="czp_catalog" select="'URI'"/>
					<xsl:with-param name="czp_entry" select="//dc:identifier"/>
				</xsl:call-template>
				<xsl:call-template name="elemental">
					<xsl:with-param name="element_name" select="'czp:language'"/>
					<!-- verplicht -->
					<xsl:with-param name="value" select="$default_language"/>
				</xsl:call-template>

				<!-- Description -->
				<xsl:choose>
					<xsl:when test="//dc:description/text()">
						<xsl:call-template name="langstring-element">
							<xsl:with-param name="element_name" select="'czp:description'"/>
							<!-- verplicht -->
							<xsl:with-param name="value" select="//dc:description"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="langstring-element">
							<xsl:with-param name="element_name" select="'czp:description'"/>
							<!-- verplicht -->
							<xsl:with-param name="value" select="'zonder beschrijving'"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>

				<!-- Keywords -->
				<xsl:for-each select="//dc:subject">
					<xsl:call-template name="langstring-element">
						<xsl:with-param name="element_name" select="'czp:keyword'"/>
						<!-- verplicht -->
						<xsl:with-param name="value" select="."/>
					</xsl:call-template>
				</xsl:for-each>

				<!-- Coverage -->
				<xsl:for-each select="//dc:coverage">
					<xsl:call-template name="langstring-element">
						<xsl:with-param name="element_name" select="'czp:coverage'"/>
						<xsl:with-param name="value" select="."/>
					</xsl:call-template>
				</xsl:for-each>
				<xsl:call-template name="date">
					<xsl:with-param name="value" select="//dc:date"/>
					<xsl:with-param name="type" select="'coverage'"/>
				</xsl:call-template>

				<!-- Aggregationlevel -->
				<xsl:call-template name="vocabulary-element">
					<xsl:with-param name="element_name" select="'czp:aggregationlevel'"/>
					<xsl:with-param name="vocabulary" select="$vdex_aggregationlevel"/>
					<xsl:with-param name="value" select="'1'"/>
				</xsl:call-template>
			</xsl:element>

			<!-- Lifecycle -->
			<xsl:element name="czp:lifecycle">
				<!-- Version -->
				<xsl:call-template name="langstring-element">
					<xsl:with-param name="element_name" select="'czp:version'"/>
					<!-- verplicht -->
					<xsl:with-param name="language" select="'nl'"/>
					<xsl:with-param name="value" select="'onbekend'"/>
				</xsl:call-template>
				<!-- Contribute author -->
				<xsl:if test="//dc:creator">
					<xsl:element name="czp:contribute">
						<xsl:call-template name="vocabulary-element">
							<xsl:with-param name="element_name" select="'czp:role'"/>
							<xsl:with-param name="vocabulary" select="$vdex_contributerole"/>
							<xsl:with-param name="value" select="'author'"/>
						</xsl:call-template>
						<xsl:call-template name="czp-contributecentity">
							<xsl:with-param name="vcard_fn" select="//dc:creator"/>
							<xsl:with-param name="vcard_org" select="//dc:relation"/>
						</xsl:call-template>
						<xsl:call-template name="date">
							<xsl:with-param name="value" select="//dc:date"/>
							<xsl:with-param name="type" select="'date'"/>
						</xsl:call-template>
					</xsl:element>
				</xsl:if>
				<!-- Contribute publisher -->
				<xsl:element name="czp:contribute">
					<xsl:call-template name="vocabulary-element">
						<xsl:with-param name="element_name" select="'czp:role'"/>
						<xsl:with-param name="vocabulary" select="$vdex_contributerole"/>
						<xsl:with-param name="value" select="'publisher'"/>
					</xsl:call-template>
					<xsl:call-template name="czp-contributecentity">
						<xsl:with-param name="vcard_fn" select="'Nationaal Archief'"/>
						<xsl:with-param name="vcard_org" select="'Nationaal Archief'"/>
					</xsl:call-template>
				</xsl:element>
			</xsl:element>

			<!-- Metametadata -->
			<xsl:element name="czp:metametadata">
				<!-- verplicht, met minstens 2 scheme's -->
				<xsl:element name="czp:metadatascheme">
					<xsl:text>LOMv1.0</xsl:text>
					<!-- verplicht -->
				</xsl:element>
				<xsl:element name="czp:metadatascheme">
					<xsl:text>nl_lom_v1p0</xsl:text>
				</xsl:element>
			</xsl:element>

			<!-- Technical -->
			<xsl:element name="czp:technical">
				<xsl:call-template name="elemental">
					<xsl:with-param name="element_name" select="'czp:format'"/>
					<!-- verplicht -->
					<xsl:with-param name="value" select="'image/jpeg'"/>
				</xsl:call-template>
				<xsl:call-template name="elemental">
					<xsl:with-param name="element_name" select="'czp:location'"/>
					<!-- verplicht -->
					<xsl:with-param name="value">
						<xsl:text>http://www.gahetna.nl/collectie/afbeeldingen/fotocollectie/zoeken/weergave/detail/q/id/</xsl:text>
						<xsl:value-of select="substring-after(substring-after(//dc:identifier, ':'),':')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:element>

			<!-- Educational -->
			<xsl:element name="czp:educational">
				<xsl:call-template name="vocabulary-element">
					<xsl:with-param name="element_name" select="'czp:learningresourcetype'"/>
					<!-- verplicht -->
					<xsl:with-param name="vocabulary" select="$vdex_learningresourcetype"/>
					<xsl:with-param name="value" select="'informatiebron'"/>
				</xsl:call-template>
				<xsl:call-template name="vocabulary-element">
					<xsl:with-param name="element_name" select="'czp:intendedenduserrole'"/>
					<!-- verplicht -->
					<xsl:with-param name="vocabulary" select="$vdex_intendedenduserrole"/>
					<xsl:with-param name="value" select="'author'"/>
				</xsl:call-template>
				<!--<xsl:call-template name="vocabulary-element">
			<xsl:with-param name="element_name" select="'czp:context'"/>
			<xsl:with-param name="vocabulary" select="$vdex_context"/>
			<xsl:with-param name="value" select="'VO'"/>
		</xsl:call-template>-->
				<xsl:call-template name="langstring-element">
					<xsl:with-param name="element_name" select="'czp:typicalagerange'"/>
					<xsl:with-param name="language" select="'x-none'"/>
					<xsl:with-param name="value" select="'7+'"/>
				</xsl:call-template>
			</xsl:element>

			<!-- Rights -->
			<xsl:element name="czp:rights">
				<xsl:call-template name="vocabulary-element">
					<xsl:with-param name="element_name" select="'czp:cost'"/>
					<!-- verplicht -->
					<xsl:with-param name="vocabulary" select="$vdex_cost"/>
					<xsl:with-param name="value" select="'no'"/>
				</xsl:call-template>
				<xsl:call-template name="vocabulary-element">
					<xsl:with-param name="element_name" select="'czp:copyrightandotherrestrictions'"/>
					<!-- verplicht -->
					<xsl:with-param name="vocabulary" select="$vdex_copyrightandotherrestrictions"/>
					<xsl:with-param name="value" select="'yes'"/>
				</xsl:call-template>
				<xsl:call-template name="langstring-element">
					<xsl:with-param name="element_name" select="'czp:description'"/>
					<xsl:with-param name="language" select="'nl'"/>
					<xsl:with-param name="value" select="//dc:rights"/>
				</xsl:call-template>
			</xsl:element>

			<!-- Relation -->
			<xsl:element name="czp:relation">
				<xsl:call-template name="vocabulary-element">
					<xsl:with-param name="element_name" select="'czp:kind'"/>
					<xsl:with-param name="vocabulary" select="$vdex_relationkind"/>
					<xsl:with-param name="value" select="'isformatof'"/>
				</xsl:call-template>
				<xsl:element name="czp:resource">
					<xsl:call-template name="langstring-element">
						<xsl:with-param name="element_name" select="'czp:description'"/>
						<xsl:with-param name="language" select="'x-none'"/>
						<xsl:with-param name="value" select="'thumbnail'"/>
					</xsl:call-template>
					<xsl:call-template name="czp-catalogentry">
						<xsl:with-param name="czp_catalog" select="'URI'"/>
						<xsl:with-param name="czp_entry">
							<xsl:text>http://afbeeldingen.gahetna.nl/naa/thumb/100x100/</xsl:text>
							<xsl:value-of select="//dc:relation"/>
							<xsl:text>.jpg</xsl:text>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:element>
			</xsl:element>

			<!-- Relation -->
			<xsl:element name="czp:relation">
				<xsl:call-template name="vocabulary-element">
					<xsl:with-param name="element_name" select="'czp:kind'"/>
					<xsl:with-param name="vocabulary" select="$vdex_relationkind"/>
					<xsl:with-param name="value" select="'haspart'"/>
				</xsl:call-template>
				<xsl:element name="czp:resource">
					<xsl:call-template name="czp-catalogentry">
						<xsl:with-param name="czp_catalog" select="'URI'"/>
						<xsl:with-param name="czp_entry">
							<xsl:text>http://afbeeldingen.gahetna.nl/naa/thumb/1280x1280/</xsl:text>
							<xsl:value-of select="//dc:relation"/>
							<xsl:text>.jpg</xsl:text>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:element>
			</xsl:element>


			<!--<xsl:element name="czp:classification">
		<xsl:call-template name="vocabulary-element">
			<xsl:with-param name="element_name" select="'czp:purpose'"/> 
			<xsl:with-param name="vocabulary" select="$vdex_classification_purpose"/>
			<xsl:with-param name="value" select="'educational level'"/>
		</xsl:call-template>
		<xsl:call-template name="czp-taxonpath">
			<xsl:with-param name="vocabulary" select="$vdex_classification_educationallevel"/>
      <xsl:with-param name="language" select="'nl'"/>
			<xsl:with-param name="czp_taxon_id" select="'VO'"/>
			<xsl:with-param name="czp_taxon_entry" select="'Voortgezet Onderwijs'"/>
		</xsl:call-template>
	</xsl:element>-->
		</xsl:element>
	</xsl:template>



	<!-- Dit zijn de functies, verander alleen hierboven de variabelen. -->
	<!--combo van elemental en langstring-element-->
	<xsl:template name="czp-catalogentry">
		<xsl:param name="czp_catalog"/>
		<xsl:param name="czp_entry"/>
		<xsl:element name="czp:catalogentry">
			<xsl:element name="czp:catalog">
				<xsl:value-of select="$czp_catalog"/>
			</xsl:element>
			<xsl:element name="czp:entry">
				<xsl:call-template name="langstring">
					<xsl:with-param name="language" select="'x-none'"/>
					<xsl:with-param name="czp_langstring" select="$czp_entry"/>
				</xsl:call-template>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="czp-contributecentity">
		<xsl:param name="vcard_fn"/>
		<xsl:param name="vcard_org"/>
		<xsl:element name="czp:centity">
			<xsl:element name="czp:vcard">
				<xsl:text>BEGIN:VCARD
</xsl:text>
				<xsl:text>VERSION: 3.0
</xsl:text>
				<xsl:if test="$vcard_fn !=''">
					<xsl:text>FN:</xsl:text>
					<xsl:value-of select="$vcard_fn"/>
					<xsl:text>
</xsl:text>
				</xsl:if>
				<xsl:if test="$vcard_org !=''">
					<xsl:text>ORG:</xsl:text>
					<xsl:value-of select="$vcard_org"/>
					<xsl:text>
</xsl:text>
				</xsl:if>
				<xsl:text>END:VCARD</xsl:text>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="czp-taxonpath">
		<xsl:param name="vocabulary"/>
		<xsl:param name="language"/>
		<xsl:param name="czp_taxon_id"/>
		<xsl:param name="czp_taxon_entry"/>
		<xsl:element name="czp:taxonpath">
			<xsl:call-template name="langstring-element">
				<xsl:with-param name="element_name" select="'czp:source'"/>
				<xsl:with-param name="language" select="'x-none'"/>
				<xsl:with-param name="value" select="$vocabulary"/>
			</xsl:call-template>
			<xsl:element name="czp:taxon">
				<xsl:call-template name="elemental">
					<xsl:with-param name="element_name" select="'czp:id'"/>
					<!-- verplicht -->
					<xsl:with-param name="value" select="$czp_taxon_id"/>
				</xsl:call-template>
				<xsl:call-template name="langstring-element">
					<xsl:with-param name="element_name" select="'czp:entry'"/>
					<xsl:with-param name="language" select="$language"/>
					<xsl:with-param name="value" select="$czp_taxon_entry"/>
				</xsl:call-template>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="date">
		<xsl:param name="value"/>
		<xsl:param name="type"/>
		<xsl:choose>
			<!-- for yyyy-mm-dd -->
			<xsl:when test="number(substring($value, 1, 4)) &gt; 1000 and number(substring($value, 1, 4)) &lt; 2100 and substring( $value, 5, 1 ) = '-' and number(substring ( $value, 6,2 )) &gt;= 0 and number(substring ( $value, 6,2 )) &lt; 13 and substring( $value, 8, 1) = '-' and number(substring ( $value, 9,2 )) &gt;= 0 and number(substring ( $value, 9,2 )) &lt; 32">
				<xsl:if test="$type = 'date'">
					<xsl:element name="czp:date">
						<xsl:call-template name="elemental">
							<xsl:with-param name="element_name" select="'czp:datetime'"/>
							<xsl:with-param name="value" select="concat(substring($value, 1, 4), '-', substring ( $value, 6,2 ), '-', substring ( $value, 9,2 ), 'T00:00:00Z' )"/>
						</xsl:call-template>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<!-- for dd-mm-yyyy -->
			<xsl:when test="number(substring($value, 7, 4)) &gt; 1000 and number(substring($value, 7, 4)) &lt; 2100 and substring( $value, 6, 1 ) = '-' and number(substring ( $value, 4,2 )) &gt;= 0 and number(substring ( $value, 4,2 )) &lt; 13 and substring( $value, 3, 1) = '-' and number(substring ( $value, 1,2 )) &gt;= 0 and number(substring ( $value, 1,2 )) &lt; 32">
				<xsl:if test="$type = 'date'">
					<xsl:element name="czp:date">
						<xsl:call-template name="elemental">
							<xsl:with-param name="element_name" select="'czp:datetime'"/>
							<xsl:with-param name="value" select="concat(substring($value, 7, 4), '-', substring ( $value, 4,2 ), '-', substring ( $value, 1,2 ), 'T00:00:00Z' )"/>
						</xsl:call-template>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<!-- yyyy -->
			<xsl:when test="string-length($value) = 4 and number($value) &gt; 1000 and number($value) &lt; 2100">
				<xsl:if test="$type = 'date'">
					<xsl:element name="czp:date">
						<xsl:call-template name="elemental">
							<xsl:with-param name="element_name" select="'czp:datetime'"/>
							<xsl:with-param name="value" select="concat($value, '-00-00T00:00:00Z' )"/>
						</xsl:call-template>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$type = 'coverage'">
					<xsl:call-template name="langstring-element">
						<xsl:with-param name="element_name" select="'czp:coverage'"/>
						<xsl:with-param name="value" select="$value"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Herbruikbare delen code, aangeroepen in bovenstaande functies -->

	<!-- Maakt een <source><langstring xml:lang="x-none">$vocabulary</langstring></source><value><langstring xml:lang="x-none">$value</langstring></value> construct. -->
	<xsl:template name="vocabulary-element">
		<xsl:param name="element_name"/>
		<xsl:param name="vocabulary"/>
		<xsl:param name="value"/>
		<xsl:element name="{$element_name}">
			<xsl:call-template name="langstring-element">
				<xsl:with-param name="element_name" select="'czp:source'"/>
				<xsl:with-param name="language" select="'x-none'"/>
				<xsl:with-param name="value" select="$vocabulary"/>
			</xsl:call-template>
			<xsl:call-template name="langstring-element">
				<xsl:with-param name="element_name" select="'czp:value'"/>
				<xsl:with-param name="language" select="'x-none'"/>
				<xsl:with-param name="value" select="$value"/>
			</xsl:call-template>
		</xsl:element>
	</xsl:template>


	<!-- Maakt een <$element_name>$value</$element_name> -->
	<xsl:template name="elemental">
		<xsl:param name="element_name"/>
		<xsl:param name="value"/>
		<xsl:element name="{$element_name}">
			<xsl:value-of select="$value"/>
		</xsl:element>
	</xsl:template>


	<!-- Maakt een <$element_name><langstring xml:lang="$language">$value</langstring></$element_name> -->
	<xsl:template name="langstring-element">
		<xsl:param name="element_name"/>
		<xsl:param name="language"/>
		<xsl:param name="value"/>
		<xsl:element name="{$element_name}">
			<xsl:choose>
				<xsl:when test="$language!=''">
					<xsl:call-template name="langstring">
						<xsl:with-param name="language" select="$language"/>
						<xsl:with-param name="czp_langstring" select="$value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="langstring">
						<xsl:with-param name="language" select="$default_language"/>
						<xsl:with-param name="czp_langstring" select="$value"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>


	<!-- Maakt een <langstring xml:lang="$language">$value</langstring>-->
	<xsl:template name="langstring">
		<xsl:param name="czp_langstring"/>
		<xsl:param name="language"/>
		<xsl:element name="czp:langstring">
			<xsl:attribute name="xml:lang">
				<xsl:value-of select="$language"/>
			</xsl:attribute>
			<xsl:value-of select="$czp_langstring"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>

