cd /d "%~dp0" 

REM set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_211
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.4

REM set MyXmlJavaJar="D:\tp\local-git-mycontrib-repositories\tp_xml\parseurs\bin\myJavaXml.jar"
set MyXmlJavaJar="../../../parseurs/bin/Saxon-HE-10.3.jar"

set XMLPath=france.xml
set XSLPath=xml_to_json.xsl
set OutPath=france.json

set Options=
rem set Options="use-badgerfish=true"
rem set Options="use-rabbitfish=true"
rem set Options="use-rabbitfish=true" "skip-root=true"

REM documentation sur les options dans https://github.com/bramstein/xsltjson

echo %OutPath% va etre regenere en partant en appliquant la transformation %XSLPath% sur le fichier %XMLPath%  
"%JAVA_HOME%\bin\java" -cp %MyXmlJavaJar% net.sf.saxon.Transform -s:%XMLPath% -xsl:%XSLPath% -o:%OutPath% %Options%
pause
