myJavaXml.jar est une copie renommée de
code/javaXml/target/javaXml-jar-with-dependencies.jar
construit via mvn package ( à lancer dans code/javaXml là où est pom.xml)
ou bien via l'équivalent eclipse "run as / maven install" .
===============================
Utilisation:

pour validation xml via dtd :
java -cp myJavaXml.jar tp.xml.DtdXmlValidatorApp xmlFilePath

pour remplacement des entites dans un fichier xml:
java -cp myJavaXml.jar tp.xml.DtdXmlEntitiesReplaceApp xmlFilePath

pour validation xml via xsd :
java -cp myJavaXml.jar tp.xml.XsdXmlValidatorApp xmlFilePath
java -cp myJavaXml.jar tp.xml.XsdXmlValidatorApp xmlFilePath xsdFilePath

pour transformation xslt  :
java -cp myJavaXml.jar tp.xml.app.XslTransformApp ficSrc.xml ficXslt.xsl ficRes.html/xml