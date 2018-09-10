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

    <xsl:include href="edurep://lomwriter"/>
    <xsl:include href="edurep://aggregationlevel"/>
    <xsl:include href="edurep://learningresourcetype"/>
    <xsl:include href="edurep://intendedenduserrole"/>
    <xsl:include href="edurep://typicallearningtime"/>
    <xsl:include href="edurep://context"/>
    <xsl:include href="edurep://cost"/>
    <xsl:include href="edurep://copyrightandotherrestrictions"/>

    
    <!-- Startpunt validatie -->
    <xsl:template name="validateValue">
     
        <xsl:choose>
            <xsl:when test="local-name() = 'aggregationlevel' or local-name() = 'aggregationLevel'">
                <xsl:call-template name="validateAggregationlevel"/>    
            </xsl:when>
            <xsl:when test="local-name() = 'format'">
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="local-name() = 'learningresourcetype' or local-name() = 'learningResourceType'">
                <xsl:call-template name="validateLearningresourcetype"/>    
            </xsl:when>
            <xsl:when test="local-name() = 'intendedenduserrole' or local-name() = 'intendedEndUserRole'">
                <xsl:call-template name="validateIntendedenduserrole"/>
            </xsl:when>
            <xsl:when test="local-name() = 'context'">
                <xsl:call-template name="validateContext"/>
            </xsl:when>
            <xsl:when test="local-name() = 'typicalLearningTime' or local-name() = 'typicallearningtime'">
                <xsl:call-template name="validateTypicalLearningTime"/>
            </xsl:when>
            <xsl:when test="local-name() = 'typicallearningtime'">
                <xsl:call-template name="validateTypicalLearningTime"/>
            </xsl:when>
            <xsl:when test="local-name() = 'cost'">
                <xsl:call-template name="validateCost"/>
            </xsl:when>
            <xsl:when test="local-name() = 'copyrightandotherrestrictions' or local-name() = 'copyrightAndOtherRestrictions'">
                <xsl:call-template name="validateCopyright"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>  
        
    </xsl:template>
    
    

    <!-- Creeer classificatie met wijzigingen -->
    <xsl:template name="buildClassification">

        <xsl:variable name="classificationValidation">
            
            <!-- aggregationlevel met vdex: vdex_aggregationlevel_czp_20060628 of LOMv1.0 -->
            <!-- zowel voor IMS-MDv1.2.4 als voor IEEE-LOMv1.0 -->
            <xsl:for-each select="child::*[local-name() = 'aggregationlevel']/*[local-name() = 'aggregationLevel']">
                <xsl:choose>
                    <!-- IMS-MDv1.2.4 -->
                    <xsl:when test="contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'vdex_aggregationlevel_czp_20060628') or contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = '1'"/>
                            <xsl:when test="$value = '2'"/>
                            <xsl:when test="$value = '3'"/>
                            <xsl:when test="$value = '4'"/>
                            <xsl:when test="contains($value,'1')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'2')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'3')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'4')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>aggregationlevel_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- IEEE-LOMv1.0 -->
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_cost_lomv1p0_20060628') or contains(child::*[local-name()= 'source'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = '1'"/>
                            <xsl:when test="$value = '2'"/>
                            <xsl:when test="$value = '3'"/>
                            <xsl:when test="$value = '4'"/>
                            <xsl:when test="contains($value,'1')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'2')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'3')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'4')">
                                <xsl:text>aggregationlevel_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>aggregationlevel_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            
            
            <!-- learningresourcetype met vdex:  vdex_learningresourcetype_czp_20060628, vdex_learningresourcetype_lomv1p0_20060628 of LOMv1.0 -->
            <!-- zowel voor IMS-MDv1.2.4 als voor IEEE-LOMv1.0 -->
            <xsl:for-each select="child::*[local-name() = 'educational']/*[local-name() = 'learningresourcetype' or local-name() = 'learningResourceType']">
                <xsl:choose>
                    <!-- IMS-MDv1.2.4 (vdex_learningresourcetype_czp_20060628) -->
                    <xsl:when test="contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'vdex_learningresourcetype_czp_20060628')">
                        <xsl:variable name="value" select="descendant::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                        <xsl:choose>
                            <xsl:when test="$value = 'verkennings- en onderzoeksmateriaal'"/>
                            <xsl:when test="$value = 'handleiding'"/>
                            <xsl:when test="$value = 'informatiebron'"/>
                            <xsl:when test="$value = 'gereedschap'"/>
                            <xsl:when test="$value = 'professionaliseringsmateriaal'"/>
                            <xsl:when test="$value = 'evaluatie- en toetsmateriaal'"/>
                            <xsl:when test="$value = 'gesloten opdracht'"/>
                            <xsl:when test="$value = 'open opdracht'"/>
                            <xsl:when test="$value = 'evaluatie-%20en%20toetsmateriaal'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'gesloten%20opdracht'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'open%20opdracht'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'verkennings-%20en%20onderzoeksmateriaal'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'verkennings- en onderzoeks materiaal'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'verkennings- en onderzoeksmateriaal')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'handleiding')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'informatiebron')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'gereedschap')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'professionaliseringsmateriaal')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'evaluatie- en toetsmateriaal')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'gesloten opdracht')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'open opdracht')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>learningresourcetype_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- IEEE-LOMv1.0 (vdex_learningresourcetype_czp_20060628) -->
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_learningresourcetype_czp_20060628')">
                        <xsl:variable name="value" select="descendant::*[local-name() = 'value']"/>
                        <xsl:choose>
                            <xsl:when test="$value = 'verkennings- en onderzoeksmateriaal'"/>
                            <xsl:when test="$value = 'handleiding'"/>
                            <xsl:when test="$value = 'informatiebron'"/>
                            <xsl:when test="$value = 'gereedschap'"/>
                            <xsl:when test="$value = 'professionaliseringsmateriaal'"/>
                            <xsl:when test="$value = 'evaluatie- en toetsmateriaal'"/>
                            <xsl:when test="$value = 'gesloten opdracht'"/>
                            <xsl:when test="$value = 'open opdracht'"/>
                            <xsl:when test="$value = 'evaluatie-%20en%20toetsmateriaal'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'gesloten%20opdracht'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'open%20opdracht'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'verkennings-%20en%20onderzoeksmateriaal'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'verkennings- en onderzoeks materiaal'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'verkennings- en onderzoeksmateriaal')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'handleiding')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'informatiebron')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'gereedschap')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'professionaliseringsmateriaal')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'evaluatie- en toetsmateriaal')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'gesloten opdracht')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'open opdracht')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>learningresourcetype_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>                    
                    <!-- IMS-MDv1.2.4 (vdex_learningresourcetype_lomv1p0_20060628 of LOMv1.0) -->
                    <xsl:when test="contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'vdex_learningresourcetype_lomv1p0_20060628') or contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                        <xsl:variable name="value" select="descendant::*[local-name() = 'value']/*[local-name() = 'langstring']"/>
                        <xsl:choose>
                            <xsl:when test="$value = 'exercise'"/>
                            <xsl:when test="$value = 'simulation'"/>
                            <xsl:when test="$value = 'questionnaire'"/>
                            <xsl:when test="$value = 'diagram'"/>
                            <xsl:when test="$value = 'figure'"/>
                            <xsl:when test="$value = 'graph'"/>
                            <xsl:when test="$value = 'index'"/>
                            <xsl:when test="$value = 'slide'"/>
                            <xsl:when test="$value = 'table'"/>
                            <xsl:when test="$value = 'narrative text'"/>
                            <xsl:when test="$value = 'exam'"/>
                            <xsl:when test="$value = 'experiment'"/>
                            <xsl:when test="$value = 'problem statement'"/>
                            <xsl:when test="$value = 'self assessment'"/>
                            <xsl:when test="$value = 'lecture'"/>
                            <xsl:when test="$value = 'narrative%20text'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'problem%20statement'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'self%20assessment'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'exercise')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'simulation')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'questionnaire')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'diagram')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'figure')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'graph')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'index')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'slide')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'table')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'narrative text')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'exam')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'experiment')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'problem statement')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'self assessment')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'lecture')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'self assesment')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>learningresourcetype_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- IEEE-LOMv1.0 (vdex_learningresourcetype_lomv1p0_20060628 of LOMv1.0)-->
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_learningresourcetype_lomv1p0_20060628') or contains(child::*[local-name()= 'source'], 'LOMv1.0')">
                        <xsl:variable name="value" select="descendant::*[local-name() = 'value']"/>
                        <xsl:choose>
                            <xsl:when test="$value = 'exercise'"/>
                            <xsl:when test="$value = 'simulation'"/>
                            <xsl:when test="$value = 'questionnaire'"/>
                            <xsl:when test="$value = 'diagram'"/>
                            <xsl:when test="$value = 'figure'"/>
                            <xsl:when test="$value = 'graph'"/>
                            <xsl:when test="$value = 'index'"/>
                            <xsl:when test="$value = 'slide'"/>
                            <xsl:when test="$value = 'table'"/>
                            <xsl:when test="$value = 'narrative text'"/>
                            <xsl:when test="$value = 'exam'"/>
                            <xsl:when test="$value = 'experiment'"/>
                            <xsl:when test="$value = 'problem statement'"/>
                            <xsl:when test="$value = 'self assessment'"/>
                            <xsl:when test="$value = 'lecture'"/>
                            <xsl:when test="$value = 'narrative%20text'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'problem%20statement'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'self%20assessment'">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'exercise')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'simulation')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'questionnaire')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'diagram')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'figure')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'graph')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'index')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'slide')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'table')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'narrative text')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'exam')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'experiment')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'problem statement')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'self assessment')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'lecture')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'self assesment')">
                                <xsl:text>learningresourcetype_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>learningresourcetype_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            
            <!-- intendedenduserrole met vdex:  vdex_intendedenduserrole_lomv1p0_20060628 of LOMv1.0 -->
            <!-- zowel voor IMS-MDv1.2.4 als voor IEEE-LOMv1.0 -->
            <xsl:for-each select="child::*[local-name() = 'educational']/*[local-name() = 'intendedenduserrole' or local-name() = 'intendedEndUserRole']">
                <xsl:choose>
                    <!-- IMS-MDv1.2.4 -->
                    <xsl:when test="contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'vdex_intendedenduserrole_lomv1p0_20060628') or contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                        <xsl:variable name="value" select="descendant::*[local-name() = 'value']/*[local-name() = 'langstring']"/> 
                        <xsl:choose>
                            <xsl:when test="$value = 'learner'"/>
                            <xsl:when test="$value = 'author'"/>
                            <xsl:when test="$value = 'teacher'"/>
                            <xsl:when test="$value = 'manager'"/>
                            <xsl:when test="$value = 'auteur'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'leerling/student'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'beheerder'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'leraar'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'author')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'learner')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'manager')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'teacher')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value=''">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="'lege waarde vervangen'"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>intendedenduserrole_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when> 
                    <!-- IEEE-LOMv1.0 -->                    
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_intendedenduserrole_lomv1p0_20060628') or contains(child::*[local-name()= 'source'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']"/> 
                        <xsl:choose>
                            <xsl:when test="$value = 'learner'"/>
                            <xsl:when test="$value = 'author'"/>
                            <xsl:when test="$value = 'teacher'"/>
                            <xsl:when test="$value = 'manager'"/>
                            <xsl:when test="$value = 'auteur'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'leerling/student'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'beheerder'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value = 'leraar'">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'author')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'learner')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'manager')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'teacher')">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="$value=''">
                                <xsl:text>intendedenduserrole_edit::</xsl:text><xsl:value-of select="'lege waarde vervangen'"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>intendedenduserrole_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>   
                </xsl:choose>
            </xsl:for-each>
            
            <!-- context met vdex:  vdex_context_czp_20060628 of LOMv1.0 -->
            <!-- zowel voor IMS-MDv1.2.4 als voor IEEE-LOMv1.0 -->
            <xsl:for-each select="child::*[local-name() = 'educational']/*[local-name() = 'context']">
                <xsl:choose>
                    <!-- IMS-MDv1.2.4 -->
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_context_czp_20060628') or contains(child::*[local-name()= 'source'], 'LOMv1.0')">
                        <xsl:variable name="value" select="descendant::*[local-name() = 'value']/*[local-name() = 'langstring']"/> 
                        <xsl:choose>
                            <xsl:when test="$value = 'other'"/>
                            <xsl:when test="$value = 'school'"/>
                            <xsl:when test="$value = 'training'"/>
                            <xsl:when test="$value = 'SBaO'"/>
                            <xsl:when test="$value = 'SO'"/>
                            <xsl:when test="$value = 'VVE'"/>
                            <xsl:when test="$value = 'PO'"/>
                            <xsl:when test="$value = 'VO'"/>
                            <xsl:when test="$value = 'BVE'"/>
                            <xsl:when test="$value = 'HBO'"/>
                            <xsl:when test="$value = 'WO'"/>
                            <xsl:when test="$value = 'bedrijfsopleiding'"/>
                            <xsl:when test="contains($value,'other')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'school')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'training')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'SBaO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'SO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'VVE')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'PO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'VO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'BVE')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'HBO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'WO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'bedrijfsopleiding')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'SBAO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Bedrijfsopleiding')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Higher education')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Other')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Training')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'School')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'higher%20education')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>context_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when> 
                    <!-- IEEE-LOMv1.0 -->                    
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_context_czp_20060628') or contains(child::*[local-name()= 'source'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']"/> 
                        <xsl:choose>
                            <xsl:when test="$value = 'other'"/>
                            <xsl:when test="$value = 'school'"/>
                            <xsl:when test="$value = 'training'"/>
                            <xsl:when test="$value = 'SBaO'"/>
                            <xsl:when test="$value = 'SO'"/>
                            <xsl:when test="$value = 'VVE'"/>
                            <xsl:when test="$value = 'PO'"/>
                            <xsl:when test="$value = 'VO'"/>
                            <xsl:when test="$value = 'BVE'"/>
                            <xsl:when test="$value = 'HBO'"/>
                            <xsl:when test="$value = 'WO'"/>
                            <xsl:when test="$value = 'bedrijfsopleiding'"/>
                            <xsl:when test="contains($value,'other')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'school')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'training')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'SBaO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'SO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'VVE')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'PO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'VO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'BVE')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'HBO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'WO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'bedrijfsopleiding')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'SBAO')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Bedrijfsopleiding')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Higher education')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Other')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'Training')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'School')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value,'higher%20education')">
                                <xsl:text>context_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>context_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>   
                </xsl:choose>
            </xsl:for-each>

            <!-- typicallearningtime zowel voor IMS-MDv1.2.4 als voor IEEE-LOMv1.0 -->
            <xsl:for-each select="child::*[local-name() = 'educational']/*[local-name() = 'typicallearningtime' or local-name() = 'typicalLearningTime']">
                <xsl:variable name="nodeValue">
                    <xsl:choose>
                        <!-- IMS-MDv1.2.4 -->
                        <xsl:when test="child::*[local-name() = 'datetime']">
                            <xsl:value-of select="child::*[local-name() = 'datetime']"/>
                        </xsl:when>
                        <!-- IEEE-LOMv1.0 --> 
                        <xsl:when test="child::*[local-name() = 'duration']">
                            <xsl:value-of select="child::*[local-name() = 'duration']"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                
                <!-- Valideer de waarde -->
                <xsl:variable name="validationResult">
                    <xsl:call-template name="typicalLearningTimeValidation">
                        <!-- Waarde moet altijd met P beginnen -->
                        <xsl:with-param name="label">
                            <xsl:text>P</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="value">
                            <xsl:value-of select="$nodeValue"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                
                <xsl:if test="contains($validationResult, 'false')">
                    <xsl:text>typicallearningtime_delete::</xsl:text>
                    <xsl:value-of select="$nodeValue"/>
                    <xsl:text>||</xsl:text>
                </xsl:if>
            </xsl:for-each> 
            
            <!-- cost met vdex: vdex_cost_lomv1p0_20060628 of LOMv1.0 -->
            <!-- zowel voor IMS-MDv1.2.4 als voor IEEE-LOMv1.0 -->
            <xsl:for-each select="child::*[local-name() = 'rights']/*[local-name() = 'cost']">
                <xsl:choose>
                    <!-- IMS-MDv1.2.4 -->
                    <xsl:when test="contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'vdex_cost_lomv1p0_20060628') or contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = 'yes'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                                <xsl:text>cost_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                                <xsl:text>cost_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>cost_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- IEEE-LOMv1.0 -->
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_cost_lomv1p0_20060628') or contains(child::*[local-name()= 'source'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = 'yes'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                                <xsl:text>cost_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                                <xsl:text>cost_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>cost_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each> 
            
            <!-- copyrightandotherrestrictions met vdex: vdex_copyrightandotherrestrictions_lomv1p0_20060628 of LOMv1.0 -->
            <!-- zowel voor IMS-MDv1.2.4 als voor IEEE-LOMv1.0 -->
            <xsl:for-each select="child::*[local-name() = 'rights']/*[local-name() = 'copyrightandotherrestrictions' or local-name() = 'copyrightAndOtherRestrictions']">
                <xsl:choose>
                    <!-- IMS-MDv1.2.4 -->
                    <xsl:when test="contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'vdex_copyrightandotherrestrictions_lomv1p0_20060628') or contains(child::*[local-name() = 'source']/*[local-name() = 'langstring'], 'vdex_copyrightsandotherrestrictions_lomv1p0_20060628') or contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = 'yes'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'cc-by-nc-sa-30') or contains($value, 'cc-by-nc-nd-30') or contains($value, 'cc-by-sa-30') or contains($value, 'cc-by-nc-30') or contains($value, 'cc-by-nd-30') or contains($value, 'cc-by-30')">
                                <xsl:text>copyrightandotherrestrictions_edit::VDEX changed for </xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>copyrightandotherrestrictions_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="contains(child::*[local-name()= 'source']/*[local-name() = 'langstring'], 'copyrightsandotherrestrictions_nllom_20110411')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']/*[local-name() = 'langstring']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = 'yes'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'cc-by-nc-sa-30'"/>
                            <xsl:when test="$value = 'cc-by-nc-nd-30'"/>
                            <xsl:when test="$value = 'cc-by-sa-30'"/>
                            <xsl:when test="$value = 'cc-by-nc-30'"/>
                            <xsl:when test="$value = 'cc-by-nd-30'"/>
                            <xsl:when test="$value = 'cc-by-30'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'cc-by-nc-sa-30') or contains($value, 'cc-by-nc-nd-30') or contains($value, 'cc-by-sa-30') or contains($value, 'cc-by-nc-30') or contains($value, 'cc-by-nd-30') or contains($value, 'cc-by-30')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>copyrightandotherrestrictions_delete::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- IEEE-LOMv1.0 -->
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'vdex_copyrightandotherrestrictions_lomv1p0_20060628') or contains(child::*[local-name() = 'source'], 'vdex_copyrightsandotherrestrictions_lomv1p0_20060628') or contains(child::*[local-name()= 'source'], 'LOMv1.0')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = 'yes'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'cc-by-nc-sa-30') or contains($value, 'cc-by-nc-nd-30') or contains($value, 'cc-by-sa-30') or contains($value, 'cc-by-nc-30') or contains($value, 'cc-by-nd-30') or contains($value, 'cc-by-30')">
                                <xsl:text>copyrightandotherrestrictions_edit::VDEX changed for </xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="contains(child::*[local-name()= 'source'], 'copyrightsandotherrestrictions_nllom_20110411')">
                        <xsl:variable name="value" select="child::*[local-name() = 'value']"/>                
                        <xsl:choose>
                            <xsl:when test="$value = 'yes'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'cc-by-nc-sa-30'"/>
                            <xsl:when test="$value = 'cc-by-nc-nd-30'"/>
                            <xsl:when test="$value = 'cc-by-sa-30'"/>
                            <xsl:when test="$value = 'cc-by-nc-30'"/>
                            <xsl:when test="$value = 'cc-by-nd-30'"/>
                            <xsl:when test="$value = 'cc-by-30'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="$value = 'no'"/>
                            <xsl:when test="contains($value,'yes') or contains($value, 'Yes') or contains($value, 'YES') or contains($value, 'ja') or contains($value, 'Ja') or contains($value, 'JA')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'no') or contains($value, 'No') or contains($value, 'NO') or contains($value, 'nee') or contains($value, 'Nee') or contains($value, 'NEE')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains($value, 'cc-by-nc-sa-30') or contains($value, 'cc-by-nc-nd-30') or contains($value, 'cc-by-sa-30') or contains($value, 'cc-by-nc-30') or contains($value, 'cc-by-nd-30') or contains($value, 'cc-by-30')">
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text><xsl:value-of select="$value"/><xsl:text>||</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>copyrightandotherrestrictions_edit::</xsl:text>
                                <xsl:value-of select="$value"/>
                                <xsl:text>||</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>  
            
        </xsl:variable>
        
                
        <!-- Maak een taxonpad aan als er foute waarden gevonden zijn -->
        <xsl:if test="$classificationValidation != ''">
            <xsl:call-template name="classification">
                <xsl:with-param name="purpose_value" select="'idea'"/>
                <xsl:with-param name="taxon_source" select="'https://raw.github.com/kennisnet/vocabularies/master/vdex_lom_field_validation.xml'"/>
                <xsl:with-param name="taxons" select="$classificationValidation"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <!-- validatie van de waarde in het typicallearningtime veld -->
    <xsl:template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                                    <xsl:call-template name="typicalLearningTimeValidation">
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
                                    <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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
                            <xsl:call-template name="typicalLearningTimeValidation">
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

    <!-- make sure access rights are set -->
    <xsl:template name="ensureAccessrights">
        <!-- 'OpenAccess::open toegang||' is a good default -->
        <xsl:param name="taxons"/>

        <xsl:variable name="accessrightsExists">
            <!-- check is very simple, if purpose value exists, we asume it is present already -->
            <xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'purpose']">
                <xsl:if test="child::*[local-name()= 'value']/*[local-name() = 'langstring']='access rights'">
                    <xsl:text>true</xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:if test="$accessrightsExists!='true'">
            <xsl:call-template name="classification">
                <xsl:with-param name="purpose_value" select="'access rights'"/>
                <xsl:with-param name="taxon_source" select="'http://purl.edustandaard.nl/classification_accessrights_nllom_20180530'"/>
                <xsl:with-param name="taxons" select="$taxons"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>    

</xsl:stylesheet>
