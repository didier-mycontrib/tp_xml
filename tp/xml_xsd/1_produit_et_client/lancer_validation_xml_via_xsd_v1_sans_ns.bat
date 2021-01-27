cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"


rem set XMLPath=client_sans_ns.xml
rem set XMLPath=client_sans_ns_invalid.xml
rem set XSDPath=client_sans_ns.xsd

set XMLPath=produit_sans_ns.xml
rem set XMLPath=produit_sans_ns_invalid.xml
set XSDPath=produit_sans_ns.xsd


"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% %XSDPath% 2> err_valid.txt
pause
