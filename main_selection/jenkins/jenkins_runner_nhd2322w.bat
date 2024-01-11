:: ==================================================================================
:: NAME     : Jenkins runner
:: ==================================================================================
@echo off

set JENKINS_PORT_ID=9000
set JENKINS_LOCATION=d:\opt\Jenkins
set JENKINS_PORT=--httpPort=9000
set JAVA_BIN="C:\Program Files\Java\jdk_17\bin"
:: set JAVA_BIN="C:\Program Files\Java\jre8u361\bin\"
:: set JENKINS_OPTIONS=--enable-future-java

set HUDSON_CSP_SHORT=-Dhudson.model.DirectoryBrowserSupport.CSP=""
set HUDSON_CSP_V1=-Xrs -Xms4096m -Xmx4096m -Dhudson.model.DirectoryBrowserSupport.CSP="sandbox allow-same-origin allow-scripts; default-src 'self'; script-src * 'unsafe-eval'; img-src *; style-src * 'unsafe-inline'; font-src * data:"
set HUDSON_CSP_V3=-Xrs -Xms4096m -Xmx4096m -Dhudson.model.DirectoryBrowserSupport.CSP="sandbox allow-same-origin allow-scripts; default-src 'self' 'unsafe-inline' 'unsafe-eval'; script-src * 'unsafe-eval'; img-src 'self' 'unsafe-inline' data:; style-src * 'unsafe-inline'; font-src * data:"



:: set HUDSON_CSP_V1=
:: 	-Dhudson.model.DirectoryBrowserSupport.CSP=
:: 		"sandbox allow-same-origin allow-scripts; 
:: 		default-src 'self'; 
:: 		script-src * 'unsafe-eval'; 
:: 		img-src *; 
:: 		style-src * 'unsafe-inline'; 
:: 		font-src * data:"



:: set HUDSON_CSP_V2=
:: 	-Xrs -Xms2048m -Xmx2048m 
:: 	-Dhudson.model.DirectoryBrowserSupport.CSP=
:: 		"sandbox allow-same-origin allow-scripts; 
:: 		default-src 'self'; 
:: 		script-src * 'unsafe-eval'; 
:: 		img-src *; 
:: 		style-src * 'unsafe-inline'; 
:: 		font-src * data:"


:: set HUDSON_CSP_V3=
:: 	-Xrs -Xms4096m -Xmx4096m 
:: 	-Dhudson.model.DirectoryBrowserSupport.CSP=
:: 		"sandbox allow-same-origin allow-scripts; 
:: 		default-src 'self' 'unsafe-inline' 'unsafe-eval'; 
:: 		script-src * 'unsafe-eval'; 
:: 		img-src 'self' 'unsafe-inline' data:; 
:: 		style-src * 'unsafe-inline'; 
:: 		font-src * data:"

:: set HUDSON_CSP_V3= -Xrs -Xms4096m -Xmx4096m -Dhudson.model.DirectoryBrowserSupport.CSP="sandbox allow-same-origin allow-scripts; default-src 'self' 'unsafe-inline' 'unsafe-eval'; script-src * 'unsafe-eval'; img-src 'self' 'unsafe-inline' data:; style-src * 'unsafe-inline'; font-src * data:"


:: Starting JENKINS automation server
:: /************************************************************************************/
echo.
ECHO ===== Starting JENKINS automation server =====
echo.

echo.
ECHO ===== Navigate JENKINS localhost:%JENKINS_PORT_ID% =====
echo.



cd %JENKINS_LOCATION%

ECHO --- Jenkins server run ---
call %JAVA_BIN%\java %HUDSON_CSP_V3% -jar %JENKINS_LOCATION%\jenkins.war %JENKINS_OPTIONS% %JENKINS_PORT%
:: call %JAVA_BIN%\java.exe %HUDSON_CSP_SHORT% -jar %JENKINS_LOCATION%\jenkins.war %JENKINS_OPTIONS% %JENKINS_PORT%
:: call java %HUDSON_CSP_SHORT% -jar %JENKINS_LOCATION%\jenkins.war %JENKINS_OPTIONS% %JENKINS_PORT%
:: call java %HUDSON_CSP% -jar %JENKINS_LOCATION%\jenkins.war %JENKINS_OPTIONS% %JENKINS_PORT%
:: call start cmd /k java -jar %JENKINS_LOCATION%\jenkins.war %JENKINS_OPTIONS% %JENKINS_PORT%
echo.
:: /************************************************************************************/