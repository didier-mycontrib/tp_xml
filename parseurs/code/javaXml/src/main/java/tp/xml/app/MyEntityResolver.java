package tp.xml.app;

import java.io.IOException;

import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class MyEntityResolver implements EntityResolver {
	
	
	private String dtdPath = null;
	
	public MyEntityResolver(){	
	}
	
	public MyEntityResolver(String dtdPath){
		this.dtdPath=dtdPath;
	}
	

	@Override
	public InputSource resolveEntity(String publicId, String systemId) throws SAXException, IOException {
		if (systemId.contains(".dtd")) {
			if(dtdPath==null)
               return new InputSource(systemId);
			  //or InputSource(MyEntityResolver.class.getResourceAsStream(MY_DTD_RESOURCE_PATH));
			else 
			   return new InputSource(dtdPath);
        } else if (systemId.contains(".ent")) {
            return new InputSource(systemId);
        } else {
            return null;
        }
	}

}
