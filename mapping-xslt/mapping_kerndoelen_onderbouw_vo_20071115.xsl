<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" standalone="no"/>

    <xsl:key name="classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'educational objective']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
    <!-- Er wordt niet getest op purposetype 'competency' voor het SLO -->
    <xsl:key name="classification-by-oldIdvdex_classification_kerndoelen_onderbouw_vo_20071115" match="*[local-name() = 'classification']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_kerndoelen_onderbouw_vo_20071115')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>

<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_kerndoelen_onderbouw_vo_20071115_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_kerndoelen_onderbouw_vo_20071115',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '1' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','fe8cc1d3-38ad-4de9-a3f4-3d820285241a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','e0e5fddd-99e6-41f7-9556-127943919374') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','87dd91e0-446f-4a5a-870b-74e00dd3b438') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','65efb2f8-72b1-44c9-b4e2-eebc87534e92') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','460f9814-41e2-4b45-8c8d-32b71590ace8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','ca8436e3-c9d2-4650-abe1-4a4e410f17ce') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','2e5a3623-a7c4-4276-a293-7293dbfa9ea5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','27f784a1-b3fc-4811-a2cb-1f28d6b08e69') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','b6a9ddbb-ff6c-49dd-b9a7-8ab59c09176c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '10' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','767abc3a-a5b3-4cc9-ab87-c5404cf87e7e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '11' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','18bd6259-e20b-41da-97c2-09cb9a2f346d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','6437bb04-d8e4-42ca-9e7d-62dde3e5f8e6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '13' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','6a30268a-1139-4e85-9669-a17ccb6254e0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '14' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','beedaf27-e6ff-45c1-9a92-27a21ffb9a65') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','3d889c52-dc81-4122-b06a-89fd18c5a04e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '16' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','4583fece-09a8-4397-9f5a-fba24a04c346') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '17' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','dac6e07d-6e4e-4929-a2aa-a577ff8bd866') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '18' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','220d2156-e2c0-4957-85b3-e11544c64585') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '19' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','13d9f45f-1511-4b8b-99b9-9de67b2bad00') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '20' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','341478a8-f989-4dd1-9ac6-2d8dbd9ac5f8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '21' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','e68c363f-8caf-4e9f-b729-12cb0e0e7c46') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '22' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f82de175-d5d2-4fba-8a4e-bac6494f83ae') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '23' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','52552e12-a168-4431-8ef8-d90462c7ad25') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '24' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','61e826e8-519d-428a-9f82-90e791d474b7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '25' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','070cf703-9914-492d-8893-0a39ccec17db') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '26' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','cef093c3-1809-4f37-96ab-a986dce94599') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '27' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f23a0fc6-5b0a-4cea-a982-4562520eada3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '28' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','477f29ac-dfd9-4497-8456-95956422a44e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '29' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','fc3d9260-29f1-4c37-ae6f-82340c86aa02') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '30' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','78311c70-18be-4a17-aeec-16fbe3cb7566') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '31' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','d357271b-3cfd-40c4-881d-084b71ca05c8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '32deel1' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','faa2483a-4230-432a-ab81-67437ff58a99') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '32deel2' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','faa2483a-4230-432a-ab81-67437ff58a99') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '33' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','0d102eae-8853-43a3-8788-5e26d80564b7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '34' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','306aa6e6-aafd-42d1-85cf-43e967a11a7a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '35' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','3755689a-68eb-4ebc-8de8-e8f2c714300e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '36' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','d1442e43-ed68-4bfb-9987-343aab2cff4d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '37' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','4fd020d4-272c-46c8-a35a-ca2539d040a7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '38' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','27fefa0d-c620-436b-84cb-205af17325ec') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '39' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','6458ab99-7837-450f-8685-308b46997112') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '40' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','bf7f6585-907f-4df6-8345-83a229ff7b71') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '41' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','7f3b8b96-587d-48e3-98dd-3892032f1e66') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','4e29b8e5-0186-4cad-8750-d91e3d45808a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '43' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','cbc82fec-0045-4096-99e8-ae4b7fddf9b9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '44' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f63a2618-8cc9-4b37-88da-6446204ce67a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '45' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f58aa6e2-cf4b-47d3-b226-113e54e440db') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '46' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','935d1aa8-d00a-4495-bea2-c39f6212bf75') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '47' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','b8552f53-4a3e-414a-ae6a-3b891c972a97') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '48' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','7da3a86c-29b8-4c65-8a6c-894b2e65c5fc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '49' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','61bc5488-34f9-4271-86f3-dca2cba615a3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '50' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','563df93f-8f84-4c9a-a10b-8fdbf0773790') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '51' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','26f2e674-ca2e-489d-b5ee-18b3a9b17065') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '52' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','7043ce15-61fd-473a-9d76-9cf3aa8fb284') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '53' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','9d0ed5bd-c111-4d8a-8386-317d5dc2ac5e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '54' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','34ec276c-7e3f-4f05-b4e3-3159f931244a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '55' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','07861cce-c1cc-4efb-af46-c36a76062ceb') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '56' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','71a175d5-24a5-4b48-9244-4a8afed1221e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '57' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','74b6ba50-c633-48ff-8494-de317a4e18eb') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '58' and key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','05abd22d-1e69-4aa1-9d56-f78e63d6e0af') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != '1' and descendant::*[local-name() = 'id'] != '2' and descendant::*[local-name() = 'id'] != '3' and descendant::*[local-name() = 'id'] != '4' and descendant::*[local-name() = 'id'] != '5' and descendant::*[local-name() = 'id'] != '6' and descendant::*[local-name() = 'id'] != '7' and descendant::*[local-name() = 'id'] != '8' and descendant::*[local-name() = 'id'] != '9' and descendant::*[local-name() = 'id'] != '10' and descendant::*[local-name() = 'id'] != '11' and descendant::*[local-name() = 'id'] != '12' and descendant::*[local-name() = 'id'] != '13' and descendant::*[local-name() = 'id'] != '14' and descendant::*[local-name() = 'id'] != '15' and descendant::*[local-name() = 'id'] != '16' and descendant::*[local-name() = 'id'] != '17' and descendant::*[local-name() = 'id'] != '18' and descendant::*[local-name() = 'id'] != '19' and descendant::*[local-name() = 'id'] != '20' and descendant::*[local-name() = 'id'] != '21' and descendant::*[local-name() = 'id'] != '22' and descendant::*[local-name() = 'id'] != '23' and descendant::*[local-name() = 'id'] != '24' and descendant::*[local-name() = 'id'] != '25' and descendant::*[local-name() = 'id'] != '26' and descendant::*[local-name() = 'id'] != '27' and descendant::*[local-name() = 'id'] != '28' and descendant::*[local-name() = 'id'] != '29' and descendant::*[local-name() = 'id'] != '30' and descendant::*[local-name() = 'id'] != '31' and descendant::*[local-name() = 'id'] != '32deel1' and descendant::*[local-name() = 'id'] != '32deel2' and descendant::*[local-name() = 'id'] != '33' and descendant::*[local-name() = 'id'] != '34' and descendant::*[local-name() = 'id'] != '35' and descendant::*[local-name() = 'id'] != '36' and descendant::*[local-name() = 'id'] != '37' and descendant::*[local-name() = 'id'] != '38' and descendant::*[local-name() = 'id'] != '39' and descendant::*[local-name() = 'id'] != '40' and descendant::*[local-name() = 'id'] != '41' and descendant::*[local-name() = 'id'] != '42' and descendant::*[local-name() = 'id'] != '43' and descendant::*[local-name() = 'id'] != '44' and descendant::*[local-name() = 'id'] != '45' and descendant::*[local-name() = 'id'] != '46' and descendant::*[local-name() = 'id'] != '47' and descendant::*[local-name() = 'id'] != '48' and descendant::*[local-name() = 'id'] != '49' and descendant::*[local-name() = 'id'] != '50' and descendant::*[local-name() = 'id'] != '51' and descendant::*[local-name() = 'id'] != '52' and descendant::*[local-name() = 'id'] != '53' and descendant::*[local-name() = 'id'] != '54' and descendant::*[local-name() = 'id'] != '55' and descendant::*[local-name() = 'id'] != '56' and descendant::*[local-name() = 'id'] != '57' and descendant::*[local-name() = 'id'] != '58'"/>
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
<xsl:text>educational objective</xsl:text>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_kerndoelen_onderbouw_vo_20071115"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_kerndoelen_onderbouw_vo_20071115">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
    <xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_kerndoelen_onderbouw_vo_20071115')]">
