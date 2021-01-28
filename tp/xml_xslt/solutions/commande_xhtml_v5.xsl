<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			   xmlns:cmde="http://commande.nf.org"
			   xmlns:cli="http://client.nf.org"
			   xmlns:prod="http://produit.nf.org">
                            
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
	
	<h3> commande n°<xsl:value-of select="cmde:commande/cmde:numeroCmde"/> 
	     du <xsl:value-of select="cmde:commande/cmde:dateCmde"/> </h3>
	<hr/>				
	<xsl:apply-templates select="cmde:commande/cli:client" />
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
            <xsl:for-each select="cmde:commande/prod:produitEnQte">
			  <xsl:sort select="prod:designation" data-type="text" />
			   <tr>
				<td><xsl:value-of select="@reference"/></td>
				<td><xsl:value-of select="prod:designation"/></td>
				<td><xsl:value-of select="prod:prix" /></td>
				<td><xsl:value-of select="prod:quantite" /></td>
				<td><xsl:value-of select="prod:prix * prod:quantite" /></td>
			   </tr>
			</xsl:for-each> 
             <tr>
			    <th colspan="3"> total </th>
				<xsl:variable name="nbTotalArticles" select="sum(cmde:commande/prod:produitEnQte/prod:quantite )"/>
				<td><xsl:value-of select="$nbTotalArticles" /></td>
				<th>
				  <xsl:call-template name="sum_prix_fois_quantite">
                    <xsl:with-param name="produits" select="cmde:commande/prod:produitEnQte" />
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
    <xsl:variable name="calc" select="$head/prod:prix * $head/prod:quantite" />
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
<xsl:template match="cli:client">
   <h4>client </h4>   
   <label>numero:</label> <b><xsl:value-of select="@numero"/></b> <br/>
   <label>prenom et nom:</label><b><xsl:value-of select="cli:prenom"/>
		&#xA0; <xsl:value-of select="cli:nom"/></b> <br/>
   <label>email:</label> <b><xsl:value-of select="cli:email"/></b> <br/>
   <label>adresse:</label> <b><xsl:value-of select="cli:adresse"/></b> <br/>
</xsl:template>

</xsl:stylesheet>
