<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2"
                xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2"
                version="1.0"
                xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd">
  <xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

  <xsl:include href="edurep://validate"/>

  <!-- Collectienaam voor het koppelen van -->
  <xsl:variable name="collectionName">
    <xsl:text>Teleblik</xsl:text>
  </xsl:variable>

  <!-- De door de collectie gebruikte namespace -->
  <xsl:variable name="usedNamespace">
    <xsl:text>czp</xsl:text>
  </xsl:variable>


  <xsl:param name="default_language" select="'nl'"/>
  <xsl:param name="vdex_aggregationlevel"
             select="'http://purl.edustandaard.nl/vdex_aggregationlevel_czp_20060628.xml'"/>
  <xsl:param name="vdex_classification_purpose"
             select="'http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml'"/>
  <xsl:param name="vdex_classification_educationallevel"
             select="'http://purl.edustandaard.nl/vdex_classification_educationallevel_czp_20071115.xml'"/>
  <xsl:param name="vdex_classification_obk" select="'http://purl.edustandaard.nl/begrippenkader'"/>
  <xsl:param name="vdex_context" select="'http://purl.edustandaard.nl/vdex_context_czp_20060628.xml'"/>
  <xsl:param name="vdex_learningresourcetype"
             select="'http://purl.edustandaard.nl/vdex_learningresourcetype_czp_20060628.xml'"/>
  <xsl:param name="vdex_intendedenduserrole"
             select="'http://purl.edustandaard.nl/vdex_intendedenduserrole_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_cost" select="'http://purl.edustandaard.nl/vdex_cost_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_copyright"
             select="'http://purl.edustandaard.nl/vdex_copyrightsandotherrestrictions_lomv1p0_20060628.xml'"/>
  <xsl:param name="vdex_relation" select="'https://purl.edustandaard.nl/relation_kind_nllom_20131211'"/>


  <xsl:template match="/">
    <xsl:apply-templates select="//czp:lom"/>
  </xsl:template>

  <xsl:template match="czp:lom">
    <xsl:copy>
      <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
      <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- default copy -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


  <xsl:template match="czp:general">
    <!--copy general -->
    <xsl:element name="czp:general">
      <xsl:for-each select="@*|node()">
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </xsl:for-each>

      <!--insert lom.technical.aggregationlevel -->
      <xsl:if test="count(//czp:aggregationlevel)=0">
        <xsl:call-template name="IMSvocabulary">
          <xsl:with-param name="element" select="'czp:aggregationlevel'"/>
          <xsl:with-param name="source" select="$vdex_aggregationlevel"/>
          <xsl:with-param name="value" select="'2'"/>
        </xsl:call-template>
      </xsl:if>

    </xsl:element>
  </xsl:template>


  <!-- insert lom.technical, lom.educational and lom.rights after lom.metametadata-->
  <xsl:template match="czp:metametadata">

    <!-- metametadata copy -->
    <xsl:element name="czp:metametadata">
      <xsl:element name="czp:metadatascheme">
        <xsl:value-of select="'LOMv1.0'"/>
      </xsl:element>
    </xsl:element>

    <!-- insert technical -->
    <xsl:element name="czp:technical">
      <xsl:choose>
        <xsl:when test="count(//czp:format)=0">
          <xsl:call-template name="elemental">
            <xsl:with-param name="element_name" select="'czp:format'"/>
            <xsl:with-param name="value" select="'video/x-flv'"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="elemental">
            <xsl:with-param name="element_name" select="'czp:format'"/>
            <xsl:with-param name="value" select="//czp:format"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:call-template name="elemental">
        <xsl:with-param name="element_name" select="'czp:location'"/>
        <xsl:with-param name="value"
                        select="concat('http://teleblik.nl/vpx/asset/', //czp:general/czp:catalogentry/czp:entry/czp:langstring)"/>
      </xsl:call-template>
      <xsl:if test="count(//czp:technical/czp:duration)!=0">
        <xsl:element name="czp:duration">
          <xsl:element name="czp:datetime">
            <xsl:value-of
                select="concat( substring-before( //czp:technical/czp:duration/czp:datetime, 'M' ), 'M', round(substring-before( substring-after(//czp:technical/czp:duration/czp:datetime,'M'), 'S')), 'S')"/>
          </xsl:element>
        </xsl:element>
      </xsl:if>
    </xsl:element>

    <!-- insert educational -->
    <xsl:element name="czp:educational">
      <xsl:call-template name="IMSvocabulary">
        <xsl:with-param name="element" select="'czp:learningresourcetype'"/>
        <xsl:with-param name="source" select="$vdex_learningresourcetype"/>
        <xsl:with-param name="value" select="'informatiebron'"/>
      </xsl:call-template>
      <xsl:call-template name="IMSvocabulary">
        <xsl:with-param name="element" select="'czp:intendedenduserrole'"/>
        <xsl:with-param name="source" select="$vdex_intendedenduserrole"/>
        <xsl:with-param name="value" select="'teacher'"/>
      </xsl:call-template>
      <xsl:call-template name="IMSvocabulary">
        <xsl:with-param name="element" select="'czp:intendedenduserrole'"/>
        <xsl:with-param name="source" select="$vdex_intendedenduserrole"/>
        <xsl:with-param name="value" select="'learner'"/>
      </xsl:call-template>
      <xsl:call-template name="determine-context">
        <xsl:with-param name="title" select="//czp:lom/czp:general/czp:title/czp:langstring"/>
        <xsl:with-param name="element" select="'context'"/>
      </xsl:call-template>
      <xsl:element name="czp:typicalagerange">
        <xsl:call-template name="langstring">
          <xsl:with-param name="czp_langstring" select="'*'"/>
          <xsl:with-param name="language" select="'x-none'"/>
        </xsl:call-template>
      </xsl:element>
    </xsl:element>

    <xsl:if test="count(//czp:rights)=0">

      <xsl:element name="czp:rights">
        <!-- Insert lom.rights.cost -->
        <xsl:call-template name="IMSvocabulary">
          <xsl:with-param name="element" select="'czp:cost'"/>
          <xsl:with-param name="source" select="$vdex_cost"/>
          <xsl:with-param name="value" select="'no'"/>
        </xsl:call-template>

        <!-- Insert lom.rights.copyrightandotherrestrictions -->
        <xsl:call-template name="IMSvocabulary">
          <xsl:with-param name="element" select="'czp:copyrightandotherrestrictions'"/>
          <xsl:with-param name="source" select="$vdex_copyright"/>
          <xsl:with-param name="value" select="'yes'"/>
        </xsl:call-template>

        <!-- Insert lom.rights.description -->
        <xsl:element name="czp:description">
          <xsl:call-template name="langstring">
            <xsl:with-param name="czp_langstring"
                            select="'For information on the use of archive material, please contact the Customer Service department of the Netherlands Institute for Sound and Vision: klantenservice@beeldengeluid.nl.'"/>
            <xsl:with-param name="language" select="'en'"/>
          </xsl:call-template>
          <xsl:call-template name="langstring">
            <xsl:with-param name="czp_langstring"
                            select="'Voor informatie over het gebruik van archiefmateriaal kunt u contact opnemen met de Klantenservice van het Nederlands Instituut voor Beeld en Geluid: klantenservice@beeldengeluid.nl.'"/>
            <xsl:with-param name="language" select="'nl'"/>
          </xsl:call-template>
        </xsl:element>
      </xsl:element>

    </xsl:if>

  </xsl:template>


  <!-- Technical element is created in metametadata template, this is to prevent duplication -->
  <xsl:template match="czp:technical"/>


  <!-- Insert relation element before classification element -->
  <xsl:template match="czp:classification">

    <!-- insert relation before the classification -->
    <xsl:element name="czp:relation">

      <!-- Old style relation element -->
      <xsl:call-template name="IMSvocabulary">
        <xsl:with-param name="element" select="'czp:kind'"/>
        <xsl:with-param name="source" select="$vdex_relation"/>
        <xsl:with-param name="value" select="'hasformat'"/>
      </xsl:call-template>

      <xsl:element name="czp:resource">
        <xsl:call-template name="langstring-element">
          <xsl:with-param name="element_name" select="'czp:description'"/>
          <xsl:with-param name="value" select="'embed-url'"/>
        </xsl:call-template>
        <xsl:element name="czp:catalogentry">
          <xsl:element name="czp:catalog">
            <xsl:value-of select="'URI'"/>
          </xsl:element>
          <xsl:call-template name="langstring-element">
            <xsl:with-param name="element_name" select="'czp:entry'"/>
            <xsl:with-param name="value"
                            select="concat('http://teleblik.nl/embed/vpx/asset/', //czp:general/czp:catalogentry/czp:entry/czp:langstring)"/>
          </xsl:call-template>
        </xsl:element>
      </xsl:element>
    </xsl:element>

    <!-- New style relation element -->
    <xsl:element name="czp:relation">
      <xsl:call-template name="IMSvocabulary">
        <xsl:with-param name="element" select="'czp:kind'"/>
        <xsl:with-param name="source" select="$vdex_relation"/>
        <xsl:with-param name="value" select="'embed'"/>
      </xsl:call-template>

      <xsl:element name="czp:resource">
        <xsl:element name="czp:catalogentry">
          <xsl:element name="czp:catalog">
            <xsl:value-of select="'URI'"/>
          </xsl:element>
          <xsl:call-template name="langstring-element">
            <xsl:with-param name="element_name" select="'czp:entry'"/>
            <xsl:with-param name="value"
                            select="concat('http://teleblik.nl/embed/vpx/asset/', //czp:general/czp:catalogentry/czp:entry/czp:langstring)"/>
          </xsl:call-template>
        </xsl:element>
      </xsl:element>

    </xsl:element>

    <!-- insert classification (purpose = educational level) based on content of lom.general.title -->
    <xsl:element name="czp:classification">
      <xsl:call-template name="IMSvocabulary">
        <xsl:with-param name="element" select="'czp:purpose'"/>
        <xsl:with-param name="source" select="$vdex_classification_purpose"/>
        <xsl:with-param name="value" select="'educational level'"/>
      </xsl:call-template>

      <xsl:call-template name="determine-context">
        <xsl:with-param name="title" select="//czp:lom/czp:general/czp:title/czp:langstring"/>
        <xsl:with-param name="element" select="'classification'"/>
      </xsl:call-template>

    </xsl:element>

    <xsl:element name="czp:classification">
      <xsl:call-template name="IMSvocabulary">
        <xsl:with-param name="element" select="'czp:purpose'"/>
        <xsl:with-param name="source" select="$vdex_classification_purpose"/>
        <xsl:with-param name="value" select="'educational level'"/>
      </xsl:call-template>
      <xsl:call-template name="determine-context">
        <xsl:with-param name="title" select="//czp:lom/czp:general/czp:title/czp:langstring"/>
        <xsl:with-param name="element" select="'classificationOBK'"/>
      </xsl:call-template>
    </xsl:element>

    <!-- add access rights -->
    <xsl:call-template name="ensureAccessrights">
        <xsl:with-param name="taxons" select="'RestrictedAccess::beperkte toegang||'"/>
    </xsl:call-template>

  </xsl:template>


  <!-- Determine context based on content of lom.general.title -->
  <xsl:template name="determine-context">
    <xsl:param name="title"/>
    <xsl:param name="element"/>

    <xsl:choose>
      <xsl:when
          test="substring( $title, 1, 32)='Beleef de natuur mee met Adriaan' or substring( $title, 1, 11)='DE BZT SHOW' or substring( $title, 1, 15)='DE KAMER VAN KO' or substring( $title, 1, 14)='DE MUSEUMBENDE' or substring( $title, 1, 12)='DE SCHATKAST' or substring( $title, 1, 29)='DE EEFJE WENTELTEEFJE TV SHOW' or substring( $title, 1, 12)='FLIP DE BEER' or substring( $title, 1, 15)='HET ZANDKASTEEL' or substring( $title, 1, 22)='HUISJE BOOMPJE BEESTJE' or substring( $title, 1, 15)='IK MIK LORELAND' or substring( $title, 1, 10)='KOEKELOERE' or substring( $title, 1, 27)='LEESDAS LETTERVOS BOEKENTAS' or substring( $title, 1, 11)='LIEDMACHIEN' or substring( $title, 1, 20)='REKENEN MET SCHOOLTV' or substring( $title, 1, 19)='SINTERKLAASJOURNAAL' or substring( $title, 1, 16)='VAKKENWIJZER 7/8' or substring( $title, 1, 16)='VROEGER &amp; ZO'">
        <xsl:choose>
          <xsl:when test="$element='context'">
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'PO'"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$element='classification'">
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'PO'"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when
          test="substring( $title, 1, 9)='Canonclip' or substring( $title, 1, 12)='HET KLOKHUIS' or substring( $title, 1, 13)='JEUGDJOURNAAL' or substring( $title, 1, 20)='NIEUWS UIT DE NATUUR' or substring( $title, 1, 21)='SCHOOLTV WEEKJOURNAAL' or substring( $title, 1, 7)='SPANGAS' or substring( $title, 1, 12)='WILLEM WEVER' or substring( $title, 1, 9)='Z@PPSPORT'">
        <xsl:choose>
          <xsl:when test="$element='context'">
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'PO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'VO'"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$element='classification'">
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'PO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'VO'"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when
          test="substring( $title, 1, 12)='BEELDENSTORM' or substring( $title, 1, 9)='2 VANDAAG' or substring( $title, 1, 21)='BAREND &amp; WITTEMAN' or substring( $title, 1, 9)='BUITENHOF' or substring( $title, 1, 21)='DE RONDE VAN WITTEMAN' or substring( $title, 1, 21)='DODE DICHTERS ALMANAK' or substring( $title, 1, 10)='EENVANDAAG' or substring( $title, 1, 13)='HET ELFDE UUR' or substring( $title, 1, 23)='HET LAGERHUIS: JONGEREN' or substring( $title, 1, 19)='HET UUR VAN DE WOLF' or substring( $title, 1, 13)='HET VERMOEDEN' or substring( $title, 1, 8)='JOURNAAL' or substring( $title, 1, 30)='KEYZER &amp; DE BOER ADVOCATEN' or substring( $title, 1, 26)='KNEVEL &amp; VAN DEN BRINK' or substring( $title, 1, 7)='NETWERK' or substring( $title, 1, 9)='NIEUWSUUR' or substring( $title, 1, 4)='NOVA' or substring( $title, 1, 19)='PAUW &amp; WITTEMAN' or substring( $title, 1, 7)='POWNEWS' or substring( $title, 1, 8)='PREMTIME' or substring( $title, 1, 11)='RONDOM TIEN' or substring( $title, 1, 11)='SOETERBEECK' or substring( $title, 1, 12)='TWEE VANDAAG' or substring( $title, 1, 6)='ZEMBLA'">
        <xsl:choose>
          <xsl:when test="$element='context'">
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'VO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'BVE'"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$element='classification'">
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'VO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'mbo'"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$element='context'">
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'PO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'VO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-context">
              <xsl:with-param name="context" select="'BVE'"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$element='classification'">
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'PO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'VO'"/>
            </xsl:call-template>
            <xsl:call-template name="make-classification">
              <xsl:with-param name="context" select="'mbo'"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <!-- Create context element -->
  <xsl:template name="make-context">
    <xsl:param name="context"/>

    <xsl:call-template name="IMSvocabulary">
      <xsl:with-param name="element" select="'czp:context'"/>
      <xsl:with-param name="source" select="$vdex_context"/>
      <xsl:with-param name="value" select="$context"/>
    </xsl:call-template>

  </xsl:template>


  <!-- Create classification element -->
  <xsl:template name="make-classification">
    <xsl:param name="context"/>

    <xsl:call-template name="czp-taxonpath">
      <xsl:with-param name="vocabulary" select="$vdex_classification_educationallevel"/>
      <xsl:with-param name="language" select="'nl'"/>
      <xsl:with-param name="czp_taxon_id" select="$context"/>
    </xsl:call-template>

    <!-- OBK classificatie -->
    <xsl:if test="$context != '' and $context != 'VVE' and $context != 'bedrijfsopleiding'">
      <xsl:call-template name="czp-taxonpath">
        <xsl:with-param name="vocabulary" select="$vdex_classification_obk"/>
        <xsl:with-param name="language" select="'nl'"/>
        <xsl:with-param name="czp_taxon_id">
          <xsl:choose>
            <xsl:when test="$context = 'SBaO'">
              <xsl:text>e05b5eb1-6a65-4f45-9556-79b25cd91da8</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'SO'">
              <xsl:text>e7f1c08f-08fb-48ab-be8e-c131b1bce54a</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'PO'">
              <xsl:text>512e4729-03a4-43a2-95ba-758071d1b725</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'VO'">
              <xsl:text>2a1401e9-c223-493b-9b86-78f6993b1a8d</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'BVE'">
              <xsl:text>caa97efc-a713-41ea-a845-1534ca65eac9</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'HBO'">
              <xsl:text>be140797-803f-4b9e-81cc-5572c711e09c</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'WO'">
              <xsl:text>bbbd99c6-cf49-4980-baed-12388f8dcff4</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:with-param>

        <xsl:with-param name="czp_taxon_entry">
          <xsl:choose>
            <xsl:when test="$context = 'SBaO'">
              <xsl:text>Speciaal basisonderwijs</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'SO'">
              <xsl:text>Speciaal onderwijs</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'PO'">
              <xsl:text>Primair onderwijs</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'VO'">
              <xsl:text>Voortgezet onderwijs</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'BVE'">
              <xsl:text>Beroepsonderwijs en Volwasseneneducatie</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'HBO'">
              <xsl:text>HBO</xsl:text>
            </xsl:when>
            <xsl:when test="$context = 'WO'">
              <xsl:text>WO</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:with-param>

      </xsl:call-template>
    </xsl:if>

  </xsl:template>


  <!-- Create taxonpath -->
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
        <xsl:if test="$czp_taxon_id!=''">
          <xsl:call-template name="elemental">
            <xsl:with-param name="element_name" select="'czp:id'"/>
            <xsl:with-param name="value" select="$czp_taxon_id"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="$czp_taxon_entry!=''">
          <xsl:call-template name="langstring-element">
            <xsl:with-param name="element_name" select="'czp:entry'"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="value" select="$czp_taxon_entry"/>
          </xsl:call-template>
        </xsl:if>

      </xsl:element>

    </xsl:element>

  </xsl:template>


  <!-- Create an element containing a langstring element -->
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


  <!-- Create a langstring element -->
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


  <!-- Create an element -->
  <xsl:template name="elemental">
    <xsl:param name="element_name"/>
    <xsl:param name="value"/>

    <xsl:element name="{$element_name}">
      <xsl:value-of select="$value"/>
    </xsl:element>

  </xsl:template>


</xsl:stylesheet>
