cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"


REM un fichier .xsd est un cas particulier de XMLPath
REM et peut donc être validé via validXsd.xsd
REM (copie de https://www.w3.org/2009/XMLSchema/XMLSchema.xsd )

set XMLPath=produit_sans_ns.xsd
set XSDPath=validXsdWithoutDocType.xsd
REM : validation assez longue !!!


"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% %XSDPath% 2> err_valid.txt
pause
