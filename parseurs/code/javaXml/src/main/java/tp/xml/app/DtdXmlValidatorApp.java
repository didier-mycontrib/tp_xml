package tp.xml.app;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class DtdXmlValidatorApp {

 
	public static void main(String[] args) {
		String xmlPathName=args[0];
		validerFichierXml(xmlPathName);
	}
	public static void validerFichierXml(String xmlPathName) {
		try {
			System.out.println("validation du fichier xml="+xmlPathName);
			
			DocumentBuilderFactory docBuilderFactory =  
					DocumentBuilderFactory.newInstance(); 
			//docBuilderFactory.setNamespaceAware(true);
			docBuilderFactory.setValidating(true); //valider en tenant compte d'un dtd ou xsd
			
			
			/* Fabriquer un parseur DOM: */ 
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
			docBuilder.setErrorHandler(new ErrorHandler() {
				public void error(SAXParseException e) throws SAXException {
					System.err.println(e);	System.err.println("document xml pas valide"); 
					System.exit(1);
				}
				public void fatalError(SAXParseException e) throws SAXException {
					System.err.println(e); System.err.println("document xml pas valide , gros problème");
					System.exit(1);
				}
				public void warning(SAXParseException e) throws SAXException {
					System.out.println(e);
				}
			});
			/* Déclencher le parsing et récupérer une référence sur l'arbre DOM: */ 
			Document xmlDoc = docBuilder.parse(xmlPathName);
			Element docElement = xmlDoc.getDocumentElement();//accès  à la balise principale
			System.out.println("This XML document is valid ");
			System.out.println("with main element=" + docElement.getNodeName());
			System.exit(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
