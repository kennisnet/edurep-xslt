<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>
	
	<!-- Include VDEX mappings -->
	<xsl:include href="edurep://discipline_20060628"/>
	<xsl:include href="edurep://discipline_domains_lb_20110301"/>
	<xsl:include href="edurep://discipline_mathematics_20110923"/>
	<xsl:include href="edurep://domeinoverstijgende_vakken_mbo_2009"/>
	<xsl:include href="edurep://educationallevel_20060628"/>
	<xsl:include href="edurep://educationallevel_20071115"/>
	<xsl:include href="edurep://kerndoelen_po_04_2006"/>
	<xsl:include href="edurep://kerndoelen_onderbouw_vo_20071115"/>
	<xsl:include href="edurep://opleidingsdomeinen_en_studierichtingen_mbo_2010"/>
	<xsl:include href="edurep://referentiekader_taal_en_rekenen_czp_2009"/>
	<xsl:include href="edurep://vakaanduiding_po_2009"/>
	<xsl:include href="edurep://vakaanduiding_vo_20071115"/>

	<!-- Map repositories and VDEX -->
	<xsl:template name="collectionMapping">
		<xsl:choose>
			<xsl:when test="$collectionName = 'artik'">
				<xsl:call-template name="vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010_newToOld"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'biodesk'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_kerndoelen_onderbouw_vo_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_kerndoelen_po_04_2006_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_vo_20071115_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'digibordopschool'">
				<xsl:call-template name="vdex_classification_discipline_czp_20060628_oldToNew"/>
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_kerndoelen_onderbouw_vo_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_kerndoelen_po_04_2006_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_vo_20071115_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'FreudenthalInstituut'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20060628_oldToNew"/>
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_referentiekader_taal_en_rekenen_czp_2009_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_vo_20071115_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'geologievannederland'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_vo_20071115_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'GroenKennisnetCc'">
				<xsl:call-template name="vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010_newToOld"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'krantindeklas'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
				<xsl:call-template name="vdex_classification_kerndoelen_po_04_2006_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_vo_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_kerndoelen_onderbouw_vo_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_domeinoverstijgende_vakken_mbo_2009_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'metaplus'">
				<xsl:call-template name="vdex_classification_discipline_czp_20060628_newToOld"/>
				<xsl:call-template name="vdex_classification_domeinoverstijgende_vakken_mbo_2009_newToOld"/>
				<xsl:call-template name="vdex_classification_kerndoelen_onderbouw_vo_20071115_newToOld"/>
				<xsl:call-template name="vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010_newToOld"/>
				<xsl:call-template name="vdex_classification_discipline_domains_lb_20110301_newToOld"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'NME'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'nmegids'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
			</xsl:when>

			<xsl:when test="$collectionName = 'Teleblik'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'webkwestie'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20060628_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
			</xsl:when>
			<xsl:when test="$collectionName = 'wellant'">
				<xsl:call-template name="vdex_classification_educationallevel_czp_20060628_oldToNew"/>
				<xsl:call-template name="vdex_classification_educationallevel_czp_20071115_oldToNew"/>
				<xsl:call-template name="vdex_classification_vakaanduidingen_po_2009_oldToNew"/>
				<xsl:call-template name="vdex_classification_opleidingsdomeinen_en_studierichtingen_mbo_2010_newToOld"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>

