<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdvdex_classification_educationallevel_czp_20071115" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'educational level']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_educationallevel_czp_20071115" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'educational level']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_educationallevel_czp_20071115')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_educationallevel_czp_20071115_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'SBaO' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e05b5eb1-6a65-4f45-9556-79b25cd91da8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'SO' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e7f1c08f-08fb-48ab-be8e-c131b1bce54a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'VVE' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','15d693b8-fbe1-4112-8135-4a20aba5101c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'PO' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','512e4729-03a4-43a2-95ba-758071d1b725') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','82ca4442-246c-44b3-a562-7b101793feb4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','c007e4dd-a3d4-4f33-902d-778e3bbeeddb') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','5c072b3f-7f58-40ee-9799-27981f0a6b2b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep5' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','bc213214-b83d-4673-b9c1-8fdaa63d6d56') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep6' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','abfb190f-e814-46f5-a9cc-ebd53f04018e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep7' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a4813bb6-cf63-4594-af56-6afb321723d8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'po_groep8' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','95138558-9f65-4888-8ea3-8acce5eea273') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'VO' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','2a1401e9-c223-493b-9b86-78f6993b1a8d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'praktonderwijs' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','d6f1bbf7-c1a6-4431-bcbd-f33126d851ef') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','c7942bb1-bf4f-409f-bc98-9a0b02f175dc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_bl1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','50746437-08f3-4559-8af3-3fa6e05d1a44') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_kl1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','12e85a55-b3ae-4e7f-a2a0-d645f4c573bf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_gl1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','8ae2af2d-890e-49d6-95cb-3619acb5c2cf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_tl1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','54edd410-2315-4eb3-a573-0e1cd59184fd') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_bl2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','9716fc83-479c-48da-be13-2fdd74e3b692') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_kl2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','30ce6ff5-d654-4a97-a6d4-9c8936f87ca6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_gl2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','05d90293-e675-44f4-bcd7-1f67161f6734') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_tl2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','90a5a228-e8de-473d-84cc-a915bf6107dd') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_bl3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e56a05b1-a9af-432f-a7ac-b7401d8e95fb') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_kl3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','f61c889e-4731-4321-802d-c7e86081499c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_gl3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','49af771b-6d9e-4d8f-bcaf-ac9cc9ee753e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_tl3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e51e6137-05d4-45ca-aed0-6e91551257d4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_bl4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','45403807-f052-4e09-a95c-b2e1c10c6c89') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_kl4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e72dacdd-968b-40ac-ad2c-8bd14c24e89f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_gl4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','ee1eada7-7866-45e6-b1d8-b7062a8fe08a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vmbo_tl4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','84f30df0-f194-435e-98c8-c4559756ec24') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'havo' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a3ddbe60-8478-4204-b769-6f5e9f4cbca2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'havo1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','78f5cabe-6649-4dc3-84bf-36d82c6c2d31') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'havo2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','eaa0c07f-193e-4be5-8dc6-a00bbfc7a446') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'havo3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','af3ecd88-a654-4458-9c5b-1e1f7d09f463') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'havo4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','70af3752-c6ad-43d9-aa0c-9ff099931f8a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'havo5' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','cb61531d-61eb-4412-a52f-ca065ca37e39') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vwo' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','ad9872e5-edc4-4a62-9ee7-ba7daceba2e0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vwo1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','ac188375-0a1a-4984-ac80-14d04a086a19') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vwo2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','17da6976-2f1b-4214-a471-168f469d7e04') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vwo3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','b924d4ad-65a1-41dc-b704-c7786eb4aec0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vwo4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e2026706-0829-4a4c-b726-9409b6f407e1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vwo5' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','f2513775-3d54-423b-803b-15e06a8c89a8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vwo6' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','85d15c83-e2b4-4359-8475-a355591aaa1a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'HBO' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','be140797-803f-4b9e-81cc-5572c711e09c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'WO' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','bbbd99c6-cf49-4980-baed-12388f8dcff4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'BVE' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','caa97efc-a713-41ea-a845-1534ca65eac9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mbo' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','f3ac3fbb-5eae-49e0-8494-0a44855fff25') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mbo_niveau1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a598e56e-d1a6-4907-9e2c-3da64e59f9ae') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mbo_niveau2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','00ace3c7-d7a8-41e6-83b1-7f13a9af7668') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mbo_niveau3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','654931e1-6f8b-4f72-aa4b-92c99c72c347') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mbo_niveau4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','8beca7eb-95a5-4c7d-9704-2d2a2fc4bc65') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'educatie' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','431f5942-4c61-42a5-b33d-638b82e0c4f6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'educatie_niveau1' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','6219cc2d-2545-4893-84a0-30395794f2f4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'educatie_niveau2' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e0a398b0-838b-409e-807a-f0f587dfd7c7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'educatie_niveau3' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','de5e9d28-7c80-4167-8d34-74520a55c27d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'educatie_niveau4' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','655a4e1f-c9cf-464b-868e-f8aa2c813b89') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'vavo' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a05ae1d7-8868-46e8-a4ed-eb6da166499d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bedrijfsopleiding' and key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a3c394bc-44a2-4afe-b7b4-044633b84121') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != 'SBaO' and descendant::*[local-name() = 'id'] != 'SO' and descendant::*[local-name() = 'id'] != 'VVE' and descendant::*[local-name() = 'id'] != 'PO' and descendant::*[local-name() = 'id'] != 'po_groep1' and descendant::*[local-name() = 'id'] != 'po_groep2' and descendant::*[local-name() = 'id'] != 'po_groep3' and descendant::*[local-name() = 'id'] != 'po_groep4' and descendant::*[local-name() = 'id'] != 'po_groep5' and descendant::*[local-name() = 'id'] != 'po_groep6' and descendant::*[local-name() = 'id'] != 'po_groep7' and descendant::*[local-name() = 'id'] != 'po_groep8' and descendant::*[local-name() = 'id'] != 'VO' and descendant::*[local-name() = 'id'] != 'praktonderwijs' and descendant::*[local-name() = 'id'] != 'vmbo' and descendant::*[local-name() = 'id'] != 'vmbo_bl1' and descendant::*[local-name() = 'id'] != 'vmbo_kl1' and descendant::*[local-name() = 'id'] != 'vmbo_gl1' and descendant::*[local-name() = 'id'] != 'vmbo_tl1' and descendant::*[local-name() = 'id'] != 'vmbo_bl2' and descendant::*[local-name() = 'id'] != 'vmbo_kl2' and descendant::*[local-name() = 'id'] != 'vmbo_gl2' and descendant::*[local-name() = 'id'] != 'vmbo_tl2' and descendant::*[local-name() = 'id'] != 'vmbo_bl3' and descendant::*[local-name() = 'id'] != 'vmbo_kl3' and descendant::*[local-name() = 'id'] != 'vmbo_gl3' and descendant::*[local-name() = 'id'] != 'vmbo_tl3' and descendant::*[local-name() = 'id'] != 'vmbo_bl4' and descendant::*[local-name() = 'id'] != 'vmbo_kl4' and descendant::*[local-name() = 'id'] != 'vmbo_gl4' and descendant::*[local-name() = 'id'] != 'vmbo_tl4' and descendant::*[local-name() = 'id'] != 'havo' and descendant::*[local-name() = 'id'] != 'havo1' and descendant::*[local-name() = 'id'] != 'havo2' and descendant::*[local-name() = 'id'] != 'havo3' and descendant::*[local-name() = 'id'] != 'havo4' and descendant::*[local-name() = 'id'] != 'havo5' and descendant::*[local-name() = 'id'] != 'vwo' and descendant::*[local-name() = 'id'] != 'vwo1' and descendant::*[local-name() = 'id'] != 'vwo2' and descendant::*[local-name() = 'id'] != 'vwo3' and descendant::*[local-name() = 'id'] != 'vwo4' and descendant::*[local-name() = 'id'] != 'vwo5' and descendant::*[local-name() = 'id'] != 'vwo6' and descendant::*[local-name() = 'id'] != 'HBO' and descendant::*[local-name() = 'id'] != 'WO' and descendant::*[local-name() = 'id'] != 'BVE' and descendant::*[local-name() = 'id'] != 'mbo' and descendant::*[local-name() = 'id'] != 'mbo_niveau1' and descendant::*[local-name() = 'id'] != 'mbo_niveau2' and descendant::*[local-name() = 'id'] != 'mbo_niveau3' and descendant::*[local-name() = 'id'] != 'mbo_niveau4' and descendant::*[local-name() = 'id'] != 'educatie' and descendant::*[local-name() = 'id'] != 'educatie_niveau1' and descendant::*[local-name() = 'id'] != 'educatie_niveau2' and descendant::*[local-name() = 'id'] != 'educatie_niveau3' and descendant::*[local-name() = 'id'] != 'educatie_niveau4' and descendant::*[local-name() = 'id'] != 'vavo' and descendant::*[local-name() = 'id'] != 'bedrijfsopleiding'"/>
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
<xsl:text>educational level</xsl:text>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_educationallevel_czp_20071115"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_educationallevel_czp_20071115">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'educational level'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_educationallevel_czp_20071115')]">
<xsl:choose>
<xsl:when test="node() = 'SBaO' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e05b5eb1-6a65-4f45-9556-79b25cd91da8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e05b5eb1-6a65-4f45-9556-79b25cd91da8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Speciaal basisonderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'SO' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e7f1c08f-08fb-48ab-be8e-c131b1bce54a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e7f1c08f-08fb-48ab-be8e-c131b1bce54a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Speciaal onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'VVE' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','15d693b8-fbe1-4112-8135-4a20aba5101c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'15d693b8-fbe1-4112-8135-4a20aba5101c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voor- en vroegschoolse educatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'PO' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','512e4729-03a4-43a2-95ba-758071d1b725'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'512e4729-03a4-43a2-95ba-758071d1b725'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Primair onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','82ca4442-246c-44b3-a562-7b101793feb4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'82ca4442-246c-44b3-a562-7b101793feb4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','c007e4dd-a3d4-4f33-902d-778e3bbeeddb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c007e4dd-a3d4-4f33-902d-778e3bbeeddb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','5c072b3f-7f58-40ee-9799-27981f0a6b2b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5c072b3f-7f58-40ee-9799-27981f0a6b2b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep5' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','bc213214-b83d-4673-b9c1-8fdaa63d6d56'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bc213214-b83d-4673-b9c1-8fdaa63d6d56'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 5'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep6' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','abfb190f-e814-46f5-a9cc-ebd53f04018e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'abfb190f-e814-46f5-a9cc-ebd53f04018e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 6'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep7' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a4813bb6-cf63-4594-af56-6afb321723d8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a4813bb6-cf63-4594-af56-6afb321723d8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 7'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'po_groep8' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','95138558-9f65-4888-8ea3-8acce5eea273'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'95138558-9f65-4888-8ea3-8acce5eea273'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 8'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'VO' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','2a1401e9-c223-493b-9b86-78f6993b1a8d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2a1401e9-c223-493b-9b86-78f6993b1a8d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voortgezet onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'praktonderwijs' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','d6f1bbf7-c1a6-4431-bcbd-f33126d851ef'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d6f1bbf7-c1a6-4431-bcbd-f33126d851ef'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Praktijkonderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','c7942bb1-bf4f-409f-bc98-9a0b02f175dc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c7942bb1-bf4f-409f-bc98-9a0b02f175dc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_bl1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','50746437-08f3-4559-8af3-3fa6e05d1a44'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'50746437-08f3-4559-8af3-3fa6e05d1a44'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_kl1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','12e85a55-b3ae-4e7f-a2a0-d645f4c573bf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'12e85a55-b3ae-4e7f-a2a0-d645f4c573bf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_gl1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','8ae2af2d-890e-49d6-95cb-3619acb5c2cf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8ae2af2d-890e-49d6-95cb-3619acb5c2cf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_tl1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','54edd410-2315-4eb3-a573-0e1cd59184fd'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'54edd410-2315-4eb3-a573-0e1cd59184fd'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_bl2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','9716fc83-479c-48da-be13-2fdd74e3b692'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9716fc83-479c-48da-be13-2fdd74e3b692'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_kl2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','30ce6ff5-d654-4a97-a6d4-9c8936f87ca6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'30ce6ff5-d654-4a97-a6d4-9c8936f87ca6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_gl2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','05d90293-e675-44f4-bcd7-1f67161f6734'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'05d90293-e675-44f4-bcd7-1f67161f6734'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_tl2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','90a5a228-e8de-473d-84cc-a915bf6107dd'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'90a5a228-e8de-473d-84cc-a915bf6107dd'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_bl3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e56a05b1-a9af-432f-a7ac-b7401d8e95fb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e56a05b1-a9af-432f-a7ac-b7401d8e95fb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_kl3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','f61c889e-4731-4321-802d-c7e86081499c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f61c889e-4731-4321-802d-c7e86081499c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_gl3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','49af771b-6d9e-4d8f-bcaf-ac9cc9ee753e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'49af771b-6d9e-4d8f-bcaf-ac9cc9ee753e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_tl3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e51e6137-05d4-45ca-aed0-6e91551257d4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e51e6137-05d4-45ca-aed0-6e91551257d4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_bl4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','45403807-f052-4e09-a95c-b2e1c10c6c89'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'45403807-f052-4e09-a95c-b2e1c10c6c89'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_kl4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e72dacdd-968b-40ac-ad2c-8bd14c24e89f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e72dacdd-968b-40ac-ad2c-8bd14c24e89f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_gl4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','ee1eada7-7866-45e6-b1d8-b7062a8fe08a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ee1eada7-7866-45e6-b1d8-b7062a8fe08a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vmbo_tl4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','84f30df0-f194-435e-98c8-c4559756ec24'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'84f30df0-f194-435e-98c8-c4559756ec24'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'havo' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a3ddbe60-8478-4204-b769-6f5e9f4cbca2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a3ddbe60-8478-4204-b769-6f5e9f4cbca2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'havo1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','78f5cabe-6649-4dc3-84bf-36d82c6c2d31'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'78f5cabe-6649-4dc3-84bf-36d82c6c2d31'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'havo2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','eaa0c07f-193e-4be5-8dc6-a00bbfc7a446'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'eaa0c07f-193e-4be5-8dc6-a00bbfc7a446'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'havo3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','af3ecd88-a654-4458-9c5b-1e1f7d09f463'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'af3ecd88-a654-4458-9c5b-1e1f7d09f463'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'havo4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','70af3752-c6ad-43d9-aa0c-9ff099931f8a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'70af3752-c6ad-43d9-aa0c-9ff099931f8a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'havo5' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','cb61531d-61eb-4412-a52f-ca065ca37e39'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'cb61531d-61eb-4412-a52f-ca065ca37e39'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 5'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vwo' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','ad9872e5-edc4-4a62-9ee7-ba7daceba2e0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ad9872e5-edc4-4a62-9ee7-ba7daceba2e0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vwo1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','ac188375-0a1a-4984-ac80-14d04a086a19'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ac188375-0a1a-4984-ac80-14d04a086a19'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vwo2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','17da6976-2f1b-4214-a471-168f469d7e04'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'17da6976-2f1b-4214-a471-168f469d7e04'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vwo3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','b924d4ad-65a1-41dc-b704-c7786eb4aec0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b924d4ad-65a1-41dc-b704-c7786eb4aec0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vwo4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e2026706-0829-4a4c-b726-9409b6f407e1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e2026706-0829-4a4c-b726-9409b6f407e1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vwo5' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','f2513775-3d54-423b-803b-15e06a8c89a8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f2513775-3d54-423b-803b-15e06a8c89a8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 5'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vwo6' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','85d15c83-e2b4-4359-8475-a355591aaa1a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'85d15c83-e2b4-4359-8475-a355591aaa1a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 6'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'HBO' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','be140797-803f-4b9e-81cc-5572c711e09c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'be140797-803f-4b9e-81cc-5572c711e09c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Hoger beroepsonderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'WO' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','bbbd99c6-cf49-4980-baed-12388f8dcff4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bbbd99c6-cf49-4980-baed-12388f8dcff4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wetenschappelijk onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'BVE' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','caa97efc-a713-41ea-a845-1534ca65eac9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'caa97efc-a713-41ea-a845-1534ca65eac9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beroepsonderwijs en Volwasseneneducatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mbo' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','f3ac3fbb-5eae-49e0-8494-0a44855fff25'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f3ac3fbb-5eae-49e0-8494-0a44855fff25'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mbo_niveau1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a598e56e-d1a6-4907-9e2c-3da64e59f9ae'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a598e56e-d1a6-4907-9e2c-3da64e59f9ae'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 1: Assistentenopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mbo_niveau2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','00ace3c7-d7a8-41e6-83b1-7f13a9af7668'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'00ace3c7-d7a8-41e6-83b1-7f13a9af7668'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 2: Basisberoepsopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mbo_niveau3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','654931e1-6f8b-4f72-aa4b-92c99c72c347'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'654931e1-6f8b-4f72-aa4b-92c99c72c347'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 3: Vakopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mbo_niveau4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','8beca7eb-95a5-4c7d-9704-2d2a2fc4bc65'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'8beca7eb-95a5-4c7d-9704-2d2a2fc4bc65'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 4: Middenkaderopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'educatie' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','431f5942-4c61-42a5-b33d-638b82e0c4f6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'431f5942-4c61-42a5-b33d-638b82e0c4f6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'educatie_niveau1' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','6219cc2d-2545-4893-84a0-30395794f2f4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6219cc2d-2545-4893-84a0-30395794f2f4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'educatie_niveau2' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','e0a398b0-838b-409e-807a-f0f587dfd7c7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e0a398b0-838b-409e-807a-f0f587dfd7c7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'educatie_niveau3' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','de5e9d28-7c80-4167-8d34-74520a55c27d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'de5e9d28-7c80-4167-8d34-74520a55c27d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'educatie_niveau4' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','655a4e1f-c9cf-464b-868e-f8aa2c813b89'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'655a4e1f-c9cf-464b-868e-f8aa2c813b89'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'vavo' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a05ae1d7-8868-46e8-a4ed-eb6da166499d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a05ae1d7-8868-46e8-a4ed-eb6da166499d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VAVO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bedrijfsopleiding' and not(key('classification-by-newIdvdex_classification_educationallevel_czp_20071115','a3c394bc-44a2-4afe-b7b4-044633b84121'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a3c394bc-44a2-4afe-b7b4-044633b84121'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bedrijfsopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="vdex_classification_educationallevel_czp_20071115_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdvdex_classification_educationallevel_czp_20071115',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e05b5eb1-6a65-4f45-9556-79b25cd91da8' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','SBaO') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e7f1c08f-08fb-48ab-be8e-c131b1bce54a' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','SO') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '15d693b8-fbe1-4112-8135-4a20aba5101c' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','VVE') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '512e4729-03a4-43a2-95ba-758071d1b725' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','PO') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '82ca4442-246c-44b3-a562-7b101793feb4' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c007e4dd-a3d4-4f33-902d-778e3bbeeddb' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5c072b3f-7f58-40ee-9799-27981f0a6b2b' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bc213214-b83d-4673-b9c1-8fdaa63d6d56' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'abfb190f-e814-46f5-a9cc-ebd53f04018e' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a4813bb6-cf63-4594-af56-6afb321723d8' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '95138558-9f65-4888-8ea3-8acce5eea273' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2a1401e9-c223-493b-9b86-78f6993b1a8d' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','VO') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd6f1bbf7-c1a6-4431-bcbd-f33126d851ef' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','praktonderwijs') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c7942bb1-bf4f-409f-bc98-9a0b02f175dc' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '50746437-08f3-4559-8af3-3fa6e05d1a44' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12e85a55-b3ae-4e7f-a2a0-d645f4c573bf' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8ae2af2d-890e-49d6-95cb-3619acb5c2cf' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '54edd410-2315-4eb3-a573-0e1cd59184fd' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9716fc83-479c-48da-be13-2fdd74e3b692' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '30ce6ff5-d654-4a97-a6d4-9c8936f87ca6' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '05d90293-e675-44f4-bcd7-1f67161f6734' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '90a5a228-e8de-473d-84cc-a915bf6107dd' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e56a05b1-a9af-432f-a7ac-b7401d8e95fb' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f61c889e-4731-4321-802d-c7e86081499c' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '49af771b-6d9e-4d8f-bcaf-ac9cc9ee753e' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e51e6137-05d4-45ca-aed0-6e91551257d4' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '45403807-f052-4e09-a95c-b2e1c10c6c89' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e72dacdd-968b-40ac-ad2c-8bd14c24e89f' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ee1eada7-7866-45e6-b1d8-b7062a8fe08a' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '84f30df0-f194-435e-98c8-c4559756ec24' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a3ddbe60-8478-4204-b769-6f5e9f4cbca2' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '78f5cabe-6649-4dc3-84bf-36d82c6c2d31' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'eaa0c07f-193e-4be5-8dc6-a00bbfc7a446' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'af3ecd88-a654-4458-9c5b-1e1f7d09f463' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '70af3752-c6ad-43d9-aa0c-9ff099931f8a' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'cb61531d-61eb-4412-a52f-ca065ca37e39' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ad9872e5-edc4-4a62-9ee7-ba7daceba2e0' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ac188375-0a1a-4984-ac80-14d04a086a19' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '17da6976-2f1b-4214-a471-168f469d7e04' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b924d4ad-65a1-41dc-b704-c7786eb4aec0' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e2026706-0829-4a4c-b726-9409b6f407e1' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f2513775-3d54-423b-803b-15e06a8c89a8' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '85d15c83-e2b4-4359-8475-a355591aaa1a' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo6') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'be140797-803f-4b9e-81cc-5572c711e09c' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','HBO') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bbbd99c6-cf49-4980-baed-12388f8dcff4' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','WO') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'caa97efc-a713-41ea-a845-1534ca65eac9' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','BVE') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f3ac3fbb-5eae-49e0-8494-0a44855fff25' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a598e56e-d1a6-4907-9e2c-3da64e59f9ae' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '00ace3c7-d7a8-41e6-83b1-7f13a9af7668' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '654931e1-6f8b-4f72-aa4b-92c99c72c347' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '8beca7eb-95a5-4c7d-9704-2d2a2fc4bc65' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '431f5942-4c61-42a5-b33d-638b82e0c4f6' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6219cc2d-2545-4893-84a0-30395794f2f4' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e0a398b0-838b-409e-807a-f0f587dfd7c7' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'de5e9d28-7c80-4167-8d34-74520a55c27d' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '655a4e1f-c9cf-464b-868e-f8aa2c813b89' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a05ae1d7-8868-46e8-a4ed-eb6da166499d' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vavo') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a3c394bc-44a2-4afe-b7b4-044633b84121' and key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','bedrijfsopleiding') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != 'e05b5eb1-6a65-4f45-9556-79b25cd91da8' and descendant::*[local-name() = 'id'] != 'e7f1c08f-08fb-48ab-be8e-c131b1bce54a' and descendant::*[local-name() = 'id'] != '15d693b8-fbe1-4112-8135-4a20aba5101c' and descendant::*[local-name() = 'id'] != '512e4729-03a4-43a2-95ba-758071d1b725' and descendant::*[local-name() = 'id'] != '82ca4442-246c-44b3-a562-7b101793feb4' and descendant::*[local-name() = 'id'] != 'c007e4dd-a3d4-4f33-902d-778e3bbeeddb' and descendant::*[local-name() = 'id'] != '25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4' and descendant::*[local-name() = 'id'] != '5c072b3f-7f58-40ee-9799-27981f0a6b2b' and descendant::*[local-name() = 'id'] != 'bc213214-b83d-4673-b9c1-8fdaa63d6d56' and descendant::*[local-name() = 'id'] != 'abfb190f-e814-46f5-a9cc-ebd53f04018e' and descendant::*[local-name() = 'id'] != 'a4813bb6-cf63-4594-af56-6afb321723d8' and descendant::*[local-name() = 'id'] != '95138558-9f65-4888-8ea3-8acce5eea273' and descendant::*[local-name() = 'id'] != '2a1401e9-c223-493b-9b86-78f6993b1a8d' and descendant::*[local-name() = 'id'] != 'd6f1bbf7-c1a6-4431-bcbd-f33126d851ef' and descendant::*[local-name() = 'id'] != 'c7942bb1-bf4f-409f-bc98-9a0b02f175dc' and descendant::*[local-name() = 'id'] != '50746437-08f3-4559-8af3-3fa6e05d1a44' and descendant::*[local-name() = 'id'] != '12e85a55-b3ae-4e7f-a2a0-d645f4c573bf' and descendant::*[local-name() = 'id'] != '8ae2af2d-890e-49d6-95cb-3619acb5c2cf' and descendant::*[local-name() = 'id'] != '54edd410-2315-4eb3-a573-0e1cd59184fd' and descendant::*[local-name() = 'id'] != '9716fc83-479c-48da-be13-2fdd74e3b692' and descendant::*[local-name() = 'id'] != '30ce6ff5-d654-4a97-a6d4-9c8936f87ca6' and descendant::*[local-name() = 'id'] != '05d90293-e675-44f4-bcd7-1f67161f6734' and descendant::*[local-name() = 'id'] != '90a5a228-e8de-473d-84cc-a915bf6107dd' and descendant::*[local-name() = 'id'] != 'e56a05b1-a9af-432f-a7ac-b7401d8e95fb' and descendant::*[local-name() = 'id'] != 'f61c889e-4731-4321-802d-c7e86081499c' and descendant::*[local-name() = 'id'] != '49af771b-6d9e-4d8f-bcaf-ac9cc9ee753e' and descendant::*[local-name() = 'id'] != 'e51e6137-05d4-45ca-aed0-6e91551257d4' and descendant::*[local-name() = 'id'] != '45403807-f052-4e09-a95c-b2e1c10c6c89' and descendant::*[local-name() = 'id'] != 'e72dacdd-968b-40ac-ad2c-8bd14c24e89f' and descendant::*[local-name() = 'id'] != 'ee1eada7-7866-45e6-b1d8-b7062a8fe08a' and descendant::*[local-name() = 'id'] != '84f30df0-f194-435e-98c8-c4559756ec24' and descendant::*[local-name() = 'id'] != 'a3ddbe60-8478-4204-b769-6f5e9f4cbca2' and descendant::*[local-name() = 'id'] != '78f5cabe-6649-4dc3-84bf-36d82c6c2d31' and descendant::*[local-name() = 'id'] != 'eaa0c07f-193e-4be5-8dc6-a00bbfc7a446' and descendant::*[local-name() = 'id'] != 'af3ecd88-a654-4458-9c5b-1e1f7d09f463' and descendant::*[local-name() = 'id'] != '70af3752-c6ad-43d9-aa0c-9ff099931f8a' and descendant::*[local-name() = 'id'] != 'cb61531d-61eb-4412-a52f-ca065ca37e39' and descendant::*[local-name() = 'id'] != 'ad9872e5-edc4-4a62-9ee7-ba7daceba2e0' and descendant::*[local-name() = 'id'] != 'ac188375-0a1a-4984-ac80-14d04a086a19' and descendant::*[local-name() = 'id'] != '17da6976-2f1b-4214-a471-168f469d7e04' and descendant::*[local-name() = 'id'] != 'b924d4ad-65a1-41dc-b704-c7786eb4aec0' and descendant::*[local-name() = 'id'] != 'e2026706-0829-4a4c-b726-9409b6f407e1' and descendant::*[local-name() = 'id'] != 'f2513775-3d54-423b-803b-15e06a8c89a8' and descendant::*[local-name() = 'id'] != '85d15c83-e2b4-4359-8475-a355591aaa1a' and descendant::*[local-name() = 'id'] != 'be140797-803f-4b9e-81cc-5572c711e09c' and descendant::*[local-name() = 'id'] != 'bbbd99c6-cf49-4980-baed-12388f8dcff4' and descendant::*[local-name() = 'id'] != 'caa97efc-a713-41ea-a845-1534ca65eac9' and descendant::*[local-name() = 'id'] != 'f3ac3fbb-5eae-49e0-8494-0a44855fff25' and descendant::*[local-name() = 'id'] != 'a598e56e-d1a6-4907-9e2c-3da64e59f9ae' and descendant::*[local-name() = 'id'] != '00ace3c7-d7a8-41e6-83b1-7f13a9af7668' and descendant::*[local-name() = 'id'] != '654931e1-6f8b-4f72-aa4b-92c99c72c347' and descendant::*[local-name() = 'id'] != '8beca7eb-95a5-4c7d-9704-2d2a2fc4bc65' and descendant::*[local-name() = 'id'] != '431f5942-4c61-42a5-b33d-638b82e0c4f6' and descendant::*[local-name() = 'id'] != '6219cc2d-2545-4893-84a0-30395794f2f4' and descendant::*[local-name() = 'id'] != 'e0a398b0-838b-409e-807a-f0f587dfd7c7' and descendant::*[local-name() = 'id'] != 'de5e9d28-7c80-4167-8d34-74520a55c27d' and descendant::*[local-name() = 'id'] != '655a4e1f-c9cf-464b-868e-f8aa2c813b89' and descendant::*[local-name() = 'id'] != 'a05ae1d7-8868-46e8-a4ed-eb6da166499d' and descendant::*[local-name() = 'id'] != 'a3c394bc-44a2-4afe-b7b4-044633b84121'"/>
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
<xsl:text>educational level</xsl:text>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:taxonpath">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/vdex_classification_educationallevel_czp_20071115.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldvdex_classification_educationallevel_czp_20071115"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldvdex_classification_educationallevel_czp_20071115">
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'educational level'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = 'e05b5eb1-6a65-4f45-9556-79b25cd91da8' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','SBaO'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'SBaO'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Speciaal basisonderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e7f1c08f-08fb-48ab-be8e-c131b1bce54a' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','SO'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'SO'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Speciaal onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '15d693b8-fbe1-4112-8135-4a20aba5101c' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','VVE'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'VVE'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voor- en vroegschoolse educatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '512e4729-03a4-43a2-95ba-758071d1b725' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','PO'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'PO'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Primair onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '82ca4442-246c-44b3-a562-7b101793feb4' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c007e4dd-a3d4-4f33-902d-778e3bbeeddb' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5c072b3f-7f58-40ee-9799-27981f0a6b2b' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bc213214-b83d-4673-b9c1-8fdaa63d6d56' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 5'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'abfb190f-e814-46f5-a9cc-ebd53f04018e' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 6'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a4813bb6-cf63-4594-af56-6afb321723d8' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 7'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '95138558-9f65-4888-8ea3-8acce5eea273' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','po_groep8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'po_groep8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'PO groep 8'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2a1401e9-c223-493b-9b86-78f6993b1a8d' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','VO'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'VO'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voortgezet onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd6f1bbf7-c1a6-4431-bcbd-f33126d851ef' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','praktonderwijs'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'praktonderwijs'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Praktijkonderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c7942bb1-bf4f-409f-bc98-9a0b02f175dc' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '50746437-08f3-4559-8af3-3fa6e05d1a44' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_bl1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12e85a55-b3ae-4e7f-a2a0-d645f4c573bf' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_kl1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8ae2af2d-890e-49d6-95cb-3619acb5c2cf' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_gl1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '54edd410-2315-4eb3-a573-0e1cd59184fd' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_tl1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9716fc83-479c-48da-be13-2fdd74e3b692' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_bl2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '30ce6ff5-d654-4a97-a6d4-9c8936f87ca6' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_kl2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '05d90293-e675-44f4-bcd7-1f67161f6734' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_gl2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '90a5a228-e8de-473d-84cc-a915bf6107dd' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_tl2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e56a05b1-a9af-432f-a7ac-b7401d8e95fb' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_bl3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f61c889e-4731-4321-802d-c7e86081499c' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_kl3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '49af771b-6d9e-4d8f-bcaf-ac9cc9ee753e' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_gl3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e51e6137-05d4-45ca-aed0-6e91551257d4' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_tl3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '45403807-f052-4e09-a95c-b2e1c10c6c89' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_bl4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_bl4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO basisberoepsgerichte leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e72dacdd-968b-40ac-ad2c-8bd14c24e89f' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_kl4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_kl4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO kaderberoepsgerichte leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ee1eada7-7866-45e6-b1d8-b7062a8fe08a' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_gl4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_gl4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO gemengde leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '84f30df0-f194-435e-98c8-c4559756ec24' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vmbo_tl4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vmbo_tl4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VMBO theoretische leerweg, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a3ddbe60-8478-4204-b769-6f5e9f4cbca2' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'havo'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '78f5cabe-6649-4dc3-84bf-36d82c6c2d31' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'havo1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'eaa0c07f-193e-4be5-8dc6-a00bbfc7a446' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'havo2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'af3ecd88-a654-4458-9c5b-1e1f7d09f463' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'havo3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '70af3752-c6ad-43d9-aa0c-9ff099931f8a' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'havo4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'cb61531d-61eb-4412-a52f-ca065ca37e39' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','havo5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'havo5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'HAVO, 5'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ad9872e5-edc4-4a62-9ee7-ba7daceba2e0' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vwo'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ac188375-0a1a-4984-ac80-14d04a086a19' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vwo1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '17da6976-2f1b-4214-a471-168f469d7e04' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vwo2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b924d4ad-65a1-41dc-b704-c7786eb4aec0' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vwo3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e2026706-0829-4a4c-b726-9409b6f407e1' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vwo4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f2513775-3d54-423b-803b-15e06a8c89a8' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vwo5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 5'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '85d15c83-e2b4-4359-8475-a355591aaa1a' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vwo6'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vwo6'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VWO, 6'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'be140797-803f-4b9e-81cc-5572c711e09c' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','HBO'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'HBO'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Hoger beroepsonderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bbbd99c6-cf49-4980-baed-12388f8dcff4' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','WO'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'WO'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wetenschappelijk onderwijs'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'caa97efc-a713-41ea-a845-1534ca65eac9' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','BVE'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'BVE'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beroepsonderwijs en Volwasseneneducatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f3ac3fbb-5eae-49e0-8494-0a44855fff25' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mbo'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a598e56e-d1a6-4907-9e2c-3da64e59f9ae' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mbo_niveau1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 1: Assistentenopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '00ace3c7-d7a8-41e6-83b1-7f13a9af7668' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mbo_niveau2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 2: Basisberoepsopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '654931e1-6f8b-4f72-aa4b-92c99c72c347' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mbo_niveau3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 3: Vakopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '8beca7eb-95a5-4c7d-9704-2d2a2fc4bc65' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','mbo_niveau4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mbo_niveau4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'MBO, Niveau 4: Middenkaderopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '431f5942-4c61-42a5-b33d-638b82e0c4f6' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'educatie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6219cc2d-2545-4893-84a0-30395794f2f4' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'educatie_niveau1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 1'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e0a398b0-838b-409e-807a-f0f587dfd7c7' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'educatie_niveau2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 2'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'de5e9d28-7c80-4167-8d34-74520a55c27d' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'educatie_niveau3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 3'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '655a4e1f-c9cf-464b-868e-f8aa2c813b89' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','educatie_niveau4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'educatie_niveau4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Volwasseneneducatie, Niveau 4'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a05ae1d7-8868-46e8-a4ed-eb6da166499d' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','vavo'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'vavo'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'VAVO'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a3c394bc-44a2-4afe-b7b4-044633b84121' and not(key('classification-by-oldIdvdex_classification_educationallevel_czp_20071115','bedrijfsopleiding'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bedrijfsopleiding'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bedrijfsopleiding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>




</xsl:stylesheet>

