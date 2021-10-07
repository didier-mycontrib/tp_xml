<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0"> 
	<xsl:output method="text" encoding="UTF-8"/>
    
  <xsl:param name="delim" select="','" />
  <xsl:param name="quote" select="'&quot;'" />
  <xsl:param name="break" select="'&#xA;'" />

  <xsl:template match="/stats">
    <xsl:apply-templates select="s" />
  </xsl:template>

  <xsl:template match="s">
    <xsl:apply-templates />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$break" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="*">
    <!-- remove normalize-space() if you want keep white-space at it is --> 
    <xsl:value-of select="concat($quote, normalize-space(), $quote)" />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()" />
	
</xsl:stylesheet>