<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdclassification_so_learner_properties_20100304" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'accessibility restrictions']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdclassification_so_learner_properties_20100304" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'accessibility restrictions']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'classification_so_learner_properties_20100304')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="classification_so_learner_properties_20100304_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdclassification_so_learner_properties_20100304',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'visuele beperkingen' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'blind_regulier' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'blind_ass' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'blind_mg' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'blind_emg' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechtziend_regulier' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechtziend_ass' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechtziend_mg' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechtziend_emg' and key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'auditieve beperkingen' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'doof_regulier' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'doof_ass' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'doof_mg' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'doof_emg' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechthorend_regulier' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechthorend_ass' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechthorend_mg' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'slechthorend_emg' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'esm_regulier' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'esm_ass' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'esm_mg' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'esm_emg' and key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'motorische_verstandelijke beperkingen' and key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'regulier' and key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ass' and key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mg' and key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'emg' and key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'gedragsstoornis' and key('classification-by-newIdclassification_so_learner_properties_20100304','3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0') != ''"/>
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
<xsl:text>accessibility restrictions</xsl:text>
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
<xsl:call-template name="writeTaxonsOldToNewclassification_so_learner_properties_20100304"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewclassification_so_learner_properties_20100304">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'accessibility restrictions'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'classification_so_learner_properties_20100304')]">
<xsl:choose>
<xsl:when test="node() = 'visuele beperkingen' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'blind_regulier' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'blind_ass' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'blind_mg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'blind_emg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechtziend_regulier' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechtziend_ass' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechtziend_mg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechtziend_emg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','443a8d94-6845-465f-ac92-7697ee42a304'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'443a8d94-6845-465f-ac92-7697ee42a304'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'auditieve beperkingen' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'doof_regulier' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'doof_ass' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'doof_mg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'doof_emg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechthorend_regulier' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechthorend_ass' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechthorend_mg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'slechthorend_emg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'esm_regulier' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'esm_ass' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'esm_mg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'esm_emg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','42937580-e88f-4784-9020-c60e5090e7ad'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42937580-e88f-4784-9020-c60e5090e7ad'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'motorische_verstandelijke beperkingen' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6f847b13-4720-4640-85f0-670eb1b55bd8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'regulier' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6f847b13-4720-4640-85f0-670eb1b55bd8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ass' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6f847b13-4720-4640-85f0-670eb1b55bd8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6f847b13-4720-4640-85f0-670eb1b55bd8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'emg' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','6f847b13-4720-4640-85f0-670eb1b55bd8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6f847b13-4720-4640-85f0-670eb1b55bd8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'gedragsstoornis' and not(key('classification-by-newIdclassification_so_learner_properties_20100304','3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ontwikkelingsachterstand'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="classification_so_learner_properties_20100304_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdclassification_so_learner_properties_20100304',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','visuele beperkingen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_regulier') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_ass') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_mg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_emg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_regulier') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_ass') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_mg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '443a8d94-6845-465f-ac92-7697ee42a304' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_emg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','auditieve beperkingen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_regulier') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_ass') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_mg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_emg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_regulier') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_ass') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_mg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_emg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_regulier') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_ass') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_mg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42937580-e88f-4784-9020-c60e5090e7ad' and key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_emg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6f847b13-4720-4640-85f0-670eb1b55bd8' and key('classification-by-oldIdclassification_so_learner_properties_20100304','motorische_verstandelijke beperkingen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6f847b13-4720-4640-85f0-670eb1b55bd8' and key('classification-by-oldIdclassification_so_learner_properties_20100304','regulier') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6f847b13-4720-4640-85f0-670eb1b55bd8' and key('classification-by-oldIdclassification_so_learner_properties_20100304','ass') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6f847b13-4720-4640-85f0-670eb1b55bd8' and key('classification-by-oldIdclassification_so_learner_properties_20100304','mg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6f847b13-4720-4640-85f0-670eb1b55bd8' and key('classification-by-oldIdclassification_so_learner_properties_20100304','emg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0' and key('classification-by-oldIdclassification_so_learner_properties_20100304','gedragsstoornis') != ''"/>
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
<xsl:text>accessibility restrictions</xsl:text>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:taxonpath">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/classification_so_learner_properties_20100304</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldclassification_so_learner_properties_20100304"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldclassification_so_learner_properties_20100304">
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'accessibility restrictions'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','visuele beperkingen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'visuele beperkingen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_regulier'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'blind_regulier'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_ass'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'blind_ass'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_mg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'blind_mg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','blind_emg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'blind_emg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_regulier'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechtziend_regulier'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_ass'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechtziend_ass'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_mg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechtziend_mg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '443a8d94-6845-465f-ac92-7697ee42a304' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechtziend_emg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechtziend_emg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Visuele beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','auditieve beperkingen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'auditieve beperkingen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_regulier'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'doof_regulier'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_ass'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'doof_ass'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_mg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'doof_mg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','doof_emg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'doof_emg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_regulier'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechthorend_regulier'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_ass'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechthorend_ass'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_mg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechthorend_mg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','slechthorend_emg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'slechthorend_emg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_regulier'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'esm_regulier'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_ass'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'esm_ass'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_mg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'esm_mg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42937580-e88f-4784-9020-c60e5090e7ad' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','esm_emg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'esm_emg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Auditieve beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6f847b13-4720-4640-85f0-670eb1b55bd8' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','motorische_verstandelijke beperkingen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'motorische_verstandelijke beperkingen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6f847b13-4720-4640-85f0-670eb1b55bd8' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','regulier'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'regulier'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6f847b13-4720-4640-85f0-670eb1b55bd8' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','ass'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ass'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6f847b13-4720-4640-85f0-670eb1b55bd8' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','mg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6f847b13-4720-4640-85f0-670eb1b55bd8' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','emg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'emg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Motorische/verstandelijke beperkingen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3eac1ee7-e31c-4f54-ba0a-5da17e1e3ad0' and not(key('classification-by-oldIdclassification_so_learner_properties_20100304','gedragsstoornis'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'gedragsstoornis'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ontwikkelingsachterstand'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>




</xsl:stylesheet>

