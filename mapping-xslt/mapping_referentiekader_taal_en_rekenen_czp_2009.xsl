<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'skill level']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'skill level']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_referentiekader_taal_en_rekenen_czp_2009')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_referentiekader_taal_en_rekenen_czp_2009_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '1F' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','d5f99b58-31be-4ffc-89f4-9d7c65526879') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1S' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','86d05d5a-8dfa-422b-820c-50019985426d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2F' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','5eac0434-a6fc-4499-9710-3d6b800973a3') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2S' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','fadc20aa-082e-4e80-8a83-830c4006f236') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3F' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','f1d56c9e-373a-4051-9ce9-81a01b812de7') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3S' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','2be1fbb4-d46f-44f8-9aff-d2bbf5108a18') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4F' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','5ec6d733-a3b2-46db-9d42-72b4be4f7750') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4S' and key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','7bae4f16-ed94-4739-9d42-d0842dee7c90') != ''"/>
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
<xsl:text>skill level</xsl:text>
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
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_referentiekader_taal_en_rekenen_czp_2009"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_referentiekader_taal_en_rekenen_czp_2009">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'skill level'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_referentiekader_taal_en_rekenen_czp_2009')]">
<xsl:choose>
<xsl:when test="node() = '1F' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','d5f99b58-31be-4ffc-89f4-9d7c65526879'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d5f99b58-31be-4ffc-89f4-9d7c65526879'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'1F'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1S' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','86d05d5a-8dfa-422b-820c-50019985426d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'86d05d5a-8dfa-422b-820c-50019985426d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'1S'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2F' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','5eac0434-a6fc-4499-9710-3d6b800973a3'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5eac0434-a6fc-4499-9710-3d6b800973a3'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'2F'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2S' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','fadc20aa-082e-4e80-8a83-830c4006f236'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fadc20aa-082e-4e80-8a83-830c4006f236'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'2S'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3F' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','f1d56c9e-373a-4051-9ce9-81a01b812de7'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f1d56c9e-373a-4051-9ce9-81a01b812de7'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'3F'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3S' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','2be1fbb4-d46f-44f8-9aff-d2bbf5108a18'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2be1fbb4-d46f-44f8-9aff-d2bbf5108a18'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'3S'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4F' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','5ec6d733-a3b2-46db-9d42-72b4be4f7750'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5ec6d733-a3b2-46db-9d42-72b4be4f7750'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'4F'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4S' and not(key('classification-by-newIdvdex_classification_referentiekader_taal_en_rekenen_czp_2009','7bae4f16-ed94-4739-9d42-d0842dee7c90'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7bae4f16-ed94-4739-9d42-d0842dee7c90'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'4S'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
