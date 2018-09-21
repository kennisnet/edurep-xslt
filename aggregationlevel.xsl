<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>
    
    
    <!-- Test de waarde van cost -->
    <xsl:template name="validateAggregationlevel">
        
        <xsl:choose>
            <!-- Alleen aggregationlevel volgens de vdex_aggregationlevel_czp_20060628 of LOMv1.0 VDEX worden gecontroleerd -->
            <xsl:when test="contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_aggregationlevel_czp_20060628') or contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = '1' or $value = '2' or $value = '3' or $value = '4'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value,'1')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationlevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'1'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value,'2')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationlevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'2'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value,'3')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationlevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'3'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value,'4')">
                        <xsl:call-template name="IMSvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationlevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="value" select="'4'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Aggregationlevel elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            <!-- LOM schema -->
            <xsl:when test="contains(child::*[local-name() = 'source'], 'vdex_aggregationlevel_czp_20060628') or contains(child::*[local-name() = 'source'], 'LOMv1.0')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']"/>
                
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = '1' or $value = '2' or $value = '3' or $value = '4'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value,'1')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationLevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'1'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value,'2')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationLevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'2'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value,'3')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationLevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'3'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value,'4')">
                        <xsl:call-template name="IEEEvocabulary">
                            <xsl:with-param name="element" select="concat($usedNamespace, ':aggregationLevel')"/>
                            <xsl:with-param name="source" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="value" select="'4'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Aggregationlevel elementen met foute waarden worden niet teruggeplaatst -->
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

