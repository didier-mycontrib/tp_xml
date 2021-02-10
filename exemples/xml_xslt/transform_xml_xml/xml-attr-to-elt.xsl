<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0"> 
 <xsl:output method="xml" indent="no"/>

	<xsl:template match="@*">
 		  <xsl:element name="{name()}"><xsl:value-of select="." /></xsl:element>	
	</xsl:template> 
	

	<xsl:template match="node()"> 
 		 <xsl:copy> 
  			  <xsl:apply-templates select="@*|node()"/> 
  		</xsl:copy> 
	</xsl:template> 
</xsl:stylesheet>