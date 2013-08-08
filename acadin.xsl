<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns="http://www.openarchives.org/OAI/2.0/" version="1.0" xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

	<xsl:include href="edurep://repositoryToVdexMapping"/>
	<!-- Collectienaam voor het koppelen van -->
	<xsl:variable name="collectionName">
		<xsl:text>acadin</xsl:text>
	</xsl:variable>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>czp</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:apply-templates select="//lom:lom"/>
	</xsl:template>

	<xsl:template match="lom:lom">
		<xsl:copy>
			<xsl:attribute name="xsi:schemaLocation">http://www.imsglobal.org/xsd/imsmd_v1p2 imsmd_v1p2p4.xsd</xsl:attribute>
			<xsl:apply-templates select="@*[. != xsi:schemaLocation]|node()"/>
			<!-- Mapping begrippenkader -->
			<xsl:call-template name="collectionMapping"/>
		</xsl:copy>
	</xsl:template>

	<!-- Keyword element met een , splitsen in meerdere keyword elementen -->
	<xsl:template match="lom:general/lom:keyword">
		<xsl:choose>
			<xsl:when test="contains(child::lom:langstring, ',')">
				<xsl:call-template name="splitKeywords">
					<xsl:with-param name="inputString">
						<xsl:value-of select="child::lom:langstring"/>
					</xsl:with-param>
					<xsl:with-param name="langstringLanguage">
						<xsl:value-of select="child::lom:langstring/@xml:lang"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="czp:keyword">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- rechten aanpassen voor cc-by-nc-sa-30 en cc-by-sa-30 -->
	<xsl:template match="lom:copyrightandotherrestrictions">
		<xsl:choose>
			<xsl:when test="following-sibling::lom:description/lom:langstring = 'Creative Commons Naamsvermelding-NietCommercieel-GelijkDelen'">
				<xsl:element name="czp:copyrightandotherrestrictions">
					<xsl:copy-of select="child::lom:source"/>
					<xsl:element name="czp:value">
						<xsl:element name="czp:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>cc-by-nc-sa-30</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:when test="following-sibling::lom:description/lom:langstring = 'Creative Commons Naamsvermelding-GelijkDelen'">
				<xsl:element name="czp:copyrightandotherrestrictions">
					<xsl:copy-of select="child::lom:source"/>
					<xsl:element name="czp:value">
						<xsl:element name="czp:langstring">
							<xsl:attribute name="xml:lang">
								<xsl:text>x-none</xsl:text>
							</xsl:attribute>
							<xsl:text>cc-by-sa-30</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="czp:copyrightandotherrestrictions">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- default copy -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<!-- splits keywords die een , bevatten -->
	<xsl:template name="splitKeywords">
		<xsl:param name="inputString"/>
		<xsl:param name="langstringLanguage"/>

		<xsl:element name="czp:keyword">
			<xsl:element name="czp:langstring">
				<xsl:attribute name="xml:lang">
					<xsl:value-of select="$langstringLanguage"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="contains($inputString, ',')">
						<xsl:value-of select="substring-before($inputString, ',')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$inputString"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:element>

		<xsl:variable name="newInputString" select="substring-after($inputString, ', ')"/>
		<xsl:if test="string-length($newInputString) &gt; 0">
			<xsl:call-template name="splitKeywords">
				<xsl:with-param name="inputString" select="$newInputString"/>
				<xsl:with-param name="langstringLanguage" select="$langstringLanguage"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>

