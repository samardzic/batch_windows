

::: ---------------  Variables   ------------------------

:: Project ROOT path
set root_path=c:\rvd\

:: CYPRESS folder location
set cypress_location=rvd_demo_portal\

:: NODE_MODULES location
set node_location=c:\rvd\rvd_demo_portal\node_modules\.bin

:: REPORTS folder location (if you want to change path, don't forget to change in cypress.json the reportDir)
set reports_location=c:\rvd\rvd_demo_portal\reports

:: REPORTS folder name
set report_folder=reports

:: COMBINED REPORTS folder name
set combined_reports=combined_reports

:: REPORT Title TimeStamp
set timestamp=%DATE:/=-%
set timestamp=%timestamp: =%

:: FINAL REPORT name
set final_report_name=RVD_Demo_portal_final_report

:: Report Title
set report_title="RVD Demo portal - "%timestamp%

:: ------ Write a comment on screen(Announcing the merge of JSON files into a single JSON file)
ECHO Merging into a single JSON
cd %reports_location%

:: ------ Calls a function that merges the JSON files into a single JSON file
call npx mochawesome-merge --reportDir %reports_location%\combined_reports > %reports_location%\%final_report_name%.json


REM :: ------ Calls a function that merges the JSON files into a single JSON file
REM [-t, --reportTitle], [-f, --reportFilename], [-o, --reportDir], [-i, --inline, boolean, Inline report assets (scripts, styles)]
call npx mochawesome-report-generator %reports_location%\%final_report_name%.json -f %final_report_name% -t %report_title% -o %reports_location%\ --inline=true --charts=true --timestamp


REM :: ------ Delete separate JSON files except merged JSON file
del /f /q /a %reports_location%\*.json

ECHO DONE