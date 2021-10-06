cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-17


REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"


set XMLPath=france_sans_ns.xml
rem set XMLPath=france_sans_ns_invalid.xml

set XSDPath=france_sans_ns.xsd


REM "%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% %XSDPath% 2> err_valid.txt
"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.XsdXmlValidatorApp %XMLPath% 2> err_valid.txt
pause

pause
