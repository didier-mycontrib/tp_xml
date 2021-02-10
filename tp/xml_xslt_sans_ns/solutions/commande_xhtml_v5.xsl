<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                            
<xsl:output method="html"
            version="4.0"
            indent="yes"
            encoding="UTF-8"/>                 
               
<xsl:template match="/">
   <html>
			<head>
			   <title> commande </title>
			   <style type="text/css">
			        h3 { color:red; font-family:Verdana }
			        h4 { color:green; font-family:Verdana }			        
			        th { background:yellow;font-family:Verdana } 
			        td { color:blue; font-family:arial }
                    label { display: inline-block; width: 8em; }					
			   </style>
			</head>
	<body>
	
	<h3> commande n°<xsl:value-of select="commande/numeroCmde"/> 
	     du <xsl:value-of select="commande/dateCmde"/> </h3>
	<hr/>				
	<xsl:apply-templates select="commande/client" />
	<hr/>
	<h4>liste des produits commandés</h4>	 
         <table border="1" width="100%">
			<tr>
			    <th>reference</th>
				<th>designation</th>
				<th>prix</th>
				<th>quantite</th>
				<th>prix_total</th>
			</tr>
            <xsl:for-each select="commande/produitEnQte">
			  <xsl:sort select="designation" data-type="text" />
			   <tr>
				<td><xsl:value-of select="@reference"/></td>
				<td><xsl:value-of select="designation"/></td>
				<td><xsl:value-of select="prix" /></td>
				<td><xsl:value-of select="quantite" /></td>
				<td><xsl:value-of select="prix * quantite" /></td>
			   </tr>
			</xsl:for-each> 
             <tr>
			    <th colspan="3"> total </th>
				<xsl:variable name="nbTotalArticles" select="sum(commande/produitEnQte/quantite)"/>
				<td><xsl:value-of select="$nbTotalArticles" /></td>
				<th>
				  <xsl:call-template name="sum_prix_fois_quantite">
                    <xsl:with-param name="produits" select="commande/produitEnQte" />
                  </xsl:call-template>
				</th>
			</tr>					
		</table>	
			
	</body>	
   </html>		
</xsl:template>	

<!-- template complexe / recursif pour calculer une somme de produit -->
<xsl:template name="sum_prix_fois_quantite">
    <xsl:param name="total" select="0" />
    <xsl:param name="produits"  />
    <xsl:variable name="head" select="$produits[1]" />
    <xsl:variable name="tail" select="$produits[position()>1]" />
    <xsl:variable name="calc" select="$head/prix * $head/quantite" />
    <xsl:choose>
      <xsl:when test="not($tail)">
        <xsl:value-of select="$total + $calc" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="sum_prix_fois_quantite">
          <xsl:with-param name="total" select="$total + $calc" />
          <xsl:with-param name="produits" select="$tail" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- &#xA0; est equivalent xml pour &nbsp; de HTML 
     et correspond à un caratère espace -->
<xsl:template match="client">
   <h4>client </h4>   
   <label>numero:</label> <b><xsl:value-of select="@numero"/></b> <br/>
   <label>prenom et nom:</label><b><xsl:value-of select="prenom"/>
		&#xA0; <xsl:value-of select="nom"/></b> <br/>
   <label>email:</label> <b><xsl:value-of select="email"/></b> <br/>
   <label>adresse:</label> <b><xsl:value-of select="adresse"/></b> <br/>
</xsl:template>


</xsl:stylesheet>
