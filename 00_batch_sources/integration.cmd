:: ==================================================================================
:: NAME     : Integration
:: AUTHOR   : Nenad Samardzic
:: VERSION  : 0.0.1
:: ==================================================================================
@echo off

set APPIUM_PORT=4723
set APPIUM_ADDRESS=0.0.0.0
set APPIUM_CONF_PORTS=--webdriveragent-port 8100 --bootstrap-port 4724
set APPIUM_OPTIONS=--relaxed-security --allow-cors --log-timestamp

set GRADLE_PATH="c:\Users\uia66114\.gradle\wrapper\dists\gradle-5.2.1-all\bviwmvmbexq6idcscbicws5me\gradle-5.2.1\bin\"
set APP_LOCATION="c:\rvd\rvd_demo_app\"
set SCRIPT_PATH="c:\Build\batch_windows\00_batch_sources\"



:: PSU Integration
:: /************************************************************************************/
REM - Interface with PSU 232
REM - Set the PSU output
:: /************************************************************************************/


:: Start Appium server
:: /************************************************************************************/
echo.
ECHO ===== Starting Appium server =====
echo.

ECHO --- Stoping Node service ---
call taskkill /F /IM node.exe
echo.

ECHO --- Appium server run ---
call start cmd /k appium -p %APPIUM_PORT% -a %APPIUM_ADDRESS% %APPIUM_OPTIONS% %APPIUM_CONF_PORTS%
echo.
:: /************************************************************************************/

call timeout 10
echo.
:: Start Gradle test
:: /************************************************************************************/
echo.
ECHO Starting GRADLE execution
call cd %APP_LOCATION%

:: GRADLE Run ALL tests
REM call %GRADLE_PATH%/gradle test --debug 

:: GRADLE Run SPECIFIC test
REM call %GRADLE_PATH%/gradle test --tests *BindingTest
call %GRADLE_PATH%/gradle test --tests testCases.BindingTest.BindingTest


REM call %GRADLE_PATH%/gradle cAT --debug
REM gradle test --tests org.gradle.SomeTest.someSpecificFeature
REM gradle test --tests *SomeTest.someSpecificFeature
REM gradle test --tests *SomeSpecificTest
REM gradle test --tests all.in.specific.package*
REM gradle test --tests *IntegTest
REM gradle test --tests *IntegTest*ui*
REM gradle test --tests *IntegTest.singleMethod
REM gradle someTestTask --tests *UiTest someOtherTestTask --tests *WebTest*ui


:: /************************************************************************************/

call cd %SCRIPT_PATH%

echo.
ECHO --- Test execution Done ---
