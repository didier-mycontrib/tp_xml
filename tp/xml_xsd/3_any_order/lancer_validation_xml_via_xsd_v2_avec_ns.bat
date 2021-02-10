cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"


rem set XMLPath=produit.xml
rem set XMLPath=produit2.xml
set XMLPath=produit2_1_1.xml
rem set XMLPath=produitEnQte.xml
rem set XMLPath=produit2_invalid.xml
rem set XMLPath=produit2_1_1_invalid.xml
rem set XMLPath=produitEnQte_invalid.xml
set XSDPath=produit_1_1.xsd


"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% %XSDPath% 2> err_valid.txt
pause
