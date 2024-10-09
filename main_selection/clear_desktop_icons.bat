:: =======================================================================================
:: NAME         : Clear company installed shortcuts
:: DESCRIPTION  : Deletes auto-installed company shortcuts (*.url, *.website) from desktop
:: =======================================================================================
@echo off

set SHORTCUTS_FOLDER=C:\Users\Public\Desktop
set DESKTOP_FOLDER=C:\Users\uia66114\Desktop
set files_list="Employee Self Service.url","Facility Ticket.url","MO Chatbot.url","SMT Web - Home.website","Password Safe.lnk","Local IT FAQ.url"
set desktop_files="Contivation.url"

:: "Employee Self Service.url"
:: "Facility Ticket.url"
:: "MO Chatbot.url"
:: "SMT Web - Home.website"
:: "Password Safe.lnk"
:: "Local IT FAQ.url"
:: "Contivation.url"


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


:: Execute Deletion for Main Desktop
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








:: CD to Working Directory
:: /************************************************************************************/
ECHO --- CD to Folder containing shortcuts ---
call c:
call cd %DESKTOP_FOLDER%
echo.
echo.

:: Execute Deletion for User Desktop
:: /************************************************************************************/
ECHO --- Execute Delete command ---
for %%G in (%desktop_files%) do (
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