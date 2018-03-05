<xsl:stylesheet version="1.0" xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:dai="info:eu-repo/dai" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:didl="urn:mpeg:mpeg21:2002:02-DIDL-NS" xmlns:diext="http://library.lanl.gov/2004-04/STB-RL/DIEXT" xmlns:dii="urn:mpeg:mpeg21:2002:01-DII-NS" xmlns:hbo="info:eu-repo/xmlns/hboMODSextension" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:mrx="http://www.memorix.nl/memorix.xsd" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no"/>
  <xsl:param name="default_language">
    <xsl:value-of select="//mods:languageTerm/text()"/>
  </xsl:param>
  <xsl:param name="vdex_aggregationlevel" select="'http://purl.edustandaard.nl/vdex_aggregationlevel_czp_20060628.xml'"/>
  <xsl:param name="vdex_status" select="'http://download.edustandaard.nl/vdex/vdex_status_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_contributerole" select="'http://purl.edustandaard.nl/vdex_lifecycle_contribute_role_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_learningresourcetype" select="'http://purl.edustandaard.nl/vdex_learningresourcetype_czp_20060628.xml'"/>
  <xsl:param name="vdex_intendedenduserrole" select="'http://purl.edustandaard.nl/vdex_intendedenduserrole_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_context" select="'http://purl.edustandaard.nl/vdex_context_czp_20060628.xml'"/>
  <xsl:param name="vdex_cost" select="'http://purl.edustandaard.nl/vdex_cost_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_copyrightandotherrestrictions" select="'https://purl.edustandaard.nl/copyrightsandotherrestrictions_nllom_20131202'"/>
  <xsl:param name="vdex_kind" select="'http://purl.edustandaard.nl/vdex_relation_kind_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_relationkind" select="'https://purl.edustandaard.nl/relation_kind_nllom_20131211'"/>
  <xsl:param name="vdex_classification" select="'http://purl.edustandaard.nl/begrippenkader'"/>
  <xsl:variable name="publisher">
    <xsl:choose>
      <xsl:when test="//mods:publisher">
        <xsl:value-of select="//mods:publisher/text()"/>
      </xsl:when>
      <xsl:otherwise>Surfsharekit repository</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="isbnissn">
    <xsl:choose>
      <xsl:when test="//mods:identifier[starts-with(text(),'urn:ISSN:')]">
        <xsl:text>urn:issn:</xsl:text>
        <xsl:value-of select="translate(//mods:identifier[starts-with(text(),'urn:ISSN:')], translate(.,'0123456789X-',''), '')"/>
      </xsl:when>
      <xsl:when test="//mods:identifier[starts-with(text(),'urn:ISSN:')]">
        <xsl:text>urn:isbn:</xsl:text>
        <xsl:value-of select="translate(//mods:identifier[starts-with(text(),'urn:ISSN:')], translate(.,'0123456789X-',''), '')"/>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="isbnissndesc">
    <xsl:choose>
      <xsl:when test="not(//mods:identifier[starts-with(text(),'urn:ISSN:')]) and not(//mods:identifier[starts-with(text(),'urn:ISSN:')])">
        <xsl:value-of select="//mods:identifier"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="//mods:identifier"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:template match="/">
    <xsl:element name="czp:lom" namespace="http://www.imsglobal.org/xsd/imsmd_v1p2">
      <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd</xsl:attribute>
      <!-- General -->
      <xsl:element name="czp:general">
        <!-- identifier -->
        <!-- Catalogentry -->
        <xsl:call-template name="czp-catalogentry">
          <xsl:with-param name="czp_catalog" select="'URI'"/>
          <xsl:with-param name="czp_entry" select="//dii:Identifier/text()"/>
        </xsl:call-template>
        <xsl:variable name="uri">
          <xsl:call-template name="string-replace-all">
            <xsl:with-param name="text" select="//dii:Identifier/text()"/>
            <xsl:with-param name="replace" select="'urn:nbn:nl:hs:20-'"/>
            <xsl:with-param name="by" select="'oai:surfsharekit.nl:'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:call-template name="czp-catalogentry">
          <xsl:with-param name="czp_catalog" select="'URI'"/>
          <xsl:with-param name="czp_entry" select="$uri"/>
        </xsl:call-template>
        <xsl:for-each select="//mods:identifier">
          <xsl:if test="//mods:identifier[starts-with(text(),'URN:ISBN:')]">
            <xsl:call-template name="czp-catalogentry">
              <xsl:with-param name="czp_catalog" select="'urn:isbn'"/>
              <xsl:with-param name="czp_entry" select="translate(., 'URN:ISBN:-', '')"/>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="not(//mods:identifier[starts-with(text(),'URN:ISBN:')])">
            <xsl:call-template name="czp-catalogentry">
              <xsl:with-param name="czp_catalog" select="'URI'"/>
              <xsl:with-param name="czp_entry" select="."/>
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>
        <xsl:if test="count(//didl:Resource[@mimeType='text/html']) &gt;0">
          <xsl:call-template name="czp-catalogentry">
            <xsl:with-param name="czp_catalog" select="'URI'"/>
            <xsl:with-param name="czp_entry" select="//didl:Resource[@mimeType='text/html']/@ref"/>
          </xsl:call-template>
        </xsl:if>
        <!-- Title -->
        <xsl:choose>
          <xsl:when test="//mods:title/text()">
            <xsl:choose>
              <xsl:when test="string-length(//mods:title) &lt; 80">
                <xsl:call-template name="langstring-element">
                  <xsl:with-param name="element_name" select="'czp:title'"/>
                  <xsl:with-param name="value" select="//mods:title"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="langstring-element">
                  <xsl:with-param name="element_name" select="'czp:title'"/>
                  <xsl:with-param name="value" select="//mods:title"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
        <!-- Language -->
        <xsl:call-template name="elemental">
          <xsl:with-param name="element_name" select="'czp:language'"/>
          <xsl:with-param name="value" select="//mods:languageTerm/text()"/>
        </xsl:call-template>
        <!-- Description -->
        <xsl:choose>
          <xsl:when test="//mods:abstract/text()">
            <xsl:call-template name="langstring-element">
              <xsl:with-param name="element_name" select="'czp:description'"/>
              <!-- verplicht -->
              <xsl:with-param name="value" select="//mods:abstract"/>
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
        <xsl:for-each select="//mods:topic">
          <xsl:call-template name="langstring-element">
            <xsl:with-param name="language" select="$default_language"/>
            <xsl:with-param name="element_name" select="'czp:keyword'"/>
            <!-- verplicht -->
            <xsl:with-param name="value" select="."/>
          </xsl:call-template>
        </xsl:for-each>
        <!-- Coverage -->
        <xsl:for-each select="//mods:coverage">
          <xsl:call-template name="langstring-element">
            <xsl:with-param name="element_name" select="'czp:coverage'"/>
            <xsl:with-param name="value" select="."/>
          </xsl:call-template>
        </xsl:for-each>
        <xsl:call-template name="date">
          <xsl:with-param name="value" select="//mods:dateIssued"/>
          <xsl:with-param name="type" select="'coverage'"/>
        </xsl:call-template>
        <!-- Aggregationlevel -->
        <xsl:call-template name="vocabulary-element">
          <xsl:with-param name="element_name" select="'czp:aggregationlevel'"/>
          <xsl:with-param name="vocabulary" select="$vdex_aggregationlevel"/>
          <!-- waarom niet LOMv1.0? -->
          <xsl:with-param name="value" select="'2'"/>
        </xsl:call-template>
      </xsl:element>
      <!-- Lifecycle -->
      <xsl:element name="czp:lifecycle">
        <!-- Contribute author -->
        <xsl:if test="//mods:name">
          <xsl:for-each select="//mods:name">
            <xsl:if test="current()//mods:roleTerm = 'aut'">
              <xsl:element name="czp:contribute">
                <xsl:call-template name="vocabulary-element">
                  <xsl:with-param name="element_name" select="'czp:role'"/>
                  <xsl:with-param name="vocabulary" select="$vdex_contributerole"/>
                  <xsl:with-param name="value" select="'author'"/>
                </xsl:call-template>
                <xsl:call-template name="czp-contributecentity">
                  <xsl:with-param name="vcard_fn" select="./mods:displayForm"/>
                  <xsl:with-param name="vcard_n" select="concat(./mods:namePart[@type='family'], ';', ./mods:namePart[@type='given'])"/>
                  <xsl:with-param name="vcard_title" select="./mods:affiliation"/>
                  <xsl:with-param name="vcard_uid" select="concat('DAI:', //dai:identifier[@IDref=current()/@ID])"/>
                </xsl:call-template>
              </xsl:element>
            </xsl:if>
          </xsl:for-each>
        </xsl:if>
        <!-- Contribute publisher -->
        <xsl:element name="czp:contribute">
          <xsl:call-template name="vocabulary-element">
            <xsl:with-param name="element_name" select="'czp:role'"/>
            <xsl:with-param name="vocabulary" select="$vdex_contributerole"/>
            <xsl:with-param name="value" select="'publisher'"/>
          </xsl:call-template>
          <xsl:if test="not(translate(//mods:publisher , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'hogeschool inholland')">
            <xsl:call-template name="czp-contributecentity">
              <xsl:with-param name="vcard_fn" select="$publisher"/>
              <xsl:with-param name="vcard_org" select="$publisher"/>
              <xsl:with-param name="vcard_address" select="//mods:placeTerm/text()"/>
            </xsl:call-template>
          </xsl:if>
          <xsl:call-template name="czp-contributecentity">
            <xsl:with-param name="vcard_fn" select="'Hogeschool InHolland'"/>
            <xsl:with-param name="vcard_org" select="'Hogeschool InHolland'"/>
            <xsl:with-param name="vcard_role" select="concat(//hbo:namePart[@type='lectorate'], ';', //hbo:namePart[@type='department'], ',',//hbo:namePart[@type='discipline']) "/>
            <xsl:with-param name="vcard_address" select="'Amsterdam'"/>
          </xsl:call-template>
          <xsl:call-template name="date">
            <xsl:with-param name="value" select="//mods:dateIssued"/>
            <xsl:with-param name="type" select="'date'"/>
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
          <xsl:with-param name="value" select="'application/pdf'"/>
        </xsl:call-template>
        <xsl:call-template name="elemental">
          <xsl:with-param name="element_name" select="'czp:location'"/>
          <!-- verplicht -->
          <xsl:with-param name="value" select="//didl:Resource[@mimeType='application/pdf']/@ref"/>
        </xsl:call-template>
      </xsl:element>
      <!-- Educational -->
      <xsl:element name="czp:educational">
        <xsl:call-template name="vocabulary-element">
          <xsl:with-param name="element_name" select="'czp:intendedenduserrole'"/>
          <!-- verplicht -->
          <xsl:with-param name="vocabulary" select="$vdex_intendedenduserrole"/>
          <xsl:with-param name="value" select="'author'"/>
        </xsl:call-template>
        <xsl:call-template name="vocabulary-element">
          <xsl:with-param name="element_name" select="'czp:context'"/>
          <xsl:with-param name="vocabulary" select="$vdex_context"/>
          <xsl:with-param name="value" select="'HO'"/>
        </xsl:call-template>
        <xsl:call-template name="vocabulary-element">
          <xsl:with-param name="element_name" select="'czp:context'"/>
          <xsl:with-param name="vocabulary" select="$vdex_context"/>
          <xsl:with-param name="value" select="'WO'"/>
        </xsl:call-template>
        <xsl:call-template name="langstring-element">
          <xsl:with-param name="element_name" select="'czp:typicalagerange'"/>
          <xsl:with-param name="language" select="'x-none'"/>
          <xsl:with-param name="value" select="'16+'"/>
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
      <xsl:if test="$isbnissn and $isbnissn != ''">
        <xsl:element name="czp:relation">
          <xsl:call-template name="vocabulary-element">
            <xsl:with-param name="element_name" select="'czp:kind'"/>
            <xsl:with-param name="vocabulary" select="$vdex_relationkind"/>
            <xsl:with-param name="value" select="'ispartof'"/>
          </xsl:call-template>
          <xsl:element name="czp:resource">
            <xsl:call-template name="czp-catalogentry">
              <xsl:with-param name="czp_catalog" select="'uri'"/>
              <xsl:with-param name="czp_entry">
                <xsl:value-of select="$isbnissn"/>
              </xsl:with-param>
            </xsl:call-template>
            <!-- Add optional description -->
            <xsl:if test="$isbnissndesc">
              <xsl:call-template name="langstring-element">
                <xsl:with-param name="element_name" select="'czp:description'"/>
                <xsl:with-param name="language" select="'x-none'"/>
                <xsl:with-param name="value">
                  <xsl:value-of select="$isbnissndesc"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:if>
          </xsl:element>
        </xsl:element>
      </xsl:if>
      <!-- Classification -->
      <xsl:element name="czp:classification">
        <xsl:call-template name="vocabulary-element">
          <xsl:with-param name="element_name" select="'czp:purpose'"/>
          <xsl:with-param name="vocabulary" select="'LOMv1.0'"/>
          <xsl:with-param name="value" select="'discipline'"/>
        </xsl:call-template>
        <xsl:call-template name="czp-taxonpath">
          <xsl:with-param name="vocabulary" select="'http://purl.edustandaard.nl/begrippenkader'"/>
          <xsl:with-param name="language" select="'nl'"/>
          <xsl:with-param name="czp_taxon_id" select="'5e86dc82-1981-48df-bbe5-abd4a9b3767b'"/>
          <xsl:with-param name="czp_taxon_entry" select="'Voedsel, natuur en leefomgeving'"/>
        </xsl:call-template>
      </xsl:element>
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
    <xsl:param name="vcard_n"/>
    <xsl:param name="vcard_fn"/>
    <xsl:param name="vcard_title"/>
    <xsl:param name="vcard_role"/>
    <xsl:param name="vcard_uid"/>
    <xsl:param name="vcard_org"/>
    <xsl:param name="vcard_address"/>
    <xsl:element name="czp:centity">
      <xsl:element name="czp:vcard">
        <xsl:text>BEGIN:VCARD
