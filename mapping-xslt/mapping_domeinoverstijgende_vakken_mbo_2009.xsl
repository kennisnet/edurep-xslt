<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_domeinoverstijgende_vakken_mbo_2009')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_domeinoverstijgende_vakken_mbo_2009_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'leren en loopbaan' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','157a7262-bdfc-4714-9f9a-b75fef94c8a2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'burgerschap' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','70c518f8-5719-4d0a-b3d8-6589073b9887') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'economisch' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','30d045c8-e34d-4da3-a412-2fb7f391b409') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'politiek-juridisch' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','dc503302-39cc-42e7-9639-4d2268c90ddb') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'sociaal-maatschappelijk' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','7fdc100e-6f72-47f4-88f4-c470f8c83858') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'rekenen-wiskunde' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','b48fa351-4561-44c7-a071-ebfd6103eec3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'getallen' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','9480fb6d-b753-49a7-8ab1-aa49fbadb1b6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'meten en meetkunde' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','e3f34035-1352-4024-9812-7f30b291d00b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'verbanden' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','d914a9cb-c57b-4676-b99c-abddb99d2027') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'verhoudingen' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','343892c7-78bb-4a66-b398-c6613190d3b6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'nederlands' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','3401cf6e-82e4-404c-b216-b980ff407159') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'begrippenlijst en taalverzorging' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','7793a80b-ee3e-439f-b548-6924ea2d7033') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'leesvaardigheid' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','f4e4403c-8c6c-45ef-97ae-a05cd4fa8d18') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mondelinge taalvaardigheid' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','4c56b100-82ca-43ef-a9d3-f7a1a6b12e21') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'schrijfvaardigheid' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','35be183e-0a81-41da-985b-35ac29677faa') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'nt2' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','e7ef4fc3-5bd3-4907-aacb-a0d5f74cef69') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'duits' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','81a1f605-db58-448d-a1dc-da682316c505') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'engels' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','18f53978-1118-4051-a778-b8d7f60ca982') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'frans' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','9f4710e3-f173-404e-b12e-577657a5da04') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'spaans' and key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','952bf604-cc38-44e3-889a-a9e74a18da8e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != 'leren en loopbaan' and descendant::*[local-name() = 'id'] != 'burgerschap' and descendant::*[local-name() = 'id'] != 'economisch' and descendant::*[local-name() = 'id'] != 'politiek-juridisch' and descendant::*[local-name() = 'id'] != 'sociaal-maatschappelijk' and descendant::*[local-name() = 'id'] != 'rekenen-wiskunde' and descendant::*[local-name() = 'id'] != 'getallen' and descendant::*[local-name() = 'id'] != 'meten en meetkunde' and descendant::*[local-name() = 'id'] != 'verbanden' and descendant::*[local-name() = 'id'] != 'verhoudingen' and descendant::*[local-name() = 'id'] != 'nederlands' and descendant::*[local-name() = 'id'] != 'begrippenlijst en taalverzorging' and descendant::*[local-name() = 'id'] != 'leesvaardigheid' and descendant::*[local-name() = 'id'] != 'mondelinge taalvaardigheid' and descendant::*[local-name() = 'id'] != 'schrijfvaardigheid' and descendant::*[local-name() = 'id'] != 'nt2' and descendant::*[local-name() = 'id'] != 'duits' and descendant::*[local-name() = 'id'] != 'engels' and descendant::*[local-name() = 'id'] != 'frans' and descendant::*[local-name() = 'id'] != 'spaans'"/>
<xsl:otherwise>
<xsl:text>unmatched</xsl:text>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:variable>

