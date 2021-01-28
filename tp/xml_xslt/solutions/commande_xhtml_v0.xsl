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
	      </h3>
	...			
	</body>	
   </html>		
</xsl:template>	

</xsl:stylesheet>
