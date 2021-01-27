cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"


rem set XMLPath=commande.xml
rem set XMLPath=commande_explicit_ns.xml
rem set XMLPath=commande_invalid_a.xml
rem set XMLPath=commande_invalid_b.xml
rem XSDPath=commande.xsd

rem set XMLPath=demandeLivraison.xml
rem set XMLPath=demandeLivraison_explicit_ns.xml
rem set XMLPath=demandeLivraison_invalid_a.xml
set XMLPath=demandeLivraison_invalid_b.xml
set XSDPath=demandeLivraison.xsd


"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% %XSDPath% 2> err_valid.txt
pause
