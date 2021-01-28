<xsl:stylesheet version="1.0" 
               xmlns:p="http://produit.nf.org"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>

 <xsl:template match="p:produit">
	 <product  xmlns="http://product.xyz.org">
		<xsl:attribute name='ref'>
			<xsl:value-of select="p:reference" />
		</xsl:attribute>
          <designation>cahier</designation>
          <features> <xsl:value-of select="p:caracteristiques" /> </features>
          <price> <xsl:value-of select="p:prix" /></price>
          <weight><xsl:value-of select="p:poids" /></weight> 
          <volume><xsl:value-of select="p:volume" /></volume>
	 </product>
 </xsl:template>
 


<!-- transformation identité par défaut pour éventuels sous parties -->
 <xsl:template match="@*|node()">
	 <xsl:copy>
	 	<xsl:apply-templates select="@*|node()"/>
	 </xsl:copy>
 </xsl:template>
 
</xsl:stylesheet>