</xsl:text>
        <xsl:text>VERSION: 3.0
</xsl:text>
        <xsl:if test="$vcard_fn !=''">
          <xsl:text>FN:</xsl:text>
          <xsl:value-of select="$vcard_fn"/>
          <xsl:text>&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="$vcard_n !=''">
          <xsl:text>N:</xsl:text>
          <xsl:value-of select="$vcard_n"/>
          <xsl:text>&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="$vcard_title !=''">
          <xsl:text>TITLE:</xsl:text>
          <xsl:value-of select="$vcard_title"/>
          <xsl:text>&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="$vcard_role !='' and $vcard_role !=';,'">
          <xsl:text>ROLE:</xsl:text>
          <xsl:value-of select="$vcard_role"/>
          <xsl:text>&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="$vcard_uid !='' and $vcard_uid != 'DAI:'">
          <xsl:text>UID:</xsl:text>
          <xsl:value-of select="$vcard_uid"/>
          <xsl:text>&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="$vcard_org !=''">
          <xsl:text>ORG:</xsl:text>
          <xsl:value-of select="$vcard_org"/>
          <xsl:text>&#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="$vcard_address !=''">
          <xsl:text>ADR:;;;</xsl:text>
          <xsl:value-of select="$vcard_address"/>
          <xsl:text>;;</xsl:text>
          <xsl:text>&#xa;</xsl:text>
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
        <xsl:if test="$czp_taxon_entry !=''">
          <xsl:call-template name="langstring-element">
            <xsl:with-param name="element_name" select="'czp:entry'"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="value" select="$czp_taxon_entry"/>
          </xsl:call-template>
        </xsl:if>
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
  <!-- Maakt een <source><langstring xml:lang="x-none">$vocabulary</langstring></source><value><langstring xml:lang="x-none">$value</langstring></value>construct. -->
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
  <!-- Maakt een <$element_name>$value</$element_name>-->
  <xsl:template name="elemental">
    <xsl:param name="element_name"/>
    <xsl:param name="value"/>
    <xsl:element name="{$element_name}">
      <xsl:value-of select="$value"/>
    </xsl:element>
  </xsl:template>
  <!-- Maakt een <$element_name><langstring xml:lang="$language">$value</langstring></$element_name>-->
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
  <!-- Vervang een stuk tekst -->
  <!-- afkomstig van http://geekswithblogs.net/Erik/archive/2008/04/01/120915.aspx -->
  <xsl:template name="string-replace-all">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="by"/>
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$by"/>
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="by" select="$by"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>