
:::  JUST EDIT THE "packageName" VARIABLE

:: Package Name (Name of the Cypress )
set packageName=vehicles




::: ---------------  Variables   ------------------------

:: Project ROOT path
set root_path=c:\rvd\

:: CYPRESS folder location
set cypress_location=rvd_demo_portal\

:: NODE_MODULES location
set node_location=c:\rvd\rvd_demo_portal\node_modules\.bin

:: REPORTS folder location (if you want to change path, don't forget to change in cypress.json the reportDir)
set reports_location=c:\rvd\rvd_demo_portal\reports
set combined_reports_location=c:\rvd\rvd_demo_portal\reports\combined_reports

:: REPORTS folder name
set report_folder=reports

:: REPORTS_BACKUP folder name
set combined_reports=combined_reports

::Details of package-------------------- (To Be Changed) ---------------
set package_path=c:\rvd\rvd_demo_portal\cypress\specs\%packageName%\*.*
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

: ------ Go to cypress "Reports" folder location
cd %root_path%\%cypress_location%\%report_folder%

:: ------ Create reports_backup sub-folder
IF not exist %combined_reports% ( mkdir %combined_reports% )
else ( echo Reports folder already exists )

:: ------ Go to reports folder location
cd %reports_location%  


:: ------ Go to cypress location (it's a precondition for the cypress run to work properly)
cd %root_path%\%cypress_location%

:: ------ Clear screen
cls

:: ------ Write a comment on screen(Announcing the start of the testing)
ECHO *** Start testing the package ***


:: ------ Calls cypress to run some specific testes
call %node_location%\cypress run --spec %package_path%

:: ------ Moves individual test reports to the package folder
move %reports_location%\individualReports\*.json %reports_location%


:: ------ Write a comment on screen(Announcing the merge of JSON files into a single JSON file)
ECHO Merging into a single JSON

:: ------ Calls a function that merges the JSON files into a single JSON file
call npx mochawesome-merge --reportDir %reports_location% > %reports_location%\%packageName%_mergedReports.json



:: ------ Moves individual test reports to the package folder
move %reports_location%\%packageName%_mergedReports.json %combined_reports_location%


:: ------ Delete separate JSON files except merged JSON file
del /f /q /a %reports_location%\*.json
