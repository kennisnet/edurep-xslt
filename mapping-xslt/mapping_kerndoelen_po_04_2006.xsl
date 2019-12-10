<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

    <xsl:key name="classification-by-newIdvdex_classification_kerndoelen_po_04_2006" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'educational objective']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
    <xsl:key name="classification-by-oldIdvdex_classification_kerndoelen_po_04_2006" match="*[local-name() = 'classification']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_kerndoelen_po_04_2006')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_kerndoelen_po_04_2006_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_kerndoelen_po_04_2006',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '1' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','8cd7169b-ec2b-4b1a-bc35-e2d2ac49e902') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e5f45cd7-ff7b-4876-a014-9aead5348100') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','cf478309-4d3b-4e81-9077-764c0793496d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','396bce44-46c7-4af6-880e-1fc3ace5128a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','fd1fd0be-25ed-47af-8ed1-15c8f6b2d8e8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','998d290b-5882-43e9-bf38-b41992ff2ce7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a81b68fb-b89b-4654-a27a-e46c2cf7dd98') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7c484813-ec13-451f-97b0-ff9b7fbab690') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7893825b-806a-4850-9870-8cb5f94cf5a6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '10' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a776f9a3-32d3-48cb-bd83-5549c2c8ff49') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '11' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7b7a5317-c622-423c-b337-b4c656d8d372') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','8990498f-49bb-4e40-8121-0a74b18c7ae7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '13' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','f7032363-a75d-4e9e-abc8-6fba2eb976d0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '14' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7ec34151-af9f-46b3-ba7f-841672f00705') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1fa773c2-2e84-41e0-9a45-ab5f6d4af705') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '16' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c2071a4a-288d-4bfd-97b8-0cd9d68ff5c2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '17' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','721cb364-8e27-42ed-95b8-31296c4dd425') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '18' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','3f8fa2b2-544f-46f9-ae7c-363112c1256a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '19' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','27b77b33-f0f8-4079-b245-62a0d7c37025') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '20' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a256864b-e6e0-4341-a09a-313bab72ec07') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '21' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','f1c6d8e5-5f18-4ef8-8845-1923c71e5edc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '22' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','49f4b7e6-68b2-4dbe-82e7-3eaa450176bb') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '23' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','ca8a7c55-b038-4eb7-ab26-e87fa58bced0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '24' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7efa59c6-b263-42c3-9199-bf818c6a1b4b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '25' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','b24b831e-ba83-4118-91d3-00ec1bc13650') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '26' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1ed1e736-c541-4b47-9061-34117d70c859') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '27' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c2bfba34-1ca1-4560-9131-67cd068f9713') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '28' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','ff515534-6ed1-45cb-9767-ee4a70119b19') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '29' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1ef4dfbf-1810-4fc5-94ef-d455fdcf3661') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '30' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','93556d3a-c7d0-4a49-a692-6fddf17f9aa5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '31' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a40c6b0a-cb46-4fc3-b42d-23a4457ab21e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '32' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','9ed074c3-29f2-475b-bbe3-aaca1b78077b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '33' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','d4b16fc2-8c8a-46ae-956c-d5cdfc6ff03d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '34' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','82c7db22-1b7f-4890-8720-dd2aa8373b56') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '35' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','45dbe23d-61b7-4332-872d-a5280d7a17b0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '36' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','28a9525c-da1f-4b7f-b67f-38a3b96b369f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '37' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','45885286-dc4b-4648-b4b3-16f14ebf262f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '38' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','156d3f88-03e0-458f-87f1-c624219ec99f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '39' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7f6e0edc-e38f-43bb-a7f8-82d0cab137ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '40' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','d803cf62-cf7e-404c-b650-8c7543534b6d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '41' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1095e038-a147-4b0a-bbfa-a202789744da') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c3d8c8c0-0f94-4dec-8ce6-f52fab27158f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '43' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','efc344e0-4651-4c07-ad61-0091cb7aa69f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '44' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','3d12e0ca-bca7-4b78-a8ed-f4699570fb12') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '45' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e652ff27-3b26-4820-8d7b-32e9d38836e1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '46' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','518b5749-dbe3-4e31-a139-f520752566e4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '47' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','4fb0176d-c4b4-4455-9cce-d43b6c1a9ac8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '48' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','89dafb2b-df9c-4f05-af37-1468f91983d1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '49' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','59065228-97c2-487c-9db3-a6d4242fc633') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '50' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','f2bacf1a-e6f9-4556-a1b9-54960a50df4b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '51' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e93ea3f8-e21a-4a8a-b3b9-4ac005fe5f30') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '52' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e2a2a741-5b36-4aff-8acc-9523fba6af5e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '53' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c6af9dc7-efee-4cb3-83b2-bf5c54512238') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '54' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c4e8c51c-144b-4a76-bff5-09337c03ab63') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '55' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','d619232e-394a-4c8c-b607-e94c36bfd48f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '56' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7555bcba-47e9-41d2-b04a-5a3623062146') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '57' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','8b4cb0d1-0a99-42fc-8ad9-2e13a2bd482f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '58' and key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','4b63c87d-59d4-4c7b-a609-8097ef7c5591') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != '1' and descendant::*[local-name() = 'id'] != '2' and descendant::*[local-name() = 'id'] != '3' and descendant::*[local-name() = 'id'] != '4' and descendant::*[local-name() = 'id'] != '5' and descendant::*[local-name() = 'id'] != '6' and descendant::*[local-name() = 'id'] != '7' and descendant::*[local-name() = 'id'] != '8' and descendant::*[local-name() = 'id'] != '9' and descendant::*[local-name() = 'id'] != '10' and descendant::*[local-name() = 'id'] != '11' and descendant::*[local-name() = 'id'] != '12' and descendant::*[local-name() = 'id'] != '13' and descendant::*[local-name() = 'id'] != '14' and descendant::*[local-name() = 'id'] != '15' and descendant::*[local-name() = 'id'] != '16' and descendant::*[local-name() = 'id'] != '17' and descendant::*[local-name() = 'id'] != '18' and descendant::*[local-name() = 'id'] != '19' and descendant::*[local-name() = 'id'] != '20' and descendant::*[local-name() = 'id'] != '21' and descendant::*[local-name() = 'id'] != '22' and descendant::*[local-name() = 'id'] != '23' and descendant::*[local-name() = 'id'] != '24' and descendant::*[local-name() = 'id'] != '25' and descendant::*[local-name() = 'id'] != '26' and descendant::*[local-name() = 'id'] != '27' and descendant::*[local-name() = 'id'] != '28' and descendant::*[local-name() = 'id'] != '29' and descendant::*[local-name() = 'id'] != '30' and descendant::*[local-name() = 'id'] != '31' and descendant::*[local-name() = 'id'] != '32' and descendant::*[local-name() = 'id'] != '33' and descendant::*[local-name() = 'id'] != '34' and descendant::*[local-name() = 'id'] != '35' and descendant::*[local-name() = 'id'] != '36' and descendant::*[local-name() = 'id'] != '37' and descendant::*[local-name() = 'id'] != '38' and descendant::*[local-name() = 'id'] != '39' and descendant::*[local-name() = 'id'] != '40' and descendant::*[local-name() = 'id'] != '41' and descendant::*[local-name() = 'id'] != '42' and descendant::*[local-name() = 'id'] != '43' and descendant::*[local-name() = 'id'] != '44' and descendant::*[local-name() = 'id'] != '45' and descendant::*[local-name() = 'id'] != '46' and descendant::*[local-name() = 'id'] != '47' and descendant::*[local-name() = 'id'] != '48' and descendant::*[local-name() = 'id'] != '49' and descendant::*[local-name() = 'id'] != '50' and descendant::*[local-name() = 'id'] != '51' and descendant::*[local-name() = 'id'] != '52' and descendant::*[local-name() = 'id'] != '53' and descendant::*[local-name() = 'id'] != '54' and descendant::*[local-name() = 'id'] != '55' and descendant::*[local-name() = 'id'] != '56' and descendant::*[local-name() = 'id'] != '57' and descendant::*[local-name() = 'id'] != '58'"/>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_kerndoelen_po_04_2006"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_kerndoelen_po_04_2006">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
    <xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_kerndoelen_po_04_2006')]">
