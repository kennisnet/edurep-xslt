<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2"
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
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'author'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'learner') or contains($value, 'leerling/student')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'learner'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'teacher') or contains($value, 'leraar')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'teacher'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'manager') or contains($value, 'beheerder')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'manager'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$value=''">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'learner'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Intendedenduserrole elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>

            <!-- IEEE schema -->
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
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'author'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'learner') or contains($value, 'leerling/student')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'learner'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'teacher') or contains($value, 'leraar')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'teacher'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'manager') or contains($value, 'beheerder')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'manager'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$value=''">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':intendedenduserrole')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'learner'"/>
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

</xsl:stylesheet>
