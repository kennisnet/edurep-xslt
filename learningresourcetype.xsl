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



    <!-- Test de waarde van learningresourcetyoe -->
    <xsl:template name="validateLearningresourcetype">
        
        <xsl:choose>
            <!-- Learningresourcetype met de vdex_learningresourcetype_czp_20060628 VDEX wordt gecontroleerd -->
            <xsl:when test="contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_learningresourcetype_czp_20060628')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'evaluatie- en toetsmateriaal' or $value = 'gesloten opdracht' or $value = 'open opdracht' or $value = 'verkennings- en onderzoeksmateriaal' or $value = 'handleiding' or $value = 'informatiebron' or $value = 'gereedschap' or $value = 'professionaliseringsmateriaal'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Waarden die URL encoded zijn -->
                    <xsl:when test="$value = 'evaluatie-%20en%20toetsmateriaal' or $value = 'gesloten%20opdracht' or $value = 'open%20opdracht' or $value = 'verkennings-%20en%20onderzoeksmateriaal'">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue">
                                <xsl:call-template name="UrlDecodeLearningresourceType">
                                    <xsl:with-param name="valueToDecode">
                                        <xsl:value-of select="$value"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'evaluatie- en toetsmateriaal')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'evaluatie- en toetsmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'gesloten opdracht')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'gesloten opdracht'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'open opdracht')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'open opdracht'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'verkennings- en onderzoeksmateriaal')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'verkennings- en onderzoeksmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'handleiding')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'handleiding'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'informatiebron')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'informatiebron'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'gereedschap')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'gereedschap'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'professionaliseringsmateriaal')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'professionaliseringsmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$value = 'verkennings- en onderzoeks materiaal'">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'verkennings- en onderzoeksmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Learningresourcetype elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            
            <!-- Alleen learningresourcetype volgens de LOMv1.0 of vdex_learningresourcetype_lomv1p0_20060628 VDEX verwijzing worden gecontroleerd -->
            <xsl:when test="contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'LOMv1.0') or contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_learningresourcetype_lomv1p0_20060628')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'exercise' or $value = 'simulation' or $value = 'questionnaire' or $value = 'diagram' or $value = 'figure' or $value = 'graph' or $value = 'index' or $value = 'slide' or $value = 'table' or $value = 'narrative text' or $value = 'exam' or $value = 'experiment' or $value = 'problem statement' or $value = 'self assessment' or $value = 'lecture'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Waarden die URL encoded zijn -->
                    <xsl:when test="$value = 'narrative%20text' or $value = 'problem%20statement' or $value = 'self%20assessment'">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue">
                                <xsl:call-template name="UrlDecodeLearningresourceType">
                                    <xsl:with-param name="valueToDecode">
                                        <xsl:value-of select="$value"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'diagram')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'diagram'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'exam')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'exam'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'exercise')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'exercise'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'experiment')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'experiment'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'figure')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'figure'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'graph')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'graph'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'index')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'index'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'lecture')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'lecture'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'narrative text')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'narrative text'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'problem statement')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'problem statement'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'questionnaire')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'questionnaire'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'self assessment')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'self assessment'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'simulation')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'simulation'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'slide')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'slide'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'table')">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'table'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$value = 'self assesment'">
                        <xsl:call-template name="buildLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']/*[local-name() = 'langstring']"/>
                            <xsl:with-param name="elementValue" select="'self assessment'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Learningresourcetype elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            
            <!-- LOM schema met de vdex_learningresourcetype_czp_20060628 VDEX -->
            <xsl:when test="contains(child::*[local-name() = 'source'], 'vdex_learningresourcetype_czp_20060628')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']"/>
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'evaluatie- en toetsmateriaal' or $value = 'gesloten opdracht' or $value = 'open opdracht' or $value = 'verkennings- en onderzoeksmateriaal' or $value = 'handleiding' or $value = 'informatiebron' or $value = 'gereedschap' or $value = 'professionaliseringsmateriaal'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Waarden die URL encoded zijn -->
                    <xsl:when test="$value = 'evaluatie-%20en%20toetsmateriaal' or $value = 'gesloten%20opdracht' or $value = 'open%20opdracht' or $value = 'verkennings-%20en%20onderzoeksmateriaal'">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue">
                                <xsl:call-template name="UrlDecodeLearningresourceType">
                                    <xsl:with-param name="valueToDecode">
                                        <xsl:value-of select="$value"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'evaluatie- en toetsmateriaal')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'evaluatie- en toetsmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'gesloten opdracht')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'gesloten opdracht'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'open opdracht')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'open opdracht'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'verkennings- en onderzoeksmateriaal')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'verkennings- en onderzoeksmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'handleiding')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'handleiding'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'informatiebron')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'informatiebron'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'gereedschap')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'gereedschap'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'professionaliseringsmateriaal')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'professionaliseringsmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$value = 'verkennings- en onderzoeks materiaal'">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'verkennings- en onderzoeksmateriaal'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Learningresourcetype elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
                
            </xsl:when>
            
            <!-- LOM schema volgens de LOMv1.0 of vdex_learningresourcetype_lomv1p0_20060628 VDEX verwijzing -->
            <xsl:when test="contains(child::*[local-name() = 'source'], 'LOMv1.0') or contains(child::*[local-name() = 'source'], 'vdex_learningresourcetype_lomv1p0_20060628')">
                <xsl:variable name="value" select="child::*[local-name() = 'value']"/>
                <xsl:choose>
                    <!-- Correcte waarden -->
                    <xsl:when test="$value = 'exercise' or $value = 'simulation' or $value = 'questionnaire' or $value = 'diagram' or $value = 'figure' or $value = 'graph' or $value = 'index' or $value = 'slide' or $value = 'table' or $value = 'narrative text' or $value = 'exam' or $value = 'experiment' or $value = 'problem statement' or $value = 'self assessment' or $value = 'lecture'">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:when>
                    <!-- Waarden die URL encoded zijn -->
                    <xsl:when test="$value = 'narrative%20text' or $value = 'problem%20statement' or $value = 'self%20assessment'">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue">
                                <xsl:call-template name="UrlDecodeLearningresourceType">
                                    <xsl:with-param name="valueToDecode">
                                        <xsl:value-of select="$value"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Fout geschreven waarden -->
                    <xsl:when test="contains($value, 'diagram')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'diagram'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'exam')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'exam'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'exercise')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'exercise'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'experiment')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'experiment'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'figure')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'figure'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'graph')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'graph'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'index')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'index'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'lecture')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'lecture'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'narrative text')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'narrative text'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'problem statement')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'problem statement'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'questionnaire')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'questionnaire'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'self assessment')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'self assessment'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'simulation')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'simulation'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'slide')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'slide'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains($value, 'table')">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'table'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$value = 'self assesment'">
                        <xsl:call-template name="buildLomLearningresourceType">
                            <xsl:with-param name="vdexValue" select="child::*[local-name() = 'source']"/>
                            <xsl:with-param name="elementValue" select="'self assessment'"/>                            
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Learningresourcetype elementen met foute waarden worden niet teruggeplaatst -->
                </xsl:choose>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>


    <!-- Maak een nieuw learningresourcetype element aan -->
    <xsl:template name="buildLearningresourceType">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:learningresourcetype">
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

    <!-- Maak een nieuw learningresourcetype element aan volgens LOM schema -->
    <xsl:template name="buildLomLearningresourceType">
        <xsl:param name="vdexValue"/>
        <xsl:param name="elementValue"/>
        
        <xsl:element name="{$usedNamespace}:learningResourceType">
            <xsl:element name="{$usedNamespace}:source">
                    <xsl:value-of select="$vdexValue"/>
            </xsl:element>
            <xsl:element name="{$usedNamespace}:value">
                    <xsl:value-of select="$elementValue"/>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>

    
    <!-- Strip %20 uit waarde -->
    <xsl:template name="UrlDecodeLearningresourceType">
        <xsl:param name="valueToDecode"/>
        
        <xsl:variable name="processedValue">
            <xsl:value-of select="substring-before($valueToDecode, '%20')"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="substring-after($valueToDecode, '%20')"/>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="contains($processedValue, '%20')">
                <xsl:call-template name="UrlDecodeLearningresourceType">
                    <xsl:with-param name="valueToDecode" select="$processedValue"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$processedValue"/>
            </xsl:otherwise>
        </xsl:choose>
        
        
    </xsl:template>


</xsl:stylesheet>
