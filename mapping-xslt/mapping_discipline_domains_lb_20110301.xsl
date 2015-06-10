<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:variable name="lowercase">
<xsl:text>abcdefghijklmnopqrstuvwxyz</xsl:text>
</xsl:variable>
<xsl:variable name="uppercase">
<xsl:text>ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:text>
</xsl:variable>

<xsl:key name="classification-by-newIdvdex_classification_discipline_domains_lb_20110301" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_discipline_domains_lb_20110301" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_discipline_domains_lb_20110301')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>

<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_discipline_domains_lb_20110301_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301',descendant::*[local-name() = 'id'])">

<!-- Vertaal naar lower case en URL-decode %20 -->
<xsl:variable name="nodeValue">
<xsl:call-template name="spaceDecoding">
<xsl:with-param name="inputValue">
<xsl:value-of select="translate(descendant::*[local-name() = 'id'], $uppercase, $lowercase)"/>
</xsl:with-param>
</xsl:call-template>
</xsl:variable>

<xsl:choose>
<xsl:when test="$nodeValue = 'economische_dimensie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','30d045c8-e34d-4da3-a412-2fb7f391b409') != ''"/>
<xsl:when test="$nodeValue = 'politiek-juridische_dimensie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','dc503302-39cc-42e7-9639-4d2268c90ddb') != ''"/>
<xsl:when test="$nodeValue = 'sociaal-maatschappeljke_dimensie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','7fdc100e-6f72-47f4-88f4-c470f8c83858') != ''"/>
<xsl:when test="$nodeValue = 'dimensie_vitaal_burgerschap' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','121f6889-f69e-4db4-82ee-e9e18a590b9a') != ''"/>
<xsl:when test="$nodeValue = 'capaciteiten_en_motieven_reflectie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','c668c811-c035-475f-ba7a-cc01d95b734a') != ''"/>
<xsl:when test="$nodeValue = 'loopbaansturing' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','b9de8965-bfcc-4a00-be07-b4ef2deffe53') != ''"/>
<xsl:when test="$nodeValue = 'netwerken' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','d470fe4a-85da-4138-8c15-44b4fa7c8417') != ''"/>
<xsl:when test="$nodeValue = 'werkexploratie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','c0d3b28a-e78c-4f28-8523-9beabe64eed6') != ''"/>
<xsl:when test="$nodeValue = 'bedrijfscultuur_en_arbeidsverhoudingen' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','06947347-f9c0-4ca3-9a47-a9f56edce14c') != ''"/>
<xsl:when test="$nodeValue = 'budgettering' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','afd30ae8-7f63-47d2-9933-7ab124caa84b') != ''"/>
<xsl:when test="$nodeValue = 'subculturen' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','d2ba6f4c-b617-4140-b493-d1957ddecf52') != ''"/>
<xsl:when test="$nodeValue = 'doel_en_invloed_netwerken' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','b7d4916f-e57b-4fbc-8d93-e885597a2a88') != ''"/>
<xsl:when test="$nodeValue = 'duurzame_consumptie_en_productie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','0ae8825b-4f73-4100-bdaa-880ad049e3f9') != ''"/>
<xsl:when test="$nodeValue = 'ethisch_en_integer_handelen' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','978b380b-ac13-45a6-a07f-edca0bb5df9f') != ''"/>
<xsl:when test="$nodeValue = 'gezonde_leefwijze' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','ab8a289f-b480-4e2b-8549-cf0945fc06b6') != ''"/>
<xsl:when test="$nodeValue = 'grondrechten_en_plichten' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','c324ebb0-f0ba-4527-a3ae-5c1150b68c8e') != ''"/>
<xsl:when test="$nodeValue = 'maatschappelijke_functies_van_arbeid' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','730826ef-a81b-423a-a65f-049a3be9fd0f') != ''"/>
<xsl:when test="$nodeValue = 'parlementaire_democratie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','513fcfba-16aa-4b1e-b26f-f78e7f03b7d9') != ''"/>
<xsl:when test="$nodeValue = 'politieke_besluitvorming' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','a646a706-bbda-484d-b667-8cdaed700820') != ''"/>
<xsl:when test="$nodeValue = 'politieke_stromingen' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','30c0d713-a013-4c25-8639-e895fc3dca5b') != ''"/>
<xsl:when test="$nodeValue = 'rechtsstaat_en_rechtssysteem' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','9c6447e1-92e2-4c8f-97de-2c8e7243adb2') != ''"/>
<xsl:when test="$nodeValue = 'rol_en_invloed_branche_en_vakorganisaties' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','65406126-c4d5-4382-875f-96a025fe73fc') != ''"/>
<xsl:when test="$nodeValue = 'rol_en_invloed_consumentenorganisaties' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','819ca924-94a5-465a-907f-18e2545bd2a7') != ''"/>
<xsl:when test="$nodeValue = 'rol_en_invloed_massamedia_op_de_politiek' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','cac360bc-2b08-4012-95af-43d8308632bd') != ''"/>
<xsl:when test="$nodeValue = 'invloed_media_op_bestedingspatroon' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','1f7281e8-22a7-4492-8737-1104ff277e36') != ''"/>
<xsl:when test="$nodeValue = 'rol_Europese_Unie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','dc27018f-a608-47cf-8dcc-b4e5b964d450') != ''"/>
<xsl:when test="$nodeValue = 'rol_overheid_op_de_politiek' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','198a1deb-9bc4-450f-bd2a-379201bee50c') != ''"/>
<xsl:when test="$nodeValue = 'rol_overheid_op_het_gebied_van_de_economie' and key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','19d5e9b0-66dd-4172-bb4c-4d8bbf3299f6') != ''"/>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_discipline_domains_lb_20110301"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_discipline_domains_lb_20110301">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_discipline_domains_lb_20110301')]">

