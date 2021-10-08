<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0" xmlns:csv="csv:csv"> 
	<xsl:output method="text" encoding="UTF-8"/>
     <xsl:strip-space elements="*"/>
	 
  <xsl:param name="delimiter" select="';'" />
  <xsl:param name="break" select="'&#xA;'" />

    <csv:columns>
        <column>date</column>
        <column>color</column>
        <column>value</column>
        <column>unit</column>
    </csv:columns>

    <xsl:template match="/stats">
        <!-- Output the CSV header -->
        <xsl:for-each select="document('')/*/csv:columns/*">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:value-of select="$delimiter"/>
                </xsl:if>
        </xsl:for-each>
        <xsl:value-of select="$break" />
    
        <!-- Output rows for each matched property -->
        <xsl:apply-templates select="s"/>
    </xsl:template>

    <xsl:template match="s">
        <xsl:variable name="property" select="."/>
    
        <!-- Loop through the columns in order  -->
        <xsl:for-each select="document('')/*/csv:columns/*">
            <!-- Extract the column name and value  -->
            <xsl:variable name="column" select="."/>
			<xsl:variable name="attrValue" select="$property/@*[name() = $column]"/>
            <xsl:variable name="eltValue" select="$property/*[name() = $column]"/>
		    <!-- NB: soit attrValue , soit eltValue est vide --> 
			<xsl:variable name="value" select="concat($attrValue,$eltValue)" />
            <!-- Quote the value if required -->
            <xsl:choose>
                <xsl:when test="contains($value, '&quot;')">
                    <xsl:variable name="x" select="replace($value, '&quot;',  '&quot;&quot;')"/>
                    <xsl:value-of select="concat('&quot;', $x, '&quot;')"/>
                </xsl:when>
                <xsl:when test="contains($value, $delimiter)">
                    <xsl:value-of select="concat('&quot;', $value, '&quot;')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$value"/>
                </xsl:otherwise>
            </xsl:choose>
        
            <!-- Add the delimiter unless we are the last expression -->
            <xsl:if test="position() != last()">
                <xsl:value-of select="$delimiter"/>
            </xsl:if>
        </xsl:for-each>
    
        <!-- Add a newline at the end of the record -->
        <xsl:value-of select="$break" />
    </xsl:template>
	
</xsl:stylesheet>