<xsl:choose>
<xsl:when test="node() = '1' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','fe8cc1d3-38ad-4de9-a3f4-3d820285241a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fe8cc1d3-38ad-4de9-a3f4-3d820285241a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 1: Spreken en schrijven'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','e0e5fddd-99e6-41f7-9556-127943919374'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e0e5fddd-99e6-41f7-9556-127943919374'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 2: Correct taalgebruik'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','87dd91e0-446f-4a5a-870b-74e00dd3b438'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'87dd91e0-446f-4a5a-870b-74e00dd3b438'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 3: Woordverwerving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','65efb2f8-72b1-44c9-b4e2-eebc87534e92'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'65efb2f8-72b1-44c9-b4e2-eebc87534e92'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 4: Lezen en luisteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','460f9814-41e2-4b45-8c8d-32b71590ace8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'460f9814-41e2-4b45-8c8d-32b71590ace8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 5: Omgaan met informatiebronnen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','ca8436e3-c9d2-4650-abe1-4a4e410f17ce'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ca8436e3-c9d2-4650-abe1-4a4e410f17ce'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 6: Overleg, planning, discussie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','2e5a3623-a7c4-4276-a293-7293dbfa9ea5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2e5a3623-a7c4-4276-a293-7293dbfa9ea5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 7: Presenteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','27f784a1-b3fc-4811-a2cb-1f28d6b08e69'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'27f784a1-b3fc-4811-a2cb-1f28d6b08e69'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 8: Fictie en non-fictie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','b6a9ddbb-ff6c-49dd-b9a7-8ab59c09176c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b6a9ddbb-ff6c-49dd-b9a7-8ab59c09176c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 9: Planmatig werken met taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '10' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','767abc3a-a5b3-4cc9-ab87-c5404cf87e7e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'767abc3a-a5b3-4cc9-ab87-c5404cf87e7e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 10: Reflectie op eigen taalgebruik'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '11' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','18bd6259-e20b-41da-97c2-09cb9a2f346d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'18bd6259-e20b-41da-97c2-09cb9a2f346d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 11: Luistervaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','6437bb04-d8e4-42ca-9e7d-62dde3e5f8e6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6437bb04-d8e4-42ca-9e7d-62dde3e5f8e6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 12: Woordverwerving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '13' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','6a30268a-1139-4e85-9669-a17ccb6254e0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6a30268a-1139-4e85-9669-a17ccb6254e0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 13: Lezen en luisteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '14' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','beedaf27-e6ff-45c1-9a92-27a21ffb9a65'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'beedaf27-e6ff-45c1-9a92-27a21ffb9a65'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 14: Omgaan met informatiebronnen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','3d889c52-dc81-4122-b06a-89fd18c5a04e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3d889c52-dc81-4122-b06a-89fd18c5a04e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 15: Informele gesprekken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '16' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','4583fece-09a8-4397-9f5a-fba24a04c346'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4583fece-09a8-4397-9f5a-fba24a04c346'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 16: Standaardgesprekken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '17' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','dac6e07d-6e4e-4929-a2aa-a577ff8bd866'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dac6e07d-6e4e-4929-a2aa-a577ff8bd866'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 17: Contact via internet'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '18' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','220d2156-e2c0-4957-85b3-e11544c64585'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'220d2156-e2c0-4957-85b3-e11544c64585'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 18: Engels als wereldtaal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '19' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','13d9f45f-1511-4b8b-99b9-9de67b2bad00'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'13d9f45f-1511-4b8b-99b9-9de67b2bad00'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 19: Wiskundetaal ontwikkelen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '20' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','341478a8-f989-4dd1-9ac6-2d8dbd9ac5f8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'341478a8-f989-4dd1-9ac6-2d8dbd9ac5f8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 20: Wiskunde gebruiken in praktische situaties'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '21' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','e68c363f-8caf-4e9f-b729-12cb0e0e7c46'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e68c363f-8caf-4e9f-b729-12cb0e0e7c46'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 21: Wiskundig redeneren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '22' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f82de175-d5d2-4fba-8a4e-bac6494f83ae'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f82de175-d5d2-4fba-8a4e-bac6494f83ae'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 22: Rekenstructuren doorzien en rekenbegrippen gebruiken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '23' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','52552e12-a168-4431-8ef8-d90462c7ad25'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'52552e12-a168-4431-8ef8-d90462c7ad25'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 23: Exact en schattend rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '24' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','61e826e8-519d-428a-9f82-90e791d474b7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'61e826e8-519d-428a-9f82-90e791d474b7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 24: Meten en metriek stelsel'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '25' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','070cf703-9914-492d-8893-0a39ccec17db'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'070cf703-9914-492d-8893-0a39ccec17db'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 25: Verbanden visualiseren en formaliseren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '26' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','cef093c3-1809-4f37-96ab-a986dce94599'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'cef093c3-1809-4f37-96ab-a986dce94599'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 26: Werken met en redeneren over vormen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '27' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f23a0fc6-5b0a-4cea-a982-4562520eada3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f23a0fc6-5b0a-4cea-a982-4562520eada3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 27: Ordenen van gegevens'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '28' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','477f29ac-dfd9-4497-8456-95956422a44e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'477f29ac-dfd9-4497-8456-95956422a44e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 28: Onderzoek leren doen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '29' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','fc3d9260-29f1-4c37-ae6f-82340c86aa02'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fc3d9260-29f1-4c37-ae6f-82340c86aa02'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 29: Sleutelbegrippen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '30' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','78311c70-18be-4a17-aeec-16fbe3cb7566'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'78311c70-18be-4a17-aeec-16fbe3cb7566'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 30: Het milieu'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '31' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','d357271b-3cfd-40c4-881d-084b71ca05c8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d357271b-3cfd-40c4-881d-084b71ca05c8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 31: Processen in de natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '32deel1' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','faa2483a-4230-432a-ab81-67437ff58a99'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'faa2483a-4230-432a-ab81-67437ff58a99'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 32: Theorieën in de natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '32deel2' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','faa2483a-4230-432a-ab81-67437ff58a99'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'faa2483a-4230-432a-ab81-67437ff58a99'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 32: Theorieën in de natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '33' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','0d102eae-8853-43a3-8788-5e26d80564b7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'0d102eae-8853-43a3-8788-5e26d80564b7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 33: Techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '34' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','306aa6e6-aafd-42d1-85cf-43e967a11a7a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'306aa6e6-aafd-42d1-85cf-43e967a11a7a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 34: Lichaam en gezondheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '35' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','3755689a-68eb-4ebc-8de8-e8f2c714300e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3755689a-68eb-4ebc-8de8-e8f2c714300e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 35: Zorg en veiligheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '36' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','d1442e43-ed68-4bfb-9987-343aab2cff4d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d1442e43-ed68-4bfb-9987-343aab2cff4d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 36: Meningvorming'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '37' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','4fd020d4-272c-46c8-a35a-ca2539d040a7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4fd020d4-272c-46c8-a35a-ca2539d040a7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 37: Historische basiskennis'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '38' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','27fefa0d-c620-436b-84cb-205af17325ec'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'27fefa0d-c620-436b-84cb-205af17325ec'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 38: Geografische basiskennis'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '39' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','6458ab99-7837-450f-8685-308b46997112'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6458ab99-7837-450f-8685-308b46997112'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 39: Onderzoek leren doen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '40' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','bf7f6585-907f-4df6-8345-83a229ff7b71'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bf7f6585-907f-4df6-8345-83a229ff7b71'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 40: Omgaan met historische bronnen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '41' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','7f3b8b96-587d-48e3-98dd-3892032f1e66'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7f3b8b96-587d-48e3-98dd-3892032f1e66'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 41: Omgaan met atlas en kaarten'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','4e29b8e5-0186-4cad-8750-d91e3d45808a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4e29b8e5-0186-4cad-8750-d91e3d45808a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 42: Inzicht in de eigen omgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '43' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','cbc82fec-0045-4096-99e8-ae4b7fddf9b9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'cbc82fec-0045-4096-99e8-ae4b7fddf9b9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 43: Cultuurverschillen in Nederland'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '44' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f63a2618-8cc9-4b37-88da-6446204ce67a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f63a2618-8cc9-4b37-88da-6446204ce67a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 44: De politiek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '45' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','f58aa6e2-cf4b-47d3-b226-113e54e440db'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f58aa6e2-cf4b-47d3-b226-113e54e440db'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 45: Europese samenwerking'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '46' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','935d1aa8-d00a-4495-bea2-c39f6212bf75'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'935d1aa8-d00a-4495-bea2-c39f6212bf75'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 46: Arm en rijk'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '47' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','b8552f53-4a3e-414a-ae6a-3b891c972a97'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b8552f53-4a3e-414a-ae6a-3b891c972a97'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 47: Oorlog, vrede en mensenrechten'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '48' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','7da3a86c-29b8-4c65-8a6c-894b2e65c5fc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7da3a86c-29b8-4c65-8a6c-894b2e65c5fc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 48: Produceren van kunst'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '49' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','61bc5488-34f9-4271-86f3-dca2cba615a3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'61bc5488-34f9-4271-86f3-dca2cba615a3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 49: Eigen kunstzinnig werk presenteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '50' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','563df93f-8f84-4c9a-a10b-8fdbf0773790'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'563df93f-8f84-4c9a-a10b-8fdbf0773790'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 50: Leren kijken en luisteren naar kunst'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '51' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','26f2e674-ca2e-489d-b5ee-18b3a9b17065'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'26f2e674-ca2e-489d-b5ee-18b3a9b17065'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 51: Verslag doen van ervaringen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '52' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','7043ce15-61fd-473a-9d76-9cf3aa8fb284'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7043ce15-61fd-473a-9d76-9cf3aa8fb284'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 52: Reflecteren op kunstzinnig werk'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '53' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','9d0ed5bd-c111-4d8a-8386-317d5dc2ac5e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9d0ed5bd-c111-4d8a-8386-317d5dc2ac5e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 53: Bewegen beleven / Oriënteren op bewegingsactiviteiten'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '54' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','34ec276c-7e3f-4f05-b4e3-3159f931244a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'34ec276c-7e3f-4f05-b4e3-3159f931244a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 54: Bewegen verbeteren / Uitbreiding van bewegingsrepertoire'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '55' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','07861cce-c1cc-4efb-af46-c36a76062ceb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'07861cce-c1cc-4efb-af46-c36a76062ceb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 55: Bewegen verbeteren / Toepassen van bewegingsprincipes'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '56' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','71a175d5-24a5-4b48-9244-4a8afed1221e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'71a175d5-24a5-4b48-9244-4a8afed1221e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 56: Bewegen beleven / Omgaan met andereren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '57' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','74b6ba50-c633-48ff-8494-de317a4e18eb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'74b6ba50-c633-48ff-8494-de317a4e18eb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 57: Bewegen regelen / Regelen en organiseren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '58' and not(key('classification-by-newIdvdex_classification_kerndoelen_onderbouw_vo_20071115','05abd22d-1e69-4aa1-9d56-f78e63d6e0af'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'05abd22d-1e69-4aa1-9d56-f78e63d6e0af'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VO Kerndoel 58: Gezond bewegen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


</xsl:stylesheet>
