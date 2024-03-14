:: ==================================================================================
:: NAME     : Gnu Cagh git repo
:: ==================================================================================
@echo off

set REPO_LOCATION=c:/Build/gnuCash


:: Navigate to repo location and Start LazyGit
:: /************************************************************************************/

ECHO  ===== Navigate to repo location and Start LazyGit =====
call c:
call cd %REPO_LOCATION% && lazygit.exe
echo.
=======
:: ECHO  ===== Navigate to repo location =====
:: call cd %REPO_LOCATION% & lazygit.exe
:: echo.



:: ECHO --- Start LazyGit ---
:: call start cmd /k lazygit.exe
:: echo.
:: /************************************************************************************/
:: >>>>>>> c3bda9d411ea664be2e770b229436d6352c9f3b1
