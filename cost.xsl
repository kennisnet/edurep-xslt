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
    xmlns:vv="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>
    
    
    <!-- Test de waarde van cost -->
    <xsl:template name="validateCost">
        
        <xsl:choose>
            <!-- Alleen cost volgens de vdex_cost_lomv1p0_20060628 of LOMv1.0 VDEX worden gecontroleerd -->
            <xsl:when test="contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_cost_lomv1p0_20060628') or contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'yes' or $value = 'no'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                        <xsl:call-template name="buildCost">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'yes'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                        <xsl:call-template name="buildCost">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'no'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Cost elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            <!-- LOM schema -->
            <xsl:when test="contains(child::*[local-name() = 'source'], 'vdex_cost_lomv1p0_20060628') or contains(child::*[local-name() = 'source'], 'LOMv1.0')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'yes' or $value = 'no'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                        <xsl:call-template name="buildLomCost">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'yes'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                        <xsl:call-template name="buildLomCost">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'no'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Cost elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
            
        </xsl:choose>
        
    </xsl:template>
    
    
    
    <xsl:template name="buildCost">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:cost">
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
    
    <xsl:template name="buildLomCost">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:cost">
            <xsl:element name="{$usedNamespace}:source">
                <xsl:value-of select="$vdexValue"/>
            </xsl:element>
            <xsl:element name="{$usedNamespace}:value">
                <xsl:value-of select="$elementValue"/>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    
    
    
</xsl:stylesheet>