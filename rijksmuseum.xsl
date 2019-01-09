<xsl:stylesheet xmlns="http://www.openarchives.org/OAI/2.0/"
	xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:param name="default_language" select="'nl'"/>
	<xsl:include href="edurep://validate"/>

	<xsl:variable name="collectionName">
		<xsl:text>rijksmuseum</xsl:text>
	</xsl:variable>

	<xsl:variable name="usedNamespace">
		<xsl:text>lom</xsl:text>
	</xsl:variable>


	<xsl:template match="/">
		<xsl:element name="lom:lom" namespace="http://www.imsglobal.org/xsd/imsmd_v1p2">
		<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd</xsl:attribute>
		
		<!-- General -->
		<xsl:element name="lom:general">
			<!-- Catalog entry -->
			<xsl:call-template name="nllom-catalogentry">
				<xsl:with-param name="nllom_catalog" select="'URI'"/>
				<xsl:with-param name="nllom_entry">
					<xsl:text>urn:rijksmuseum:</xsl:text>
					<xsl:value-of select="normalize-space(//oai_dc:dc/dc:identifier[2])"/>
					<xsl:text>-</xsl:text>
					<xsl:value-of select="normalize-space(//oai_dc:dc/dc:identifier[1])"/>
				</xsl:with-param>
			</xsl:call-template>			
			<!-- Language -->
			<xsl:call-template name="elemental">
				<xsl:with-param name="element_name" select="'lom:language'"/> 
				<xsl:with-param name="value" select="$default_language"/>
			</xsl:call-template>
			<!-- Title -->
			<xsl:call-template name="langstring-element">
              	<xsl:with-param name="element_name" select="'lom:title'"/>
				<xsl:with-param name="value">
					<xsl:choose>
						<xsl:when test="//oai_dc:dc/child::dc:title">
              				<xsl:value-of select="//oai_dc:dc/dc:title[1]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="//oai_dc:dc/dc:identifier[1]"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
            </xsl:call-template>
			<!-- Description -->
			<xsl:call-template name="langstring-element">
          		<xsl:with-param name="element_name" select="'lom:description'"/>
          		<xsl:with-param name="value">
					<xsl:variable name="combinedDescription">
						<xsl:value-of select="//dc:description"/>

						<!-- Check if there are multiple titles -->
						<xsl:if test="count(//dc:title) &gt; 1">
							<xsl:for-each select="//dc:title[1]/following-sibling::dc:title">
								<xsl:text> </xsl:text>
								<xsl:value-of select="node()"/>
								<xsl:text>.</xsl:text>
							</xsl:for-each>
						</xsl:if>

						<!-- Check if there is information about used materials -->
						<xsl:if test="//dc:format[starts-with(node(), 'materiaal: ')]">
							<xsl:text> Materiaal: </xsl:text>
							<xsl:for-each select="//dc:format[starts-with(node(), 'materiaal')]">
								<xsl:if test="preceding-sibling::dc:format[starts-with(node(), 'materiaal')]">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="substring-after(node(), 'materiaal: ')"/>
							</xsl:for-each>
							<xsl:text>.</xsl:text>
						</xsl:if>

						<!-- Check if there is information about size -->
						<xsl:if test="//dc:format[contains(node(), 'hoogte') or contains(node(), 'breedte') or contains(node(), 'diepte') or contains(node(), 'diameter')]">
							<xsl:text> Formaat: </xsl:text>
							<!-- Height -->
							<xsl:for-each select="//dc:format[contains(node(), 'hoogte')]">
								<xsl:value-of select="node()"/>
							</xsl:for-each>
							<!-- Width -->
							<xsl:for-each select="//dc:format[contains(node(), 'breedte')]">
								<xsl:if test="preceding-sibling::dc:format[contains(node(), 'hoogte') or contains(node(), 'diepte') or contains(node(), 'diameter')]">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="node()"/>
							</xsl:for-each>
							<!-- Depth -->
							<xsl:for-each select="//dc:format[contains(node(), 'diepte')]">
								<xsl:if test="preceding-sibling::dc:format[contains(node(), 'hoogte') or contains(node(), 'breedte') or contains(node(), 'diameter')]">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="node()"/>
							</xsl:for-each>
							<!-- Diameter -->
							<xsl:for-each select="//dc:format[contains(node(), 'diameter')]">
								<xsl:if test="preceding-sibling::dc:format[contains(node(), 'hoogte') or contains(node(), 'breedte') or contains(node(), 'diepte')]">
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select="node()"/>
							</xsl:for-each>
							<xsl:text>.</xsl:text>
						</xsl:if>
					</xsl:variable>
								
					<xsl:choose>
						<xsl:when test="string-length($combinedDescription) &lt; 1998">
							<xsl:value-of select="$combinedDescription"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(substring($combinedDescription, 1, 1997), '...')"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
        	</xsl:call-template>
			<!-- Keyword -->
			<xsl:for-each select="//dc:creator[not(contains(node(),'anoniem'))]">
				<xsl:call-template name="langstring-element">
					<xsl:with-param name="element_name" select="'lom:keyword'"/> 
					<xsl:with-param name="value">
						<xsl:value-of select="substring-after(node(), ', ')"/>
						<xsl:value-of select="substring-before(substring-after(node(), ':'), ', ')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="//dc:date">
				<xsl:call-template name="langstring-element">
					<xsl:with-param name="element_name" select="'lom:keyword'"/> 
					<xsl:with-param name="value">
						<xsl:choose>
							<xsl:when test="substring-before(node(), ' -  ') = substring-after(node(), ' -  ')">
								<xsl:value-of select="substring-before(node(), ' -  ')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="node()"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="//dc:type">
				<xsl:call-template name="langstring-element">
					<xsl:with-param name="element_name" select="'lom:keyword'"/> 
					<xsl:with-param name="value" select="."/>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="//dc:subject">
				<xsl:choose>
					<xsl:when test="contains(node(), 'Iconclasscode: ')"/>
					<xsl:otherwise>
						<xsl:call-template name="langstring-element">
							<xsl:with-param name="element_name" select="'lom:keyword'"/> 
							<xsl:with-param name="value" select="."/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:for-each select="//dc:format">
					<xsl:if test="contains(node(), 'techniek: ')">
						<xsl:call-template name="langstring-element">
							<xsl:with-param name="element_name" select="'lom:keyword'"/> 
							<xsl:with-param name="value" select="substring-after(node(), 'techniek: ')"/>
						</xsl:call-template>
					</xsl:if>
			</xsl:for-each>
			<!-- Coverage -->
			<xsl:for-each select="//dc:coverage">
				<xsl:choose>
					<xsl:when test="name(preceding-sibling::*[1]) = 'dc:creator'"/>
					<xsl:otherwise>
						<xsl:call-template name="langstring-element">
							<xsl:with-param name="element_name" select="'lom:coverage'"/>						
							<xsl:with-param name="value" select="."/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>

			<!-- Aggregationlevel -->
			<xsl:call-template name="IMSvocabulary">
				<xsl:with-param name="element" select="'lom:aggregationlevel'"/>
				<xsl:with-param name="source" select="$vdex_aggregationlevel"/>
				<xsl:with-param name="value" select="'1'"/>
			</xsl:call-template>

		</xsl:element>

		<!-- Lifecycle -->
		<xsl:element name="lom:lifecycle">
			<!-- Version -->
			<xsl:call-template name="langstring-element">
				<xsl:with-param name="element_name" select="'lom:version'"/>
				<xsl:with-param name="language" select="'x-none'"/>
				<xsl:with-param name="value" select="'onbekend'"/>
			</xsl:call-template>

			<xsl:element name="lom:contribute">
				<xsl:call-template name="IMSvocabulary">
        			<xsl:with-param name="element" select="'lom:role'"/>
        			<xsl:with-param name="source" select="$vdex_contributerole"/>
			  		<xsl:with-param name="value" select="'publisher'"/>
      			</xsl:call-template>
      			<xsl:call-template name="nllom-contributecentity">
       				<xsl:with-param name="vcard_fn" select="//dc:publisher"/>
       				<xsl:with-param name="vcard_org" select="//dc:publisher"/>
      			</xsl:call-template>
			</xsl:element>
		</xsl:element>

		<!-- Metametadata -->
			<xsl:element name="lom:metametadata">  <!-- verplicht, met minstens 2 scheme's -->
				<xsl:element name="lom:metadatascheme">
					<xsl:text>LOMv1.0</xsl:text> <!-- verplicht -->
				</xsl:element>
				<xsl:element name="lom:metadatascheme">
					<xsl:text>nl_lom_v1p0</xsl:text>
				</xsl:element>
			</xsl:element>

		<!-- Technical -->
		<xsl:element name="lom:technical">
			<xsl:call-template name="elemental">
				<xsl:with-param name="element_name" select="'lom:format'"/> <!-- verplicht -->
				<xsl:with-param name="value" select="'image/jpeg'"/>
			</xsl:call-template>
			<xsl:call-template name="elemental">
				<xsl:with-param name="element_name" select="'lom:location'"/> <!-- verplicht -->
				<xsl:with-param name="value" select="//dc:format[2]"/>
			</xsl:call-template>
		</xsl:element>

		<!-- Educational -->
		<xsl:element name="lom:educational">
			<xsl:call-template name="IMSvocabulary">
				<xsl:with-param name="element" select="'lom:learningresourcetype'"/>
				<xsl:with-param name="source" select="$vdex_learningresourcetype"/>
				<xsl:with-param name="value" select="'informatiebron'"/>
			</xsl:call-template>
			<xsl:call-template name="IMSvocabulary">
				<xsl:with-param name="element" select="'lom:intendedenduserrole'"/>
				<xsl:with-param name="source" select="$vdex_intendedenduserrole"/>
				<xsl:with-param name="value" select="'learner'"/>
			</xsl:call-template>
			<xsl:call-template name="langstring-element">
				<xsl:with-param name="element_name" select="'lom:typicalagerange'"/>
				<xsl:with-param name="language" select="'x-none'"/>
				<xsl:with-param name="value" select="'7+'"/>
			</xsl:call-template>
		</xsl:element>

		<!-- Rights -->
		<xsl:element name="lom:rights">
			<xsl:call-template name="IMSvocabulary">
				<xsl:with-param name="element" select="'lom:cost'"/>
				<xsl:with-param name="source" select="$vdex_cost"/>
				<xsl:with-param name="value" select="'no'"/>
			</xsl:call-template>
			<xsl:call-template name="IMSvocabulary">
				<xsl:with-param name="element" select="'lom:copyrightandotherrestrictions'"/>
				<xsl:with-param name="source" select="$vdex_copyrightandotherrestrictions"/>
				<xsl:with-param name="value" select="'cc-by-30'"/>
			</xsl:call-template>
		</xsl:element>

		<!-- Relation thumbnail 100x100 -->
		<!-- Oude methode -->
		<xsl:element name="lom:relation">
			<xsl:call-template name="IMSvocabulary">
				<xsl:with-param name="element" select="'lom:kind'"/>
				<xsl:with-param name="source" select="$vdex_relationkind"/>
				<xsl:with-param name="value" select="'hasformat'"/>
			</xsl:call-template>
			<xsl:element name="lom:resource">
			<xsl:element name="lom:description">
				<xsl:element name="lom:langstring">
					<xsl:attribute name="xml:lang">nl</xsl:attribute>
					<xsl:text>thumbnail</xsl:text>
				</xsl:element>
			</xsl:element>
				<xsl:call-template name="nllom-catalogentry">
					<xsl:with-param name="nllom_catalog" select="'URI'"/>
					<xsl:with-param name="nllom_entry">
						<xsl:value-of select="//dc:format[1]"/>
						<xsl:text>&amp;200x200</xsl:text>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:element>
		</xsl:element>
		<!-- Nieuwe methode -->
		<xsl:element name="lom:relation">
			<xsl:call-template name="IMSvocabulary">
				<xsl:with-param name="element" select="'lom:kind'"/>
				<xsl:with-param name="source" select="$vdex_relationkind"/>
				<xsl:with-param name="value" select="'thumbnail'"/>
			</xsl:call-template>
			<xsl:element name="lom:resource">
				<xsl:call-template name="nllom-catalogentry">
					<xsl:with-param name="nllom_catalog" select="'URI'"/>
					<xsl:with-param name="nllom_entry">
						<xsl:value-of select="//dc:format[1]"/>
						<xsl:text>&amp;200x200</xsl:text>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:element>
		</xsl:element>

		<xsl:call-template name="ensureAccessrights">
			<xsl:with-param name="taxons" select="'OpenAccess::open toegang||'"/>
		</xsl:call-template>

		<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>



