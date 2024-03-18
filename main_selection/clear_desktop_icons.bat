:: =======================================================================================
:: NAME         : Clear company installed shortcuts
:: DESCRIPTION  : Deletes auto-installed company shortcuts (*.url, *.website) from desktop
:: =======================================================================================
@echo off

set SHORTCUTS_FOLDER=C:\Users\Public\Desktop
set files_list="Employee Self Service.url","Facility Ticket.url","MO Chatbot.url","SMT Web - Home.website","Password Safe.lnk"

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


:: CD to Working Directory
:: /************************************************************************************/
ECHO --- CD to Folder containing shortcuts ---
call c:
call cd %SHORTCUTS_FOLDER%
echo.
echo.


:: Execute Deletion
:: /************************************************************************************/
ECHO --- Execute Delete command ---
for %%G in (%files_list%) do (
	if exist %%G (
		del %%G
		echo. File %%G found and deleted
	) else (
		echo. *** Error - file %%G not found ***
	)
)



:: call timeout 10


echo.
:: /************************************************************************************/