cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-17

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/Saxon-HE-10.3.jar"

set XMLPath=f1.xml
REM set XSLPath=basic-xml-to-csv.xslt
REM set XSLPath=xml-to-csv-v2.xslt
set XSLPath=xml-to-csv.xslt
set OutPath=f1.csv

echo %OutPath% va etre regenere en partant en appliquant la transformation %XSLPath% sur le fichier %XMLPath%  
"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% net.sf.saxon.Transform -s:%XMLPath% -xsl:%XSLPath% -o:%OutPath%
pause
