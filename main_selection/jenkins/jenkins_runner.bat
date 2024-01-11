:: ==================================================================================
:: NAME     : Jenkins runner
:: ==================================================================================
@echo off

set JENKINS_PORT_ID=9000
set JENKINS_LOCATION=d:\opt\Jenkins
set JENKINS_PORT=--httpPort=9000
set JAVA_BIN="C:\Program Files\Java\jdk_17\bin"
:: set JENKINS_OPTIONS=--enable-future-java
:: set JENKINS_OPTIONS_FULL=--enable-future-java --webroot="%JENKINS_LOCATION%\war "
::  -jar "%JENKINS_LOCATION%\jenkins.war" --httpPort=9000 --webroot="%JENKINS_LOCATION%\war"</arguments>

set HUDSON_CSP_SHORT=-Dhudson.model.DirectoryBrowserSupport.CSP=""
set HUDSON_CSP_V1=-Xrs -Xms4096m -Xmx4096m -Dhudson.model.DirectoryBrowserSupport.CSP="sandbox allow-same-origin allow-scripts; default-src 'self'; script-src * 'unsafe-eval'; img-src *; style-src * 'unsafe-inline'; font-src * data:"
set HUDSON_CSP_V3=-Xrs -Xms4096m -Xmx4096m -Dhudson.model.DirectoryBrowserSupport.CSP="sandbox allow-same-origin allow-scripts; default-src 'self' 'unsafe-inline' 'unsafe-eval'; script-src 'self' 'unsafe-inline'; img-src 'self' 'unsafe-inline' data:; style-src 'self' 'unsafe-inline'; font-src 'self' data:"




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
echo.
:: /************************************************************************************/





:: ////////////////////////////////////////////////////////////////////////////////////////


:: set HUDSON_CSP_V3=-Xrs -Xms4096m -Xmx4096m 
:: 	-Dhudson.model.DirectoryBrowserSupport.CSP=
:: 		"sandbox allow-same-origin allow-scripts; 
:: 		default-src 'self' 'unsafe-inline' 'unsafe-eval'; 
:: 		script-src 'self' 'unsafe-inline'; 
:: 		img-src 'self' 'unsafe-inline' data:; 
:: 		style-src 'self' 'unsafe-inline'; 
:: 		base-uri 'self';
:: 		form-action 'self';
:: 		connect-src 'self'; 
:: 		font-src 'self' data:"


:: set HUDSON_CSP_V2=
:: 	-Xrs -Xms2048m -Xmx2048m 
:: 	-Dhudson.model.DirectoryBrowserSupport.CSP=
:: 		"sandbox allow-same-origin allow-scripts; 
:: 		default-src 'self'; 
:: 		script-src * 'unsafe-eval'; 
:: 		img-src *; 
:: 		style-src * 'unsafe-inline'; 
:: 		font-src * data:"


:: set HUDSON_CSP_V1=
:: 	-Dhudson.model.DirectoryBrowserSupport.CSP=
:: 		"sandbox allow-same-origin allow-scripts; 
:: 		default-src 'self'; 
:: 		script-src * 'unsafe-eval'; 
:: 		img-src *; 
:: 		style-src * 'unsafe-inline'; 
:: 		font-src * data:"

:: Starter Policy
:: This policy allows images, scripts, AJAX, form actions, and CSS from the same origin, and does not allow any other resources to load (eg object, frame, media, etc). 
:: It is a good starting point for many sites.

:: default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self';base-uri 'self';form-action 'self'

:: set HUDSON_CSP_V3= -Xrs -Xms4096m -Xmx4096m -Dhudson.model.DirectoryBrowserSupport.CSP="sandbox allow-same-origin allow-scripts; default-src 'self' 'unsafe-inline' 'unsafe-eval'; script-src * 'unsafe-eval'; img-src 'self' 'unsafe-inline' data:; style-src * 'unsafe-inline'; font-src * data:"