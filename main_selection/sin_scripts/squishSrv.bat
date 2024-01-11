:: ==================================================================================
:: DESC   : SQUISH server launcher
:: ==================================================================================
@echo off

REM set APPIUM_PORT=4723
REM set APPIUM_ADDRESS=0.0.0.0
REM set APPIUM_CONF_PORTS=--webdriveragent-port 8100 --bootstrap-port 4724
REM :: set APPIUM_OPTIONS=--relaxed-security --allow-cors --log-timestamp
REM set APPIUM_OPTIONS=--allow-cors --log-timestamp

set SQUISH_DIR=c:\Squish



:: Start SQUISH server
:: /************************************************************************************/
echo.
ECHO ===== Starting SQUISH server =====
echo.

ECHO --- Stoping SQUISH service ---
call taskkill /F /IM squishserver.exe
echo.


ECHO --- SQUISH server run ---
call start cmd /k start "" "%SQUISH_DIR%\bin\squishserver" --verbose
echo.
:: /************************************************************************************/
