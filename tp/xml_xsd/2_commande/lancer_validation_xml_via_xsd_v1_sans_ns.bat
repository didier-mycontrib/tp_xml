cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"


rem set XMLPath=commande_sans_ns.xml
rem set XMLPath=commande_sans_ns_invalid.xml
rem set XSDPath=commande_sans_ns.xsd

rem set XMLPath=demandeLivraison_sans_ns_variante_avec_listeProduits.xml
set XMLPath=demandeLivraison_sans_ns.xml
rem set XMLPath=demandeLivraison_sans_ns_invalid.xml
set XSDPath=demandeLivraison_sans_ns.xsd
rem set XSDPath=demandeLivraison_sans_ns_variante_avec_listeProduits.xsd


"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% %XSDPath% 2> err_valid.txt
pause
