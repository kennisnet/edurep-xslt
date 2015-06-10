<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdvdex_classification_discipline_czp_20060628" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_discipline_czp_20060628" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_discipline_czp_20060628')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_discipline_czp_20060628_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_discipline_czp_20060628',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'taal' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','3401cf6e-82e4-404c-b216-b980ff407159') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Nederlands' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','3401cf6e-82e4-404c-b216-b980ff407159') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Engels' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','18f53978-1118-4051-a778-b8d7f60ca982') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Frans' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','9f4710e3-f173-404e-b12e-577657a5da04') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Duits' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','81a1f605-db58-448d-a1dc-da682316c505') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Spaans' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','952bf604-cc38-44e3-889a-a9e74a18da8e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Turks' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Arabisch' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','455d527a-bfd0-4460-919e-12e0478a54cf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Russisch' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','116fbfd6-77d8-4676-8634-8cfd686942c9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Italiaans' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','aedcfc1c-a676-4f40-8587-4a5f43a354b5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Fries' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','93a7126d-7307-4b6a-b55a-f4f78e92f680') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Latijn' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','1cb06441-fc86-49fa-9347-a5869acb3778') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Grieks' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','c92a4d95-f2bb-4eb0-8861-0691365f15b1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'wereldorientatie' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','8b194f4d-d757-440d-b8a2-e7427849a6db') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'aardrijkskunde' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','c001f86a-4f8f-4420-bd78-381c615ecedc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'geschiedenis' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'natuurwetenschappen' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','f97e788f-5aa6-4ab4-9448-9e27b79daa9e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'natuurwetenschappen' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','3b49e7f7-00cc-47ad-8403-32adb3ec31ee') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'biologie' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','2b363227-8633-4652-ad57-c61f1efc02c8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'natuurkunde' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','e98be5ad-4bd2-4768-a9eb-7e24026e360c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'scheikunde' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','3aab168a-9b24-4aca-b0f1-4bfb12e7c288') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'milieu' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','c001f86a-4f8f-4420-bd78-381c615ecedc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'techniek' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','c6971373-aa44-4de9-91ef-aca886d42a6a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mens%20en%20natuur' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','3a8e841e-ee9a-4790-b6ac-747f54d19ea1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'kunst%20en%20cultuur' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','4aa16ae7-48c6-4f96-b48d-a67389a7050d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'dans' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','0b1fbf62-4eb4-4af3-a267-3cd3215d6aac') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'drama' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','904a6dbc-c236-42c8-aaa9-a5d7eaa9639f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'muziek' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','7aa6f577-b02d-484a-90d6-72fc80199f9a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'beeldende%20vorming' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','4c8a3378-6616-459d-acc4-83ee5a9b91a2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'handenarbeid' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','f1116b34-14c9-4098-85fb-aed1b9473894') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'tekenen' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','5cb7f440-c370-4056-b30d-f57130cccede') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'schilderen' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','4c8a3378-6616-459d-acc4-83ee5a9b91a2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'audiovisuele%20vormgeving' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','570aef95-9d43-401d-bac2-b40a6dab4082') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'textiele%20werkvormen' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','5fa492c3-7f83-4e2f-8931-87fc1a2d0048') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'schrijven' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','ddae0006-230f-4f00-b407-9d358a90a27e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'informatie-%20en%20communicatietechnologie' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'informatie-%20en%20communicatietechnologie' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','2845473d-ce18-450a-9135-6738abbdc129') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'filosofie' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','d35b903f-1598-4bdd-a2fa-8aba854df762') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'levensbeschouwing' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','37ca9dc8-2560-42de-9aac-590143932b63') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'lichamelijke%20opvoeding' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','bc7cb521-bdfe-46ab-b635-f2d2189bdd39') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'sociale%20vaardigheid' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','35d0e3ed-d62e-40a5-8bff-46f1de51e47a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'verkeer' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','d45cf1d7-3d8e-476a-a4ef-a39440820199') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'verzorging' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'maatschappijleer' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','7596e435-d417-4de8-a32e-8e61f11ee1d2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'management%20en%20organisatie' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','fd3988c5-9648-4c39-9122-93a7260c8bbe') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'economie' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','4ba5583f-b147-42cc-a083-ce5ebfd53746') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'wiskunde' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','7afbb7a6-c29b-425c-9c59-6f79c845f5f0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'rekenen' and key('classification-by-newIdvdex_classification_discipline_czp_20060628','b48fa351-4561-44c7-a071-ebfd6103eec3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != 'taal' and descendant::*[local-name() = 'id'] != 'Nederlands' and descendant::*[local-name() = 'id'] != 'Engels' and descendant::*[local-name() = 'id'] != 'Frans' and descendant::*[local-name() = 'id'] != 'Duits' and descendant::*[local-name() = 'id'] != 'Spaans' and descendant::*[local-name() = 'id'] != 'Turks' and descendant::*[local-name() = 'id'] != 'Arabisch' and descendant::*[local-name() = 'id'] != 'Russisch' and descendant::*[local-name() = 'id'] != 'Italiaans' and descendant::*[local-name() = 'id'] != 'Fries' and descendant::*[local-name() = 'id'] != 'Latijn' and descendant::*[local-name() = 'id'] != 'Grieks' and descendant::*[local-name() = 'id'] != 'wereldorientatie' and descendant::*[local-name() = 'id'] != 'aardrijkskunde' and descendant::*[local-name() = 'id'] != 'geschiedenis' and descendant::*[local-name() = 'id'] != 'natuurwetenschappen' and descendant::*[local-name() = 'id'] != 'natuurwetenschappen' and descendant::*[local-name() = 'id'] != 'biologie' and descendant::*[local-name() = 'id'] != 'natuurkunde' and descendant::*[local-name() = 'id'] != 'scheikunde' and descendant::*[local-name() = 'id'] != 'milieu' and descendant::*[local-name() = 'id'] != 'techniek' and descendant::*[local-name() = 'id'] != 'mens%20en%20natuur' and descendant::*[local-name() = 'id'] != 'kunst%20en%20cultuur' and descendant::*[local-name() = 'id'] != 'dans' and descendant::*[local-name() = 'id'] != 'drama' and descendant::*[local-name() = 'id'] != 'muziek' and descendant::*[local-name() = 'id'] != 'beeldende%20vorming' and descendant::*[local-name() = 'id'] != 'handenarbeid' and descendant::*[local-name() = 'id'] != 'tekenen' and descendant::*[local-name() = 'id'] != 'schilderen' and descendant::*[local-name() = 'id'] != 'audiovisuele%20vormgeving' and descendant::*[local-name() = 'id'] != 'textiele%20werkvormen' and descendant::*[local-name() = 'id'] != 'schrijven' and descendant::*[local-name() = 'id'] != 'informatie-%20en%20communicatietechnologie' and descendant::*[local-name() = 'id'] != 'informatie-%20en%20communicatietechnologie' and descendant::*[local-name() = 'id'] != 'filosofie' and descendant::*[local-name() = 'id'] != 'levensbeschouwing' and descendant::*[local-name() = 'id'] != 'lichamelijke%20opvoeding' and descendant::*[local-name() = 'id'] != 'sociale%20vaardigheid' and descendant::*[local-name() = 'id'] != 'verkeer' and descendant::*[local-name() = 'id'] != 'verzorging' and descendant::*[local-name() = 'id'] != 'maatschappijleer' and descendant::*[local-name() = 'id'] != 'management%20en%20organisatie' and descendant::*[local-name() = 'id'] != 'economie' and descendant::*[local-name() = 'id'] != 'wiskunde' and descendant::*[local-name() = 'id'] != 'rekenen'"/>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_discipline_czp_20060628"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_discipline_czp_20060628">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_discipline_czp_20060628')]">
<xsl:choose>
<xsl:when test="node() = 'taal' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','3401cf6e-82e4-404c-b216-b980ff407159'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3401cf6e-82e4-404c-b216-b980ff407159'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlandse taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Nederlands' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','3401cf6e-82e4-404c-b216-b980ff407159'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3401cf6e-82e4-404c-b216-b980ff407159'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlandse taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Engels' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','18f53978-1118-4051-a778-b8d7f60ca982'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'18f53978-1118-4051-a778-b8d7f60ca982'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Engels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Frans' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','9f4710e3-f173-404e-b12e-577657a5da04'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9f4710e3-f173-404e-b12e-577657a5da04'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Frans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Duits' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','81a1f605-db58-448d-a1dc-da682316c505'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'81a1f605-db58-448d-a1dc-da682316c505'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duits'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Spaans' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','952bf604-cc38-44e3-889a-a9e74a18da8e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'952bf604-cc38-44e3-889a-a9e74a18da8e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Spaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Turks' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Turks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Arabisch' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','455d527a-bfd0-4460-919e-12e0478a54cf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'455d527a-bfd0-4460-919e-12e0478a54cf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Arabisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Russisch' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','116fbfd6-77d8-4676-8634-8cfd686942c9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'116fbfd6-77d8-4676-8634-8cfd686942c9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Russisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Italiaans' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','aedcfc1c-a676-4f40-8587-4a5f43a354b5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'aedcfc1c-a676-4f40-8587-4a5f43a354b5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Italiaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Fries' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','93a7126d-7307-4b6a-b55a-f4f78e92f680'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'93a7126d-7307-4b6a-b55a-f4f78e92f680'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Fries'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Latijn' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','1cb06441-fc86-49fa-9347-a5869acb3778'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1cb06441-fc86-49fa-9347-a5869acb3778'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Latijn'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Grieks' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','c92a4d95-f2bb-4eb0-8861-0691365f15b1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c92a4d95-f2bb-4eb0-8861-0691365f15b1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Grieks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'wereldorientatie' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','8b194f4d-d757-440d-b8a2-e7427849a6db'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8b194f4d-d757-440d-b8a2-e7427849a6db'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wereldoriëntatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'aardrijkskunde' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','c001f86a-4f8f-4420-bd78-381c615ecedc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c001f86a-4f8f-4420-bd78-381c615ecedc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'geschiedenis' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Geschiedenis'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'natuurwetenschappen' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','f97e788f-5aa6-4ab4-9448-9e27b79daa9e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f97e788f-5aa6-4ab4-9448-9e27b79daa9e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'natuurwetenschappen' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','3b49e7f7-00cc-47ad-8403-32adb3ec31ee'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3b49e7f7-00cc-47ad-8403-32adb3ec31ee'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Algemene natuurwetenschappen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'biologie' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','2b363227-8633-4652-ad57-c61f1efc02c8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2b363227-8633-4652-ad57-c61f1efc02c8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Biologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'natuurkunde' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','e98be5ad-4bd2-4768-a9eb-7e24026e360c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e98be5ad-4bd2-4768-a9eb-7e24026e360c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuurkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'scheikunde' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','3aab168a-9b24-4aca-b0f1-4bfb12e7c288'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3aab168a-9b24-4aca-b0f1-4bfb12e7c288'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Scheikunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'milieu' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','c001f86a-4f8f-4420-bd78-381c615ecedc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c001f86a-4f8f-4420-bd78-381c615ecedc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'techniek' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','c6971373-aa44-4de9-91ef-aca886d42a6a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c6971373-aa44-4de9-91ef-aca886d42a6a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mens%20en%20natuur' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','3a8e841e-ee9a-4790-b6ac-747f54d19ea1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3a8e841e-ee9a-4790-b6ac-747f54d19ea1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mens en natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'kunst%20en%20cultuur' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','4aa16ae7-48c6-4f96-b48d-a67389a7050d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4aa16ae7-48c6-4f96-b48d-a67389a7050d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kunst en cultuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'dans' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','0b1fbf62-4eb4-4af3-a267-3cd3215d6aac'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'0b1fbf62-4eb4-4af3-a267-3cd3215d6aac'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Dans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'drama' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','904a6dbc-c236-42c8-aaa9-a5d7eaa9639f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'904a6dbc-c236-42c8-aaa9-a5d7eaa9639f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Drama'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'muziek' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','7aa6f577-b02d-484a-90d6-72fc80199f9a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7aa6f577-b02d-484a-90d6-72fc80199f9a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Muziek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'beeldende%20vorming' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','4c8a3378-6616-459d-acc4-83ee5a9b91a2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4c8a3378-6616-459d-acc4-83ee5a9b91a2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beeldende vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'handenarbeid' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','f1116b34-14c9-4098-85fb-aed1b9473894'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f1116b34-14c9-4098-85fb-aed1b9473894'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'tekenen' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','5cb7f440-c370-4056-b30d-f57130cccede'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5cb7f440-c370-4056-b30d-f57130cccede'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'schilderen' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','4c8a3378-6616-459d-acc4-83ee5a9b91a2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4c8a3378-6616-459d-acc4-83ee5a9b91a2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beeldende vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'audiovisuele%20vormgeving' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','570aef95-9d43-401d-bac2-b40a6dab4082'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'570aef95-9d43-401d-bac2-b40a6dab4082'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Audiovisuele vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'textiele%20werkvormen' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','5fa492c3-7f83-4e2f-8931-87fc1a2d0048'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5fa492c3-7f83-4e2f-8931-87fc1a2d0048'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Textiele vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'schrijven' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','ddae0006-230f-4f00-b407-9d358a90a27e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ddae0006-230f-4f00-b407-9d358a90a27e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Technisch schrijven'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'informatie-%20en%20communicatietechnologie' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Computervaardigheden/ ICT'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'informatie-%20en%20communicatietechnologie' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','2845473d-ce18-450a-9135-6738abbdc129'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2845473d-ce18-450a-9135-6738abbdc129'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Informatica'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'filosofie' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','d35b903f-1598-4bdd-a2fa-8aba854df762'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d35b903f-1598-4bdd-a2fa-8aba854df762'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Filosofie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'levensbeschouwing' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','37ca9dc8-2560-42de-9aac-590143932b63'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'37ca9dc8-2560-42de-9aac-590143932b63'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Levensbeschouwing'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'lichamelijke%20opvoeding' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','bc7cb521-bdfe-46ab-b635-f2d2189bdd39'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bc7cb521-bdfe-46ab-b635-f2d2189bdd39'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Lichamelijke opvoeding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'sociale%20vaardigheid' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','35d0e3ed-d62e-40a5-8bff-46f1de51e47a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'35d0e3ed-d62e-40a5-8bff-46f1de51e47a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sociaal-emotionele ontwikkeling'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'verkeer' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','d45cf1d7-3d8e-476a-a4ef-a39440820199'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d45cf1d7-3d8e-476a-a4ef-a39440820199'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verkeer'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'verzorging' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'maatschappijleer' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','7596e435-d417-4de8-a32e-8e61f11ee1d2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7596e435-d417-4de8-a32e-8e61f11ee1d2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappijleer'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'management%20en%20organisatie' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','fd3988c5-9648-4c39-9122-93a7260c8bbe'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fd3988c5-9648-4c39-9122-93a7260c8bbe'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Management en organisatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'economie' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','4ba5583f-b147-42cc-a083-ce5ebfd53746'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4ba5583f-b147-42cc-a083-ce5ebfd53746'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'wiskunde' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','7afbb7a6-c29b-425c-9c59-6f79c845f5f0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7afbb7a6-c29b-425c-9c59-6f79c845f5f0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rekenen/wiskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'rekenen' and not(key('classification-by-newIdvdex_classification_discipline_czp_20060628','b48fa351-4561-44c7-a071-ebfd6103eec3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b48fa351-4561-44c7-a071-ebfd6103eec3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="vdex_classification_discipline_czp_20060628_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdvdex_classification_discipline_czp_20060628',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '3401cf6e-82e4-404c-b216-b980ff407159' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','taal') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3401cf6e-82e4-404c-b216-b980ff407159' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Nederlands') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '18f53978-1118-4051-a778-b8d7f60ca982' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Engels') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9f4710e3-f173-404e-b12e-577657a5da04' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Frans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '81a1f605-db58-448d-a1dc-da682316c505' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Duits') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '952bf604-cc38-44e3-889a-a9e74a18da8e' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Spaans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Turks') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '455d527a-bfd0-4460-919e-12e0478a54cf' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Arabisch') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '116fbfd6-77d8-4676-8634-8cfd686942c9' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Russisch') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'aedcfc1c-a676-4f40-8587-4a5f43a354b5' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Italiaans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '93a7126d-7307-4b6a-b55a-f4f78e92f680' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Fries') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1cb06441-fc86-49fa-9347-a5869acb3778' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Latijn') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c92a4d95-f2bb-4eb0-8861-0691365f15b1' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Grieks') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8b194f4d-d757-440d-b8a2-e7427849a6db' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','wereldorientatie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c001f86a-4f8f-4420-bd78-381c615ecedc' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','aardrijkskunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','geschiedenis') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f97e788f-5aa6-4ab4-9448-9e27b79daa9e' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','natuurwetenschappen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3b49e7f7-00cc-47ad-8403-32adb3ec31ee' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','natuurwetenschappen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2b363227-8633-4652-ad57-c61f1efc02c8' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','biologie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e98be5ad-4bd2-4768-a9eb-7e24026e360c' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','natuurkunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3aab168a-9b24-4aca-b0f1-4bfb12e7c288' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','scheikunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c001f86a-4f8f-4420-bd78-381c615ecedc' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','milieu') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c6971373-aa44-4de9-91ef-aca886d42a6a' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','techniek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3a8e841e-ee9a-4790-b6ac-747f54d19ea1' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','mens%20en%20natuur') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4aa16ae7-48c6-4f96-b48d-a67389a7050d' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','kunst%20en%20cultuur') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '0b1fbf62-4eb4-4af3-a267-3cd3215d6aac' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','dans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '904a6dbc-c236-42c8-aaa9-a5d7eaa9639f' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','drama') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7aa6f577-b02d-484a-90d6-72fc80199f9a' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','muziek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','beeldende%20vorming') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f1116b34-14c9-4098-85fb-aed1b9473894' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','handenarbeid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5cb7f440-c370-4056-b30d-f57130cccede' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','tekenen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','schilderen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '570aef95-9d43-401d-bac2-b40a6dab4082' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','audiovisuele%20vormgeving') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5fa492c3-7f83-4e2f-8931-87fc1a2d0048' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','textiele%20werkvormen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ddae0006-230f-4f00-b407-9d358a90a27e' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','schrijven') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','informatie-%20en%20communicatietechnologie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2845473d-ce18-450a-9135-6738abbdc129' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','informatie-%20en%20communicatietechnologie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd35b903f-1598-4bdd-a2fa-8aba854df762' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','filosofie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '37ca9dc8-2560-42de-9aac-590143932b63' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','levensbeschouwing') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bc7cb521-bdfe-46ab-b635-f2d2189bdd39' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','lichamelijke%20opvoeding') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '35d0e3ed-d62e-40a5-8bff-46f1de51e47a' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','sociale%20vaardigheid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd45cf1d7-3d8e-476a-a4ef-a39440820199' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','verkeer') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','verzorging') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7596e435-d417-4de8-a32e-8e61f11ee1d2' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','maatschappijleer') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'fd3988c5-9648-4c39-9122-93a7260c8bbe' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','management%20en%20organisatie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4ba5583f-b147-42cc-a083-ce5ebfd53746' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','economie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7afbb7a6-c29b-425c-9c59-6f79c845f5f0' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','wiskunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b48fa351-4561-44c7-a071-ebfd6103eec3' and key('classification-by-oldIdvdex_classification_discipline_czp_20060628','rekenen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != '3401cf6e-82e4-404c-b216-b980ff407159' and descendant::*[local-name() = 'id'] != '3401cf6e-82e4-404c-b216-b980ff407159' and descendant::*[local-name() = 'id'] != '18f53978-1118-4051-a778-b8d7f60ca982' and descendant::*[local-name() = 'id'] != '9f4710e3-f173-404e-b12e-577657a5da04' and descendant::*[local-name() = 'id'] != '81a1f605-db58-448d-a1dc-da682316c505' and descendant::*[local-name() = 'id'] != '952bf604-cc38-44e3-889a-a9e74a18da8e' and descendant::*[local-name() = 'id'] != '96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9' and descendant::*[local-name() = 'id'] != '455d527a-bfd0-4460-919e-12e0478a54cf' and descendant::*[local-name() = 'id'] != '116fbfd6-77d8-4676-8634-8cfd686942c9' and descendant::*[local-name() = 'id'] != 'aedcfc1c-a676-4f40-8587-4a5f43a354b5' and descendant::*[local-name() = 'id'] != '93a7126d-7307-4b6a-b55a-f4f78e92f680' and descendant::*[local-name() = 'id'] != '1cb06441-fc86-49fa-9347-a5869acb3778' and descendant::*[local-name() = 'id'] != 'c92a4d95-f2bb-4eb0-8861-0691365f15b1' and descendant::*[local-name() = 'id'] != '8b194f4d-d757-440d-b8a2-e7427849a6db' and descendant::*[local-name() = 'id'] != 'c001f86a-4f8f-4420-bd78-381c615ecedc' and descendant::*[local-name() = 'id'] != 'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d' and descendant::*[local-name() = 'id'] != 'f97e788f-5aa6-4ab4-9448-9e27b79daa9e' and descendant::*[local-name() = 'id'] != '3b49e7f7-00cc-47ad-8403-32adb3ec31ee' and descendant::*[local-name() = 'id'] != '2b363227-8633-4652-ad57-c61f1efc02c8' and descendant::*[local-name() = 'id'] != 'e98be5ad-4bd2-4768-a9eb-7e24026e360c' and descendant::*[local-name() = 'id'] != '3aab168a-9b24-4aca-b0f1-4bfb12e7c288' and descendant::*[local-name() = 'id'] != 'c001f86a-4f8f-4420-bd78-381c615ecedc' and descendant::*[local-name() = 'id'] != 'c6971373-aa44-4de9-91ef-aca886d42a6a' and descendant::*[local-name() = 'id'] != '3a8e841e-ee9a-4790-b6ac-747f54d19ea1' and descendant::*[local-name() = 'id'] != '4aa16ae7-48c6-4f96-b48d-a67389a7050d' and descendant::*[local-name() = 'id'] != '0b1fbf62-4eb4-4af3-a267-3cd3215d6aac' and descendant::*[local-name() = 'id'] != '904a6dbc-c236-42c8-aaa9-a5d7eaa9639f' and descendant::*[local-name() = 'id'] != '7aa6f577-b02d-484a-90d6-72fc80199f9a' and descendant::*[local-name() = 'id'] != '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and descendant::*[local-name() = 'id'] != 'f1116b34-14c9-4098-85fb-aed1b9473894' and descendant::*[local-name() = 'id'] != '5cb7f440-c370-4056-b30d-f57130cccede' and descendant::*[local-name() = 'id'] != '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and descendant::*[local-name() = 'id'] != '570aef95-9d43-401d-bac2-b40a6dab4082' and descendant::*[local-name() = 'id'] != '5fa492c3-7f83-4e2f-8931-87fc1a2d0048' and descendant::*[local-name() = 'id'] != 'ddae0006-230f-4f00-b407-9d358a90a27e' and descendant::*[local-name() = 'id'] != 'e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138' and descendant::*[local-name() = 'id'] != '2845473d-ce18-450a-9135-6738abbdc129' and descendant::*[local-name() = 'id'] != 'd35b903f-1598-4bdd-a2fa-8aba854df762' and descendant::*[local-name() = 'id'] != '37ca9dc8-2560-42de-9aac-590143932b63' and descendant::*[local-name() = 'id'] != 'bc7cb521-bdfe-46ab-b635-f2d2189bdd39' and descendant::*[local-name() = 'id'] != '35d0e3ed-d62e-40a5-8bff-46f1de51e47a' and descendant::*[local-name() = 'id'] != 'd45cf1d7-3d8e-476a-a4ef-a39440820199' and descendant::*[local-name() = 'id'] != 'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d' and descendant::*[local-name() = 'id'] != '7596e435-d417-4de8-a32e-8e61f11ee1d2' and descendant::*[local-name() = 'id'] != 'fd3988c5-9648-4c39-9122-93a7260c8bbe' and descendant::*[local-name() = 'id'] != '4ba5583f-b147-42cc-a083-ce5ebfd53746' and descendant::*[local-name() = 'id'] != '7afbb7a6-c29b-425c-9c59-6f79c845f5f0' and descendant::*[local-name() = 'id'] != 'b48fa351-4561-44c7-a071-ebfd6103eec3'"/>
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
<xsl:text>http://purl.edustandaard.nl/vdex_classification_discipline_czp_20060628.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldvdex_classification_discipline_czp_20060628"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldvdex_classification_discipline_czp_20060628">
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = '3401cf6e-82e4-404c-b216-b980ff407159' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','taal'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'taal'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlandse taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3401cf6e-82e4-404c-b216-b980ff407159' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Nederlands'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Nederlands'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlandse taal'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '18f53978-1118-4051-a778-b8d7f60ca982' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Engels'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Engels'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Engels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9f4710e3-f173-404e-b12e-577657a5da04' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Frans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Frans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Frans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '81a1f605-db58-448d-a1dc-da682316c505' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Duits'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Duits'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duits'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '952bf604-cc38-44e3-889a-a9e74a18da8e' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Spaans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Spaans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Spaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Turks'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Turks'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Turks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '455d527a-bfd0-4460-919e-12e0478a54cf' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Arabisch'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Arabisch'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Arabisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '116fbfd6-77d8-4676-8634-8cfd686942c9' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Russisch'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Russisch'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Russisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'aedcfc1c-a676-4f40-8587-4a5f43a354b5' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Italiaans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Italiaans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Italiaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '93a7126d-7307-4b6a-b55a-f4f78e92f680' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Fries'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Fries'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Fries'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1cb06441-fc86-49fa-9347-a5869acb3778' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Latijn'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Latijn'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Latijn'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c92a4d95-f2bb-4eb0-8861-0691365f15b1' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','Grieks'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Grieks'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Grieks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8b194f4d-d757-440d-b8a2-e7427849a6db' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','wereldorientatie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'wereldorientatie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wereldoriëntatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c001f86a-4f8f-4420-bd78-381c615ecedc' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','aardrijkskunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'aardrijkskunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','geschiedenis'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'geschiedenis'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Geschiedenis'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f97e788f-5aa6-4ab4-9448-9e27b79daa9e' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','natuurwetenschappen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'natuurwetenschappen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3b49e7f7-00cc-47ad-8403-32adb3ec31ee' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','natuurwetenschappen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'natuurwetenschappen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Algemene natuurwetenschappen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2b363227-8633-4652-ad57-c61f1efc02c8' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','biologie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'biologie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Biologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e98be5ad-4bd2-4768-a9eb-7e24026e360c' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','natuurkunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'natuurkunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuurkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3aab168a-9b24-4aca-b0f1-4bfb12e7c288' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','scheikunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'scheikunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Scheikunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c001f86a-4f8f-4420-bd78-381c615ecedc' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','milieu'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'milieu'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c6971373-aa44-4de9-91ef-aca886d42a6a' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','techniek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'techniek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3a8e841e-ee9a-4790-b6ac-747f54d19ea1' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','mens%20en%20natuur'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mens%20en%20natuur'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mens en natuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4aa16ae7-48c6-4f96-b48d-a67389a7050d' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','kunst%20en%20cultuur'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'kunst%20en%20cultuur'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kunst en cultuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '0b1fbf62-4eb4-4af3-a267-3cd3215d6aac' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','dans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Dans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '904a6dbc-c236-42c8-aaa9-a5d7eaa9639f' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','drama'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'drama'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Drama'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7aa6f577-b02d-484a-90d6-72fc80199f9a' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','muziek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'muziek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Muziek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','beeldende%20vorming'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'beeldende%20vorming'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beeldende vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f1116b34-14c9-4098-85fb-aed1b9473894' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','handenarbeid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'handenarbeid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5cb7f440-c370-4056-b30d-f57130cccede' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','tekenen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'tekenen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','schilderen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'schilderen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beeldende vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '570aef95-9d43-401d-bac2-b40a6dab4082' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','audiovisuele%20vormgeving'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'audiovisuele%20vormgeving'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Audiovisuele vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5fa492c3-7f83-4e2f-8931-87fc1a2d0048' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','textiele%20werkvormen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'textiele%20werkvormen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Textiele vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ddae0006-230f-4f00-b407-9d358a90a27e' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','schrijven'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'schrijven'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Technisch schrijven'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e8e7fa96-dfc6-4d6d-a41b-a44c1b5b4138' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','informatie-%20en%20communicatietechnologie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'informatie-%20en%20communicatietechnologie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Computervaardigheden/ ICT'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2845473d-ce18-450a-9135-6738abbdc129' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','informatie-%20en%20communicatietechnologie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'informatie-%20en%20communicatietechnologie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Informatica'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd35b903f-1598-4bdd-a2fa-8aba854df762' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','filosofie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'filosofie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Filosofie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '37ca9dc8-2560-42de-9aac-590143932b63' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','levensbeschouwing'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'levensbeschouwing'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Levensbeschouwing'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bc7cb521-bdfe-46ab-b635-f2d2189bdd39' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','lichamelijke%20opvoeding'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'lichamelijke%20opvoeding'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Lichamelijke opvoeding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '35d0e3ed-d62e-40a5-8bff-46f1de51e47a' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','sociale%20vaardigheid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'sociale%20vaardigheid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sociaal-emotionele ontwikkeling'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd45cf1d7-3d8e-476a-a4ef-a39440820199' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','verkeer'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'verkeer'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verkeer'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','verzorging'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'verzorging'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7596e435-d417-4de8-a32e-8e61f11ee1d2' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','maatschappijleer'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'maatschappijleer'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappijleer'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'fd3988c5-9648-4c39-9122-93a7260c8bbe' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','management%20en%20organisatie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'management%20en%20organisatie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Management en organisatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4ba5583f-b147-42cc-a083-ce5ebfd53746' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','economie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'economie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7afbb7a6-c29b-425c-9c59-6f79c845f5f0' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','wiskunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'wiskunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rekenen/wiskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b48fa351-4561-44c7-a071-ebfd6103eec3' and not(key('classification-by-oldIdvdex_classification_discipline_czp_20060628','rekenen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'rekenen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Rekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>




</xsl:stylesheet>

