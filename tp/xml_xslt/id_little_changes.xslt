<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0" xmlns:cmde="http://commande.nf.org"
			   xmlns:cli="http://client.nf.org"	
			   exclude-result-prefixes="cli cmde"> 

	
	<xsl:template match="cli:client" xmlns="http://customer.en.org"> 
 		 <xsl:element name="customer"> 
		      <xsl:attribute name="number"> 
			      <xsl:value-of select="@numero" />
			  </xsl:attribute> 
  			  <firstname><xsl:value-of select="cli:prenom" /></firstname>
              <lastname><xsl:value-of select="cli:nom" /></lastname>
              <email><xsl:value-of select="cli:email" /></email>
              <address><xsl:value-of select="cli:adresse" /></address> 
         </xsl:element>			  
	</xsl:template> 

	<xsl:template match="@*|node()"> 
 		 <xsl:copy> 
  			  <xsl:apply-templates select="@*|node()"/> 
  		</xsl:copy> 
	</xsl:template> 
</xsl:stylesheet>