# edurep-xslt
Dit is de collectie van XSLT's die Edurep gebruikt. Per collectie is er een XSLT, die waar nodig de metadata aanpast en/of aanvult.

## includes
Vrijwel alle XSLT's maken gebruik van includes om andere relevante XSLT templates te kunnen aanroepen. Voor de meeste XSLT's is het relevante include pad als volgt:
> repository-xslt -> validate.xsl -> lomwriter.xsl

In het kort, de _validate.xsl_ valideert bepaalde velden conform NL-LOM (en include daarbij ook de relevante veld-XSLT's), en de _lomwriter.xsl_ bevat generieke templates om IMS of IEEE LOM onderdelen te maken (zoals vocabulaire of langstring velden).

Binnen Edurep wordt een specifieke namespacing gebruikt om XSLT's te includen, bijvoorbeeld:
```xml
<xsl:include href="edurep://validate"/>
```
Er wordt dus niet naar een specifiek bestandspad verwezen. Voor gebruik van deze XSLT's zal de include dus moeten worden aangepast om naar het juiste pad te verwijzen. 
Dit kan met behulp van het _local-setup.sh_ commando. Of handmatig met de rewrite-includes.xsl sheet.
```bash
./local-setup.sh /home/user/work-edurep-xslt
```

## OBK-mapping
Veel collecties maken ook nog gebruik van de repositoryToVdexMapping XSLT. In de directory 'mapping-xslt' staan XSLT's die gebruikt worden voor het vertalen van bestaande waarden in veld 9 (classification) naar OBK termen en vice versa.

In de repositoryToVdexMapping XSLT wordt een koppeling gemaakt tussen de collectie en de daarin gebruikte VDEX'en.
Het mappen werkt volgens de volgende flow:
> repository-xslt -> repositoryToVdexMapping.xsl -> per gebruikte VDEX een vertaal XSLT

Een overzicht van welke VDEX'en worden vertaald en de bestanden die gebruikt zijn om de mapping XSLT's te maken staat op de [Kennisnet Developer Wiki](https://developers.wiki.kennisnet.nl/index.php/OBK:Mappen_naar_het_OBK).
