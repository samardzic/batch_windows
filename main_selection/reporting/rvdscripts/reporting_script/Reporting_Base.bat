:: ==================================================================================
:: TITLE        : Cypress template reporter
:: DESCRIPTION  : This is a batch script intended to merge json reports and report them as a single HTML file
:: AUTHOR       : Valentin-Ovidiu Indreiu
:: PROJECT      : RVD
:: VERSION      : 0.1
:: ==================================================================================

::: ---------------  Variables   ------------------------

:: Package Name (Name of the Cypress )
set packageName=proto2

:: Project ROOT path
set root_path=c:\rvd\

:: CYPRESS folder location
set cypress_location=rvd_portal\

:: NODE_MODULES location
set node_location=c:\rvd\rvd_portal\node_modules\.bin

:: REPORTS folder location (if you want to change path, don't forget to change in cypress.json the reportDir)
set reports_location=c:\rvd\rvd_portal\reports

:: REPORTS folder name
set report_folder=reports

:: Backup folder location
set backup_location=c:\rvd\

::Details of package-------------------- (To Be Changed) ---------------
set package_path=c:\rvd\rvd_portal\cypress\specs\%packageName%\*.*
set html_path=%reports_location%\%packageName%



::: ---------------  Cypress Report Execution   ------------------------

@ECHO OFF

:: ------ Set title for batch window
ECHO *** Cypress Test Execution reporter ***

:: ------ Go to cypress folder location
cd %root_path%\%cypress_location%

:: ------ Create reports folder
IF not exist %report_folder% ( mkdir %report_folder% )
else ( echo Reports folder already exists )

:: ------ Go to reports folder location
cd %reports_location%  


:: ------ Create a folder by the name of the package tested
IF not exist %packageName% (mkdir %packageName%)



:: ------ Create a folder for HTML report
REM cd %html_path%
REM IF not exist html_report ( mkdir html_report )


:: ------ Go to cypress location (it's a precondition for the cypress run to work properly)
cd %root_path%\%cypress_location%

:: ------ Clear screen
cls

:: ------ Write a comment on screen(Announcing the start of the testing)
ECHO Start testing the package



:: ------ Calls cypress to run some specific testes
call %node_location%\cypress run --spec %package_path%

:: ------ Moves individual test reports to the package folder
move %reports_location%\individualReports\*.json %reports_location%\%packageName%




:: ------ Write a comment on screen(Announcing the merge of JSON files into a single JSON file)
ECHO Merging into a single JSON

:: ------ Calls a function that merges the JSON files into a single JSON file
call npx mochawesome-merge --reportDir %reports_location%\%packageName% > %reports_location%\%packageName%\%packageName%_mergedReports.json



:: ------ Write a comment on screen(Announcing the conversion of the JSON file into a HTML file)
ECHO Convert to HTML

:: ------ Calls a function that merges the JSON files into a single JSON file
call npx mochawesome-report-generator %reports_location%\%packageName%\%packageName%_mergedReports.json -f %packageName%_report -t RVD_%packageName%_report -o %reports_location%\%packageName%\ --inline=true

:: ------ Delete separate JSON files except merged JSON file
del /f /q /a %reports_location%\%packageName%\*.json
REM del /f /q /a %reports_location%\%packageName%\*mochawesome*.json




:: ------ Kill process
REM taskkill /f /im node.exe
tasklist | find /i "node.exe" && taskkill /im notepad.exe /F || echo process "node.exe" not running.



:: ------ Announcing the end of the test
ECHO DONE

:: ------ Exit batch file
REM EXIT