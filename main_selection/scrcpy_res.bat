:: ==================================================================================
:: NAME     : ScrCpy startup script
:: AUTHOR   : Nenad Samardzic
:: ==================================================================================
@echo off

set SCRCPY_PATH=d:/opt/scrcpy
set SCRCPY_PARAMS=-s 
set DEVICE=2UPNW19B23000868


:: Start ScrCpy Server
:: /************************************************************************************/
echo.
ECHO ===== Starting SCRCPY =====
echo.

ECHO --- CD to ScrCpy App Folder ---
call d:
call cd %SCRCPY_PATH%
echo.


ECHO --- Execute command ---
call start cmd /k scrcpy -m 1920
:: call start cmd /k scrcpy -m 1600
:: call start cmd /k scrcpy -m 1440
:: call start cmd /k scrcpy -m 1280
:: call start cmd /k scrcpy -m 1024
:: call start cmd /k scrcpy -m 960
:: call start cmd /k scrcpy-noconsole -m 1920
echo.
:: /************************************************************************************/

