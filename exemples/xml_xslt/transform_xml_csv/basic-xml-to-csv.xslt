<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0"> 
	<xsl:output method="text" encoding="UTF-8"/>
    
	<xsl:strip-space elements="*" />

	<xsl:template match="/*/child::*">
		<xsl:for-each select="child::*">
			<xsl:if test="position() != last()">"<xsl:value-of select="normalize-space(.)"/>",    </xsl:if>
			<xsl:if test="position()  = last()">"<xsl:value-of select="normalize-space(.)"/>"<xsl:text>&#xD;</xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>