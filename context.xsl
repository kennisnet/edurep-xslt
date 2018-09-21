<?xml version="1.0" encoding="UTF-8"?>
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
    xmlns:ieee="http://ltsc.ieee.org/xsd/LOM"
    xmlns:vv="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>



    <!-- Test de waarde van context -->
    <xsl:template name="validateContext">
        
        <xsl:choose>
            <!-- Alleen context volgens de vdex_context_czp_20060628 VDEX wordt gecontroleerd -->
            <xsl:when test="contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_context_czp_20060628')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'higher education' or $value = 'other' or $value = 'school' or $value = 'training' or $value = 'SBaO' or $value = 'SO' or $value = 'VVE' or $value = 'PO' or $value = 'VO' or $value = 'BVE' or $value = 'HBO' or $value = 'WO' or $value = 'bedrijfsopleiding'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'higher education')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'higher education'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'other')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'other'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'school')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'school'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'training')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'training'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'SBaO')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'SBaO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'SO')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'SO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'VVE')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'VVE'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'PO')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'PO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'VO')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'VO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'BVE')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'BVE'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'HBO')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'HBO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'WO')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'WO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'bedrijfsopleiding')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'bedrijfsopleiding'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'Bedrijfsopleiding')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'bedrijfsopleiding'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'Other')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'other'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'School')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'school'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'Higher education')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'higher education'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'Training')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'training'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'SBAO')">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'SBaO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Waarden die URL encoded zijn -->
                    <xsl:when test="$value = 'higher%20education'">
                        <xsl:call-template name="buildContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue">
                                <xsl:call-template name="UrlDecodeContext">
                                    <xsl:with-param name="valueToDecode">
                                        <xsl:value-of select="$value"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Context elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
            </xsl:when>
            <!-- LOM schema -->
            <xsl:when test="contains(child::*[local-name() = 'source'], 'vdex_context_czp_20060628') or contains(child::*[local-name() = 'source'], 'LOMv1.0')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'higher education' or $value = 'other' or $value = 'school' or $value = 'training' or $value = 'SBaO' or $value = 'SO' or $value = 'VVE' or $value = 'PO' or $value = 'VO' or $value = 'BVE' or $value = 'HBO' or $value = 'WO' or $value = 'bedrijfsopleiding'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'higher education')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'higher education'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'other')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'other'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'school')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'school'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'training')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'training'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'SBaO')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'SBaO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'SO')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'SO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'VVE')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'VVE'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'PO')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'PO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'VO')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'VO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'BVE')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'BVE'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'HBO')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'HBO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'WO')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'WO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'bedrijfsopleiding')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'bedrijfsopleiding'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'Bedrijfsopleiding')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'bedrijfsopleiding'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'SBAO')">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'SBaO'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Waarden die URL encoded zijn -->
                    <xsl:when test="$value = 'higher%20education'">
                        <xsl:call-template name="buildLomContext">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue">
                                <xsl:call-template name="UrlDecodeContext">
                                    <xsl:with-param name="valueToDecode">
                                        <xsl:value-of select="$value"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Context elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
            
        </xsl:choose>
        
    </xsl:template>


    <!-- Maak een nieuw context element aan -->
    <xsl:template name="buildContext">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:context">
            <xsl:element name="{$usedNamespace}:source">
                <xsl:element name="{$usedNamespace}:langstring">
                    <xsl:attribute name="xml:lang">
                        <xsl:text>x-none</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="$vdexValue"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="{$usedNamespace}:value">
                <xsl:element name="{$usedNamespace}:langstring">
                    <xsl:attribute name="xml:lang">
                        <xsl:text>x-none</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="$elementValue"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    
    
    <xsl:template name="buildLomContext">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:context">
            <xsl:element name="{$usedNamespace}:source">
                    <xsl:value-of select="$vdexValue"/>
            </xsl:element>
            <xsl:element name="{$usedNamespace}:value">
                    <xsl:value-of select="$elementValue"/>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    
    
    <!-- Strip %20 uit waarde -->
    <xsl:template name="UrlDecodeContext">
        <xsl:param name="valueToDecode"/>
        
        <xsl:variable name="processedValue">
            <xsl:value-of select="substring-before($valueToDecode, '%20')"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="substring-after($valueToDecode, '%20')"/>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="contains($processedValue, '%20')">
                <xsl:call-template name="UrlDecodeContext">
                    <xsl:with-param name="valueToDecode" select="$processedValue"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$processedValue"/>
            </xsl:otherwise>
        </xsl:choose>
        
        
    </xsl:template>


</xsl:stylesheet>
