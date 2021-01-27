package tp.xml.app;

import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class MyErrorHandler implements ErrorHandler {
	
	public static MyErrorHandler uniqueInstance = null;
	
	public static MyErrorHandler getInstance() {
		if(uniqueInstance == null) {
			uniqueInstance = new MyErrorHandler();
		}
		return uniqueInstance;
	}

	private MyErrorHandler() { 
	}
	
	public void error(SAXParseException e) throws SAXException {
		System.out.println(e);	System.out.println("document xml pas valide"); 
		System.err.println(e);	System.err.println("document xml pas valide"); 
		System.exit(1);
	}
	public void fatalError(SAXParseException e) throws SAXException {
		System.out.println(e);	System.out.println("document xml pas valide , gros problème"); 
		System.err.println(e); System.err.println("document xml pas valide , gros problème");
		System.exit(1);
	}
	public void warning(SAXParseException e) throws SAXException {
		System.out.println(e);
	}
}
