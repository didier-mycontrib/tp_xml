biblio.xml:2 Unsafe attempt to load URL 
file:///D:/tp/tp_css_xslt_fo_v2005/xml_+_xslt/biblio_xhtml.xsl 
from frame with URL file:///D:/tp/tp_css_xslt_fo_v2005/xml_+_xslt/biblio.xml. 
'file:' URLs are treated as unique security origins.
=================
Transformations XLST coté navigateur maintenant
bloqué par tous les navigateurs récents (pb d'autorisations CORS)
si URL en file:///
=================
Seul Internet-Explorer continue à bien gérer les transformations
XSLT coté navigateur avec URL en file:///
=================
--> besoin donc de télécharger xml et xlst depuis un serveur HTTP (ex: lite-server)
    pour avoir une URL en http:// !!!
ou bien d'effectuer la transformation XSLT coté serveur !!!

------------
* si nodeJs installé (avec sous partie npm)
  - npm install -g lite-server (à faire 1 seule fois)
  - lancer lite-server dans repertoire html contenant index.html
  - http://localhost:3000 dans navigateur
