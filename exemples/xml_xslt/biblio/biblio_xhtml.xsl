<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
               xmlns:xsd="http://www.w3.org/2001/XMLSchema">
                            
               
<xsl:import href="generic_html.xsl"/>


<xsl:output method="html"
            version="1.0"
            indent="yes"
            encoding="ISO-8859-1"/>                 
               
<xsl:template match="/">
<html>
			<head>
			   <title> bibliographie </title>
			   <style type="text/css">
			        h3 { color:red; font-family:Verdana }
			        h4 { color:green; font-family:Verdana }			        
			        th { background:yellow;font-family:Verdana } 
			        td { color:blue; font-family:arial }			   
			   </style>
			</head>
	<body>
	<xsl:call-template name="entete"/>
	
	<h3> <xsl:value-of select="bibliographie/titre"/> </h3>
	<hr/>
	 <!-- table des matières -->
	 <xsl:apply-templates select="bibliographie/sujet" mode="tm"/>				       				   
	<hr/>				
	<xsl:apply-templates select="bibliographie/sujet" mode="content"/>	
	</body>
   </html>
</xsl:template>


<!-- table des matières -->
<xsl:template match="sujet" mode="tm">
     <h4><xsl:number count="sujet" format="I - "/> 
	    <xsl:value-of select="titre"/></h4>
	    
		<xsl:apply-templates select="livre" mode="tm">
		     <!-- <xsl:with-param name="nom_sujet" select="titre"  /> -->
		     <xsl:sort select="titre" data-type="text" /> <!-- tri sur le titre des livres -->
		</xsl:apply-templates>

</xsl:template>


<xsl:template match="livre" mode="tm">
     <xsl:param name="nom_sujet" select="'inconnu'" />
     <xsl:variable name="numero"> 
			<xsl:number count="sujet|livre" level="multiple" format="I.1"/>
	 </xsl:variable>
				           
		<xsl:element name="a">
			 <xsl:attribute name="href">#a<xsl:value-of select="$numero" /></xsl:attribute>
			                  
		   <xsl:number count="sujet" level="single" format="I."/> <xsl:value-of select="position()" /> - <xsl:value-of select="titre"/>
		 <!--   [ <xsl:value-of select="$nom_sujet" />  ] -->
		</xsl:element>				           
		<br/>
</xsl:template>


<!-- contenu affiché comme un tableau par sujet -->	
<xsl:template match="sujet" mode="content">
        <h4><xsl:number count="sujet" format="I"/> - 
				           <xsl:value-of select="titre"/>
		</h4>				
		<table border="1" width="100%">
			<tr>
			    <th>titre</th>
				<th>auteur</th>
				<th>editeur</th>
				<th>prix [ parution ]</th>
			</tr>
            <xsl:for-each select="livre">
              <xsl:sort select="titre" data-type="text" /> <!-- tri sur le titre des livres -->
			   <tr>
			    <td> <xsl:element name="a">
			            <xsl:attribute name="name">a<xsl:number count="sujet|livre" level="multiple" format="I.1"/></xsl:attribute>
			            <xsl:value-of select="titre"/>
			         </xsl:element>
			      </td>
				<td><xsl:value-of select="auteur"/></td>
				<td><xsl:value-of select="editeur"/></td>
				<td><xsl:value-of select="@prix" />  [ <xsl:value-of select="@parution"/> ] </td>
			   </tr>
			</xsl:for-each> 			      
		</table>

</xsl:template>




</xsl:stylesheet>
