<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdvdex_classification_vakaanduidingen_po_2009" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_vakaanduidingen_po_2009" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_vakaanduidingen_po_2009')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_vakaanduidingen_po_2009_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_vakaanduidingen_po_2009',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'nederlands' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','3401cf6e-82e4-404c-b216-b980ff407159') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'schrijven' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','ddae0006-230f-4f00-b407-9d358a90a27e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'lezen' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','534ac9f4-f71d-4b46-89e0-dc3f6813da6d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'taal' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','3401cf6e-82e4-404c-b216-b980ff407159') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'fries' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','93a7126d-7307-4b6a-b55a-f4f78e92f680') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'engels' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','18f53978-1118-4051-a778-b8d7f60ca982') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'duits' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','81a1f605-db58-448d-a1dc-da682316c505') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'frans' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','9f4710e3-f173-404e-b12e-577657a5da04') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'spaans' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','952bf604-cc38-44e3-889a-a9e74a18da8e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'rekenen en wiskunde' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','b48fa351-4561-44c7-a071-ebfd6103eec3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'wereldorientatie' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','8b194f4d-d757-440d-b8a2-e7427849a6db') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'aardrijkskunde' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','c001f86a-4f8f-4420-bd78-381c615ecedc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'geschiedenis' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'natuur' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','f97e788f-5aa6-4ab4-9448-9e27b79daa9e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'techniek' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','c6971373-aa44-4de9-91ef-aca886d42a6a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'milieu' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','c001f86a-4f8f-4420-bd78-381c615ecedc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'verkeer' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','d45cf1d7-3d8e-476a-a4ef-a39440820199') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'gezond en redzaam gedrag' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','04058361-4e9e-4c02-a057-41605a7f37b5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'burgerschapsvorming' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','70c518f8-5719-4d0a-b3d8-6589073b9887') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'levensbeschouwing' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','e605402f-4cc2-46bb-9026-d1d49bde17bf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'godsdienst' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','e605402f-4cc2-46bb-9026-d1d49bde17bf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'geestelijke stromingen' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','fbf55a0b-41b6-4dc7-848d-ec41378c9c53') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'sociaal-emotionele ontwikkeling' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','35d0e3ed-d62e-40a5-8bff-46f1de51e47a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'kunstzinnige orientatie' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','4aa16ae7-48c6-4f96-b48d-a67389a7050d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'handvaardigheid' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','f1116b34-14c9-4098-85fb-aed1b9473894') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'tekenen' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','5cb7f440-c370-4056-b30d-f57130cccede') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'muziek' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','7aa6f577-b02d-484a-90d6-72fc80199f9a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'drama' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','904a6dbc-c236-42c8-aaa9-a5d7eaa9639f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bewegingsonderwijs' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','34f8bed2-b9f1-4de9-8db7-ee3d9bbb10f2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'computervaardigheden%2FICT' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'filosofie' and key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','d35b903f-1598-4bdd-a2fa-8aba854df762') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != 'nederlands' and descendant::*[local-name() = 'id'] != 'schrijven' and descendant::*[local-name() = 'id'] != 'lezen' and descendant::*[local-name() = 'id'] != 'taal' and descendant::*[local-name() = 'id'] != 'fries' and descendant::*[local-name() = 'id'] != 'engels' and descendant::*[local-name() = 'id'] != 'duits' and descendant::*[local-name() = 'id'] != 'frans' and descendant::*[local-name() = 'id'] != 'spaans' and descendant::*[local-name() = 'id'] != 'rekenen en wiskunde' and descendant::*[local-name() = 'id'] != 'wereldorientatie' and descendant::*[local-name() = 'id'] != 'aardrijkskunde' and descendant::*[local-name() = 'id'] != 'geschiedenis' and descendant::*[local-name() = 'id'] != 'natuur' and descendant::*[local-name() = 'id'] != 'techniek' and descendant::*[local-name() = 'id'] != 'milieu' and descendant::*[local-name() = 'id'] != 'verkeer' and descendant::*[local-name() = 'id'] != 'gezond en redzaam gedrag' and descendant::*[local-name() = 'id'] != 'burgerschapsvorming' and descendant::*[local-name() = 'id'] != 'levensbeschouwing' and descendant::*[local-name() = 'id'] != 'godsdienst' and descendant::*[local-name() = 'id'] != 'geestelijke stromingen' and descendant::*[local-name() = 'id'] != 'sociaal-emotionele ontwikkeling' and descendant::*[local-name() = 'id'] != 'kunstzinnige orientatie' and descendant::*[local-name() = 'id'] != 'handvaardigheid' and descendant::*[local-name() = 'id'] != 'tekenen' and descendant::*[local-name() = 'id'] != 'muziek' and descendant::*[local-name() = 'id'] != 'drama' and descendant::*[local-name() = 'id'] != 'bewegingsonderwijs' and descendant::*[local-name() = 'id'] != 'computervaardigheden%2FICT' and descendant::*[local-name() = 'id'] != 'filosofie'"/>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_vakaanduidingen_po_2009"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_vakaanduidingen_po_2009">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_vakaanduidingen_po_2009')]">
<xsl:choose>
<xsl:when test="node() = 'nederlands' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','3401cf6e-82e4-404c-b216-b980ff407159'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3401cf6e-82e4-404c-b216-b980ff407159'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlandse taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'schrijven' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','ddae0006-230f-4f00-b407-9d358a90a27e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ddae0006-230f-4f00-b407-9d358a90a27e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Technisch schrijven'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'lezen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','534ac9f4-f71d-4b46-89e0-dc3f6813da6d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'534ac9f4-f71d-4b46-89e0-dc3f6813da6d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Lezen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'taal' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','3401cf6e-82e4-404c-b216-b980ff407159'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3401cf6e-82e4-404c-b216-b980ff407159'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlandse taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'fries' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','93a7126d-7307-4b6a-b55a-f4f78e92f680'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'93a7126d-7307-4b6a-b55a-f4f78e92f680'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Fries'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'engels' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','18f53978-1118-4051-a778-b8d7f60ca982'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'18f53978-1118-4051-a778-b8d7f60ca982'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Engels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'duits' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','81a1f605-db58-448d-a1dc-da682316c505'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'81a1f605-db58-448d-a1dc-da682316c505'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duits'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'frans' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','9f4710e3-f173-404e-b12e-577657a5da04'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9f4710e3-f173-404e-b12e-577657a5da04'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Frans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'spaans' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','952bf604-cc38-44e3-889a-a9e74a18da8e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'952bf604-cc38-44e3-889a-a9e74a18da8e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Spaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'rekenen en wiskunde' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','b48fa351-4561-44c7-a071-ebfd6103eec3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b48fa351-4561-44c7-a071-ebfd6103eec3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'wereldorientatie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','8b194f4d-d757-440d-b8a2-e7427849a6db'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8b194f4d-d757-440d-b8a2-e7427849a6db'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wereldoriëntatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'aardrijkskunde' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','c001f86a-4f8f-4420-bd78-381c615ecedc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c001f86a-4f8f-4420-bd78-381c615ecedc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'geschiedenis' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Geschiedenis'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'natuur' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','f97e788f-5aa6-4ab4-9448-9e27b79daa9e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f97e788f-5aa6-4ab4-9448-9e27b79daa9e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'techniek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','c6971373-aa44-4de9-91ef-aca886d42a6a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c6971373-aa44-4de9-91ef-aca886d42a6a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'milieu' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','c001f86a-4f8f-4420-bd78-381c615ecedc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c001f86a-4f8f-4420-bd78-381c615ecedc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'verkeer' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','d45cf1d7-3d8e-476a-a4ef-a39440820199'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d45cf1d7-3d8e-476a-a4ef-a39440820199'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verkeer'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'gezond en redzaam gedrag' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','04058361-4e9e-4c02-a057-41605a7f37b5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'04058361-4e9e-4c02-a057-41605a7f37b5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Gezond en redzaam gedrag'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'burgerschapsvorming' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','70c518f8-5719-4d0a-b3d8-6589073b9887'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'70c518f8-5719-4d0a-b3d8-6589073b9887'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Burgerschapsvorming'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'levensbeschouwing' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','e605402f-4cc2-46bb-9026-d1d49bde17bf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e605402f-4cc2-46bb-9026-d1d49bde17bf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Godsdienst'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'godsdienst' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','e605402f-4cc2-46bb-9026-d1d49bde17bf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e605402f-4cc2-46bb-9026-d1d49bde17bf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Godsdienst'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'geestelijke stromingen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','fbf55a0b-41b6-4dc7-848d-ec41378c9c53'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fbf55a0b-41b6-4dc7-848d-ec41378c9c53'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Geestelijke stromingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'sociaal-emotionele ontwikkeling' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','35d0e3ed-d62e-40a5-8bff-46f1de51e47a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'35d0e3ed-d62e-40a5-8bff-46f1de51e47a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sociaal-emotionele ontwikkeling'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'kunstzinnige orientatie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','4aa16ae7-48c6-4f96-b48d-a67389a7050d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4aa16ae7-48c6-4f96-b48d-a67389a7050d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kunstzinnige oriëntatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'handvaardigheid' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','f1116b34-14c9-4098-85fb-aed1b9473894'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f1116b34-14c9-4098-85fb-aed1b9473894'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'tekenen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','5cb7f440-c370-4056-b30d-f57130cccede'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5cb7f440-c370-4056-b30d-f57130cccede'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'muziek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','7aa6f577-b02d-484a-90d6-72fc80199f9a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7aa6f577-b02d-484a-90d6-72fc80199f9a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Muziek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'drama' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','904a6dbc-c236-42c8-aaa9-a5d7eaa9639f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'904a6dbc-c236-42c8-aaa9-a5d7eaa9639f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Drama'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bewegingsonderwijs' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','34f8bed2-b9f1-4de9-8db7-ee3d9bbb10f2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'34f8bed2-b9f1-4de9-8db7-ee3d9bbb10f2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bewegingsonderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'computervaardigheden%2FICT' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Computervaardigheden/ ICT'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'filosofie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_po_2009','d35b903f-1598-4bdd-a2fa-8aba854df762'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d35b903f-1598-4bdd-a2fa-8aba854df762'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Filosofie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
