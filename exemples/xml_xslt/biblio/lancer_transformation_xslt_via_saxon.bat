cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/Saxon-HE-10.3.jar"

set XMLPath=biblio.xml
REM XMLPath=biblio_v2_with_default_namespace.xml

set XSLPath=biblio_xhtml_v1.xsl
REM set XSLPath=biblio_xhtml.xsl

set OutPath=biblio.html

echo %OutPath% va etre regenere en partant en appliquant la transformation %XSLPath% sur le fichier %XMLPath%  
"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% net.sf.saxon.Transform -s:%XMLPath% -xsl:%XSLPath% -o:%OutPath%
pause
