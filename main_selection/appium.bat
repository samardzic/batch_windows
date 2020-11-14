:: ==================================================================================
:: NAME     : Integration
:: AUTHOR   : Nenad Samardzic
:: VERSION  : 0.0.1
:: ==================================================================================
@echo off

set APPIUM_PORT=4723
set APPIUM_ADDRESS=0.0.0.0
set APPIUM_CONF_PORTS=--webdriveragent-port 8100 --bootstrap-port 4724
:: set APPIUM_OPTIONS=--relaxed-security --allow-cors --log-timestamp
set APPIUM_OPTIONS=--allow-cors --log-timestamp


:: appium --udid T2334RS23 --port 4725 --address 127.0.0.1 --chromedriver-port 9516 --bootstrap-port 4725 --selendroid-port 8082 --no-reset --local-timezone



:: Start Appium server
:: /************************************************************************************/
echo.
ECHO ===== Starting Appium server =====
echo.

ECHO --- Stoping Node service ---
call taskkill /F /IM node.exe
echo.

cd \

ECHO --- Appium server run ---
call start cmd /k appium -p %APPIUM_PORT% -a %APPIUM_ADDRESS% %APPIUM_OPTIONS% %APPIUM_CONF_PORTS%
echo.
:: /************************************************************************************/
