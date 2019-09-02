<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>
    
    
    <!-- Test de waarde van copyright -->
    <xsl:template name="validateCopyright">
        
        <xsl:choose>
            <!-- Alleen copyright volgens de vdex_copyrightsandotherrestrictions_lomv1p0_20060628 of LOMv1.0 VDEX worden gecontroleerd -->
            <xsl:when test="contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_copyrightsandotherrestrictions_lomv1p0_20060628') or contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
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
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':copyrightandotherrestrictions')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'yes'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':copyrightandotherrestrictions')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'no'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Copyright elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            <!-- IEEE schema -->
            <xsl:when test="contains(child::*[local-name() = 'source'], 'vdex_copyrightsandotherrestrictions_lomv1p0_20060628') or contains(child::*[local-name() = 'source'], 'LOMv1.0')">
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
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':copyrightAndOtherRestrictions')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'yes'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':copyrightAndOtherRestrictions')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'no'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Copyright elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
            
        </xsl:choose>
        
    </xsl:template>

</xsl:stylesheet>
