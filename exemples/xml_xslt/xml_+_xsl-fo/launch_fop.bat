REM @echo off

set FOP_DIR=D:\Prog\fop-2.6\fop


%FOP_DIR%\fop.bat -xml biblio.xml -xsl biblio-fo.xsl -pdf biblio.pdf

pause

