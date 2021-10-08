<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
      version="1.0"> 
    
	<!-- <xsl:import href="generic-tr.xslt" />  -->
<xsl:template name="color_en2fr">
            <xsl:param name="colour" select="'black'" />
			<xsl:variable name="listeCouleurs1" select="'yellow,orange,marron'" />
			<xsl:choose>
				<xsl:when test='$colour = "red"' >rouge</xsl:when>
				<xsl:when test='$colour = "green"'>vert</xsl:when>
				<xsl:when test='$colour = "blue"' >bleu</xsl:when>
			<!--	<xsl:when test='($colour = "yellow") or ($colour = "orange") or ($colour = "marron")'>jaune ou jaune</xsl:when> -->
                <xsl:when test='contains($listeCouleurs1,$colour)'>jaune_orange_marron</xsl:when>
                
				<xsl:otherwise>noir</xsl:otherwise>
            </xsl:choose>
     </xsl:template>
	 
	 <xsl:template name="temperature_celcius2kelvin">
            <xsl:param name="t" select="0" />
			<xsl:value-of select="$t + 273.15" />
     </xsl:template>

	<xsl:template match="s"> 
 		 <xsl:element name="val"> 
  			  <xsl:attribute  name="d" >
			      <xsl:value-of select="@date" />
			  </xsl:attribute>
              <xsl:attribute  name="color">
			      <xsl:call-template name="color_en2fr">
                      <xsl:with-param name="colour" select="@color" />
				  </xsl:call-template>
			  </xsl:attribute>
              <xsl:attribute  name="temperature">
			       <xsl:call-template name="temperature_celcius2kelvin">
                      <xsl:with-param name="t" >
					      <xsl:value-of select="@value"/>
					  </xsl:with-param>
				  </xsl:call-template>
			  </xsl:attribute>  	
              <xsl:attribute  name="unit">
			      <xsl:value-of select="'kelvin'" />
			  </xsl:attribute> 				  
  		 </xsl:element>
	</xsl:template> 
	
	

	<xsl:template match="@*|node()"> 
 		 <xsl:copy> 
  			  <xsl:apply-templates select="@*|node()"/> 
  		</xsl:copy> 
	</xsl:template> 
	
</xsl:stylesheet>