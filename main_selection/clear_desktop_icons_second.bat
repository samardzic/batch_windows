:: =======================================================================================
:: NAME         : Clear company installed shortcuts
:: DESCRIPTION  : Deletes auto-installed company shortcuts (*.url, *.website) from desktop
:: =======================================================================================
@echo off

set SHORTCUTS_FOLDER=C:\Users\Public\Desktop
:: $files = "'Employee Self Service.url'","'Facility Ticket.url'","'MO Chatbot.url'","'SMT Web - Home.website'","'Password Safe.lnk'"
set file = "'Employee Self Service.url'"

:: "Employee Self Service.url"
:: "Facility Ticket.url"
:: "MO Chatbot.url"
:: "SMT Web - Home.website"
:: "Password Safe.lnk"


:: Start Files Deletion
:: /************************************************************************************/

ECHO --- CD to Folder containing shortcuts ---
call c:
call cd %SHORTCUTS_FOLDER%

:: call powershell If (Test-Path $file){Remove-Item $file -verbose}
:: call if exists %SHORTCUTS_FOLDER%\%file% (rem '%file% exists') else rem '%file% missing.'



:: ECHO --- Execute Delete command ---
:: call powershell Remove-Item "'Employee Self Service.url'"
 call if exists %file% (rm "'Facility Ticket.url'")
:: call powershell Remove-Item "'MO Chatbot.url'"
:: call powershell Remove-Item "'SMT Web - Home.website'"
:: call powershell Remove-Item "'Password Safe.lnk'"

call timeout 5


echo.
:: /************************************************************************************/