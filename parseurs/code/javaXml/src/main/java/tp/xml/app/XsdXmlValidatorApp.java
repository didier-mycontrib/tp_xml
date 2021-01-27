package tp.xml.app;

import java.io.File;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class XsdXmlValidatorApp {

	static final String JAXP_SCHEMA_LANGUAGE ="http://java.sun.com/xml/jaxp/properties/schemaLanguage";
	static final String JAXP_SCHEMA_SOURCE ="http://java.sun.com/xml/jaxp/properties/schemaSource";
	static final String W3C_XML_SCHEMA = "http://www.w3.org/2001/XMLSchema"; 
	static final String W3C_XML_SCHEMA_1_1 = "http://www.w3.org/XML/XMLSchema/v1.1"; 
	public static void main(String[] args) {
		String xmlPathName=args[0];
		String xsdPathName=null;
		if(args.length>=2) {
			xsdPathName=args[1];
		}
		//validerFichierXml(xmlPathName,xsdPathName);
		validerFichierXml_xsd1_1(xmlPathName,xsdPathName);
	}
	
	public static void validerFichierXml_xsd1_1(String xmlPathName,String xsdPathName) {
		try {
			Validator validator = null;
			System.out.println("validation du fichier xml="+xmlPathName);
			if(xsdPathName!=null) {
				System.out.println("via schema (1.1) ="+xsdPathName);
			}
			DocumentBuilderFactory docBuilderFactory =  
					DocumentBuilderFactory.newInstance(); 
			docBuilderFactory.setNamespaceAware(true);
			if(xsdPathName==null) {
			   docBuilderFactory.setValidating(true); //valider en tenant compte d'un dtd ou xsd
			   docBuilderFactory.setAttribute(JAXP_SCHEMA_LANGUAGE, W3C_XML_SCHEMA); 
			}
			else {
			    				
				 // create a SchemaFactory capable of understanding WXS schemas
				  SchemaFactory factory = SchemaFactory.newInstance(W3C_XML_SCHEMA_1_1);

				  // load a WXS schema, represented by a Schema instance
				  
				  Schema schema = factory.newSchema(new File(xsdPathName));

				  // create a Validator instance, which can be used to validate an instance document
				  validator = schema.newValidator();
				  validator.setErrorHandler(MyErrorHandler.getInstance());
			}
			
			/* Fabriquer un parseur DOM: */ 
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
			docBuilder.setErrorHandler(MyErrorHandler.getInstance());
			/* Déclencher le parsing et récupérer une référence sur l'arbre DOM: */ 
			Document xmlDoc = docBuilder.parse(xmlPathName);
			if(xsdPathName!=null) {
				 // validate the DOM tree
				  validator.validate(new DOMSource(xmlDoc));
			}
			Element docElement = xmlDoc.getDocumentElement();//accès  à la balise principale
			System.out.println("This XML document is valid ");
			System.out.println("with main element=" + docElement.getNodeName());
			System.out.println("and namespace=" + docElement.getNamespaceURI());
			System.exit(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void validerFichierXml(String xmlPathName,String xsdPathName) {
		try {
			System.out.println("validation du fichier xml="+xmlPathName);
			if(xsdPathName!=null) {
				System.out.println("via schema="+xsdPathName);
			}
			DocumentBuilderFactory docBuilderFactory =  
					DocumentBuilderFactory.newInstance(); 
			docBuilderFactory.setNamespaceAware(true);
			docBuilderFactory.setValidating(true); //valider en tenant compte d'un dtd ou xsd
			docBuilderFactory.setAttribute(JAXP_SCHEMA_LANGUAGE, W3C_XML_SCHEMA); 
			if(xsdPathName!=null) {
			    docBuilderFactory.setAttribute(JAXP_SCHEMA_SOURCE, new File(xsdPathName));
			}
			
			/* Fabriquer un parseur DOM: */ 
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
			docBuilder.setErrorHandler(MyErrorHandler.getInstance());
			/* Déclencher le parsing et récupérer une référence sur l'arbre DOM: */ 
			Document xmlDoc = docBuilder.parse(xmlPathName);
			Element docElement = xmlDoc.getDocumentElement();//accès  à la balise principale
			System.out.println("This XML document is valid ");
			System.out.println("with main element=" + docElement.getNodeName());
			System.out.println("and namespace=" + docElement.getNamespaceURI());
			System.exit(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
