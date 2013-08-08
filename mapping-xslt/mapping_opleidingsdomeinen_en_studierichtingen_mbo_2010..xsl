<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','17b41166-ab49-4a56-bcf1-32317da752ef') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','652bc6a3-d024-493f-9199-a08340cbb2b3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8154d1f0-9b05-4649-b5b8-1da16cdb0185') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3ed67cca-37f6-4d7b-b1eb-872f6671caf7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','31926035-10da-4f58-bf5b-6ba6a8084f90') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8bfd94a6-23ab-4d61-b816-90c67e0ba084') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','784bb003-e72d-4ce1-ad4f-4d7313fc80c6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6276c656-2285-47ca-a7d0-7c833a0ce882') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','c6c55e80-9fae-440b-b50a-4a1f70432734') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','693f235a-511f-4f59-9633-6b1abd0e3b6f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2534e3c9-67b8-472b-b7ed-5cc595839ec6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2bc0df5e-8a3e-4327-993d-7e7d785866b7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bc899047-ae76-4414-a6df-e25c743def3f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3.5' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','ee14b214-78a5-4436-ac08-acda03de24af') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','b658110d-0115-4059-9889-cc7cc6369cc7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e813cc0e-3f90-4097-880f-2a79c6bf67b2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4af508b6-da26-4895-a238-ad8f9775bd00') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','59362601-8e47-406c-9d76-b5c380440f9b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2c366888-5642-4262-922d-f84908767235') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3e4c4a78-565c-4e1a-8553-4267ef05b40c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','20c064ec-c7b1-474c-a973-af4ded2f991c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9bba22a0-8bee-4f76-9b79-621f056d69b9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','25f996b2-5ebf-4b52-be39-86406f237690') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','fd8df586-d10e-4cd2-8ef7-c0c93f0bc5cd') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d6d6003d-1420-4fc4-9172-775aa7b3601f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d25ad680-54d4-4721-98b5-8c59e45bd039') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e526d561-44a7-4127-9678-458e7b3ba973') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d761bbea-3e5c-4887-89e6-f1129b9c77de') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bd31cb34-9b8d-42dc-abbe-40d34417e1a3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','ab706abb-1f4a-4860-93c1-1d5ef63ea3b5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9ca10565-ec88-44b7-abc2-582dfdea5abc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','69f48643-6340-445e-92a6-8bdd1637af36') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bc763868-161e-4aec-9fe6-0493348f7c2d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2e21886c-d285-4017-929a-1a69c8d3ced8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','77218c97-9714-452b-ba6c-3943d8a87dac') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3912477b-4bd1-40ca-aeba-eb7a748728b8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','076b2d41-8a82-4144-83ef-c60608b46469') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','97537f98-2e78-4881-bfe1-c4c74de19837') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','80de344b-6c8d-4594-8413-ee33f9a2bc4b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e543db45-b4e1-46c5-b13b-ee269f5d0edd') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '10' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8ce88270-8fc1-41fa-97c0-6a59b66218f7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '10.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','df874fdf-deb6-4b84-b0b1-7ab162fbe789') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '10.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','f593fa33-b229-4557-ad67-352d75bae2a8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '10.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3d904049-0624-4aae-a924-e478fcb7c0aa') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '11' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8aa21fc6-4da8-4bdf-9de2-d9e5e707d003') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '11.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','c4ee4d2d-2d48-42a9-a728-9e3d551d8266') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '11.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','244d522c-fc3b-4d37-8826-ff82eb9cbe07') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '11.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7b3bbad5-34b2-4b5d-9c83-e3b64a3efed0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4c5ca35d-a5b7-4408-af1f-9bbbcf96caa6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2cc6b924-b9c6-413c-95c2-43fadf093778') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','a2466ca1-0e2f-47fd-b388-d087994e7c91') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d3233c10-603c-423e-9339-6144418ba359') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '13' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bac03586-16fe-4384-98f5-8e0d6845ec72') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '13.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','567381e5-881f-49c6-b616-64410e797327') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '13.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','0c9a006f-3acf-43d2-87e4-e931c47b552f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '13.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','fcd28540-37d2-4beb-b76f-8abef5bbb484') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '14' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6bd98aec-fc1a-4732-b1a8-a6e526f153a9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '14.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2bf9d82c-1b6a-49fc-9138-f9f46b2ced9a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '14.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','08018424-b218-4de6-b174-df6982e7a72d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','750580b3-11c3-46a8-9bc2-dd5a6e7612b6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','b333369b-e647-4bbf-b04c-d11a9235a113') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e65c1e81-e93f-4fdb-adb8-d50676d00025') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','be7be841-a81f-4277-9b50-65102179b285') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','cf0afed9-d6e2-4b9d-9360-68724f33625e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15.5' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9a03cb44-b6e4-43dd-b322-acf0a3557b09') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '16' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5e86dc82-1981-48df-bbe5-abd4a9b3767b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '16.1' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1f5fcc77-6cd9-41cc-81e1-291b9a368378') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '16.2' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9a95a2cc-5fda-4bb1-8dbc-fb7ba21a65b3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '16.3' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','80a98b2a-5d16-4b2f-8246-f68f23c1d151') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '16.4' and key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','07af53ba-bb6e-4fae-a82d-34a489cffe01') != ''"/>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010')]">
<xsl:choose>
<xsl:when test="node() = '1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','17b41166-ab49-4a56-bcf1-32317da752ef'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'17b41166-ab49-4a56-bcf1-32317da752ef'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouw en infra'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','652bc6a3-d024-493f-9199-a08340cbb2b3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'652bc6a3-d024-493f-9199-a08340cbb2b3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8154d1f0-9b05-4649-b5b8-1da16cdb0185'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8154d1f0-9b05-4649-b5b8-1da16cdb0185'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Infrastructuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3ed67cca-37f6-4d7b-b1eb-872f6671caf7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3ed67cca-37f6-4d7b-b1eb-872f6671caf7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Afbouw, hout en onderhoud'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','31926035-10da-4f58-bf5b-6ba6a8084f90'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'31926035-10da-4f58-bf5b-6ba6a8084f90'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Hout en meubel'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8bfd94a6-23ab-4d61-b816-90c67e0ba084'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8bfd94a6-23ab-4d61-b816-90c67e0ba084'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Stukadoren en afbouw'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','784bb003-e72d-4ce1-ad4f-4d7313fc80c6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'784bb003-e72d-4ce1-ad4f-4d7313fc80c6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schilderen en onderhoud'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6276c656-2285-47ca-a7d0-7c833a0ce882'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6276c656-2285-47ca-a7d0-7c833a0ce882'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schoonmaak en glazenwassen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','c6c55e80-9fae-440b-b50a-4a1f70432734'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c6c55e80-9fae-440b-b50a-4a1f70432734'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek en procesindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','693f235a-511f-4f59-9633-6b1abd0e3b6f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'693f235a-511f-4f59-9633-6b1abd0e3b6f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Werktuigbouwkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2534e3c9-67b8-472b-b7ed-5cc595839ec6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2534e3c9-67b8-472b-b7ed-5cc595839ec6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Elektrotechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2bc0df5e-8a3e-4327-993d-7e7d785866b7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2bc0df5e-8a3e-4327-993d-7e7d785866b7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Installatietechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bc899047-ae76-4414-a6df-e25c743def3f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bc899047-ae76-4414-a6df-e25c743def3f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Procesindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3.5' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','ee14b214-78a5-4436-ac08-acda03de24af'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ee14b214-78a5-4436-ac08-acda03de24af'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Vliegtuigbouwkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','b658110d-0115-4059-9889-cc7cc6369cc7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b658110d-0115-4059-9889-cc7cc6369cc7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ambacht, laboratorium en gezondheidstechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e813cc0e-3f90-4097-880f-2a79c6bf67b2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e813cc0e-3f90-4097-880f-2a79c6bf67b2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ambachtelijke techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4af508b6-da26-4895-a238-ad8f9775bd00'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4af508b6-da26-4895-a238-ad8f9775bd00'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Gezondheidstechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','59362601-8e47-406c-9d76-b5c380440f9b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'59362601-8e47-406c-9d76-b5c380440f9b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Laboratoriumtechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2c366888-5642-4262-922d-f84908767235'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2c366888-5642-4262-922d-f84908767235'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Media en vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3e4c4a78-565c-4e1a-8553-4267ef05b40c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3e4c4a78-565c-4e1a-8553-4267ef05b40c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mediatechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','20c064ec-c7b1-474c-a973-af4ded2f991c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'20c064ec-c7b1-474c-a973-af4ded2f991c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mediavormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9bba22a0-8bee-4f76-9b79-621f056d69b9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9bba22a0-8bee-4f76-9b79-621f056d69b9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Evenemententechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','25f996b2-5ebf-4b52-be39-86406f237690'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'25f996b2-5ebf-4b52-be39-86406f237690'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ruimtelijke vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','fd8df586-d10e-4cd2-8ef7-c0c93f0bc5cd'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fd8df586-d10e-4cd2-8ef7-c0c93f0bc5cd'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Informatie en communicatietechnologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d6d6003d-1420-4fc4-9172-775aa7b3601f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d6d6003d-1420-4fc4-9172-775aa7b3601f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'ICT en media'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d25ad680-54d4-4721-98b5-8c59e45bd039'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d25ad680-54d4-4721-98b5-8c59e45bd039'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kantoorautomatisering'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e526d561-44a7-4127-9678-458e7b3ba973'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e526d561-44a7-4127-9678-458e7b3ba973'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Digitaal onderzoek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d761bbea-3e5c-4887-89e6-f1129b9c77de'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d761bbea-3e5c-4887-89e6-f1129b9c77de'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mobiliteit en voertuigen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bd31cb34-9b8d-42dc-abbe-40d34417e1a3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bd31cb34-9b8d-42dc-abbe-40d34417e1a3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mobiliteitstechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','ab706abb-1f4a-4860-93c1-1d5ef63ea3b5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ab706abb-1f4a-4860-93c1-1d5ef63ea3b5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Carrosserietechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9ca10565-ec88-44b7-abc2-582dfdea5abc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9ca10565-ec88-44b7-abc2-582dfdea5abc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Transport, scheepvaart en logistiek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','69f48643-6340-445e-92a6-8bdd1637af36'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'69f48643-6340-445e-92a6-8bdd1637af36'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Scheepvaart'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bc763868-161e-4aec-9fe6-0493348f7c2d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bc763868-161e-4aec-9fe6-0493348f7c2d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Luchtvaart'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2e21886c-d285-4017-929a-1a69c8d3ced8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2e21886c-d285-4017-929a-1a69c8d3ced8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wegtransport'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','77218c97-9714-452b-ba6c-3943d8a87dac'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'77218c97-9714-452b-ba6c-3943d8a87dac'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Logistiek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3912477b-4bd1-40ca-aeba-eb7a748728b8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3912477b-4bd1-40ca-aeba-eb7a748728b8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handel en ondernemerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','076b2d41-8a82-4144-83ef-c60608b46469'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'076b2d41-8a82-4144-83ef-c60608b46469'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Detailhandel en groothandel'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','97537f98-2e78-4881-bfe1-c4c74de19837'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'97537f98-2e78-4881-bfe1-c4c74de19837'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Management en ondernemerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','80de344b-6c8d-4594-8413-ee33f9a2bc4b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'80de344b-6c8d-4594-8413-ee33f9a2bc4b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mode en interieurindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e543db45-b4e1-46c5-b13b-ee269f5d0edd'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e543db45-b4e1-46c5-b13b-ee269f5d0edd'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tapijt en textielindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '10' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8ce88270-8fc1-41fa-97c0-6a59b66218f7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8ce88270-8fc1-41fa-97c0-6a59b66218f7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economie en administratie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '10.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','df874fdf-deb6-4b84-b0b1-7ab162fbe789'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'df874fdf-deb6-4b84-b0b1-7ab162fbe789'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Administratieve dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '10.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','f593fa33-b229-4557-ad67-352d75bae2a8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f593fa33-b229-4557-ad67-352d75bae2a8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Zakelijke dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '10.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3d904049-0624-4aae-a924-e478fcb7c0aa'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3d904049-0624-4aae-a924-e478fcb7c0aa'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Commerciele dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '11' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8aa21fc6-4da8-4bdf-9de2-d9e5e707d003'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8aa21fc6-4da8-4bdf-9de2-d9e5e707d003'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Veiligheid en sport'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '11.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','c4ee4d2d-2d48-42a9-a728-9e3d551d8266'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c4ee4d2d-2d48-42a9-a728-9e3d551d8266'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Defensie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '11.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','244d522c-fc3b-4d37-8826-ff82eb9cbe07'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'244d522c-fc3b-4d37-8826-ff82eb9cbe07'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Publieke veiligheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '11.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7b3bbad5-34b2-4b5d-9c83-e3b64a3efed0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7b3bbad5-34b2-4b5d-9c83-e3b64a3efed0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sport en bewegen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4c5ca35d-a5b7-4408-af1f-9bbbcf96caa6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4c5ca35d-a5b7-4408-af1f-9bbbcf96caa6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Uiterlijke verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2cc6b924-b9c6-413c-95c2-43fadf093778'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2cc6b924-b9c6-413c-95c2-43fadf093778'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kappers'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','a2466ca1-0e2f-47fd-b388-d087994e7c91'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a2466ca1-0e2f-47fd-b388-d087994e7c91'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schoonheidsverzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','d3233c10-603c-423e-9339-6144418ba359'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d3233c10-603c-423e-9339-6144418ba359'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voetverzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '13' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','bac03586-16fe-4384-98f5-8e0d6845ec72'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bac03586-16fe-4384-98f5-8e0d6845ec72'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Horeca en bakkerij'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '13.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','567381e5-881f-49c6-b616-64410e797327'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'567381e5-881f-49c6-b616-64410e797327'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Horeca'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '13.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','0c9a006f-3acf-43d2-87e4-e931c47b552f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'0c9a006f-3acf-43d2-87e4-e931c47b552f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Brood en banket'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '13.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','fcd28540-37d2-4beb-b76f-8abef5bbb484'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fcd28540-37d2-4beb-b76f-8abef5bbb484'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Facilitaire dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '14' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6bd98aec-fc1a-4732-b1a8-a6e526f153a9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6bd98aec-fc1a-4732-b1a8-a6e526f153a9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Toerisme en recreatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '14.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2bf9d82c-1b6a-49fc-9138-f9f46b2ced9a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2bf9d82c-1b6a-49fc-9138-f9f46b2ced9a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Toerisme'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '14.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','08018424-b218-4de6-b174-df6982e7a72d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'08018424-b218-4de6-b174-df6982e7a72d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Recreatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','750580b3-11c3-46a8-9bc2-dd5a6e7612b6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'750580b3-11c3-46a8-9bc2-dd5a6e7612b6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Zorg en welzijn'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','b333369b-e647-4bbf-b04c-d11a9235a113'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b333369b-e647-4bbf-b04c-d11a9235a113'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verpleging en verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','e65c1e81-e93f-4fdb-adb8-d50676d00025'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e65c1e81-e93f-4fdb-adb8-d50676d00025'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Gezondheidsondersteuning'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','be7be841-a81f-4277-9b50-65102179b285'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'be7be841-a81f-4277-9b50-65102179b285'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappelijke zorg'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','cf0afed9-d6e2-4b9d-9360-68724f33625e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'cf0afed9-d6e2-4b9d-9360-68724f33625e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Pedagogisch werk'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15.5' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9a03cb44-b6e4-43dd-b322-acf0a3557b09'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9a03cb44-b6e4-43dd-b322-acf0a3557b09'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Cultureel werk'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '16' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5e86dc82-1981-48df-bbe5-abd4a9b3767b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5e86dc82-1981-48df-bbe5-abd4a9b3767b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voedsel, natuur en leefomgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '16.1' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1f5fcc77-6cd9-41cc-81e1-291b9a368378'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1f5fcc77-6cd9-41cc-81e1-291b9a368378'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voeding, teelt en verwerking'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '16.2' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9a95a2cc-5fda-4bb1-8dbc-fb7ba21a65b3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9a95a2cc-5fda-4bb1-8dbc-fb7ba21a65b3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voeding en handel'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '16.3' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','80a98b2a-5d16-4b2f-8246-f68f23c1d151'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'80a98b2a-5d16-4b2f-8246-f68f23c1d151'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verse voeding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '16.4' and not(key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','07af53ba-bb6e-4fae-a82d-34a489cffe01'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'07af53ba-bb6e-4fae-a82d-34a489cffe01'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuur en groene ruimte'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '17b41166-ab49-4a56-bcf1-32317da752ef' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '652bc6a3-d024-493f-9199-a08340cbb2b3' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8154d1f0-9b05-4649-b5b8-1da16cdb0185' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3ed67cca-37f6-4d7b-b1eb-872f6671caf7' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '31926035-10da-4f58-bf5b-6ba6a8084f90' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8bfd94a6-23ab-4d61-b816-90c67e0ba084' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '784bb003-e72d-4ce1-ad4f-4d7313fc80c6' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6276c656-2285-47ca-a7d0-7c833a0ce882' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c6c55e80-9fae-440b-b50a-4a1f70432734' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '693f235a-511f-4f59-9633-6b1abd0e3b6f' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2534e3c9-67b8-472b-b7ed-5cc595839ec6' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2bc0df5e-8a3e-4327-993d-7e7d785866b7' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bc899047-ae76-4414-a6df-e25c743def3f' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ee14b214-78a5-4436-ac08-acda03de24af' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b658110d-0115-4059-9889-cc7cc6369cc7' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e813cc0e-3f90-4097-880f-2a79c6bf67b2' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4af508b6-da26-4895-a238-ad8f9775bd00' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '59362601-8e47-406c-9d76-b5c380440f9b' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2c366888-5642-4262-922d-f84908767235' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3e4c4a78-565c-4e1a-8553-4267ef05b40c' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '20c064ec-c7b1-474c-a973-af4ded2f991c' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9bba22a0-8bee-4f76-9b79-621f056d69b9' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '25f996b2-5ebf-4b52-be39-86406f237690' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'fd8df586-d10e-4cd2-8ef7-c0c93f0bc5cd' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd6d6003d-1420-4fc4-9172-775aa7b3601f' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd25ad680-54d4-4721-98b5-8c59e45bd039' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e526d561-44a7-4127-9678-458e7b3ba973' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd761bbea-3e5c-4887-89e6-f1129b9c77de' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bd31cb34-9b8d-42dc-abbe-40d34417e1a3' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ab706abb-1f4a-4860-93c1-1d5ef63ea3b5' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9ca10565-ec88-44b7-abc2-582dfdea5abc' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '69f48643-6340-445e-92a6-8bdd1637af36' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bc763868-161e-4aec-9fe6-0493348f7c2d' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2e21886c-d285-4017-929a-1a69c8d3ced8' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '77218c97-9714-452b-ba6c-3943d8a87dac' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3912477b-4bd1-40ca-aeba-eb7a748728b8' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '076b2d41-8a82-4144-83ef-c60608b46469' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '97537f98-2e78-4881-bfe1-c4c74de19837' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '80de344b-6c8d-4594-8413-ee33f9a2bc4b' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e543db45-b4e1-46c5-b13b-ee269f5d0edd' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8ce88270-8fc1-41fa-97c0-6a59b66218f7' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'df874fdf-deb6-4b84-b0b1-7ab162fbe789' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f593fa33-b229-4557-ad67-352d75bae2a8' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3d904049-0624-4aae-a924-e478fcb7c0aa' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8aa21fc6-4da8-4bdf-9de2-d9e5e707d003' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c4ee4d2d-2d48-42a9-a728-9e3d551d8266' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '244d522c-fc3b-4d37-8826-ff82eb9cbe07' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7b3bbad5-34b2-4b5d-9c83-e3b64a3efed0' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11.4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4c5ca35d-a5b7-4408-af1f-9bbbcf96caa6' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2cc6b924-b9c6-413c-95c2-43fadf093778' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a2466ca1-0e2f-47fd-b388-d087994e7c91' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd3233c10-603c-423e-9339-6144418ba359' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bac03586-16fe-4384-98f5-8e0d6845ec72' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '567381e5-881f-49c6-b616-64410e797327' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '0c9a006f-3acf-43d2-87e4-e931c47b552f' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'fcd28540-37d2-4beb-b76f-8abef5bbb484' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6bd98aec-fc1a-4732-b1a8-a6e526f153a9' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','14') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2bf9d82c-1b6a-49fc-9138-f9f46b2ced9a' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','14.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '08018424-b218-4de6-b174-df6982e7a72d' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','14.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '750580b3-11c3-46a8-9bc2-dd5a6e7612b6' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b333369b-e647-4bbf-b04c-d11a9235a113' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e65c1e81-e93f-4fdb-adb8-d50676d00025' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'be7be841-a81f-4277-9b50-65102179b285' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'cf0afed9-d6e2-4b9d-9360-68724f33625e' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9a03cb44-b6e4-43dd-b322-acf0a3557b09' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5e86dc82-1981-48df-bbe5-abd4a9b3767b' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1f5fcc77-6cd9-41cc-81e1-291b9a368378' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9a95a2cc-5fda-4bb1-8dbc-fb7ba21a65b3' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '80a98b2a-5d16-4b2f-8246-f68f23c1d151' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '07af53ba-bb6e-4fae-a82d-34a489cffe01' and key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.4') != ''"/>
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
<xsl:text>http://purl.edustandaard.nl/vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010">
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = '17b41166-ab49-4a56-bcf1-32317da752ef' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouw en infra'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '652bc6a3-d024-493f-9199-a08340cbb2b3' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8154d1f0-9b05-4649-b5b8-1da16cdb0185' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','1.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Infrastructuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3ed67cca-37f6-4d7b-b1eb-872f6671caf7' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Afbouw, hout en onderhoud'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '31926035-10da-4f58-bf5b-6ba6a8084f90' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Hout en meubel'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8bfd94a6-23ab-4d61-b816-90c67e0ba084' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Stukadoren en afbouw'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '784bb003-e72d-4ce1-ad4f-4d7313fc80c6' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schilderen en onderhoud'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6276c656-2285-47ca-a7d0-7c833a0ce882' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','2.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schoonmaak en glazenwassen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c6c55e80-9fae-440b-b50a-4a1f70432734' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek en procesindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '693f235a-511f-4f59-9633-6b1abd0e3b6f' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Werktuigbouwkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2534e3c9-67b8-472b-b7ed-5cc595839ec6' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Elektrotechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2bc0df5e-8a3e-4327-993d-7e7d785866b7' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Installatietechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bc899047-ae76-4414-a6df-e25c743def3f' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Procesindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ee14b214-78a5-4436-ac08-acda03de24af' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','3.5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3.5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Vliegtuigbouwkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b658110d-0115-4059-9889-cc7cc6369cc7' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ambacht, laboratorium en gezondheidstechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e813cc0e-3f90-4097-880f-2a79c6bf67b2' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ambachtelijke techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4af508b6-da26-4895-a238-ad8f9775bd00' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Gezondheidstechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '59362601-8e47-406c-9d76-b5c380440f9b' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','4.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Laboratoriumtechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2c366888-5642-4262-922d-f84908767235' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Media en vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3e4c4a78-565c-4e1a-8553-4267ef05b40c' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mediatechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '20c064ec-c7b1-474c-a973-af4ded2f991c' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mediavormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9bba22a0-8bee-4f76-9b79-621f056d69b9' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Evenemententechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '25f996b2-5ebf-4b52-be39-86406f237690' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','5.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ruimtelijke vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'fd8df586-d10e-4cd2-8ef7-c0c93f0bc5cd' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Informatie en communicatietechnologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd6d6003d-1420-4fc4-9172-775aa7b3601f' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'ICT en media'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd25ad680-54d4-4721-98b5-8c59e45bd039' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kantoorautomatisering'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e526d561-44a7-4127-9678-458e7b3ba973' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','6.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Digitaal onderzoek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd761bbea-3e5c-4887-89e6-f1129b9c77de' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mobiliteit en voertuigen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bd31cb34-9b8d-42dc-abbe-40d34417e1a3' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mobiliteitstechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ab706abb-1f4a-4860-93c1-1d5ef63ea3b5' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','7.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Carrosserietechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9ca10565-ec88-44b7-abc2-582dfdea5abc' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Transport, scheepvaart en logistiek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '69f48643-6340-445e-92a6-8bdd1637af36' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Scheepvaart'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bc763868-161e-4aec-9fe6-0493348f7c2d' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Luchtvaart'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2e21886c-d285-4017-929a-1a69c8d3ced8' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wegtransport'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '77218c97-9714-452b-ba6c-3943d8a87dac' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','8.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Logistiek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3912477b-4bd1-40ca-aeba-eb7a748728b8' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handel en ondernemerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '076b2d41-8a82-4144-83ef-c60608b46469' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Detailhandel en groothandel'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '97537f98-2e78-4881-bfe1-c4c74de19837' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Management en ondernemerschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '80de344b-6c8d-4594-8413-ee33f9a2bc4b' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mode en interieurindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e543db45-b4e1-46c5-b13b-ee269f5d0edd' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','9.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tapijt en textielindustrie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8ce88270-8fc1-41fa-97c0-6a59b66218f7' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'10'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economie en administratie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'df874fdf-deb6-4b84-b0b1-7ab162fbe789' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'10.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Administratieve dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f593fa33-b229-4557-ad67-352d75bae2a8' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'10.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Zakelijke dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3d904049-0624-4aae-a924-e478fcb7c0aa' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','10.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'10.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Commerciele dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8aa21fc6-4da8-4bdf-9de2-d9e5e707d003' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'11'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Veiligheid en sport'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c4ee4d2d-2d48-42a9-a728-9e3d551d8266' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'11.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Defensie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '244d522c-fc3b-4d37-8826-ff82eb9cbe07' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'11.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Publieke veiligheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7b3bbad5-34b2-4b5d-9c83-e3b64a3efed0' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','11.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'11.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sport en bewegen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4c5ca35d-a5b7-4408-af1f-9bbbcf96caa6' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'12'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Uiterlijke verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2cc6b924-b9c6-413c-95c2-43fadf093778' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'12.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kappers'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a2466ca1-0e2f-47fd-b388-d087994e7c91' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'12.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Schoonheidsverzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd3233c10-603c-423e-9339-6144418ba359' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','12.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'12.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voetverzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bac03586-16fe-4384-98f5-8e0d6845ec72' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'13'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Horeca en bakkerij'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '567381e5-881f-49c6-b616-64410e797327' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'13.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Horeca'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '0c9a006f-3acf-43d2-87e4-e931c47b552f' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'13.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Brood en banket'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'fcd28540-37d2-4beb-b76f-8abef5bbb484' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','13.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'13.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Facilitaire dienstverlening'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6bd98aec-fc1a-4732-b1a8-a6e526f153a9' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','14'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'14'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Toerisme en recreatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2bf9d82c-1b6a-49fc-9138-f9f46b2ced9a' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','14.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'14.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Toerisme'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '08018424-b218-4de6-b174-df6982e7a72d' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','14.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'14.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Recreatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '750580b3-11c3-46a8-9bc2-dd5a6e7612b6' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'15'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Zorg en welzijn'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b333369b-e647-4bbf-b04c-d11a9235a113' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'15.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verpleging en verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e65c1e81-e93f-4fdb-adb8-d50676d00025' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'15.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Gezondheidsondersteuning'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'be7be841-a81f-4277-9b50-65102179b285' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'15.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappelijke zorg'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'cf0afed9-d6e2-4b9d-9360-68724f33625e' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'15.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Pedagogisch werk'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9a03cb44-b6e4-43dd-b322-acf0a3557b09' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','15.5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'15.5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Cultureel werk'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5e86dc82-1981-48df-bbe5-abd4a9b3767b' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'16'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voedsel, natuur en leefomgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1f5fcc77-6cd9-41cc-81e1-291b9a368378' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'16.1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voeding, teelt en verwerking'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9a95a2cc-5fda-4bb1-8dbc-fb7ba21a65b3' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'16.2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voeding en handel'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '80a98b2a-5d16-4b2f-8246-f68f23c1d151' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'16.3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verse voeding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '07af53ba-bb6e-4fae-a82d-34a489cffe01' and not(key('classification-by-oldIdvdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010','16.4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'16.4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuur en groene ruimte'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>




</xsl:stylesheet>

