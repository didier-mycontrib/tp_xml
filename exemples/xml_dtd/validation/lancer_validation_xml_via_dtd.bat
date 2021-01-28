cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/myJavaXml.jar"

set XMLPath=adresse.xml
REM set XMLPath=adresse_v2.xml
REM set XMLPath=adresse_debug.xml
REM set XMLPath=adresse_no_debug.xml
rem set XMLPath=adresseInvalid.xml
REM set XMLPath=lettre.xml
REM set XMLPath=lettreInvalid.xml

rem set OptionalDtdPath=address.dtd

"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% tp.xml.app.DtdXmlValidatorApp %XMLPath% %OptionalDtdPath%
pause