<!-- Vertaal naar lower case en URL-decode %20 -->
<xsl:variable name="nodeValue">
<xsl:call-template name="spaceDecoding">
<xsl:with-param name="inputValue">
<xsl:value-of select="translate(node(), $uppercase, $lowercase)"/>
</xsl:with-param>
</xsl:call-template>
</xsl:variable>

<xsl:choose>
<xsl:when test="$nodeValue = 'economische_dimensie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','30d045c8-e34d-4da3-a412-2fb7f391b409'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'30d045c8-e34d-4da3-a412-2fb7f391b409'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Economisch burgerschap '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'politiek-juridische_dimensie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','dc503302-39cc-42e7-9639-4d2268c90ddb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dc503302-39cc-42e7-9639-4d2268c90ddb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Politiek-juridisch burgerschap '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'sociaal-maatschappeljke_dimensie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','7fdc100e-6f72-47f4-88f4-c470f8c83858'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7fdc100e-6f72-47f4-88f4-c470f8c83858'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Sociaal-maatschappelijk burgerschap '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'dimensie_vitaal_burgerschap' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','121f6889-f69e-4db4-82ee-e9e18a590b9a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'121f6889-f69e-4db4-82ee-e9e18a590b9a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Vitaal burgerschap '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'capaciteiten_en_motieven_reflectie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','c668c811-c035-475f-ba7a-cc01d95b734a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c668c811-c035-475f-ba7a-cc01d95b734a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Capaciteiten- en motievenreflectie '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'loopbaansturing' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','b9de8965-bfcc-4a00-be07-b4ef2deffe53'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b9de8965-bfcc-4a00-be07-b4ef2deffe53'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Loopbaansturing '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'netwerken' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','d470fe4a-85da-4138-8c15-44b4fa7c8417'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d470fe4a-85da-4138-8c15-44b4fa7c8417'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Netwerken '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'werkexploratie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','c0d3b28a-e78c-4f28-8523-9beabe64eed6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c0d3b28a-e78c-4f28-8523-9beabe64eed6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Werkexploratie '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'bedrijfscultuur_en_arbeidsverhoudingen' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','06947347-f9c0-4ca3-9a47-a9f56edce14c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'06947347-f9c0-4ca3-9a47-a9f56edce14c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Bedrijfscultuur en arbeidsverhoudingen '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'budgettering' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','afd30ae8-7f63-47d2-9933-7ab124caa84b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'afd30ae8-7f63-47d2-9933-7ab124caa84b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Budgettering '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'subculturen' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','d2ba6f4c-b617-4140-b493-d1957ddecf52'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d2ba6f4c-b617-4140-b493-d1957ddecf52'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Culturen en subculturen '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'doel_en_invloed_netwerken' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','b7d4916f-e57b-4fbc-8d93-e885597a2a88'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b7d4916f-e57b-4fbc-8d93-e885597a2a88'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Doel en invloed netwerken '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'duurzame_consumptie_en_productie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','0ae8825b-4f73-4100-bdaa-880ad049e3f9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'0ae8825b-4f73-4100-bdaa-880ad049e3f9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Duurzame consumptie en productie   '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'ethisch_en_integer_handelen' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','978b380b-ac13-45a6-a07f-edca0bb5df9f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'978b380b-ac13-45a6-a07f-edca0bb5df9f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Ethisch en integer handelen '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'gezonde_leefwijze' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','ab8a289f-b480-4e2b-8549-cf0945fc06b6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ab8a289f-b480-4e2b-8549-cf0945fc06b6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Gezonde leefwijze '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'grondrechten_en_plichten' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','c324ebb0-f0ba-4527-a3ae-5c1150b68c8e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c324ebb0-f0ba-4527-a3ae-5c1150b68c8e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Grondrechten en plichten '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'maatschappelijke_functies_van_arbeid' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','730826ef-a81b-423a-a65f-049a3be9fd0f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'730826ef-a81b-423a-a65f-049a3be9fd0f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Maatschappelijke functies van arbeid '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'parlementaire_democratie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','513fcfba-16aa-4b1e-b26f-f78e7f03b7d9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'513fcfba-16aa-4b1e-b26f-f78e7f03b7d9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Parlementaire democratie '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'politieke_besluitvorming' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','a646a706-bbda-484d-b667-8cdaed700820'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a646a706-bbda-484d-b667-8cdaed700820'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Politieke besluitvorming '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'politieke_stromingen' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','30c0d713-a013-4c25-8639-e895fc3dca5b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'30c0d713-a013-4c25-8639-e895fc3dca5b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Politieke stromingen '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'rechtsstaat_en_rechtssysteem' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','9c6447e1-92e2-4c8f-97de-2c8e7243adb2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9c6447e1-92e2-4c8f-97de-2c8e7243adb2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rechtsstaat en rechtssysteem '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'rol_en_invloed_branche_en_vakorganisaties' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','65406126-c4d5-4382-875f-96a025fe73fc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'65406126-c4d5-4382-875f-96a025fe73fc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rol en invloed branche- en vakorganisaties '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'rol_en_invloed_consumentenorganisaties' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','819ca924-94a5-465a-907f-18e2545bd2a7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'819ca924-94a5-465a-907f-18e2545bd2a7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rol en invloed consumentenorganisaties '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'rol_en_invloed_massamedia_op_de_politiek' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','cac360bc-2b08-4012-95af-43d8308632bd'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'cac360bc-2b08-4012-95af-43d8308632bd'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rol en invloed massamedia op politiek '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'invloed_media_op_bestedingspatroon' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','1f7281e8-22a7-4492-8737-1104ff277e36'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1f7281e8-22a7-4492-8737-1104ff277e36'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rol en invloed media op bestedingspatroon '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'rol_Europese_Unie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','dc27018f-a608-47cf-8dcc-b4e5b964d450'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dc27018f-a608-47cf-8dcc-b4e5b964d450'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rol Europese Unie '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'rol_overheid_op_de_politiek' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','198a1deb-9bc4-450f-bd2a-379201bee50c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'198a1deb-9bc4-450f-bd2a-379201bee50c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rol overheid op de politiek '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="$nodeValue = 'rol_overheid_op_het_gebied_van_de_economie' and not(key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301','19d5e9b0-66dd-4172-bb4c-4d8bbf3299f6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'19d5e9b0-66dd-4172-bb4c-4d8bbf3299f6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>nl</xsl:text>
</xsl:attribute>
<xsl:value-of select="'Rol overheid op het gebied van de economie '"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="vdex_classification_discipline_domains_lb_20110301_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdvdex_classification_discipline_domains_lb_20110301',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '30d045c8-e34d-4da3-a412-2fb7f391b409' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','economische_dimensie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'dc503302-39cc-42e7-9639-4d2268c90ddb' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','politiek-juridische_dimensie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7fdc100e-6f72-47f4-88f4-c470f8c83858' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','sociaal-maatschappeljke_dimensie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '121f6889-f69e-4db4-82ee-e9e18a590b9a' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','dimensie_vitaal_burgerschap') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c668c811-c035-475f-ba7a-cc01d95b734a' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','capaciteiten_en_motieven_reflectie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b9de8965-bfcc-4a00-be07-b4ef2deffe53' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','loopbaansturing') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd470fe4a-85da-4138-8c15-44b4fa7c8417' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','netwerken') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c0d3b28a-e78c-4f28-8523-9beabe64eed6' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','werkexploratie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '06947347-f9c0-4ca3-9a47-a9f56edce14c' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','bedrijfscultuur_en_arbeidsverhoudingen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'afd30ae8-7f63-47d2-9933-7ab124caa84b' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','budgettering') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd2ba6f4c-b617-4140-b493-d1957ddecf52' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','subculturen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b7d4916f-e57b-4fbc-8d93-e885597a2a88' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','doel_en_invloed_netwerken') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '0ae8825b-4f73-4100-bdaa-880ad049e3f9' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','duurzame_consumptie_en_productie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '978b380b-ac13-45a6-a07f-edca0bb5df9f' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','ethisch_en_integer_handelen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ab8a289f-b480-4e2b-8549-cf0945fc06b6' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','gezonde_leefwijze') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c324ebb0-f0ba-4527-a3ae-5c1150b68c8e' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','grondrechten_en_plichten') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '730826ef-a81b-423a-a65f-049a3be9fd0f' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','maatschappelijke_functies_van_arbeid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '513fcfba-16aa-4b1e-b26f-f78e7f03b7d9' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','parlementaire_democratie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a646a706-bbda-484d-b667-8cdaed700820' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','politieke_besluitvorming') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '30c0d713-a013-4c25-8639-e895fc3dca5b' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','politieke_stromingen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9c6447e1-92e2-4c8f-97de-2c8e7243adb2' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rechtsstaat_en_rechtssysteem') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '65406126-c4d5-4382-875f-96a025fe73fc' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_en_invloed_branche_en_vakorganisaties') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '819ca924-94a5-465a-907f-18e2545bd2a7' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_en_invloed_consumentenorganisaties') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'cac360bc-2b08-4012-95af-43d8308632bd' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_en_invloed_massamedia_op_de_politiek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1f7281e8-22a7-4492-8737-1104ff277e36' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','invloed_media_op_bestedingspatroon') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'dc27018f-a608-47cf-8dcc-b4e5b964d450' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_Europese_Unie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '198a1deb-9bc4-450f-bd2a-379201bee50c' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_overheid_op_de_politiek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '19d5e9b0-66dd-4172-bb4c-4d8bbf3299f6' and key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_overheid_op_het_gebied_van_de_economie') != ''"/>
<xsl:otherwise>
<xsl:text>unmatched</xsl:text>
</xsl:otherwise></xsl:choose>
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
<xsl:text>http://purl.edustandaard.nl/vdex_classification_discipline_domains_lb_20110301</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldvdex_classification_discipline_domains_lb_20110301"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldvdex_classification_discipline_domains_lb_20110301">
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = '30d045c8-e34d-4da3-a412-2fb7f391b409' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','economische_dimensie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'economische_dimensie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economisch burgerschap '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'dc503302-39cc-42e7-9639-4d2268c90ddb' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','politiek-juridische_dimensie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'politiek-juridische_dimensie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Politiek-juridisch burgerschap '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7fdc100e-6f72-47f4-88f4-c470f8c83858' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','sociaal-maatschappeljke_dimensie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'sociaal-maatschappeljke_dimensie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sociaal-maatschappelijk burgerschap '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '121f6889-f69e-4db4-82ee-e9e18a590b9a' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','dimensie_vitaal_burgerschap'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dimensie_vitaal_burgerschap'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Vitaal burgerschap '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c668c811-c035-475f-ba7a-cc01d95b734a' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','capaciteiten_en_motieven_reflectie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'capaciteiten_en_motieven_reflectie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Capaciteiten- en motievenreflectie '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b9de8965-bfcc-4a00-be07-b4ef2deffe53' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','loopbaansturing'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'loopbaansturing'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Loopbaansturing '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd470fe4a-85da-4138-8c15-44b4fa7c8417' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','netwerken'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'netwerken'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Netwerken '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c0d3b28a-e78c-4f28-8523-9beabe64eed6' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','werkexploratie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'werkexploratie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Werkexploratie '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '06947347-f9c0-4ca3-9a47-a9f56edce14c' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','bedrijfscultuur_en_arbeidsverhoudingen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bedrijfscultuur_en_arbeidsverhoudingen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bedrijfscultuur en arbeidsverhoudingen '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'afd30ae8-7f63-47d2-9933-7ab124caa84b' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','budgettering'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'budgettering'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Budgettering '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd2ba6f4c-b617-4140-b493-d1957ddecf52' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','subculturen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'subculturen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Culturen en subculturen '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b7d4916f-e57b-4fbc-8d93-e885597a2a88' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','doel_en_invloed_netwerken'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'doel_en_invloed_netwerken'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Doel en invloed netwerken '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '0ae8825b-4f73-4100-bdaa-880ad049e3f9' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','duurzame_consumptie_en_productie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'duurzame_consumptie_en_productie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duurzame consumptie en productie   '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '978b380b-ac13-45a6-a07f-edca0bb5df9f' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','ethisch_en_integer_handelen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ethisch_en_integer_handelen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ethisch en integer handelen '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ab8a289f-b480-4e2b-8549-cf0945fc06b6' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','gezonde_leefwijze'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'gezonde_leefwijze'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Gezonde leefwijze '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c324ebb0-f0ba-4527-a3ae-5c1150b68c8e' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','grondrechten_en_plichten'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'grondrechten_en_plichten'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Grondrechten en plichten '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '730826ef-a81b-423a-a65f-049a3be9fd0f' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','maatschappelijke_functies_van_arbeid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'maatschappelijke_functies_van_arbeid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappelijke functies van arbeid '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '513fcfba-16aa-4b1e-b26f-f78e7f03b7d9' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','parlementaire_democratie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'parlementaire_democratie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Parlementaire democratie '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a646a706-bbda-484d-b667-8cdaed700820' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','politieke_besluitvorming'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'politieke_besluitvorming'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Politieke besluitvorming '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '30c0d713-a013-4c25-8639-e895fc3dca5b' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','politieke_stromingen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'politieke_stromingen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Politieke stromingen '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9c6447e1-92e2-4c8f-97de-2c8e7243adb2' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rechtsstaat_en_rechtssysteem'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rechtsstaat_en_rechtssysteem'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rechtsstaat en rechtssysteem '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '65406126-c4d5-4382-875f-96a025fe73fc' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_en_invloed_branche_en_vakorganisaties'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rol_en_invloed_branche_en_vakorganisaties'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rol en invloed branche- en vakorganisaties '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '819ca924-94a5-465a-907f-18e2545bd2a7' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_en_invloed_consumentenorganisaties'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rol_en_invloed_consumentenorganisaties'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rol en invloed consumentenorganisaties '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'cac360bc-2b08-4012-95af-43d8308632bd' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_en_invloed_massamedia_op_de_politiek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rol_en_invloed_massamedia_op_de_politiek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rol en invloed massamedia op politiek '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1f7281e8-22a7-4492-8737-1104ff277e36' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','invloed_media_op_bestedingspatroon'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'invloed_media_op_bestedingspatroon'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rol en invloed media op bestedingspatroon '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'dc27018f-a608-47cf-8dcc-b4e5b964d450' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_Europese_Unie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rol_Europese_Unie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rol Europese Unie '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '198a1deb-9bc4-450f-bd2a-379201bee50c' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_overheid_op_de_politiek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rol_overheid_op_de_politiek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rol overheid op de politiek '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '19d5e9b0-66dd-4172-bb4c-4d8bbf3299f6' and not(key('classification-by-oldIdvdex_classification_discipline_domains_lb_20110301','rol_overheid_op_het_gebied_van_de_economie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rol_overheid_op_het_gebied_van_de_economie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rol overheid op het gebied van de economie '"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>

<xsl:template name="spaceDecoding">
<xsl:param name="inputValue"/>
<xsl:choose>
<xsl:when test="contains($inputValue, '%20')">
<xsl:variable name="newValue">
<xsl:value-of select="substring-before($inputValue, '%20')"/>
<xsl:text> </xsl:text>
<xsl:value-of select="substring-after($inputValue, '%20')"/>
</xsl:variable>

<xsl:choose>
<xsl:when test="contains($newValue, '%20')">
<xsl:call-template name="spaceDecoding">
<xsl:with-param name="inputValue" select="$newValue"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$newValue"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$inputValue"/>
</xsl:otherwise>
</xsl:choose>

</xsl:template>


</xsl:stylesheet>

