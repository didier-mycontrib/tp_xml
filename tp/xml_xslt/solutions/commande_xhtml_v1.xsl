<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			   xmlns:cmde="http://commande.nf.org"
			   xmlns:cli="http://client.nf.org"
			   xmlns:prod="http://produit.nf.org">
                            
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
	
	<h3> commande n°<xsl:value-of select="cmde:commande/cmde:numeroCmde"/> 
	     du <xsl:value-of select="cmde:commande/cmde:dateCmde"/> </h3>
	<hr/>				
	<xsl:apply-templates select="cmde:commande/cli:client" />
		
	</body>	
   </html>
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
