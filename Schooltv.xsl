<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

    <xsl:include href="edurep://validate"/>

    <!-- De door de collectie gebruikte namespace -->
    <xsl:variable name="usedNamespace">
        <xsl:text>lom</xsl:text>
    </xsl:variable>

    <xsl:template match="/">
        <xsl:apply-templates select="//lom:lom"/>
    </xsl:template>

    <xsl:template match="lom:lom">
        <xsl:copy>
            <xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
            <xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
            <!-- make educational levels op basis van typical age range -->
            <xsl:call-template name="buildObkEducationalLevels"/>


            <!-- Maak een classificatie voor de validatie -->
            <xsl:call-template name="buildClassification"/>
            <!-- add access rights -->
            <xsl:call-template name="ensureAccessrights">
                <xsl:with-param name="taxons" select="'OpenAccess::open toegang||'"/>
            </xsl:call-template>
        </xsl:copy>
    </xsl:template>


    <xsl:template name="buildObkEducationalLevels">
        <xsl:variable name="typicalAgeRange" select="child::lom:educational/lom:typicalagerange/lom:langstring"/>

        <xsl:variable name="taxons">
            <!-- always PO -->
            <xsl:text>512e4729-03a4-43a2-95ba-758071d1b725::Primair Onderwijs||</xsl:text>

            <!-- at 2019-12, only a few ranges are used: *, 0-4, 5-6, 7-8, 9-12, 13-15, 16-18 -->
            <xsl:choose>
                <xsl:when test="$typicalAgeRange = '0-4'">
                    <xsl:text>82ca4442-246c-44b3-a562-7b101793feb4::PO groep 1||</xsl:text>
                    <xsl:text>c007e4dd-a3d4-4f33-902d-778e3bbeeddb::PO groep 2||</xsl:text>
                </xsl:when>
                <xsl:when test="$typicalAgeRange = '5-6'">
                    <xsl:text>c007e4dd-a3d4-4f33-902d-778e3bbeeddb::PO groep 2||</xsl:text>
                    <xsl:text>25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4::PO groep 3||</xsl:text>
                </xsl:when>
                <xsl:when test="$typicalAgeRange = '7-8'">
                    <xsl:text>25a2f4f4-cf91-4b16-94bc-6d9e6fad88f4::PO groep 3||</xsl:text>
                    <xsl:text>5c072b3f-7f58-40ee-9799-27981f0a6b2b::PO groep 4||</xsl:text>
                </xsl:when>
                <xsl:when test="$typicalAgeRange = '9-12'">
                    <xsl:text>bc213214-b83d-4673-b9c1-8fdaa63d6d56::PO groep 5||</xsl:text>
                    <xsl:text>abfb190f-e814-46f5-a9cc-ebd53f04018e::PO groep 6||</xsl:text>
                    <xsl:text>a4813bb6-cf63-4594-af56-6afb321723d8::PO groep 7||</xsl:text>
                    <xsl:text>95138558-9f65-4888-8ea3-8acce5eea273::PO groep 8||</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>2a1401e9-c223-493b-9b86-78f6993b1a8d::Voortgezet onderwijs||</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="classification">
            <xsl:with-param name="purpose_value" select="'educational level'"/>
            <xsl:with-param name="taxon_source" select="$vdex_classification_begrippenkader"/>
            <xsl:with-param name="taxons" select="$taxons"/>
        </xsl:call-template>
    </xsl:template>


    <!-- default copy -->
    <xsl:template match="@*|node()">
        <xsl:call-template name="validateValue"/>
    </xsl:template>

</xsl:stylesheet>
