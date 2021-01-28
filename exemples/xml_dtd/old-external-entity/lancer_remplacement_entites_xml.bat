cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"

set XMLPath=doc_livre.xml


"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.DtdXmlEntitiesReplaceApp %XMLPath%
pause
