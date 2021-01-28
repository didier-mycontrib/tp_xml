cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"

REM produit2.xml et produit2Invalide.xml ne sont pas déjà associés à produit.xsd
REM et necessitent de donner une valeur à XSDPath


set XMLPath=exemple_id_ref.xml
rem set XMLPath=exemple_id_ref_invalid.xml

set XSDPath=schema_ex_id_ref.xsd


"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% %XSDPath% 2> err_valid.txt
pause
