<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0"> 
    
	<xsl:template name="color_en2fr">
            <xsl:param name="colour" select="'black'" />
			<xsl:choose>
				<xsl:when test='$colour = "red"' >rouge</xsl:when>
				<xsl:when test='$colour = "green"'>vert</xsl:when>
				<xsl:when test='$colour = "blue"' >bleu</xsl:when>
				<xsl:when test='$colour = "yellow"'>jaune</xsl:when>
                <xsl:otherwise>noir</xsl:otherwise>
            </xsl:choose>
     </xsl:template>
	 
	 <xsl:template name="temperature_celcius2kelvin">
            <xsl:param name="t" select="0" />
			<xsl:value-of select="$t + 273,15" />
     </xsl:template>


</xsl:stylesheet>