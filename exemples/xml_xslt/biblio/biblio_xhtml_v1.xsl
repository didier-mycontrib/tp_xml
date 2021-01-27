<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
               xmlns:xsd="http://www.w3.org/2001/XMLSchema">
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
				<h3> <xsl:value-of select="bibliographie/titre"/> </h3>
	<hr/>
	 <!-- table des matières -->
				   <xsl:for-each select="bibliographie/sujet">
				       <h4><xsl:number count="sujet" format="I"/> - 
				           <xsl:value-of select="titre"/></h4>
				       <xsl:for-each select="livre">
				           <xsl:sort select="titre" data-type="text" /> <!-- tri sur le titre des livres -->
				           
				           <xsl:variable name="numero"> 
				              <xsl:number count="sujet|livre" level="multiple" format="I.1"/>
				           </xsl:variable>
				           
				           <xsl:element name="a">
			                  <xsl:attribute name="href">#a<xsl:value-of select="$numero" /></xsl:attribute>
			                  
			                 <xsl:value-of select="$numero" /> - <xsl:value-of select="titre"/>
				               
			                 </xsl:element>				           
				           <br/>
				        </xsl:for-each>
				   </xsl:for-each>
	<hr/>
	<!-- contenu afficher comme un tableau par sujet -->				
	<xsl:for-each select="bibliographie/sujet">
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
		</xsl:for-each>		
	    </body>
   </html>
</xsl:template>
</xsl:stylesheet>
