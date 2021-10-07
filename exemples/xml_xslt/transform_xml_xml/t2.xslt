<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
    
	<xsl:import href="generic-tr.xslt" />


	<xsl:template match="s"> 
 		 <xsl:element name="val"> 
  			  <xsl:attribute  name="d" select="@date"/>
              <xsl:attribute  name="color">
			      <xsl:call-template name="color_en2fr">
                      <xsl:with-param name="colour" select="@color"/>
				  </xsl:call-template>
			  </xsl:attribute>
              <xsl:attribute  name="temperature">
			       <xsl:call-template name="temperature_celcius2kelvin">
                      <xsl:with-param name="t" select="@value"/>
				  </xsl:call-template>
			  </xsl:attribute>  	
              <xsl:attribute  name="unit" select="'kelvin'"/>				  
  		 </xsl:element>
	</xsl:template> 
	
	

	<xsl:template match="@*|node()"> 
 		 <xsl:copy> 
  			  <xsl:apply-templates select="@*|node()"/> 
  		</xsl:copy> 
	</xsl:template> 
	
</xsl:stylesheet>