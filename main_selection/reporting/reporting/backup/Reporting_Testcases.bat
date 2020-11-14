:: ==================================================================================
:: TITLE        : Cypress template reporter
:: DESCRIPTION  : This is a batch script intended to merge json reports and report them as a single HTML file
:: AUTHOR       : Valentin-Ovidiu Indreiu
:: PROJECT      : RVD
:: VERSION      : 0.1
:: ==================================================================================

::: ---------------  Variables   ------------------------

:: Project ROOT path
set root_path=c:\rvd\

:: CYPRESS folder location
set cypress_location=rvd_portal\

:: NODE_MODULES location
set node_location=c:\rvd\rvd_portal\node_modules\.bin

:: REPORTS folder location (if you want to change path, don't forget to change in cypress.json the reportDir)
set reports_location=c:\rvd\rvd_portal\reports

:: Backup folder location
set backup_location=c:\rvd\
set backup_folder_name=backup_reports

::Details of package-------------------- (To Be Changed) ---------------
set packageName=Reporting
set package_path=c:\rvd\rvd_portal\cypress\specs\Reporting\*.*
set individual_reports_path=%reports_location%\individualReports



::: ---------------  Cypress Report Execution   ------------------------

@ECHO OFF

:: ------ Set title for batch window
TITLE Cypress template reporter

:: ------ Go to cypress folder location
cd %root_path%\%cypress_location%

:: ------ Create reports folder
mkdir reports

:: ------ Go to reports folder location
cd %reports_location%  

:: ------ Create a folder YYYY-MM-DD
set date_folder=%date:~-4,4%"-"%date:~-10,2%"-"%date:~7,2%"_reports"
mkdir %date_folder%

:: ------ Search for latest folder created in reports location (if it's not found the batch will EXIT) if it's found, "echo" will write the message in CMD window
FOR /F %%i IN ('dir %reports_location% /a:d /t:c /o-d /b') DO (
    SET a=%%i
    GOTO :found_last
)
EXIT
goto :eof
:found_last
echo Most recent subfolder: %a%

:: ------ Set variable with the name of the last folder created
set last_subfolder=%a%

:: ------ Enter the last folder created
cd %last_subfolder%\

:: ------ Create a folder by the name of the package tested
mkdir %packageName%

:: ------ Enter the package folder created
cd %packageName%

:: ------ Create a folder for HTML report
mkdir  "html_report"

:: ------ Go to cypress location (it's a precondition for the cypress run to work properly)
cd %root_path%\%cypress_location%

:: ------ Clear screen
cls

:: ------ Write a comment on screen(Announcing the start of the testing)
ECHO Start testing the package

:: ------ Calls cypress to run some specific testes
call %node_location%\cypress run --spec %package_path%

:: ------ Moves individual test reports to the package folder
move %individual_reports_path% %reports_location%\%last_subfolder%\%packageName%

:: ------ Write a comment on screen(Announcing the merge of JSON files into a single JSON file)
ECHO Merging into a single JSON

:: ------ Calls a function that merges the JSON files into a single JSON file
call npx mochawesome-merge --reportDir reports/%last_subfolder%/%packageName%/individualReports > reports/%last_subfolder%/%packageName%/mergedReports.json

:: ------ Set timestamp
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%HH%h-%Min%m-%Sec%s"

:: ------ Write a comment on screen(Announcing the conversion of the JSON file into a HTML file)
ECHO Convert to HTML

:: ------ Calls a function that merges the JSON files into a single JSON file
call npx marge reports/%last_subfolder%/%packageName%/mergedReports.json -f %packageName%"_"%timestamp% -o reports/%last_subfolder%/%packageName%/html_report --overwrite=false

:: ------ Go to package folder location
cd %reports_location%\%last_subfolder%\%packageName%\

:: ------ Rename individualReports into invididual_reports_hh_mm_ss
Rename %reports_location%\%last_subfolder%\%packageName%\individualReports individual_reports_%timestamp%

:: ------ Kill process
taskkill /f /im node.exe

:: ------ Delete the merged JSON file
del /f /q /a mergedReports.json

:: ------ Go to backup location
cd %backup_location%

:: ------ Create backup folder
mkdir  %backup_folder_name%

:: ------ Enter backup reports folder
cd %backup_folder_name%

:: ------ Create date folder
mkdir %date_folder%

:: ------ Enter date folder
cd %date_folder%

:: ------ Create package folder
mkdir %packageName%

:: ------ Copy report files into backup folder(overwrite=true by /y for yes, /n for no and /a for ALL)
xcopy /s /i /y /a %reports_location%\%last_subfolder%\%packageName% %backup_location%\%backup_folder_name%\%date_folder%\%packageName%

:: ------ Announcing the end of the test
ECHO DONE

:: ------ Exit batch file
EXIT