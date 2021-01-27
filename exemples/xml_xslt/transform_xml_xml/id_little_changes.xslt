<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 

	<xsl:template match="titre"> 
 		 <title> 
  			  <xsl:apply-templates select="@*|node()"/>  
  		 </title> 
	</xsl:template> 
	
	<xsl:template match="livre"> 
 		 <xsl:element name="book"> 
		      <xsl:attribute name="price"> 
			      <xsl:value-of select="@prix" />
			  </xsl:attribute> 
  			  <xsl:apply-templates select="node()"/> 
         </xsl:element>			  
	</xsl:template> 

	<xsl:template match="@*|node()"> 
 		 <xsl:copy> 
  			  <xsl:apply-templates select="@*|node()"/> 
  		</xsl:copy> 
	</xsl:template> 
</xsl:stylesheet>