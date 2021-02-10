<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>


<xsl:template match="/">
  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<fo:layout-master-set>
	<!-- fo:layout-master-set defines in its children the page layout:
			 the pagination and layout specifications
			 - page-masters: have the role of describing the intended subdivisions
											 of a page and the geometry of these subdivisions			 
	-->

		<!-- layout for the title & TM -->
		<fo:simple-page-master master-name="Title_TM"
									page-height="29.7cm"
									page-width="21cm"
									margin-top="1cm"
									margin-bottom="2cm"
									margin-left="2.5cm"
									margin-right="2.5cm"
									border="2mm"
									border-color="red"
									border-style="solid">
			<fo:region-body margin-top="3cm" margin-bottom="1.5cm"/>
			<fo:region-before extent="3cm"/>
			<fo:region-after extent="1.5cm"/>
		</fo:simple-page-master>

		<!-- layout for the other pages -->
		<fo:simple-page-master master-name="Content_Page"
									page-height="29.7cm"
									page-width="21cm"
									margin-top="1cm"
									margin-bottom="2cm"
									margin-left="2.5cm"
									margin-right="2.5cm">
			<fo:region-body margin-top="2.5cm" margin-bottom="1.5cm"/>
			<fo:region-before extent="2.5cm"/>
			<fo:region-after extent="1.5cm"/>
		</fo:simple-page-master>

	</fo:layout-master-set>
	<!-- end: defines page layout -->

	<!-- actual layout -->
	<fo:page-sequence master-reference="Title_TM">
		
       <!-- header -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:block text-align="end"
						font-size="10pt"
						font-family="serif"
						line-height="14pt" >
				Bibliographie - p. <fo:page-number/>
			</fo:block>
		</fo:static-content>

		<fo:flow flow-name="xsl-region-body">

			<!-- defines text title level 1-->
			<fo:block font-size="18pt"
						font-family="sans-serif"
						line-height="24pt"
						space-after.optimum="15pt"
						background-color="blue"
						color="white"
						text-align="center"
						padding-top="3pt"
						font-variant="small-caps">
				<xsl:value-of select="bibliographie/titre" />
			</fo:block>
			
			<!--  table des matières   --> 
			
			<fo:block font-size="16pt"
						font-family="sans-serif"
						line-height="20pt"
						space-after.optimum="15pt"
						background-color="green"
						color="white"
						text-align="center"
						padding-top="3pt"
						font-variant="small-caps">
				Table des matières
			</fo:block>
			<fo:block>
			<fo:basic-link internal-destination="test" text-decoration="underline"> lien vers xxx </fo:basic-link>
			</fo:block>
			<xsl:for-each select="bibliographie/sujet">
			
			<!-- une boite d'encadrement pour chaque sujet -->
			<fo:block border-color="red" border-width="0.5pt" border-style="solid"
			          margin="5pt" padding="5pt"
			          space-before.optimum="12pt"
					  space-after.optimum="12pt"
			          background-color="yellow">						
			
			<!-- defines text title level 2-->
			<fo:block font-size="16pt"
						font-family="sans-serif"
						line-height="20pt"
						color="red"						
						space-before.optimum="2pt"
						space-after.optimum="2pt"
						text-align="start"
						padding-top="1pt">

  			<xsl:number count="sujet" format="I" /> - <xsl:value-of select="titre" /> 
  			</fo:block>
				<xsl:for-each select="livre">
  				<xsl:sort select="titre" data-type="text" /> 
				<!--  tri sur le titre des livres   --> 
					<xsl:variable name="numero">
  					<xsl:number count="sujet|livre" level="multiple" format="I.1" /> 
  					</xsl:variable>
  					<!-- defines text title level 3-->
				<fo:block font-size="14pt"
						font-family="sans-serif"
						line-height="20pt"
						color="blue"
						space-before.optimum="2pt"
						space-after.optimum="2pt"
						text-align="start"
						padding-top="2pt">
  					<xsl:value-of select="$numero" />   -   <xsl:value-of select="titre" /> 
   				</fo:block>
  				</xsl:for-each>
  			</fo:block>	
  			</xsl:for-each>
  			
  		</fo:flow>
	</fo:page-sequence>
	<!--  Contenu   --> 
	<fo:page-sequence master-reference="Content_Page">
	
	<!-- header -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:block text-align="end"
						font-size="10pt"
						font-family="serif"
						line-height="14pt" >
				Bibliographie - p. <fo:page-number/>
			</fo:block>
		</fo:static-content>
		
		
  		<fo:flow flow-name="xsl-region-body">	
  		<fo:block id="test">xxx</fo:block>
  			
			<xsl:for-each select="bibliographie/sujet">
			<!-- defines text title level 2-->
			<fo:block font-size="16pt"
						font-family="sans-serif"
						line-height="20pt"
						color="red"
						space-before.optimum="10pt"
						space-after.optimum="10pt"
						text-align="start"
						padding-top="3pt">
			
  			<xsl:number count="sujet" format="I" /> - <xsl:value-of select="titre" /> 
  			</fo:block>
  			<fo:table border-collapse="separate" table-layout="fixed">
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="4cm"/>
				
				<fo:table-body>
	  				<fo:table-row>
	    				<fo:table-cell border-color="blue" border-width="1pt" border-style="solid"> 
					       <fo:block background-color="yellow" color="blue"
					       			 font-weight="bold"
						             text-align="center">titre</fo:block>
						</fo:table-cell>
						<fo:table-cell border-color="blue" border-width="1pt" border-style="solid"> 
					       <fo:block background-color="yellow" color="blue"
					                 font-weight="bold" 
						             text-align="center">auteur</fo:block>
						</fo:table-cell>
						<fo:table-cell border-color="blue" border-width="1pt" border-style="solid"> 
					       <fo:block background-color="yellow" color="blue"
					                 font-weight="bold" 
						             text-align="center">editeur</fo:block>
						</fo:table-cell>
						<fo:table-cell border-color="blue" border-width="1pt" border-style="solid"> 
					       <fo:block background-color="yellow" color="blue"
					                 font-weight="bold" 
						             text-align="center">prix [parution]</fo:block>
						</fo:table-cell>
					</fo:table-row>	
				
				<xsl:for-each select="livre">
  				<xsl:sort select="titre" data-type="text" /> 
				<!--  tri sur le titre des livres   --> 
					
   					<fo:table-row>	
				      <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid"> 
					    <fo:block padding="2pt 2pt"><xsl:value-of select="titre"/></fo:block>
					  </fo:table-cell>  
				 	  <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid"> 
					    <fo:block padding="2pt 2pt"><xsl:value-of select="auteur"/></fo:block>
					  </fo:table-cell>  
				      <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid"> 
					    <fo:block padding="2pt 2pt"><xsl:value-of select="editeur"/></fo:block>
					  </fo:table-cell>  
				      <fo:table-cell border-color="blue" border-width="0.5pt" border-style="solid"> 
					    <fo:block padding="2pt 2pt"><xsl:value-of select="@prix" />  
				        [<xsl:value-of select="@parution"/>]</fo:block>
					  </fo:table-cell>  
				     </fo:table-row>					   				
  				</xsl:for-each>
  				</fo:table-body>
  				</fo:table>
  			</xsl:for-each>
		</fo:flow>
	</fo:page-sequence>
</fo:root>

</xsl:template>



</xsl:stylesheet>
