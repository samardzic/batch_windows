:: ==================================================================================
:: NAME     : ScrCpy startup script
:: VERSION  : 0.0.1
:: ==================================================================================
@echo off

set SCRCPY_PATH=d:/opt/scrcpy
set SCRCPY_PARAMS=-s 
set DEVICE=2UPNW19B23000868
set PUSH_TARGET=/Internal storage/Downloads/
:: PUSH_TARGET=/sdcard/Downloads/


:: Start ScrCpy Server
:: /************************************************************************************/
echo.
ECHO ===== Starting SCRCPY =====
echo.

ECHO --- CD to App Folder ---
call cd %SCRCPY_PATH%
echo.


ECHO --- Execute command ---
call start cmd /k scrcpy -m 1920
:: call start cmd /c scrcpy -m 1600
:: call start cmd /k scrcpy -m 1440
:: call start cmd /k scrcpy -m 1280
:: call start cmd /k scrcpy -m 1024
:: call start cmd /k scrcpy -m 960
:: call start cmd /k scrcpy-noconsole -m 1920
echo.
:: /************************************************************************************/
