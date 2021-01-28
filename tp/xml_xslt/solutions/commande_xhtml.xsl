<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
                            
<xsl:output method="html"
            version="1.0"
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
	
	<h3> commande n°<xsl:value-of select="commande/numeroCmde"/> du <xsl:value-of select="commande/dateCmde"/> </h3>
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
			</tr>
            <xsl:for-each select="commande/produitsEnQte">
			   <tr>
				<td><xsl:value-of select="reference"/></td>
				<td><xsl:value-of select="designation"/></td>
				<td><xsl:value-of select="prix" /></td>
				<td><xsl:value-of select="quantite" /></td>
			   </tr>
			</xsl:for-each> 			      
		</table>			
	</body>
   </html>
</xsl:template>


<!-- table des matières -->
<xsl:template match="client">
   <h4>client </h4>   
   <label>numero:</label> <b><xsl:value-of select="numero"/></b> <br/>
   <label>prenom et nom:</label><b><xsl:value-of select="prenom"/>
		 <xsl:value-of select="nom"/></b> <br/>
   <label>email:</label> <b><xsl:value-of select="email"/></b> <br/>
   <label>adresse:</label> <b><xsl:value-of select="adresse"/></b> <br/>
</xsl:template>

</xsl:stylesheet>
