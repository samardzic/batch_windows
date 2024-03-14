:: =======================================================================================
:: NAME         : Clear company installed shortcuts
:: DESCRIPTION  : Deletes auto-installed company shortcuts (*.url, *.website) from desktop
:: =======================================================================================
@echo off

set SHORTCUTS_FOLDER=C:\Users\Public\Desktop
set file = "Employee Self Service.url"

:: "Employee Self Service.url"
:: "Facility Ticket.url"
:: "MO Chatbot.url"
:: "SMT Web - Home.website"
:: "Password Safe.lnk"


:: Start Files Deletion
:: /************************************************************************************/
echo.
ECHO ===== Starting Deletion process =====
echo.
echo.

ECHO --- CD to Folder containing shortcuts ---
call c:
call cd %SHORTCUTS_FOLDER%


ECHO --- Execute Delete command ---
call powershell Remove-Item "'Employee Self Service.url'"
call powershell Remove-Item "'Facility Ticket.url'"
call powershell Remove-Item "'MO Chatbot.url'"
call powershell Remove-Item "'SMT Web - Home.website'"
call powershell Remove-Item "'Password Safe.lnk'"


:: call timeout 10


echo.
:: /************************************************************************************/