<xsl:if test="contains($createClassification, 'unmatched')">
<xsl:element name="{$usedNamespace}:classification">
<xsl:element name="{$usedNamespace}:purpose">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:value">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>discipline</xsl:text>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:taxonpath">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/begrippenkader</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_domeinoverstijgende_vakken_mbo_2009"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_domeinoverstijgende_vakken_mbo_2009">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_domeinoverstijgende_vakken_mbo_2009')]">
<xsl:choose>
<xsl:when test="node() = 'leren en loopbaan' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','157a7262-bdfc-4714-9f9a-b75fef94c8a2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'157a7262-bdfc-4714-9f9a-b75fef94c8a2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Loopbaan'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'burgerschap' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','70c518f8-5719-4d0a-b3d8-6589073b9887'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'70c518f8-5719-4d0a-b3d8-6589073b9887'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'economisch' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','30d045c8-e34d-4da3-a412-2fb7f391b409'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'30d045c8-e34d-4da3-a412-2fb7f391b409'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economisch burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'politiek-juridisch' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','dc503302-39cc-42e7-9639-4d2268c90ddb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dc503302-39cc-42e7-9639-4d2268c90ddb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Politiek-juridisch burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'sociaal-maatschappelijk' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','7fdc100e-6f72-47f4-88f4-c470f8c83858'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7fdc100e-6f72-47f4-88f4-c470f8c83858'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sociaal-maatschappelijk burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'rekenen-wiskunde' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','b48fa351-4561-44c7-a071-ebfd6103eec3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b48fa351-4561-44c7-a071-ebfd6103eec3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'getallen' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','9480fb6d-b753-49a7-8ab1-aa49fbadb1b6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9480fb6d-b753-49a7-8ab1-aa49fbadb1b6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Getallen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'meten en meetkunde' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','e3f34035-1352-4024-9812-7f30b291d00b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e3f34035-1352-4024-9812-7f30b291d00b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Meten en meetkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'verbanden' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','d914a9cb-c57b-4676-b99c-abddb99d2027'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d914a9cb-c57b-4676-b99c-abddb99d2027'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verbanden'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'verhoudingen' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','343892c7-78bb-4a66-b398-c6613190d3b6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'343892c7-78bb-4a66-b398-c6613190d3b6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verhoudingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'nederlands' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','3401cf6e-82e4-404c-b216-b980ff407159'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3401cf6e-82e4-404c-b216-b980ff407159'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlands'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'begrippenlijst en taalverzorging' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','7793a80b-ee3e-439f-b548-6924ea2d7033'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7793a80b-ee3e-439f-b548-6924ea2d7033'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Begrippenlijst en taalverzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'leesvaardigheid' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','f4e4403c-8c6c-45ef-97ae-a05cd4fa8d18'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f4e4403c-8c6c-45ef-97ae-a05cd4fa8d18'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Leesvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mondelinge taalvaardigheid' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','4c56b100-82ca-43ef-a9d3-f7a1a6b12e21'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4c56b100-82ca-43ef-a9d3-f7a1a6b12e21'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mondelinge taalvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'schrijfvaardigheid' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','35be183e-0a81-41da-985b-35ac29677faa'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'35be183e-0a81-41da-985b-35ac29677faa'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schrijfvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'nt2' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','e7ef4fc3-5bd3-4907-aacb-a0d5f74cef69'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e7ef4fc3-5bd3-4907-aacb-a0d5f74cef69'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlands als tweede taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'duits' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','81a1f605-db58-448d-a1dc-da682316c505'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'81a1f605-db58-448d-a1dc-da682316c505'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duits'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'engels' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','18f53978-1118-4051-a778-b8d7f60ca982'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'18f53978-1118-4051-a778-b8d7f60ca982'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Engels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'frans' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','9f4710e3-f173-404e-b12e-577657a5da04'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9f4710e3-f173-404e-b12e-577657a5da04'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Frans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'spaans' and not(key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','952bf604-cc38-44e3-889a-a9e74a18da8e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'952bf604-cc38-44e3-889a-a9e74a18da8e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Spaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="vdex_classification_domeinoverstijgende_vakken_mbo_2009_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdvdex_classification_domeinoverstijgende_vakken_mbo_2009',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '157a7262-bdfc-4714-9f9a-b75fef94c8a2' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','leren en loopbaan') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '70c518f8-5719-4d0a-b3d8-6589073b9887' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','burgerschap') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '30d045c8-e34d-4da3-a412-2fb7f391b409' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','economisch') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'dc503302-39cc-42e7-9639-4d2268c90ddb' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','politiek-juridisch') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7fdc100e-6f72-47f4-88f4-c470f8c83858' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','sociaal-maatschappelijk') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b48fa351-4561-44c7-a071-ebfd6103eec3' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','rekenen-wiskunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9480fb6d-b753-49a7-8ab1-aa49fbadb1b6' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','getallen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e3f34035-1352-4024-9812-7f30b291d00b' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','meten en meetkunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd914a9cb-c57b-4676-b99c-abddb99d2027' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','verbanden') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '343892c7-78bb-4a66-b398-c6613190d3b6' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','verhoudingen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3401cf6e-82e4-404c-b216-b980ff407159' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','nederlands') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7793a80b-ee3e-439f-b548-6924ea2d7033' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','begrippenlijst en taalverzorging') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f4e4403c-8c6c-45ef-97ae-a05cd4fa8d18' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','leesvaardigheid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4c56b100-82ca-43ef-a9d3-f7a1a6b12e21' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','mondelinge taalvaardigheid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '35be183e-0a81-41da-985b-35ac29677faa' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','schrijfvaardigheid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e7ef4fc3-5bd3-4907-aacb-a0d5f74cef69' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','nt2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '81a1f605-db58-448d-a1dc-da682316c505' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','duits') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '18f53978-1118-4051-a778-b8d7f60ca982' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','engels') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9f4710e3-f173-404e-b12e-577657a5da04' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','frans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '952bf604-cc38-44e3-889a-a9e74a18da8e' and key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','spaans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != '157a7262-bdfc-4714-9f9a-b75fef94c8a2' and descendant::*[local-name() = 'id'] != '70c518f8-5719-4d0a-b3d8-6589073b9887' and descendant::*[local-name() = 'id'] != '30d045c8-e34d-4da3-a412-2fb7f391b409' and descendant::*[local-name() = 'id'] != 'dc503302-39cc-42e7-9639-4d2268c90ddb' and descendant::*[local-name() = 'id'] != '7fdc100e-6f72-47f4-88f4-c470f8c83858' and descendant::*[local-name() = 'id'] != 'b48fa351-4561-44c7-a071-ebfd6103eec3' and descendant::*[local-name() = 'id'] != '9480fb6d-b753-49a7-8ab1-aa49fbadb1b6' and descendant::*[local-name() = 'id'] != 'e3f34035-1352-4024-9812-7f30b291d00b' and descendant::*[local-name() = 'id'] != 'd914a9cb-c57b-4676-b99c-abddb99d2027' and descendant::*[local-name() = 'id'] != '343892c7-78bb-4a66-b398-c6613190d3b6' and descendant::*[local-name() = 'id'] != '3401cf6e-82e4-404c-b216-b980ff407159' and descendant::*[local-name() = 'id'] != '7793a80b-ee3e-439f-b548-6924ea2d7033' and descendant::*[local-name() = 'id'] != 'f4e4403c-8c6c-45ef-97ae-a05cd4fa8d18' and descendant::*[local-name() = 'id'] != '4c56b100-82ca-43ef-a9d3-f7a1a6b12e21' and descendant::*[local-name() = 'id'] != '35be183e-0a81-41da-985b-35ac29677faa' and descendant::*[local-name() = 'id'] != 'e7ef4fc3-5bd3-4907-aacb-a0d5f74cef69' and descendant::*[local-name() = 'id'] != '81a1f605-db58-448d-a1dc-da682316c505' and descendant::*[local-name() = 'id'] != '18f53978-1118-4051-a778-b8d7f60ca982' and descendant::*[local-name() = 'id'] != '9f4710e3-f173-404e-b12e-577657a5da04' and descendant::*[local-name() = 'id'] != '952bf604-cc38-44e3-889a-a9e74a18da8e'"/>
<xsl:otherwise>
<xsl:text>unmatched</xsl:text>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:variable>

