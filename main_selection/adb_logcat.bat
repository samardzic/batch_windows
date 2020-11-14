:: ==================================================================================
:: NAME     : ADB logcat output
:: AUTHOR   : Nenad Samardzic
:: VERSION  : 0.0.1
:: ==================================================================================
@echo off

set PACKAGEMNG=com.continental.rvd_on_board_app_v2
set ACTIVITYMNG1=/.views.vehicleOnboarding.BindingActivity
set ACTIVITYMNG2=.views.status.StatusScreenActivity
set ACTIVITYMNG3=.views.settings.SettingsActivity


:: V — Verbose (lowest priority)
:: D — Debug
:: I — Info
:: W — Warning
:: E — Error
:: F — Fatal
:: S — Silent (highest priority, on which nothing is ever printed)

:: adb logcat | findstr com.example.package



:: Start LogCat
:: /************************************************************************************/
echo.
ECHO ===== Starting Appium server =====
echo.

ECHO --- Stoping Node service ---
:: call taskkill /F /IM node.exe
echo.

cd \

ECHO --- Appium server run ---
:: call start cmd /k adb logcat time %APPPACKAGE%:W 
:: call start cmd /k adb logcat -s Unity ActivityManager PackageManager dalvikvm DEBUG -v color
call start cmd /k adb logcat Unity %PACKAGEMNG% %ACTIVITYMNG1% DEBUG -v color


:: call start cmd /k adb shell ps | grep %APPPACKAGE% | cut -c10-15

:: call start cmd /k adb logcat -p %APPIUM_PORT% -a %APPIUM_ADDRESS% %APPIUM_OPTIONS% %APPIUM_CONF_PORTS%
echo.
:: /************************************************************************************/
