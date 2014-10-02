<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:oai="http://www.openarchives.org/OAI/2.0/" 
	xmlns:lom="http://ltsc.ieee.org/xsd/LOM" 
	xmlns="http://www.openarchives.org/OAI/2.0/" 
	version="1.0"
	xsi:schemaLocation="http://www.imsglobal.org/xsd/imsmd_v1p2 http://www.imsglobal.org/xsd/imsmd_v1p2p4.xsd http://www.openarchives.org/OAI/2.0/ http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" standalone="no"/>

	<!-- De door de collectie gebruikte namespace -->
	<xsl:variable name="usedNamespace">
		<xsl:text>lom</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:apply-templates select="//lom:lom"/>
	</xsl:template>
	
	<xsl:template match="lom:lom">
		<xsl:element name="lom:lom">
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
	
	
	<xsl:template match="lom:aggregationLevel">
		<xsl:element name="lom:aggregationLevel">
			<xsl:element name="lom:source">
				<xsl:text>LOMv1.0</xsl:text>				
			</xsl:element>
			<xsl:element name="lom:value">
				<xsl:value-of select="child::lom:value"/>
			</xsl:element>
			
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="lom:entity">
		<xsl:element name="lom:entity">
			<xsl:call-template name="normaliseEntity">
				<xsl:with-param name="entityString">
					<xsl:value-of select="node()"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="lom:metadataSchema">
		<xsl:element name="lom:metadataSchema">
			<xsl:value-of select="'LOMv1.0'"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="lom:context">
		<xsl:element name="lom:context">
			<xsl:element name="lom:source">
				<xsl:text>http://purl.edustandaard.nl/vdex_context_czp_20060628.xml</xsl:text>
			</xsl:element>
			<xsl:element name="lom:value">
				<xsl:text>HBO</xsl:text>
			</xsl:element>
		</xsl:element>
		<xsl:element name="lom:context">
			<xsl:element name="lom:source">
				<xsl:text>http://purl.edustandaard.nl/vdex_context_czp_20060628.xml</xsl:text>
			</xsl:element>
			<xsl:element name="lom:value">
				<xsl:text>WO</xsl:text>
			</xsl:element>
		</xsl:element>
		<xsl:element name="lom:context">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="lom:copyrightAndOtherRestrictions">
		<xsl:element name="lom:copyrightAndOtherRestrictions">
			<xsl:element name="lom:source">
				<xsl:text>http://purl.edustandaard.nl/copyrightsandotherrestrictions_nllom_20110411</xsl:text>
			</xsl:element>
			<xsl:element name="lom:value">
				<xsl:choose>				
					<xsl:when test="following-sibling::lom:description/lom:string != ''">
						<xsl:text>by</xsl:text><xsl:value-of select="substring-before(substring-after(following-sibling::lom:description/lom:string, 'by'), ' ')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="child::lom:value"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:element>	
	</xsl:template>
	
	<xsl:template match="lom:rights/lom:description"/>
	
	
	<xsl:template match="lom:taxonPath">
		<xsl:element name="lom:taxonPath">
			<xsl:element name="lom:source">
				<xsl:element name="lom:string">
					<xsl:attribute name="language">
						<xsl:value-of select="child::lom:source/lom:string/@language"/>
					</xsl:attribute>
					<xsl:text>LOMv1.0</xsl:text>
				</xsl:element>
			</xsl:element>
			<xsl:for-each select="child::lom:taxon">
				<xsl:element name="lom:taxon">
					<xsl:element name="lom:id">
						<xsl:value-of select="child::lom:id"/>
					</xsl:element>
					<xsl:element name="lom:entry">
						<xsl:element name="lom:string">
							<xsl:attribute name="language">
								<xsl:value-of select="child::lom:entry/lom:string/@language"/>
							</xsl:attribute>
							<xsl:value-of select="child::lom:entry/lom:string"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="lom:taxonPath/lom:source"/>
	<xsl:template match="lom:taxonPath/lom:taxon"/>
	
	<xsl:template match="lom:source">
		<xsl:element name="lom:source">
		<xsl:choose>
			<xsl:when test="node() = 'IMS 1.3'">
				<xsl:value-of select="'LOMv1.0'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="node()"/>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:element>
	</xsl:template>
	


	<!-- default copy -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	
	<xsl:template name="normaliseEntity">
		<xsl:param name="entityString"/>
		
		<xsl:choose>
			<xsl:when test="contains($entityString, '&#xA;&#xA;')">
				<xsl:variable name="newEntityString">
					<xsl:value-of select="substring-before($entityString, '&#xA;&#xA;')"/>
					<xsl:text>&#xA;</xsl:text>
					<xsl:value-of select="substring-after($entityString, '&#xA;&#xA;')"/>
				</xsl:variable>
				
				<xsl:value-of select="$newEntityString"/>
				
				<xsl:if test="contains($newEntityString, '&#xA;&#xA;')">
					<xsl:call-template name="normaliseEntity">
						<xsl:with-param name="entityString">
							<xsl:value-of select="$newEntityString"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				
				
				
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$entityString"/>
			</xsl:otherwise>
		</xsl:choose>
		
		
		
		
		
		
		
	</xsl:template>

</xsl:stylesheet>