<xsl:if test="contains($createClassification, 'unmatched')">
<xsl:element name="{$usedNamespace}:classification">
<xsl:element name="{$usedNamespace}:purpose">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:value">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>discipline</xsl:text>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:taxonpath">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/vdex_classification_domeinoverstijgende_vakken_mbo_2009.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldvdex_classification_domeinoverstijgende_vakken_mbo_2009"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldvdex_classification_domeinoverstijgende_vakken_mbo_2009">
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = '157a7262-bdfc-4714-9f9a-b75fef94c8a2' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','leren en loopbaan'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'leren en loopbaan'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Loopbaan'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '70c518f8-5719-4d0a-b3d8-6589073b9887' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','burgerschap'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'burgerschap'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '30d045c8-e34d-4da3-a412-2fb7f391b409' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','economisch'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'economisch'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economisch burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'dc503302-39cc-42e7-9639-4d2268c90ddb' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','politiek-juridisch'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'politiek-juridisch'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Politiek-juridisch burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7fdc100e-6f72-47f4-88f4-c470f8c83858' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','sociaal-maatschappelijk'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'sociaal-maatschappelijk'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sociaal-maatschappelijk burgerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b48fa351-4561-44c7-a071-ebfd6103eec3' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','rekenen-wiskunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rekenen-wiskunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9480fb6d-b753-49a7-8ab1-aa49fbadb1b6' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','getallen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'getallen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Getallen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e3f34035-1352-4024-9812-7f30b291d00b' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','meten en meetkunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'meten en meetkunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Meten en meetkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd914a9cb-c57b-4676-b99c-abddb99d2027' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','verbanden'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'verbanden'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verbanden'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '343892c7-78bb-4a66-b398-c6613190d3b6' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','verhoudingen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'verhoudingen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verhoudingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3401cf6e-82e4-404c-b216-b980ff407159' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','nederlands'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'nederlands'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlands'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7793a80b-ee3e-439f-b548-6924ea2d7033' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','begrippenlijst en taalverzorging'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'begrippenlijst en taalverzorging'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Begrippenlijst en taalverzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f4e4403c-8c6c-45ef-97ae-a05cd4fa8d18' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','leesvaardigheid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'leesvaardigheid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Leesvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4c56b100-82ca-43ef-a9d3-f7a1a6b12e21' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','mondelinge taalvaardigheid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mondelinge taalvaardigheid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mondelinge taalvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '35be183e-0a81-41da-985b-35ac29677faa' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','schrijfvaardigheid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'schrijfvaardigheid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schrijfvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e7ef4fc3-5bd3-4907-aacb-a0d5f74cef69' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','nt2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'nt2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlands als tweede taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '81a1f605-db58-448d-a1dc-da682316c505' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','duits'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'duits'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duits'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '18f53978-1118-4051-a778-b8d7f60ca982' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','engels'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'engels'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Engels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9f4710e3-f173-404e-b12e-577657a5da04' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','frans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'frans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Frans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '952bf604-cc38-44e3-889a-a9e74a18da8e' and not(key('classification-by-oldIdvdex_classification_domeinoverstijgende_vakken_mbo_2009','spaans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'spaans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Spaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>




</xsl:stylesheet>

