<?xml version="1.0" encoding="UTF-8"?>
<!--
Collection of IMS and IEEE LOM formatting templates that can be
called from other templates when included.
-->
<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:oai_nl_lom="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:vv="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>


    <!-- IMS Functions -->

    <xsl:template name="IMSclassification">
        <!-- purpose source is hardcoded to latest, taxons are key-value pair texts -->
        <xsl:param name="purpose_value"/>
        <xsl:param name="taxon_source"/>
        <xsl:param name="taxons"/>

        <xsl:element name="{$usedNamespace}:classification">
            <xsl:call-template name="IMSvocabulary">
                <xsl:with-param name="element" select="concat($usedNamespace, ':purpose')"/>
                <xsl:with-param name="source" select="'http://purl.edustandaard.nl/classification_purpose_nllom_20180530'"/>
                <xsl:with-param name="value" select="$purpose_value"/>
            </xsl:call-template>
            <xsl:element name="{$usedNamespace}:taxonpath">
                <xsl:call-template name="IMSlangstring">
                    <xsl:with-param name="element" select="concat($usedNamespace, ':source')"/>
                    <xsl:with-param name="language" select="'x-none'"/>
                    <xsl:with-param name="value" select="$taxon_source"/>
                </xsl:call-template>
            </xsl:element>
            <xsl:call-template name="IMStaxon">
                <xsl:with-param name="taxons" select="$taxons"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template name="IMSvocabulary">
        <xsl:param name="element"/>
        <xsl:param name="source"/>
        <xsl:param name="value"/>

        <xsl:element name="{$element}">
            <xsl:call-template name="IMSlangstring">
                <xsl:with-param name="element" select="concat($usedNamespace, ':source')"/>
                <xsl:with-param name="language" select="'x-none'"/>
                <xsl:with-param name="value" select="$source"/>
            </xsl:call-template>
            <xsl:call-template name="IMSlangstring">
                <xsl:with-param name="element" select="concat($usedNamespace, ':value')"/>
                <xsl:with-param name="language" select="'x-none'"/>
                <xsl:with-param name="value" select="$value"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template name="IMSlangstring">
        <xsl:param name="element"/>
        <xsl:param name="language"/>
        <xsl:param name="value"/>

        <xsl:element name="{$element}">
            <xsl:element name="{$usedNamespace}:langstring">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="$language"/>
                </xsl:attribute>
                <xsl:value-of select="$value"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="IMStaxon">
        <!-- based on Derrick Toppert's awesome buildTaxon function, ex: id1::entry1||id2::entry2|| -->
        <xsl:param name="taxons"/>

        <xsl:if test="substring-before($taxons, '||') != ''">
            <xsl:element name="{$usedNamespace}:taxon">
                <xsl:element name="{$usedNamespace}:id">
                    <xsl:value-of select="substring-before($taxons, '::')"/>
                </xsl:element>
                <xsl:call-template name="IMSlangstring">
                    <xsl:with-param name="element" select="concat($usedNamespace, ':entry')"/>
                    <xsl:with-param name="language" select="'nl'"/>
                    <xsl:with-param name="value" select="substring-before(substring-after($taxons, '::'), '||')"/>
                </xsl:call-template>
            </xsl:element>
        </xsl:if>

        <!-- Als er nog meer foute waarden zijn roep dan de template nogmaals aan -->
        <xsl:if test="substring-after($taxons, '|') != ''">
            <xsl:call-template name="IMStaxon">
                <xsl:with-param name="taxons" select="substring-after($taxons, '||')"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>



    <!-- IEEE Functions -->

    <xsl:template name="IEEEvocabulary">
        <xsl:param name="element"/>
        <xsl:param name="source"/>
        <xsl:param name="value"/>

        <xsl:element name="{$element}">
            <xsl:element name="{$usedNamespace}:source">
                <xsl:value-of select="$source"/>
            </xsl:element>
            <xsl:element name="{$usedNamespace}:value">
                <xsl:value-of select="$value"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
