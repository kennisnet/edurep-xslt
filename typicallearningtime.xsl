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


    <!-- Test de waarde van typicallearningtime -->
    <xsl:template name="validateTypicalLearningTime">
        <!-- Bepaal de volgens welk schema het element is opgebouwd -->
        <xsl:variable name="schemaType">
            <xsl:choose>
                <xsl:when test="child::*[local-name() = 'duration']">
                    <xsl:text>lom</xsl:text>
                </xsl:when>
                <xsl:when test="child::*[local-name() = 'datetime']">
                    <xsl:text>ims</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <!-- De waarde van typicallearningtime -->
        <xsl:variable name="nodeValue">
            <xsl:choose>
                <xsl:when test="$schemaType = 'lom'">
                    <xsl:value-of select="child::*[local-name() = 'duration']"/>
                </xsl:when>
                <xsl:when test="$schemaType = 'ims'">
                    <xsl:value-of select="child::*[local-name() = 'datetime']"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        
        <!-- Valideer de waarde -->
        <xsl:variable name="validationResult">
            <xsl:choose>
                <xsl:when test="$nodeValue = ''">
                    <xsl:text>false</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="valueValidation">
                        <!-- Waarde moet altijd met P beginnen -->
                        <xsl:with-param name="label">
                            <xsl:text>P</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="value">
                            <xsl:value-of select="$nodeValue"/>
                        </xsl:with-param>
                    </xsl:call-template>                    
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        

        
        <xsl:choose>
            <xsl:when test="not(contains($validationResult, 'false')) and $schemaType = 'lom'">
                <xsl:call-template name="buildLomTypicalLearningTime">
                    <xsl:with-param name="elementValue">
                        <xsl:value-of select="$nodeValue"/>
                    </xsl:with-param>
                    <xsl:with-param name="descriptionValue">
                        <xsl:if test="child::*[local-name() = 'description']/*[local-name() = 'string']">
                            <xsl:value-of select="child::*[local-name() = 'description']/*[local-name() = 'string']"/>
                        </xsl:if>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="not(contains($validationResult, 'false')) and $schemaType = 'ims'">
                <xsl:call-template name="buildTypicalLearningTime">
                    <xsl:with-param name="elementValue">
                        <xsl:value-of select="$nodeValue"/>
                    </xsl:with-param>
                    <xsl:with-param name="descriptionValue">
                        <xsl:if test="child::*[local-name() = 'description']/*[local-name() = 'langstring']">
                            <xsl:value-of select="child::*[local-name() = 'description']/*[local-name() = 'langstring']"/>
                        </xsl:if>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="valueValidation">
        <xsl:param name="label"/>
        <xsl:param name="value"/>
        
        <!-- Format: P[yY][mM][dD][T[hH][mM][s[.s]S]] -->

        <xsl:if test="$value != ''">
            <xsl:choose>
                <xsl:when test="$label = 'P'">
                    <xsl:choose>
                        <!-- Waarde start niet met een P -->
                        <xsl:when test="not(starts-with($value, 'P'))">
                            <xsl:text>false</xsl:text>
                        </xsl:when>
                        <!-- Waarde bevat alleen een P -->
                        <xsl:when test="substring-after($value, 'P') = ''">
                            <xsl:text>false</xsl:text>
                        </xsl:when>
                        <!-- In alle andere gevallen gaan we verder met de validatie -->
                        <xsl:otherwise>
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>year</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="substring-after($value, 'P')"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$label = 'year'">
                    <xsl:choose>
                        <!-- Waarde bevat een aanduiding voor jaar -->
                        <xsl:when test="contains($value, 'Y') and translate(substring-before($value, 'Y'), '0123456789', '') = '' and substring-before($value, 'Y') != ''">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>month</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="substring-after($value, 'Y')"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Waarde bevat geen aanduiding voor jaar -->
                        <xsl:when test="not(contains($value, 'Y'))">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>month</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="$value"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Alle andere gevallen -->
                        <xsl:otherwise>
                            <xsl:text>false</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$label = 'month'">
                    <!-- Eerst vaststellen dat de M voor maand staat en niet voor minuut -->
                    <xsl:choose>
                        <xsl:when test="contains(substring-after($value, 'M'), 'D') or contains(substring-after($value, 'M'), 'T') or (substring-after($value, 'M') = '' and not(contains($value, 'T')))">
                            <xsl:choose>
                                <!-- Waarde bevat een aanduiding voor maand -->
                                <xsl:when test="contains($value, 'M') and translate(substring-before($value, 'M'), '0123456789', '') = '' and substring-before($value, 'M') != ''">
                                    <xsl:call-template name="valueValidation">
                                        <xsl:with-param name="label">
                                            <xsl:text>day</xsl:text>
                                        </xsl:with-param>
                                        <xsl:with-param name="value">
                                            <xsl:value-of select="substring-after($value, 'M')"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                                <!-- Waarde bevat geen aanduiding voor maand -->
                                <xsl:when test="not(contains($value, 'M'))">
                                        <xsl:call-template name="valueValidation">
                                        <xsl:with-param name="label">
                                            <xsl:text>day</xsl:text>
                                        </xsl:with-param>
                                        <xsl:with-param name="value">
                                            <xsl:value-of select="$value"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                                <!-- Alle andere gevallen -->
                                <xsl:otherwise>
                                    <xsl:text>false</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise> 
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>day</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="$value"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$label = 'day'">
                    <xsl:choose>
                        <!-- Waarde bevat een aanduiding voor dag -->
                        <xsl:when test="contains($value, 'D') and translate(substring-before($value, 'D'), '0123456789', '') = '' and substring-before($value, 'D') != ''">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>T</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="substring-after($value, 'D')"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Waarde bevat geen aanduiding voor dag -->
                        <xsl:when test="not(contains($value, 'D'))">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>T</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="$value"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Alle andere gevallen -->
                        <xsl:otherwise>
                            <xsl:text>false</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$label = 'T'">
                    <xsl:choose>
                        <!-- Waarde start niet met een T, maar bevat wel karakters -->
                        <xsl:when test="not(starts-with($value, 'T')) and $value != ''">
                            <xsl:text>false</xsl:text>
                        </xsl:when>
                        <!-- Waarde bevat alleen een T -->
                        <xsl:when test="substring-after($value, 'T') = ''">
                            <xsl:text>false</xsl:text>
                        </xsl:when>
                        <!-- In alle andere gevallen gaan we verder met de validatie -->
                        <xsl:otherwise>
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>hour</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="substring-after($value, 'T')"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$label = 'hour'">
                    <xsl:choose>
                        <!-- Waarde bevat een aanduiding voor uur -->
                        <xsl:when test="contains($value, 'H') and translate(substring-before($value, 'H'), '0123456789', '') = '' and substring-before($value, 'H') != ''">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>minute</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="substring-after($value, 'H')"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Waarde bevat geen aanduiding voor uur -->
                        <xsl:when test="not(contains($value, 'H'))">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>minute</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="$value"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Alle andere gevallen -->
                        <xsl:otherwise>
                            <xsl:text>false</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="$label = 'minute'"> 
                    <xsl:choose>
                        <!-- Waarde bevat een aanduiding voor minuut -->
                        <xsl:when test="contains($value, 'M') and translate(substring-before($value, 'M'), '0123456789', '') = '' and substring-before($value, 'M') != ''">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>second</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="substring-after($value, 'M')"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Waarde bevat geen aanduiding voor minuut -->
                        <xsl:when test="not(contains($value, 'M'))">
                            <xsl:call-template name="valueValidation">
                                <xsl:with-param name="label">
                                    <xsl:text>second</xsl:text>
                                </xsl:with-param>
                                <xsl:with-param name="value">
                                    <xsl:value-of select="$value"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <!-- Alle andere gevallen -->
                        <xsl:otherwise>
                            <xsl:text>false</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>                
                </xsl:when>
                <xsl:when test="$label = 'second'"> 
                    <xsl:choose>
                        <!-- Waarde bevat een aanduiding voor seconde (mag een . bevatten als decimaal scheidingsteken -->
                        <xsl:when test="contains($value, 'S') and translate(substring-before($value, 'S'), '0123456789.', '') = '' and substring-before($value, 'S') != '' and substring-before($value, 'S') != '.' and not(substring-after($value, 'S'))"/>                        
                        <!-- Waarde bevat geen aanduiding voor seconde -->
                        <xsl:when test="$value = ''"/>                        
                        <!-- Alle andere gevallen -->
                        <xsl:otherwise>
                            <xsl:text>false</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>                                
                </xsl:when>
                <!-- Alle andere waarden voor een label zijn fout -->
                <xsl:otherwise>
                    <xsl:text>false</xsl:text>
                </xsl:otherwise>

            </xsl:choose>
        </xsl:if>

    </xsl:template>



    <xsl:template name="buildTypicalLearningTime">
        <xsl:param name="elementValue"/>
        <xsl:param name="descriptionValue"/>
        
        <xsl:element name="{$usedNamespace}:typicallearningtime">
            <xsl:element name="{$usedNamespace}:datetime">
                <xsl:value-of select="$elementValue"/>
            </xsl:element>
            <xsl:if test="$descriptionValue != ''">
                <xsl:element name="{$usedNamespace}:description">
                    <xsl:element name="langstring">
                        <xsl:attribute name="xml:lang">
                            <xsl:text>nl</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="$descriptionValue"/>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
        </xsl:element>        
    </xsl:template>
    
    
    <xsl:template name="buildLomTypicalLearningTime">
        <xsl:param name="elementValue"/>
        <xsl:param name="descriptionValue"/>
        
        <xsl:element name="{$usedNamespace}:typicalLearningTime">
            <xsl:element name="{$usedNamespace}:duration">
                <xsl:value-of select="$elementValue"/>
            </xsl:element>
            <xsl:if test="$descriptionValue != ''">
                <xsl:element name="{$usedNamespace}:description">
                    <xsl:element name="string">
                        <xsl:attribute name="language">
                            <xsl:text>nl</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="$descriptionValue"/>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
        </xsl:element>        
    </xsl:template>

</xsl:stylesheet>
