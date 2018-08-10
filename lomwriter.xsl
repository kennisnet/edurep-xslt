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
