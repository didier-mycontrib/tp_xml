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
	      </h3>
		  <hr/>
	...			
	</body>	
   </html>		
</xsl:template>	

</xsl:stylesheet>
