:: ==================================================================================
:: NAME     : Gnu Cagh git repo
:: ==================================================================================
@echo off

set REPO_LOCATION=c:/Build/gnuCash


:: Navigate to repo location and Start LazyGit
:: /************************************************************************************/
ECHO  ===== Navigate to repo location and Start LazyGit =====
 cd %REPO_LOCATION% & lazygit.exe
echo.