<xsl:choose>
<xsl:when test="node() = '1' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','8cd7169b-ec2b-4b1a-bc35-e2d2ac49e902'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8cd7169b-ec2b-4b1a-bc35-e2d2ac49e902'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 1: Informatie verwerven'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e5f45cd7-ff7b-4876-a014-9aead5348100'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e5f45cd7-ff7b-4876-a014-9aead5348100'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 2: Spreken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','cf478309-4d3b-4e81-9077-764c0793496d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'cf478309-4d3b-4e81-9077-764c0793496d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 3: Informatie beoordelen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','396bce44-46c7-4af6-880e-1fc3ace5128a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'396bce44-46c7-4af6-880e-1fc3ace5128a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 4: Informatie opzoeken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','fd1fd0be-25ed-47af-8ed1-15c8f6b2d8e8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fd1fd0be-25ed-47af-8ed1-15c8f6b2d8e8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 5: Teksttypen onderscheiden'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','998d290b-5882-43e9-bf38-b41992ff2ce7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'998d290b-5882-43e9-bf38-b41992ff2ce7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 6: Informatie ordenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a81b68fb-b89b-4654-a27a-e46c2cf7dd98'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a81b68fb-b89b-4654-a27a-e46c2cf7dd98'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 7: Informatie vergelijken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7c484813-ec13-451f-97b0-ff9b7fbab690'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7c484813-ec13-451f-97b0-ff9b7fbab690'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 8: Teksten produceren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7893825b-806a-4850-9870-8cb5f94cf5a6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7893825b-806a-4850-9870-8cb5f94cf5a6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 9: Plezier in lezen en schrijven'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '10' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a776f9a3-32d3-48cb-bd83-5549c2c8ff49'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a776f9a3-32d3-48cb-bd83-5549c2c8ff49'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 10: Strategieen hanteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '11' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7b7a5317-c622-423c-b337-b4c656d8d372'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7b7a5317-c622-423c-b337-b4c656d8d372'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 11: Principes en regels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','8990498f-49bb-4e40-8121-0a74b18c7ae7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8990498f-49bb-4e40-8121-0a74b18c7ae7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 12: Woordenschat'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '13' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','f7032363-a75d-4e9e-abc8-6fba2eb976d0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f7032363-a75d-4e9e-abc8-6fba2eb976d0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 13: Informatie verwerken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '14' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7ec34151-af9f-46b3-ba7f-841672f00705'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7ec34151-af9f-46b3-ba7f-841672f00705'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 14: Spreken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1fa773c2-2e84-41e0-9a45-ab5f6d4af705'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1fa773c2-2e84-41e0-9a45-ab5f6d4af705'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 15: Schrijfwijze van woorden'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '16' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c2071a4a-288d-4bfd-97b8-0cd9d68ff5c2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c2071a4a-288d-4bfd-97b8-0cd9d68ff5c2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 16: Woordenboek hanteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '17' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','721cb364-8e27-42ed-95b8-31296c4dd425'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'721cb364-8e27-42ed-95b8-31296c4dd425'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 17: Positieve attitude'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '18' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','3f8fa2b2-544f-46f9-ae7c-363112c1256a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3f8fa2b2-544f-46f9-ae7c-363112c1256a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 18: Informatie verwerven'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '19' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','27b77b33-f0f8-4079-b245-62a0d7c37025'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'27b77b33-f0f8-4079-b245-62a0d7c37025'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 19: Spreken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '20' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a256864b-e6e0-4341-a09a-313bab72ec07'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a256864b-e6e0-4341-a09a-313bab72ec07'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 20: Teksttypes hanteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '21' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','f1c6d8e5-5f18-4ef8-8845-1923c71e5edc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f1c6d8e5-5f18-4ef8-8845-1923c71e5edc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 21: Teksten produceren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '22' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','49f4b7e6-68b2-4dbe-82e7-3eaa450176bb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'49f4b7e6-68b2-4dbe-82e7-3eaa450176bb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 22: Woordenschat'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '23' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','ca8a7c55-b038-4eb7-ab26-e87fa58bced0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ca8a7c55-b038-4eb7-ab26-e87fa58bced0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 23: Wiskundetaal gebruiken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '24' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7efa59c6-b263-42c3-9199-bf818c6a1b4b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7efa59c6-b263-42c3-9199-bf818c6a1b4b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 24: Wiskundige problemen oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '25' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','b24b831e-ba83-4118-91d3-00ec1bc13650'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b24b831e-ba83-4118-91d3-00ec1bc13650'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 25: Strategieen beoordelen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '26' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1ed1e736-c541-4b47-9061-34117d70c859'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1ed1e736-c541-4b47-9061-34117d70c859'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 26: Structuren doorzien'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '27' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c2bfba34-1ca1-4560-9131-67cd068f9713'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c2bfba34-1ca1-4560-9131-67cd068f9713'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 27: Basisbewerkingen automatiseren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '28' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','ff515534-6ed1-45cb-9767-ee4a70119b19'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ff515534-6ed1-45cb-9767-ee4a70119b19'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 28: Schattend rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '29' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1ef4dfbf-1810-4fc5-94ef-d455fdcf3661'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1ef4dfbf-1810-4fc5-94ef-d455fdcf3661'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 29: Handig rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '30' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','93556d3a-c7d0-4a49-a692-6fddf17f9aa5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'93556d3a-c7d0-4a49-a692-6fddf17f9aa5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 30: Standaardprocedures'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '31' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','a40c6b0a-cb46-4fc3-b42d-23a4457ab21e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a40c6b0a-cb46-4fc3-b42d-23a4457ab21e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 31: Rekenmachine'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '32' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','9ed074c3-29f2-475b-bbe3-aaca1b78077b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9ed074c3-29f2-475b-bbe3-aaca1b78077b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 32: Meetkundige problemen oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '33' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','d4b16fc2-8c8a-46ae-956c-d5cdfc6ff03d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d4b16fc2-8c8a-46ae-956c-d5cdfc6ff03d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 33: Eenheden en maten'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '34' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','82c7db22-1b7f-4890-8720-dd2aa8373b56'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'82c7db22-1b7f-4890-8720-dd2aa8373b56'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 34: Gezondheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '35' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','45dbe23d-61b7-4332-872d-a5280d7a17b0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'45dbe23d-61b7-4332-872d-a5280d7a17b0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 35: Redzaam gedrag'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '36' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','28a9525c-da1f-4b7f-b67f-38a3b96b369f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'28a9525c-da1f-4b7f-b67f-38a3b96b369f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 36: Staatsinrichting'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '37' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','45885286-dc4b-4648-b4b3-16f14ebf262f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'45885286-dc4b-4648-b4b3-16f14ebf262f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 37: Waarden en normen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '38' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','156d3f88-03e0-458f-87f1-c624219ec99f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'156d3f88-03e0-458f-87f1-c624219ec99f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 38: Geestelijke stromingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '39' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7f6e0edc-e38f-43bb-a7f8-82d0cab137ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7f6e0edc-e38f-43bb-a7f8-82d0cab137ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 39: Milieu'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '40' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','d803cf62-cf7e-404c-b650-8c7543534b6d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d803cf62-cf7e-404c-b650-8c7543534b6d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 40: Planten en dieren herkennen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '41' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','1095e038-a147-4b0a-bbfa-a202789744da'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1095e038-a147-4b0a-bbfa-a202789744da'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 41: Bouw van organismen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c3d8c8c0-0f94-4dec-8ce6-f52fab27158f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c3d8c8c0-0f94-4dec-8ce6-f52fab27158f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 42: Natuurkundige verschijnselen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '43' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','efc344e0-4651-4c07-ad61-0091cb7aa69f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'efc344e0-4651-4c07-ad61-0091cb7aa69f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 43: Weer en klimaat'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '44' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','3d12e0ca-bca7-4b78-a8ed-f4699570fb12'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3d12e0ca-bca7-4b78-a8ed-f4699570fb12'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 44: Kennis van produkten'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '45' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e652ff27-3b26-4820-8d7b-32e9d38836e1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e652ff27-3b26-4820-8d7b-32e9d38836e1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 45: Technische oplossingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '46' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','518b5749-dbe3-4e31-a139-f520752566e4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'518b5749-dbe3-4e31-a139-f520752566e4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 46: Dagritme en seizoenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '47' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','4fb0176d-c4b4-4455-9cce-d43b6c1a9ac8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4fb0176d-c4b4-4455-9cce-d43b6c1a9ac8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 47: Ruimtelijke inrichting'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '48' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','89dafb2b-df9c-4f05-af37-1468f91983d1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'89dafb2b-df9c-4f05-af37-1468f91983d1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 48: Omgang met water'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '49' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','59065228-97c2-487c-9db3-a6d4242fc633'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'59065228-97c2-487c-9db3-a6d4242fc633'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 49: Spreiding van bevolking en landschap'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '50' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','f2bacf1a-e6f9-4556-a1b9-54960a50df4b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f2bacf1a-e6f9-4556-a1b9-54960a50df4b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 50: Kaart en atlas'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '51' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e93ea3f8-e21a-4a8a-b3b9-4ac005fe5f30'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e93ea3f8-e21a-4a8a-b3b9-4ac005fe5f30'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 51: Historische bronnen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '52' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','e2a2a741-5b36-4aff-8acc-9523fba6af5e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e2a2a741-5b36-4aff-8acc-9523fba6af5e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 52: Tijdvakken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '53' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c6af9dc7-efee-4cb3-83b2-bf5c54512238'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c6af9dc7-efee-4cb3-83b2-bf5c54512238'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 53: Personen en gebeurtenissen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '54' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','c4e8c51c-144b-4a76-bff5-09337c03ab63'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c4e8c51c-144b-4a76-bff5-09337c03ab63'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 54: Uitdrukken en communiceren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '55' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','d619232e-394a-4c8c-b607-e94c36bfd48f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d619232e-394a-4c8c-b607-e94c36bfd48f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 55: Reflecteren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '56' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','7555bcba-47e9-41d2-b04a-5a3623062146'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7555bcba-47e9-41d2-b04a-5a3623062146'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 56: Cultureel erfgoed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '57' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','8b4cb0d1-0a99-42fc-8ad9-2e13a2bd482f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8b4cb0d1-0a99-42fc-8ad9-2e13a2bd482f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 57: Leren deelnemen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '58' and not(key('classification-by-newIdvdex_classification_kerndoelen_po_04_2006','4b63c87d-59d4-4c7b-a609-8097ef7c5591'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4b63c87d-59d4-4c7b-a609-8097ef7c5591'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO Kerndoel 58: Leren samenwerken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


</xsl:stylesheet>
