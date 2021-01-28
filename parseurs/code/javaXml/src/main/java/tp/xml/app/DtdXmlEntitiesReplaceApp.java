package tp.xml.app;

import java.io.FileOutputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class DtdXmlEntitiesReplaceApp {

 
	public static void main(String[] args) {
		String xmlPathName=args[0]; //fichier xml à analyser
		
		remplacerEntitesDansXml(xmlPathName);
	}
	public static void remplacerEntitesDansXml(String xmlPathName) {
		try {
			System.out.println("remplacement des entités du fichier xml="+xmlPathName);
			
			DocumentBuilderFactory docBuilderFactory =  
					DocumentBuilderFactory.newInstance(); 
			//docBuilderFactory.setNamespaceAware(true);
			
			
			/* Fabriquer un parseur DOM: */ 
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
			//docBuilder.setErrorHandler(MyErrorHandler.getInstance());

			/* Déclencher le parsing et récupérer une référence sur l'arbre DOM: */ 
			Document xmlDoc = docBuilder.parse(xmlPathName);
			Element docElement = xmlDoc.getDocumentElement();//accès  à la balise principale
			System.out.println("This XML document is load ");
			System.out.println("with main element=" + docElement.getNodeName());
			//ré-écriture du fichier lu dans ...out.xml:
			TransformerFactory trFactory = TransformerFactory.newInstance();
			Transformer tr = trFactory.newTransformer();
			tr.transform(new DOMSource(xmlDoc),
			             new StreamResult(
			                   new FileOutputStream(xmlPathName+".out.xml")
			             ));
			System.out.println(xmlPathName+".out.xml  written with replacement of entities");
			System.exit(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
