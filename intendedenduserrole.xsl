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



    <!-- Test de waarde van intendedenduserrole -->
    <xsl:template name="validateIntendedenduserrole">
        
        <xsl:choose>
            <!-- Alleen intendedenduserrole volgens de vdex_intendedenduserrole_lomv1p0_20060628 of LOMv1.0 VDEX worden gecontroleerd -->
            <xsl:when test="contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_intendedenduserrole_lomv1p0_20060628') or contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'author' or $value = 'learner' or $value = 'teacher' or $value = 'manager'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'author') or contains($value, 'auteur')">
                        <xsl:call-template name="buildIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'author'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'learner') or contains($value, 'leerling/student')">
                        <xsl:call-template name="buildIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'learner'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'teacher') or contains($value, 'leraar')">
                        <xsl:call-template name="buildIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'teacher'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'manager') or contains($value, 'beheerder')">
                        <xsl:call-template name="buildIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'manager'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Intendedenduserrole elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            <!-- LOM schema -->
            <xsl:when test="contains(child::*[local-name() = 'source'], 'vdex_intendedenduserrole_lomv1p0_20060628') or contains(child::*[local-name() = 'source'], 'LOMv1.0')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'author' or $value = 'learner' or $value = 'teacher' or $value = 'manager'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'author') or contains($value, 'auteur')">
                        <xsl:call-template name="buildLomIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'author'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'learner') or contains($value, 'leerling/student')">
                        <xsl:call-template name="buildLomIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'learner'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'teacher') or contains($value, 'leraar')">
                        <xsl:call-template name="buildLomIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'teacher'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'manager') or contains($value, 'beheerder')">
                        <xsl:call-template name="buildLomIntendedenduserrole">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'manager'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Intendedenduserrole elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
            
        </xsl:choose>
        
    </xsl:template>


    <xsl:template name="buildIntendedenduserrole">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:intendedenduserrole">
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
    
    
    <xsl:template name="buildLomIntendedenduserrole">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:intendedEndUserRole">
            <xsl:element name="{$usedNamespace}:source">
                    <xsl:value-of select="$vdexValue"/>
            </xsl:element>
            <xsl:element name="{$usedNamespace}:value">
                    <xsl:value-of select="$elementValue"/>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>


</xsl:stylesheet>