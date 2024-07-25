:: ==================================================================================
:: NAME     : Mouse moving emulation
:: ==================================================================================
@echo off

set PROJECT_LOCATION=c:/Build/mouse_move/mouse_emulation
set VENV_LOCATION=c:/Build/mouse_move/mouse_emulation/venv/Scripts
set SCRIPT_NAME=script_new.py


:: Navigate to project location
:: /************************************************************************************/
ECHO  ===== Navigate to project location =====
call c:
call cd %PROJECT_LOCATION%
echo.


ECHO --- Script run run ---
:: call start cmd /k %VENV_LOCATION%/python.exe %PROJECT_LOCATION%/%SCRIPT_NAME%
:: call cmd /c start /k /min %VENV_LOCATION%/python.exe %PROJECT_LOCATION%/%SCRIPT_NAME%
:: cmd.exe /c start /min cmd /k notepad
cmd.exe /c start /min cmd /k %VENV_LOCATION%/python.exe %PROJECT_LOCATION%/%SCRIPT_NAME%
echo.
:: /************************************************************************************/
