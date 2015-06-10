<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdbegrippenkader" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdbegrippenkader" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="begrippenkader_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdbegrippenkader',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = '6856753d-3be7-4d32-91d7-af922fb319b2' and key('classification-by-newIdbegrippenkader','ea561c6e-def6-468b-a585-dc49faaff647') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'fc862dc8-1dae-4c3d-92e9-a01aa48a0414' and key('classification-by-newIdbegrippenkader','f1be21ef-4d0c-4510-8256-baf8bae4789d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '77f346c5-0529-496f-850d-fdf5574d93f4' and key('classification-by-newIdbegrippenkader','896a2c9b-ed1a-4975-a62e-cfd8b7b33b2c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c0d284f5-e87e-40fc-93fc-37e51572cdec' and key('classification-by-newIdbegrippenkader','31c3bbc5-9a01-44c1-a9fb-9051dd9125d4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '25db0736-ea07-42cc-b004-2a4c3917664d' and key('classification-by-newIdbegrippenkader','aed1908a-86dd-410b-be15-1fec11e3c372') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a022bb8a-af8e-42ce-9135-b5ce083b7068' and key('classification-by-newIdbegrippenkader','aed1908a-86dd-410b-be15-1fec11e3c372') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '12e931af-746d-4bd2-a0dd-5b445f5b3a8c' and key('classification-by-newIdbegrippenkader','264cb4a8-a4f9-4af4-9159-538a060ee56b') != ''"/>
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
<xsl:call-template name="writeTaxonsOldToNewbegrippenkader"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewbegrippenkader">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = '6856753d-3be7-4d32-91d7-af922fb319b2' and not(key('classification-by-newIdbegrippenkader','ea561c6e-def6-468b-a585-dc49faaff647'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ea561c6e-def6-468b-a585-dc49faaff647'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tekenen en construeren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'fc862dc8-1dae-4c3d-92e9-a01aa48a0414' and not(key('classification-by-newIdbegrippenkader','f1be21ef-4d0c-4510-8256-baf8bae4789d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f1be21ef-4d0c-4510-8256-baf8bae4789d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Werken met representaties - lineaire formule opstellen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '77f346c5-0529-496f-850d-fdf5574d93f4' and not(key('classification-by-newIdbegrippenkader','896a2c9b-ed1a-4975-a62e-cfd8b7b33b2c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'896a2c9b-ed1a-4975-a62e-cfd8b7b33b2c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verbanden herkennen - lineair'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c0d284f5-e87e-40fc-93fc-37e51572cdec' and not(key('classification-by-newIdbegrippenkader','31c3bbc5-9a01-44c1-a9fb-9051dd9125d4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'31c3bbc5-9a01-44c1-a9fb-9051dd9125d4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verbanden herkennen - kwadratisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '25db0736-ea07-42cc-b004-2a4c3917664d' and not(key('classification-by-newIdbegrippenkader','aed1908a-86dd-410b-be15-1fec11e3c372'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'aed1908a-86dd-410b-be15-1fec11e3c372'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kwadratische vergelijkingen oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a022bb8a-af8e-42ce-9135-b5ce083b7068' and not(key('classification-by-newIdbegrippenkader','aed1908a-86dd-410b-be15-1fec11e3c372'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'aed1908a-86dd-410b-be15-1fec11e3c372'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kwadratische vergelijkingen oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '12e931af-746d-4bd2-a0dd-5b445f5b3a8c' and not(key('classification-by-newIdbegrippenkader','264cb4a8-a4f9-4af4-9159-538a060ee56b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'264cb4a8-a4f9-4af4-9159-538a060ee56b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Derde graads vergelijking oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="begrippenkader_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdbegrippenkader',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ea561c6e-def6-468b-a585-dc49faaff647' and key('classification-by-oldIdbegrippenkader','6856753d-3be7-4d32-91d7-af922fb319b2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f1be21ef-4d0c-4510-8256-baf8bae4789d' and key('classification-by-oldIdbegrippenkader','fc862dc8-1dae-4c3d-92e9-a01aa48a0414') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '896a2c9b-ed1a-4975-a62e-cfd8b7b33b2c' and key('classification-by-oldIdbegrippenkader','77f346c5-0529-496f-850d-fdf5574d93f4') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '31c3bbc5-9a01-44c1-a9fb-9051dd9125d4' and key('classification-by-oldIdbegrippenkader','c0d284f5-e87e-40fc-93fc-37e51572cdec') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'aed1908a-86dd-410b-be15-1fec11e3c372' and key('classification-by-oldIdbegrippenkader','25db0736-ea07-42cc-b004-2a4c3917664d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'aed1908a-86dd-410b-be15-1fec11e3c372' and key('classification-by-oldIdbegrippenkader','a022bb8a-af8e-42ce-9135-b5ce083b7068') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '264cb4a8-a4f9-4af4-9159-538a060ee56b' and key('classification-by-oldIdbegrippenkader','12e931af-746d-4bd2-a0dd-5b445f5b3a8c') != ''"/>
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
<xsl:text>http://purl.edustandaard.nl/begrippenkader</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldbegrippenkader"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldbegrippenkader">
<xsl:for-each select="//*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = 'ea561c6e-def6-468b-a585-dc49faaff647' and not(key('classification-by-oldIdbegrippenkader','6856753d-3be7-4d32-91d7-af922fb319b2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6856753d-3be7-4d32-91d7-af922fb319b2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tekenen en construeren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f1be21ef-4d0c-4510-8256-baf8bae4789d' and not(key('classification-by-oldIdbegrippenkader','fc862dc8-1dae-4c3d-92e9-a01aa48a0414'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fc862dc8-1dae-4c3d-92e9-a01aa48a0414'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Werken met representaties - lineaire formule opstellen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '896a2c9b-ed1a-4975-a62e-cfd8b7b33b2c' and not(key('classification-by-oldIdbegrippenkader','77f346c5-0529-496f-850d-fdf5574d93f4'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'77f346c5-0529-496f-850d-fdf5574d93f4'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verbanden herkennen - lineair'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '31c3bbc5-9a01-44c1-a9fb-9051dd9125d4' and not(key('classification-by-oldIdbegrippenkader','c0d284f5-e87e-40fc-93fc-37e51572cdec'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c0d284f5-e87e-40fc-93fc-37e51572cdec'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verbanden herkennen - kwadratisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'aed1908a-86dd-410b-be15-1fec11e3c372' and not(key('classification-by-oldIdbegrippenkader','25db0736-ea07-42cc-b004-2a4c3917664d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'25db0736-ea07-42cc-b004-2a4c3917664d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kwadratische vergelijkingen oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'aed1908a-86dd-410b-be15-1fec11e3c372' and not(key('classification-by-oldIdbegrippenkader','a022bb8a-af8e-42ce-9135-b5ce083b7068'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a022bb8a-af8e-42ce-9135-b5ce083b7068'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kwadratische vergelijkingen oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '264cb4a8-a4f9-4af4-9159-538a060ee56b' and not(key('classification-by-oldIdbegrippenkader','12e931af-746d-4bd2-a0dd-5b445f5b3a8c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'12e931af-746d-4bd2-a0dd-5b445f5b3a8c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Derde graads vergelijking oplossen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>




</xsl:stylesheet>