<!-- Overige elementen weggooien -->
<xsl:template match="@*|node()">
</xsl:template>



<xsl:template name="nllom-catalogentry">
	<xsl:param name="nllom_catalog"/>
	<xsl:param name="nllom_entry"/>
	<xsl:element name="lom:catalogentry">
		<xsl:element name="lom:catalog">
			<xsl:value-of select="$nllom_catalog"/>
		</xsl:element>
		<xsl:element name="lom:entry">
			<xsl:call-template name="langstring">
				<xsl:with-param name="language" select="'x-none'"/>
				<xsl:with-param name="nllom_langstring" select="$nllom_entry"/>
			</xsl:call-template>
		</xsl:element>
	</xsl:element>
</xsl:template>

<xsl:template name="nllom-contributecentity">
	<xsl:param name="vcard_n"/>
	<xsl:param name="vcard_fn"/>
	<xsl:param name="vcard_org"/>
	<xsl:param name="vcard_address"/>
   	<xsl:element name="lom:centity">
    	<xsl:element name="lom:vcard">
      		<xsl:text>BEGIN:VCARD
</xsl:text>
<xsl:text>VERSION: 3.0
</xsl:text>
      		<xsl:if test="$vcard_n !=''">
<xsl:text>N:</xsl:text>
<xsl:value-of select="$vcard_n"/>
<xsl:text>
</xsl:text>
      		</xsl:if>
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
			<xsl:if test="$vcard_address !=''">
<xsl:text>ADR:;;;</xsl:text><xsl:value-of select="$vcard_address"/><xsl:text>;;</xsl:text>
<xsl:text>
</xsl:text>
      		</xsl:if>
<xsl:text>END:VCARD</xsl:text>
    	</xsl:element>
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
				<xsl:with-param name="nllom_langstring" select="$value"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="langstring">
				<xsl:with-param name="language" select="$default_language"/>
				<xsl:with-param name="nllom_langstring" select="$value"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:element>
</xsl:template>


<!-- Maakt een <langstring xml:lang="$language">$value</langstring>-->
<xsl:template name="langstring">
	<xsl:param name="nllom_langstring"/>
	<xsl:param name="language"/>
	<xsl:element name="lom:langstring">
		<xsl:attribute name="xml:lang"><xsl:value-of select="$language"/></xsl:attribute>
		<xsl:value-of select="$nllom_langstring"/>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>

