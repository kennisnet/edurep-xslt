<xsl:stylesheet xmlns="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_czp="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_dc="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_gkn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:oai_kn="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom_ims="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:nllom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:lom="http://www.imsglobal.org/xsd/imsmd_v1p2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="no" encoding="UTF-8" standalone="no"/>

<xsl:key name="classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'begrippenkader')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<xsl:key name="classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115" match="*[local-name() = 'classification'][child::*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline']/*[local-name() = 'taxonpath'][contains(child::*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_vakaanduidingen_vo_20071115')]/*[local-name() = 'taxon']" use="*[local-name() = 'id']"/>
<!-- Vervangt oude VDEX waarden voor waarden uit het begrippenkader -->
<xsl:template name="vdex_classification_vakaanduidingen_vo_20071115_oldToNew">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'aardrijkskunde' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c001f86a-4f8f-4420-bd78-381c615ecedc') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'algemene natuurwetenschappen' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3b49e7f7-00cc-47ad-8403-32adb3ec31ee') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Arabisch' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','455d527a-bfd0-4460-919e-12e0478a54cf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'beeldende vorming' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4c8a3378-6616-459d-acc4-83ee5a9b91a2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'biologie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','2b363227-8633-4652-ad57-c61f1efc02c8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Chinees' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1f7aa29f-38d8-4dab-91db-3be52669951f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'culturele en kunstzinnige vorming' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1773b48b-1cce-4a77-bec2-5fd3aa0e2ec2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'dans' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','0b1fbf62-4eb4-4af3-a267-3cd3215d6aac') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'drama' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','904a6dbc-c236-42c8-aaa9-a5d7eaa9639f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Duits' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','81a1f605-db58-448d-a1dc-da682316c505') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'economie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4ba5583f-b147-42cc-a083-ce5ebfd53746') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Engels' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','18f53978-1118-4051-a778-b8d7f60ca982') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'filosofie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','d35b903f-1598-4bdd-a2fa-8aba854df762') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Frans' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','9f4710e3-f173-404e-b12e-577657a5da04') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Fries' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','93a7126d-7307-4b6a-b55a-f4f78e92f680') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'geschiedenis' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'godsdienst' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','e605402f-4cc2-46bb-9026-d1d49bde17bf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Grieks' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c92a4d95-f2bb-4eb0-8861-0691365f15b1') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'handvaardigheid' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','f1116b34-14c9-4098-85fb-aed1b9473894') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'informatica' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','2845473d-ce18-450a-9135-6738abbdc129') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Italiaans' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','aedcfc1c-a676-4f40-8587-4a5f43a354b5') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'klassieke culturele vorming' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','42e5a6c8-3d23-4a02-a409-aeaa9fc01721') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'kunst' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4aa16ae7-48c6-4f96-b48d-a67389a7050d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Latijn' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1cb06441-fc86-49fa-9347-a5869acb3778') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'letterkunde' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b3f61346-92c4-4fb5-9207-6a4142b64122') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'lichamelijke opvoeding' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','bc7cb521-bdfe-46ab-b635-f2d2189bdd39') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'maatschappijleer' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','7596e435-d417-4de8-a32e-8e61f11ee1d2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'maatschappijwetenschappen' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','04f6fd49-a81d-4142-9eac-66502c87f744') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'management en organisatie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','fd3988c5-9648-4c39-9122-93a7260c8bbe') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'muziek' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','7aa6f577-b02d-484a-90d6-72fc80199f9a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'natuur, leven en technologie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','08a3212d-1360-406b-ac95-61b16578a75d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'natuurkunde' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','e98be5ad-4bd2-4768-a9eb-7e24026e360c') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Nederlands' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3401cf6e-82e4-404c-b216-b980ff407159') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Portugees' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','dabf3753-248a-495b-b861-bcd36e2b55cb') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Russisch' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','116fbfd6-77d8-4676-8634-8cfd686942c9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'scheikunde' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3aab168a-9b24-4aca-b0f1-4bfb12e7c288') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Spaans' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','952bf604-cc38-44e3-889a-a9e74a18da8e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'techniek' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c6971373-aa44-4de9-91ef-aca886d42a6a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'tekenen' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','5cb7f440-c370-4056-b30d-f57130cccede') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'textiele vormgeving' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','5fa492c3-7f83-4e2f-8931-87fc1a2d0048') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'Turks' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'verzorging' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'wiskunde' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','7afbb7a6-c29b-425c-9c59-6f79c845f5f0') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'administratie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b5d1d3b4-a20c-40d4-b5fe-ee9aa819dc19') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'agrarische bedrijfseconomie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ad7e37a9-fe80-4b2c-a130-12af95499137') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'agrarische techniek' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','62aac92b-00ad-4d0c-8aec-98713cbfea25') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bloembinden en schikken' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','351cd58e-1ec2-4bac-8b6f-9dc555b1c96d') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bouwtechniek - fijnhoutbewerking' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','37c5f10a-30a8-43b0-b2dd-60bf1721abcf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bouwtechniek - metselen' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3f02457c-0944-4ec3-b519-9c0132cce73b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bouwtechniek - schilderen' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','797704ac-6c19-4029-999d-41b5434770cf') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bouwtechniek - timmeren' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3b970baf-5338-469a-a08c-f13bc0cd071b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bouwtechniek breed' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','a0bc5d77-7231-46d0-8157-7d46f44c09a9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'consumptief - bakken' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ac42c9d5-7bcc-4769-862a-d9e83a075829') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'consumptief - horeca' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','bcc5ccd8-6f9e-4462-9f3e-b48d8471288a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'consumptief-breed' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','bcc5ccd8-6f9e-4462-9f3e-b48d8471288a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'dierhouderij en verzorging' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','59e44cb3-6e06-4c2d-a4a1-fa254a708f64') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'grafimedia' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','217cd594-7bf7-4515-971b-d9825afde27a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'groene ruimte' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4457dcb9-d619-43b2-8b69-e0c65f27c0fe') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'handel en administratie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','9ce440de-6f00-41f0-88f4-b414314e2ce8') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'handel en verkoop' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','d4ed648e-9542-4092-b6e3-727abdd2ea51') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ict-route' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b4f393ae-a033-4a76-b6e1-0bcbe867dd5a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'installatietechniek' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','6611b0e5-6773-4652-9eff-4cb37df7919a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'installektro' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b4f393ae-a033-4a76-b6e1-0bcbe867dd5a') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'landbouw breed' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','db5b20c4-4e94-4554-8137-a45acb130ad2') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'metaaltechniek' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','de3e7b4c-e4f5-4976-9b8b-65b66bd22635') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'metalektro' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','11255639-ada3-4df4-99a0-9a6cfdfd7934') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'mode en commercie' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','d9eb3e4c-e4a9-4eb8-bc1a-b7ae6f1f3b90') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'plantenteelt' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c85887b4-c7bb-46ae-882d-3215a3c0411f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'sport, dienstverlening en veiligheid' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','70d98953-5ad0-4cd9-b887-e99dcc931844') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'techniek breed' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','391cc969-81fa-4d30-940b-68714fb50b5e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'technologie in de gemengde leerweg' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','433a3b22-32a2-4136-93f4-35bd369f9b1b') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'transport en logistiek' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','a4109169-ad0b-4691-bedf-41f1a2b4061e') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'uiterlijke verzorging' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','e3340775-67e8-4db0-a5ad-816d7712deda') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'verwerking agrarische producten' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','a583552a-1732-435b-9354-21bb39646b1f') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'voertuigentechniek' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1191725c-5d0c-4067-b5f0-4d80b63014cd') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'zorg en welzijn breed' and key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','f653d5cb-5173-422c-abc3-2cc837c2e8e9') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != 'aardrijkskunde' and descendant::*[local-name() = 'id'] != 'algemene natuurwetenschappen' and descendant::*[local-name() = 'id'] != 'Arabisch' and descendant::*[local-name() = 'id'] != 'beeldende vorming' and descendant::*[local-name() = 'id'] != 'biologie' and descendant::*[local-name() = 'id'] != 'Chinees' and descendant::*[local-name() = 'id'] != 'culturele en kunstzinnige vorming' and descendant::*[local-name() = 'id'] != 'dans' and descendant::*[local-name() = 'id'] != 'drama' and descendant::*[local-name() = 'id'] != 'Duits' and descendant::*[local-name() = 'id'] != 'economie' and descendant::*[local-name() = 'id'] != 'Engels' and descendant::*[local-name() = 'id'] != 'filosofie' and descendant::*[local-name() = 'id'] != 'Frans' and descendant::*[local-name() = 'id'] != 'Fries' and descendant::*[local-name() = 'id'] != 'geschiedenis' and descendant::*[local-name() = 'id'] != 'godsdienst' and descendant::*[local-name() = 'id'] != 'Grieks' and descendant::*[local-name() = 'id'] != 'handvaardigheid' and descendant::*[local-name() = 'id'] != 'informatica' and descendant::*[local-name() = 'id'] != 'Italiaans' and descendant::*[local-name() = 'id'] != 'klassieke culturele vorming' and descendant::*[local-name() = 'id'] != 'kunst' and descendant::*[local-name() = 'id'] != 'Latijn' and descendant::*[local-name() = 'id'] != 'letterkunde' and descendant::*[local-name() = 'id'] != 'lichamelijke opvoeding' and descendant::*[local-name() = 'id'] != 'maatschappijleer' and descendant::*[local-name() = 'id'] != 'maatschappijwetenschappen' and descendant::*[local-name() = 'id'] != 'management en organisatie' and descendant::*[local-name() = 'id'] != 'muziek' and descendant::*[local-name() = 'id'] != 'natuur, leven en technologie' and descendant::*[local-name() = 'id'] != 'natuurkunde' and descendant::*[local-name() = 'id'] != 'Nederlands' and descendant::*[local-name() = 'id'] != 'Portugees' and descendant::*[local-name() = 'id'] != 'Russisch' and descendant::*[local-name() = 'id'] != 'scheikunde' and descendant::*[local-name() = 'id'] != 'Spaans' and descendant::*[local-name() = 'id'] != 'techniek' and descendant::*[local-name() = 'id'] != 'tekenen' and descendant::*[local-name() = 'id'] != 'textiele vormgeving' and descendant::*[local-name() = 'id'] != 'Turks' and descendant::*[local-name() = 'id'] != 'verzorging' and descendant::*[local-name() = 'id'] != 'wiskunde' and descendant::*[local-name() = 'id'] != 'administratie' and descendant::*[local-name() = 'id'] != 'agrarische bedrijfseconomie' and descendant::*[local-name() = 'id'] != 'agrarische techniek' and descendant::*[local-name() = 'id'] != 'bloembinden en schikken' and descendant::*[local-name() = 'id'] != 'bouwtechniek - fijnhoutbewerking' and descendant::*[local-name() = 'id'] != 'bouwtechniek - metselen' and descendant::*[local-name() = 'id'] != 'bouwtechniek - schilderen' and descendant::*[local-name() = 'id'] != 'bouwtechniek - timmeren' and descendant::*[local-name() = 'id'] != 'bouwtechniek breed' and descendant::*[local-name() = 'id'] != 'consumptief - bakken' and descendant::*[local-name() = 'id'] != 'consumptief - horeca' and descendant::*[local-name() = 'id'] != 'consumptief-breed' and descendant::*[local-name() = 'id'] != 'dierhouderij en verzorging' and descendant::*[local-name() = 'id'] != 'grafimedia' and descendant::*[local-name() = 'id'] != 'groene ruimte' and descendant::*[local-name() = 'id'] != 'handel en administratie' and descendant::*[local-name() = 'id'] != 'handel en verkoop' and descendant::*[local-name() = 'id'] != 'ict-route' and descendant::*[local-name() = 'id'] != 'installatietechniek' and descendant::*[local-name() = 'id'] != 'installektro' and descendant::*[local-name() = 'id'] != 'landbouw breed' and descendant::*[local-name() = 'id'] != 'metaaltechniek' and descendant::*[local-name() = 'id'] != 'metalektro' and descendant::*[local-name() = 'id'] != 'mode en commercie' and descendant::*[local-name() = 'id'] != 'plantenteelt' and descendant::*[local-name() = 'id'] != 'sport, dienstverlening en veiligheid' and descendant::*[local-name() = 'id'] != 'techniek breed' and descendant::*[local-name() = 'id'] != 'technologie in de gemengde leerweg' and descendant::*[local-name() = 'id'] != 'transport en logistiek' and descendant::*[local-name() = 'id'] != 'uiterlijke verzorging' and descendant::*[local-name() = 'id'] != 'verwerking agrarische producten' and descendant::*[local-name() = 'id'] != 'voertuigentechniek' and descendant::*[local-name() = 'id'] != 'zorg en welzijn breed'"/>
<xsl:otherwise>
<xsl:text>unmatched</xsl:text>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:variable>

<xsl:if test="contains($createClassification, 'unmatched')">
<xsl:element name="{$usedNamespace}:classification">
<xsl:element name="{$usedNamespace}:purpose">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:value">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>discipline</xsl:text>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:taxonpath">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/begrippenkader</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsOldToNewvdex_classification_vakaanduidingen_vo_20071115"/>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:template>


<xsl:template name="writeTaxonsOldToNewvdex_classification_vakaanduidingen_vo_20071115">
<!-- Map de individuele oude taxons naar nieuwe begrippenkader waarden -->
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'vdex_classification_vakaanduidingen_vo_20071115')]">
<xsl:choose>
<xsl:when test="node() = 'aardrijkskunde' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c001f86a-4f8f-4420-bd78-381c615ecedc'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c001f86a-4f8f-4420-bd78-381c615ecedc'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'algemene natuurwetenschappen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3b49e7f7-00cc-47ad-8403-32adb3ec31ee'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3b49e7f7-00cc-47ad-8403-32adb3ec31ee'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Algemene natuurwetenschappen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Arabisch' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','455d527a-bfd0-4460-919e-12e0478a54cf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'455d527a-bfd0-4460-919e-12e0478a54cf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Arabisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'beeldende vorming' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4c8a3378-6616-459d-acc4-83ee5a9b91a2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4c8a3378-6616-459d-acc4-83ee5a9b91a2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beeldende vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'biologie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','2b363227-8633-4652-ad57-c61f1efc02c8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2b363227-8633-4652-ad57-c61f1efc02c8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Biologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Chinees' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1f7aa29f-38d8-4dab-91db-3be52669951f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1f7aa29f-38d8-4dab-91db-3be52669951f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Chinees'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'culturele en kunstzinnige vorming' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1773b48b-1cce-4a77-bec2-5fd3aa0e2ec2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1773b48b-1cce-4a77-bec2-5fd3aa0e2ec2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Culturele en kunstzinnige vorming'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'dans' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','0b1fbf62-4eb4-4af3-a267-3cd3215d6aac'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'0b1fbf62-4eb4-4af3-a267-3cd3215d6aac'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Dans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'drama' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','904a6dbc-c236-42c8-aaa9-a5d7eaa9639f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'904a6dbc-c236-42c8-aaa9-a5d7eaa9639f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Drama'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Duits' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','81a1f605-db58-448d-a1dc-da682316c505'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'81a1f605-db58-448d-a1dc-da682316c505'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duits'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'economie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4ba5583f-b147-42cc-a083-ce5ebfd53746'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4ba5583f-b147-42cc-a083-ce5ebfd53746'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Engels' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','18f53978-1118-4051-a778-b8d7f60ca982'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'18f53978-1118-4051-a778-b8d7f60ca982'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Engels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'filosofie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','d35b903f-1598-4bdd-a2fa-8aba854df762'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d35b903f-1598-4bdd-a2fa-8aba854df762'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Filosofie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Frans' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','9f4710e3-f173-404e-b12e-577657a5da04'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9f4710e3-f173-404e-b12e-577657a5da04'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Frans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Fries' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','93a7126d-7307-4b6a-b55a-f4f78e92f680'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'93a7126d-7307-4b6a-b55a-f4f78e92f680'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Fries'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'geschiedenis' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Geschiedenis'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'godsdienst' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','e605402f-4cc2-46bb-9026-d1d49bde17bf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e605402f-4cc2-46bb-9026-d1d49bde17bf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Godsdienst'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Grieks' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c92a4d95-f2bb-4eb0-8861-0691365f15b1'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c92a4d95-f2bb-4eb0-8861-0691365f15b1'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Grieks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'handvaardigheid' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','f1116b34-14c9-4098-85fb-aed1b9473894'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f1116b34-14c9-4098-85fb-aed1b9473894'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'informatica' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','2845473d-ce18-450a-9135-6738abbdc129'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'2845473d-ce18-450a-9135-6738abbdc129'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Informatica'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Italiaans' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','aedcfc1c-a676-4f40-8587-4a5f43a354b5'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'aedcfc1c-a676-4f40-8587-4a5f43a354b5'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Italiaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'klassieke culturele vorming' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','42e5a6c8-3d23-4a02-a409-aeaa9fc01721'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'42e5a6c8-3d23-4a02-a409-aeaa9fc01721'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Klassieke culturele vorming'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'kunst' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4aa16ae7-48c6-4f96-b48d-a67389a7050d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4aa16ae7-48c6-4f96-b48d-a67389a7050d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kunst en cultuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Latijn' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1cb06441-fc86-49fa-9347-a5869acb3778'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1cb06441-fc86-49fa-9347-a5869acb3778'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Latijn'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'letterkunde' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b3f61346-92c4-4fb5-9207-6a4142b64122'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b3f61346-92c4-4fb5-9207-6a4142b64122'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Literatuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'lichamelijke opvoeding' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','bc7cb521-bdfe-46ab-b635-f2d2189bdd39'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bc7cb521-bdfe-46ab-b635-f2d2189bdd39'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Lichamelijke opvoeding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'maatschappijleer' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','7596e435-d417-4de8-a32e-8e61f11ee1d2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7596e435-d417-4de8-a32e-8e61f11ee1d2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappijleer'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'maatschappijwetenschappen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','04f6fd49-a81d-4142-9eac-66502c87f744'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'04f6fd49-a81d-4142-9eac-66502c87f744'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappijwetenschappen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'management en organisatie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','fd3988c5-9648-4c39-9122-93a7260c8bbe'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'fd3988c5-9648-4c39-9122-93a7260c8bbe'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Management en organisatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'muziek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','7aa6f577-b02d-484a-90d6-72fc80199f9a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7aa6f577-b02d-484a-90d6-72fc80199f9a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Muziek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'natuur, leven en technologie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','08a3212d-1360-406b-ac95-61b16578a75d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'08a3212d-1360-406b-ac95-61b16578a75d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuur, leven en technologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'natuurkunde' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','e98be5ad-4bd2-4768-a9eb-7e24026e360c'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e98be5ad-4bd2-4768-a9eb-7e24026e360c'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuurkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Nederlands' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3401cf6e-82e4-404c-b216-b980ff407159'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3401cf6e-82e4-404c-b216-b980ff407159'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlands'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Portugees' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','dabf3753-248a-495b-b861-bcd36e2b55cb'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dabf3753-248a-495b-b861-bcd36e2b55cb'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Portugees'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Russisch' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','116fbfd6-77d8-4676-8634-8cfd686942c9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'116fbfd6-77d8-4676-8634-8cfd686942c9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Russisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'scheikunde' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3aab168a-9b24-4aca-b0f1-4bfb12e7c288'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3aab168a-9b24-4aca-b0f1-4bfb12e7c288'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Scheikunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Spaans' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','952bf604-cc38-44e3-889a-a9e74a18da8e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'952bf604-cc38-44e3-889a-a9e74a18da8e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Spaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'techniek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c6971373-aa44-4de9-91ef-aca886d42a6a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c6971373-aa44-4de9-91ef-aca886d42a6a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'tekenen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','5cb7f440-c370-4056-b30d-f57130cccede'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5cb7f440-c370-4056-b30d-f57130cccede'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'textiele vormgeving' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','5fa492c3-7f83-4e2f-8931-87fc1a2d0048'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'5fa492c3-7f83-4e2f-8931-87fc1a2d0048'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Textiele vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'Turks' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Turks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'verzorging' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'wiskunde' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','7afbb7a6-c29b-425c-9c59-6f79c845f5f0'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'7afbb7a6-c29b-425c-9c59-6f79c845f5f0'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wiskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'administratie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b5d1d3b4-a20c-40d4-b5fe-ee9aa819dc19'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b5d1d3b4-a20c-40d4-b5fe-ee9aa819dc19'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Administratie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'agrarische bedrijfseconomie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ad7e37a9-fe80-4b2c-a130-12af95499137'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ad7e37a9-fe80-4b2c-a130-12af95499137'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Agrarische bedrijfseconomie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'agrarische techniek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','62aac92b-00ad-4d0c-8aec-98713cbfea25'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'62aac92b-00ad-4d0c-8aec-98713cbfea25'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Agrarische techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bloembinden en schikken' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','351cd58e-1ec2-4bac-8b6f-9dc555b1c96d'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'351cd58e-1ec2-4bac-8b6f-9dc555b1c96d'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bloembinden en -schikken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bouwtechniek - fijnhoutbewerking' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','37c5f10a-30a8-43b0-b2dd-60bf1721abcf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'37c5f10a-30a8-43b0-b2dd-60bf1721abcf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - fijnhoutbewerking'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bouwtechniek - metselen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3f02457c-0944-4ec3-b519-9c0132cce73b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3f02457c-0944-4ec3-b519-9c0132cce73b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - metselen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bouwtechniek - schilderen' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','797704ac-6c19-4029-999d-41b5434770cf'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'797704ac-6c19-4029-999d-41b5434770cf'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - schilderen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bouwtechniek - timmeren' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','3b970baf-5338-469a-a08c-f13bc0cd071b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'3b970baf-5338-469a-a08c-f13bc0cd071b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - timmeren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bouwtechniek breed' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','a0bc5d77-7231-46d0-8157-7d46f44c09a9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a0bc5d77-7231-46d0-8157-7d46f44c09a9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouw - breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'consumptief - bakken' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','ac42c9d5-7bcc-4769-862a-d9e83a075829'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ac42c9d5-7bcc-4769-862a-d9e83a075829'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Consumptief - bakken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'consumptief - horeca' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','bcc5ccd8-6f9e-4462-9f3e-b48d8471288a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Consumptief - horeca'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'consumptief-breed' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','bcc5ccd8-6f9e-4462-9f3e-b48d8471288a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Consumptief - horeca'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'dierhouderij en verzorging' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','59e44cb3-6e06-4c2d-a4a1-fa254a708f64'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'59e44cb3-6e06-4c2d-a4a1-fa254a708f64'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Dierhouderij en verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'grafimedia' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','217cd594-7bf7-4515-971b-d9825afde27a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'217cd594-7bf7-4515-971b-d9825afde27a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Grafimedia'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'groene ruimte' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','4457dcb9-d619-43b2-8b69-e0c65f27c0fe'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'4457dcb9-d619-43b2-8b69-e0c65f27c0fe'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Groene ruimte'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'handel en administratie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','9ce440de-6f00-41f0-88f4-b414314e2ce8'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'9ce440de-6f00-41f0-88f4-b414314e2ce8'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handel en administratie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'handel en verkoop' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','d4ed648e-9542-4092-b6e3-727abdd2ea51'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d4ed648e-9542-4092-b6e3-727abdd2ea51'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handel en verkoop'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ict-route' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b4f393ae-a033-4a76-b6e1-0bcbe867dd5a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ict-route'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'installatietechniek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','6611b0e5-6773-4652-9eff-4cb37df7919a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'6611b0e5-6773-4652-9eff-4cb37df7919a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Installatietechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'installektro' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','b4f393ae-a033-4a76-b6e1-0bcbe867dd5a'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ict-route'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'landbouw breed' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','db5b20c4-4e94-4554-8137-a45acb130ad2'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'db5b20c4-4e94-4554-8137-a45acb130ad2'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Landbouw breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'metaaltechniek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','de3e7b4c-e4f5-4976-9b8b-65b66bd22635'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'de3e7b4c-e4f5-4976-9b8b-65b66bd22635'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Metaaltechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'metalektro' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','11255639-ada3-4df4-99a0-9a6cfdfd7934'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'11255639-ada3-4df4-99a0-9a6cfdfd7934'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Metalektro'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'mode en commercie' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','d9eb3e4c-e4a9-4eb8-bc1a-b7ae6f1f3b90'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'d9eb3e4c-e4a9-4eb8-bc1a-b7ae6f1f3b90'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mode en commercie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'plantenteelt' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','c85887b4-c7bb-46ae-882d-3215a3c0411f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'c85887b4-c7bb-46ae-882d-3215a3c0411f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Plantenteelt'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'sport, dienstverlening en veiligheid' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','70d98953-5ad0-4cd9-b887-e99dcc931844'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'70d98953-5ad0-4cd9-b887-e99dcc931844'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sport, dienstverlening en veiligheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'techniek breed' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','391cc969-81fa-4d30-940b-68714fb50b5e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'391cc969-81fa-4d30-940b-68714fb50b5e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'technologie in de gemengde leerweg' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','433a3b22-32a2-4136-93f4-35bd369f9b1b'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'433a3b22-32a2-4136-93f4-35bd369f9b1b'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Technologie in de gemengde leerweg'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'transport en logistiek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','a4109169-ad0b-4691-bedf-41f1a2b4061e'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a4109169-ad0b-4691-bedf-41f1a2b4061e'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Transport en logistiek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'uiterlijke verzorging' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','e3340775-67e8-4db0-a5ad-816d7712deda'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'e3340775-67e8-4db0-a5ad-816d7712deda'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Uiterlijke verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'verwerking agrarische producten' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','a583552a-1732-435b-9354-21bb39646b1f'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'a583552a-1732-435b-9354-21bb39646b1f'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verwerking agrarische producten'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'voertuigentechniek' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','1191725c-5d0c-4067-b5f0-4d80b63014cd'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'1191725c-5d0c-4067-b5f0-4d80b63014cd'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voertuigentechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'zorg en welzijn breed' and not(key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115','f653d5cb-5173-422c-abc3-2cc837c2e8e9'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'f653d5cb-5173-422c-abc3-2cc837c2e8e9'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Zorg en welzijn breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>


<!-- Vervangt indien nodig waarden van het begrippenkader voor waarden uit de oude VDEX -->
<xsl:template name="vdex_classification_vakaanduidingen_vo_20071115_newToOld">

<!-- Bepaal of er een waarde vervangen moet worden en dus een classificatie moet worden aangemaakt -->
<xsl:variable name="createClassification">
<xsl:for-each select="key('classification-by-newIdvdex_classification_vakaanduidingen_vo_20071115',descendant::*[local-name() = 'id'])">
<xsl:choose>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c001f86a-4f8f-4420-bd78-381c615ecedc' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','aardrijkskunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3b49e7f7-00cc-47ad-8403-32adb3ec31ee' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','algemene natuurwetenschappen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '455d527a-bfd0-4460-919e-12e0478a54cf' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Arabisch') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','beeldende vorming') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2b363227-8633-4652-ad57-c61f1efc02c8' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','biologie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1f7aa29f-38d8-4dab-91db-3be52669951f' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Chinees') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1773b48b-1cce-4a77-bec2-5fd3aa0e2ec2' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','culturele en kunstzinnige vorming') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '0b1fbf62-4eb4-4af3-a267-3cd3215d6aac' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','dans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '904a6dbc-c236-42c8-aaa9-a5d7eaa9639f' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','drama') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '81a1f605-db58-448d-a1dc-da682316c505' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Duits') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4ba5583f-b147-42cc-a083-ce5ebfd53746' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','economie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '18f53978-1118-4051-a778-b8d7f60ca982' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Engels') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd35b903f-1598-4bdd-a2fa-8aba854df762' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','filosofie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9f4710e3-f173-404e-b12e-577657a5da04' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Frans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '93a7126d-7307-4b6a-b55a-f4f78e92f680' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Fries') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','geschiedenis') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e605402f-4cc2-46bb-9026-d1d49bde17bf' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','godsdienst') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c92a4d95-f2bb-4eb0-8861-0691365f15b1' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Grieks') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f1116b34-14c9-4098-85fb-aed1b9473894' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','handvaardigheid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '2845473d-ce18-450a-9135-6738abbdc129' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','informatica') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'aedcfc1c-a676-4f40-8587-4a5f43a354b5' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Italiaans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '42e5a6c8-3d23-4a02-a409-aeaa9fc01721' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','klassieke culturele vorming') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4aa16ae7-48c6-4f96-b48d-a67389a7050d' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','kunst') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1cb06441-fc86-49fa-9347-a5869acb3778' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Latijn') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b3f61346-92c4-4fb5-9207-6a4142b64122' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','letterkunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bc7cb521-bdfe-46ab-b635-f2d2189bdd39' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','lichamelijke opvoeding') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7596e435-d417-4de8-a32e-8e61f11ee1d2' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','maatschappijleer') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '04f6fd49-a81d-4142-9eac-66502c87f744' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','maatschappijwetenschappen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'fd3988c5-9648-4c39-9122-93a7260c8bbe' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','management en organisatie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7aa6f577-b02d-484a-90d6-72fc80199f9a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','muziek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '08a3212d-1360-406b-ac95-61b16578a75d' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','natuur, leven en technologie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e98be5ad-4bd2-4768-a9eb-7e24026e360c' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','natuurkunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3401cf6e-82e4-404c-b216-b980ff407159' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Nederlands') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'dabf3753-248a-495b-b861-bcd36e2b55cb' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Portugees') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '116fbfd6-77d8-4676-8634-8cfd686942c9' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Russisch') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3aab168a-9b24-4aca-b0f1-4bfb12e7c288' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','scheikunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '952bf604-cc38-44e3-889a-a9e74a18da8e' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Spaans') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c6971373-aa44-4de9-91ef-aca886d42a6a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','techniek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5cb7f440-c370-4056-b30d-f57130cccede' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','tekenen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '5fa492c3-7f83-4e2f-8931-87fc1a2d0048' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','textiele vormgeving') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Turks') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','verzorging') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '7afbb7a6-c29b-425c-9c59-6f79c845f5f0' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','wiskunde') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b5d1d3b4-a20c-40d4-b5fe-ee9aa819dc19' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','administratie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ad7e37a9-fe80-4b2c-a130-12af95499137' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','agrarische bedrijfseconomie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '62aac92b-00ad-4d0c-8aec-98713cbfea25' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','agrarische techniek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '351cd58e-1ec2-4bac-8b6f-9dc555b1c96d' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bloembinden en schikken') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '37c5f10a-30a8-43b0-b2dd-60bf1721abcf' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - fijnhoutbewerking') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3f02457c-0944-4ec3-b519-9c0132cce73b' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - metselen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '797704ac-6c19-4029-999d-41b5434770cf' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - schilderen') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '3b970baf-5338-469a-a08c-f13bc0cd071b' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - timmeren') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a0bc5d77-7231-46d0-8157-7d46f44c09a9' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek breed') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'ac42c9d5-7bcc-4769-862a-d9e83a075829' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','consumptief - bakken') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','consumptief - horeca') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','consumptief-breed') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '59e44cb3-6e06-4c2d-a4a1-fa254a708f64' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','dierhouderij en verzorging') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '217cd594-7bf7-4515-971b-d9825afde27a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','grafimedia') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '4457dcb9-d619-43b2-8b69-e0c65f27c0fe' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','groene ruimte') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '9ce440de-6f00-41f0-88f4-b414314e2ce8' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','handel en administratie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd4ed648e-9542-4092-b6e3-727abdd2ea51' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','handel en verkoop') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','ict-route') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '6611b0e5-6773-4652-9eff-4cb37df7919a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','installatietechniek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','installektro') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'db5b20c4-4e94-4554-8137-a45acb130ad2' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','landbouw breed') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'de3e7b4c-e4f5-4976-9b8b-65b66bd22635' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','metaaltechniek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '11255639-ada3-4df4-99a0-9a6cfdfd7934' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','metalektro') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'd9eb3e4c-e4a9-4eb8-bc1a-b7ae6f1f3b90' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','mode en commercie') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'c85887b4-c7bb-46ae-882d-3215a3c0411f' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','plantenteelt') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '70d98953-5ad0-4cd9-b887-e99dcc931844' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','sport, dienstverlening en veiligheid') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '391cc969-81fa-4d30-940b-68714fb50b5e' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','techniek breed') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '433a3b22-32a2-4136-93f4-35bd369f9b1b' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','technologie in de gemengde leerweg') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a4109169-ad0b-4691-bedf-41f1a2b4061e' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','transport en logistiek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'e3340775-67e8-4db0-a5ad-816d7712deda' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','uiterlijke verzorging') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'a583552a-1732-435b-9354-21bb39646b1f' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','verwerking agrarische producten') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = '1191725c-5d0c-4067-b5f0-4d80b63014cd' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','voertuigentechniek') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] = 'f653d5cb-5173-422c-abc3-2cc837c2e8e9' and key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','zorg en welzijn breed') != ''"/>
<xsl:when test="descendant::*[local-name() = 'id'] != 'c001f86a-4f8f-4420-bd78-381c615ecedc' and descendant::*[local-name() = 'id'] != '3b49e7f7-00cc-47ad-8403-32adb3ec31ee' and descendant::*[local-name() = 'id'] != '455d527a-bfd0-4460-919e-12e0478a54cf' and descendant::*[local-name() = 'id'] != '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and descendant::*[local-name() = 'id'] != '2b363227-8633-4652-ad57-c61f1efc02c8' and descendant::*[local-name() = 'id'] != '1f7aa29f-38d8-4dab-91db-3be52669951f' and descendant::*[local-name() = 'id'] != '1773b48b-1cce-4a77-bec2-5fd3aa0e2ec2' and descendant::*[local-name() = 'id'] != '0b1fbf62-4eb4-4af3-a267-3cd3215d6aac' and descendant::*[local-name() = 'id'] != '904a6dbc-c236-42c8-aaa9-a5d7eaa9639f' and descendant::*[local-name() = 'id'] != '81a1f605-db58-448d-a1dc-da682316c505' and descendant::*[local-name() = 'id'] != '4ba5583f-b147-42cc-a083-ce5ebfd53746' and descendant::*[local-name() = 'id'] != '18f53978-1118-4051-a778-b8d7f60ca982' and descendant::*[local-name() = 'id'] != 'd35b903f-1598-4bdd-a2fa-8aba854df762' and descendant::*[local-name() = 'id'] != '9f4710e3-f173-404e-b12e-577657a5da04' and descendant::*[local-name() = 'id'] != '93a7126d-7307-4b6a-b55a-f4f78e92f680' and descendant::*[local-name() = 'id'] != 'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d' and descendant::*[local-name() = 'id'] != 'e605402f-4cc2-46bb-9026-d1d49bde17bf' and descendant::*[local-name() = 'id'] != 'c92a4d95-f2bb-4eb0-8861-0691365f15b1' and descendant::*[local-name() = 'id'] != 'f1116b34-14c9-4098-85fb-aed1b9473894' and descendant::*[local-name() = 'id'] != '2845473d-ce18-450a-9135-6738abbdc129' and descendant::*[local-name() = 'id'] != 'aedcfc1c-a676-4f40-8587-4a5f43a354b5' and descendant::*[local-name() = 'id'] != '42e5a6c8-3d23-4a02-a409-aeaa9fc01721' and descendant::*[local-name() = 'id'] != '4aa16ae7-48c6-4f96-b48d-a67389a7050d' and descendant::*[local-name() = 'id'] != '1cb06441-fc86-49fa-9347-a5869acb3778' and descendant::*[local-name() = 'id'] != 'b3f61346-92c4-4fb5-9207-6a4142b64122' and descendant::*[local-name() = 'id'] != 'bc7cb521-bdfe-46ab-b635-f2d2189bdd39' and descendant::*[local-name() = 'id'] != '7596e435-d417-4de8-a32e-8e61f11ee1d2' and descendant::*[local-name() = 'id'] != '04f6fd49-a81d-4142-9eac-66502c87f744' and descendant::*[local-name() = 'id'] != 'fd3988c5-9648-4c39-9122-93a7260c8bbe' and descendant::*[local-name() = 'id'] != '7aa6f577-b02d-484a-90d6-72fc80199f9a' and descendant::*[local-name() = 'id'] != '08a3212d-1360-406b-ac95-61b16578a75d' and descendant::*[local-name() = 'id'] != 'e98be5ad-4bd2-4768-a9eb-7e24026e360c' and descendant::*[local-name() = 'id'] != '3401cf6e-82e4-404c-b216-b980ff407159' and descendant::*[local-name() = 'id'] != 'dabf3753-248a-495b-b861-bcd36e2b55cb' and descendant::*[local-name() = 'id'] != '116fbfd6-77d8-4676-8634-8cfd686942c9' and descendant::*[local-name() = 'id'] != '3aab168a-9b24-4aca-b0f1-4bfb12e7c288' and descendant::*[local-name() = 'id'] != '952bf604-cc38-44e3-889a-a9e74a18da8e' and descendant::*[local-name() = 'id'] != 'c6971373-aa44-4de9-91ef-aca886d42a6a' and descendant::*[local-name() = 'id'] != '5cb7f440-c370-4056-b30d-f57130cccede' and descendant::*[local-name() = 'id'] != '5fa492c3-7f83-4e2f-8931-87fc1a2d0048' and descendant::*[local-name() = 'id'] != '96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9' and descendant::*[local-name() = 'id'] != 'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d' and descendant::*[local-name() = 'id'] != '7afbb7a6-c29b-425c-9c59-6f79c845f5f0' and descendant::*[local-name() = 'id'] != 'b5d1d3b4-a20c-40d4-b5fe-ee9aa819dc19' and descendant::*[local-name() = 'id'] != 'ad7e37a9-fe80-4b2c-a130-12af95499137' and descendant::*[local-name() = 'id'] != '62aac92b-00ad-4d0c-8aec-98713cbfea25' and descendant::*[local-name() = 'id'] != '351cd58e-1ec2-4bac-8b6f-9dc555b1c96d' and descendant::*[local-name() = 'id'] != '37c5f10a-30a8-43b0-b2dd-60bf1721abcf' and descendant::*[local-name() = 'id'] != '3f02457c-0944-4ec3-b519-9c0132cce73b' and descendant::*[local-name() = 'id'] != '797704ac-6c19-4029-999d-41b5434770cf' and descendant::*[local-name() = 'id'] != '3b970baf-5338-469a-a08c-f13bc0cd071b' and descendant::*[local-name() = 'id'] != 'a0bc5d77-7231-46d0-8157-7d46f44c09a9' and descendant::*[local-name() = 'id'] != 'ac42c9d5-7bcc-4769-862a-d9e83a075829' and descendant::*[local-name() = 'id'] != 'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a' and descendant::*[local-name() = 'id'] != 'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a' and descendant::*[local-name() = 'id'] != '59e44cb3-6e06-4c2d-a4a1-fa254a708f64' and descendant::*[local-name() = 'id'] != '217cd594-7bf7-4515-971b-d9825afde27a' and descendant::*[local-name() = 'id'] != '4457dcb9-d619-43b2-8b69-e0c65f27c0fe' and descendant::*[local-name() = 'id'] != '9ce440de-6f00-41f0-88f4-b414314e2ce8' and descendant::*[local-name() = 'id'] != 'd4ed648e-9542-4092-b6e3-727abdd2ea51' and descendant::*[local-name() = 'id'] != 'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a' and descendant::*[local-name() = 'id'] != '6611b0e5-6773-4652-9eff-4cb37df7919a' and descendant::*[local-name() = 'id'] != 'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a' and descendant::*[local-name() = 'id'] != 'db5b20c4-4e94-4554-8137-a45acb130ad2' and descendant::*[local-name() = 'id'] != 'de3e7b4c-e4f5-4976-9b8b-65b66bd22635' and descendant::*[local-name() = 'id'] != '11255639-ada3-4df4-99a0-9a6cfdfd7934' and descendant::*[local-name() = 'id'] != 'd9eb3e4c-e4a9-4eb8-bc1a-b7ae6f1f3b90' and descendant::*[local-name() = 'id'] != 'c85887b4-c7bb-46ae-882d-3215a3c0411f' and descendant::*[local-name() = 'id'] != '70d98953-5ad0-4cd9-b887-e99dcc931844' and descendant::*[local-name() = 'id'] != '391cc969-81fa-4d30-940b-68714fb50b5e' and descendant::*[local-name() = 'id'] != '433a3b22-32a2-4136-93f4-35bd369f9b1b' and descendant::*[local-name() = 'id'] != 'a4109169-ad0b-4691-bedf-41f1a2b4061e' and descendant::*[local-name() = 'id'] != 'e3340775-67e8-4db0-a5ad-816d7712deda' and descendant::*[local-name() = 'id'] != 'a583552a-1732-435b-9354-21bb39646b1f' and descendant::*[local-name() = 'id'] != '1191725c-5d0c-4067-b5f0-4d80b63014cd' and descendant::*[local-name() = 'id'] != 'f653d5cb-5173-422c-abc3-2cc837c2e8e9'"/>
<xsl:otherwise>
<xsl:text>unmatched</xsl:text>
</xsl:otherwise></xsl:choose>
</xsl:for-each>
</xsl:variable>

<xsl:if test="contains($createClassification, 'unmatched')">
<xsl:element name="{$usedNamespace}:classification">
<xsl:element name="{$usedNamespace}:purpose">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/vdex_classification_purpose_czp_20060628.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:value">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>discipline</xsl:text>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="{$usedNamespace}:taxonpath">
<xsl:element name="{$usedNamespace}:source">
<xsl:element name="{$usedNamespace}:langstring">
<xsl:attribute name="xml:lang">
<xsl:text>x-none</xsl:text>
</xsl:attribute>
<xsl:text>http://purl.edustandaard.nl/vdex_classification_vakaanduidingen_vo_20071115.xml</xsl:text>
</xsl:element>
</xsl:element>
<xsl:call-template name="writeTaxonsNewToOldvdex_classification_vakaanduidingen_vo_20071115"/>
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:template>


<!-- Map de individuele begrippenkader taxons naar oude VDEX waarden -->
<xsl:template name="writeTaxonsNewToOldvdex_classification_vakaanduidingen_vo_20071115">
<xsl:for-each select="child::*[local-name() = 'classification']/*[local-name() = 'taxonpath']/*[local-name() = 'taxon']/*[local-name() = 'id'][ancestor::*[local-name() = 'classification']/*[local-name() = 'purpose']/*[local-name() = 'value']/*[local-name() = 'langstring'] = 'discipline'][contains(ancestor::*[local-name()='taxonpath']/*[local-name()='source']/*[local-name()='langstring'], 'http://purl.edustandaard.nl/begrippenkader')]">
<xsl:choose>
<xsl:when test="node() = 'c001f86a-4f8f-4420-bd78-381c615ecedc' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','aardrijkskunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'aardrijkskunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Aardrijkskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3b49e7f7-00cc-47ad-8403-32adb3ec31ee' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','algemene natuurwetenschappen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'algemene natuurwetenschappen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Algemene natuurwetenschappen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '455d527a-bfd0-4460-919e-12e0478a54cf' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Arabisch'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Arabisch'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Arabisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4c8a3378-6616-459d-acc4-83ee5a9b91a2' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','beeldende vorming'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'beeldende vorming'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Beeldende vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2b363227-8633-4652-ad57-c61f1efc02c8' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','biologie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'biologie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Biologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1f7aa29f-38d8-4dab-91db-3be52669951f' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Chinees'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Chinees'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Chinees'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1773b48b-1cce-4a77-bec2-5fd3aa0e2ec2' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','culturele en kunstzinnige vorming'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'culturele en kunstzinnige vorming'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Culturele en kunstzinnige vorming'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '0b1fbf62-4eb4-4af3-a267-3cd3215d6aac' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','dans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Dans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '904a6dbc-c236-42c8-aaa9-a5d7eaa9639f' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','drama'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'drama'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Drama'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '81a1f605-db58-448d-a1dc-da682316c505' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Duits'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Duits'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Duits'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4ba5583f-b147-42cc-a083-ce5ebfd53746' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','economie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'economie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Economie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '18f53978-1118-4051-a778-b8d7f60ca982' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Engels'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Engels'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Engels'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd35b903f-1598-4bdd-a2fa-8aba854df762' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','filosofie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'filosofie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Filosofie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9f4710e3-f173-404e-b12e-577657a5da04' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Frans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Frans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Frans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '93a7126d-7307-4b6a-b55a-f4f78e92f680' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Fries'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Fries'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Fries'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ef3a0b2e-0843-4e0a-b45b-788be6e1ec8d' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','geschiedenis'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'geschiedenis'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Geschiedenis'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e605402f-4cc2-46bb-9026-d1d49bde17bf' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','godsdienst'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'godsdienst'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Godsdienst'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c92a4d95-f2bb-4eb0-8861-0691365f15b1' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Grieks'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Grieks'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Grieks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f1116b34-14c9-4098-85fb-aed1b9473894' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','handvaardigheid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'handvaardigheid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handvaardigheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '2845473d-ce18-450a-9135-6738abbdc129' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','informatica'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'informatica'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Informatica'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'aedcfc1c-a676-4f40-8587-4a5f43a354b5' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Italiaans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Italiaans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Italiaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '42e5a6c8-3d23-4a02-a409-aeaa9fc01721' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','klassieke culturele vorming'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'klassieke culturele vorming'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Klassieke culturele vorming'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4aa16ae7-48c6-4f96-b48d-a67389a7050d' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','kunst'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'kunst'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Kunst en cultuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1cb06441-fc86-49fa-9347-a5869acb3778' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Latijn'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Latijn'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Latijn'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b3f61346-92c4-4fb5-9207-6a4142b64122' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','letterkunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'letterkunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Literatuur'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bc7cb521-bdfe-46ab-b635-f2d2189bdd39' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','lichamelijke opvoeding'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'lichamelijke opvoeding'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Lichamelijke opvoeding'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7596e435-d417-4de8-a32e-8e61f11ee1d2' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','maatschappijleer'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'maatschappijleer'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappijleer'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '04f6fd49-a81d-4142-9eac-66502c87f744' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','maatschappijwetenschappen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'maatschappijwetenschappen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Maatschappijwetenschappen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'fd3988c5-9648-4c39-9122-93a7260c8bbe' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','management en organisatie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'management en organisatie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Management en organisatie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7aa6f577-b02d-484a-90d6-72fc80199f9a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','muziek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'muziek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Muziek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '08a3212d-1360-406b-ac95-61b16578a75d' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','natuur, leven en technologie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'natuur, leven en technologie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuur, leven en technologie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e98be5ad-4bd2-4768-a9eb-7e24026e360c' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','natuurkunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'natuurkunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Natuurkunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3401cf6e-82e4-404c-b216-b980ff407159' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Nederlands'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Nederlands'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Nederlands'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'dabf3753-248a-495b-b861-bcd36e2b55cb' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Portugees'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Portugees'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Portugees'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '116fbfd6-77d8-4676-8634-8cfd686942c9' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Russisch'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Russisch'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Russisch'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3aab168a-9b24-4aca-b0f1-4bfb12e7c288' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','scheikunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'scheikunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Scheikunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '952bf604-cc38-44e3-889a-a9e74a18da8e' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Spaans'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Spaans'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Spaans'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c6971373-aa44-4de9-91ef-aca886d42a6a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','techniek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'techniek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5cb7f440-c370-4056-b30d-f57130cccede' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','tekenen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'tekenen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Tekenen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '5fa492c3-7f83-4e2f-8931-87fc1a2d0048' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','textiele vormgeving'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'textiele vormgeving'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Textiele vormgeving'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '96ff821f-148d-46fd-bc0e-ddb5e8f7d7c9' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','Turks'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'Turks'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Turks'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ff7a7b4f-7c70-4d4f-8c2e-2755cfb3595d' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','verzorging'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'verzorging'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '7afbb7a6-c29b-425c-9c59-6f79c845f5f0' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','wiskunde'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'wiskunde'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Wiskunde'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b5d1d3b4-a20c-40d4-b5fe-ee9aa819dc19' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','administratie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'administratie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Administratie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ad7e37a9-fe80-4b2c-a130-12af95499137' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','agrarische bedrijfseconomie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'agrarische bedrijfseconomie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Agrarische bedrijfseconomie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '62aac92b-00ad-4d0c-8aec-98713cbfea25' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','agrarische techniek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'agrarische techniek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Agrarische techniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '351cd58e-1ec2-4bac-8b6f-9dc555b1c96d' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bloembinden en schikken'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bloembinden en schikken'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bloembinden en -schikken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '37c5f10a-30a8-43b0-b2dd-60bf1721abcf' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - fijnhoutbewerking'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bouwtechniek - fijnhoutbewerking'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - fijnhoutbewerking'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3f02457c-0944-4ec3-b519-9c0132cce73b' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - metselen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bouwtechniek - metselen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - metselen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '797704ac-6c19-4029-999d-41b5434770cf' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - schilderen'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bouwtechniek - schilderen'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - schilderen'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '3b970baf-5338-469a-a08c-f13bc0cd071b' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek - timmeren'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bouwtechniek - timmeren'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouwtechniek - timmeren'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a0bc5d77-7231-46d0-8157-7d46f44c09a9' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','bouwtechniek breed'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'bouwtechniek breed'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Bouw - breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'ac42c9d5-7bcc-4769-862a-d9e83a075829' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','consumptief - bakken'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'consumptief - bakken'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Consumptief - bakken'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','consumptief - horeca'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'consumptief - horeca'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Consumptief - horeca'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'bcc5ccd8-6f9e-4462-9f3e-b48d8471288a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','consumptief-breed'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'consumptief-breed'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Consumptief - horeca'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '59e44cb3-6e06-4c2d-a4a1-fa254a708f64' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','dierhouderij en verzorging'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'dierhouderij en verzorging'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Dierhouderij en verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '217cd594-7bf7-4515-971b-d9825afde27a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','grafimedia'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'grafimedia'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Grafimedia'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '4457dcb9-d619-43b2-8b69-e0c65f27c0fe' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','groene ruimte'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'groene ruimte'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Groene ruimte'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '9ce440de-6f00-41f0-88f4-b414314e2ce8' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','handel en administratie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'handel en administratie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handel en administratie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd4ed648e-9542-4092-b6e3-727abdd2ea51' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','handel en verkoop'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'handel en verkoop'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Handel en verkoop'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','ict-route'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'ict-route'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ict-route'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '6611b0e5-6773-4652-9eff-4cb37df7919a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','installatietechniek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'installatietechniek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Installatietechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'b4f393ae-a033-4a76-b6e1-0bcbe867dd5a' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','installektro'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'installektro'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Ict-route'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'db5b20c4-4e94-4554-8137-a45acb130ad2' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','landbouw breed'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'landbouw breed'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Landbouw breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'de3e7b4c-e4f5-4976-9b8b-65b66bd22635' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','metaaltechniek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'metaaltechniek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Metaaltechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '11255639-ada3-4df4-99a0-9a6cfdfd7934' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','metalektro'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'metalektro'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Metalektro'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'd9eb3e4c-e4a9-4eb8-bc1a-b7ae6f1f3b90' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','mode en commercie'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'mode en commercie'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Mode en commercie'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'c85887b4-c7bb-46ae-882d-3215a3c0411f' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','plantenteelt'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'plantenteelt'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Plantenteelt'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '70d98953-5ad0-4cd9-b887-e99dcc931844' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','sport, dienstverlening en veiligheid'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'sport, dienstverlening en veiligheid'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Sport, dienstverlening en veiligheid'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '391cc969-81fa-4d30-940b-68714fb50b5e' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','techniek breed'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'techniek breed'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Techniek breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '433a3b22-32a2-4136-93f4-35bd369f9b1b' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','technologie in de gemengde leerweg'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'technologie in de gemengde leerweg'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Technologie in de gemengde leerweg'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a4109169-ad0b-4691-bedf-41f1a2b4061e' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','transport en logistiek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'transport en logistiek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Transport en logistiek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'e3340775-67e8-4db0-a5ad-816d7712deda' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','uiterlijke verzorging'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'uiterlijke verzorging'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Uiterlijke verzorging'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'a583552a-1732-435b-9354-21bb39646b1f' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','verwerking agrarische producten'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'verwerking agrarische producten'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Verwerking agrarische producten'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = '1191725c-5d0c-4067-b5f0-4d80b63014cd' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','voertuigentechniek'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'voertuigentechniek'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Voertuigentechniek'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
<xsl:when test="node() = 'f653d5cb-5173-422c-abc3-2cc837c2e8e9' and not(key('classification-by-oldIdvdex_classification_vakaanduidingen_vo_20071115','zorg en welzijn breed'))">
<xsl:element name="{$usedNamespace}:taxon">
<xsl:element name="{$usedNamespace}:id">
<xsl:value-of select="'zorg en welzijn breed'"/>
</xsl:element>
<xsl:element name="{$usedNamespace}:entry">
<xsl:element name="{$usedNamespace}:langstring"><xsl:attribute name="xml:lang"><xsl:text>nl</xsl:text></xsl:attribute><xsl:value-of select="'Zorg en welzijn breed'"/></xsl:element>
</xsl:element>
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</xsl:template>




</xsl:stylesheet>

