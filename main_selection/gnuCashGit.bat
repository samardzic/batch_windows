:: ==================================================================================
:: NAME     : Gnu Cagh git repo
:: ==================================================================================
@echo off

set REPO_LOCATION=c:/Build/gnuCash/




:: Navigate to repo location
:: /************************************************************************************/
ECHO  ===== Navigate to repo location =====
call cd %REPO_LOCATION% & lazygit.exe
echo.



ECHO --- Start LazyGit ---
:: call start cmd /k lazygit.exe
echo.
:: /************************************************************************************/
