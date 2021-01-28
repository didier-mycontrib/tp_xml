package tp.xml.app;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class DtdXmlValidatorApp {

 
	public static void main(String[] args) {
		String xmlPathName=args[0]; //fichier xml à analyser
		
		String dtdPathName=null;
		if(args.length>=2) {
			dtdPathName=args[1];
		}
		
		validerFichierXml(xmlPathName,dtdPathName);
	}
	public static void validerFichierXml(String xmlPathName,String dtdPathName) {
		try {
			System.out.println("validation du fichier xml="+xmlPathName);
			if(dtdPathName!=null) {
				System.out.println("via dtd="+dtdPathName);
			}
			DocumentBuilderFactory docBuilderFactory =  
					DocumentBuilderFactory.newInstance(); 
			//docBuilderFactory.setNamespaceAware(true);
			docBuilderFactory.setValidating(true); //valider en tenant compte d'un dtd ou xsd
			
			/* Fabriquer un parseur DOM: */ 
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
			docBuilder.setErrorHandler(MyErrorHandler.getInstance());
			docBuilder.setEntityResolver(new MyEntityResolver(dtdPathName));
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
