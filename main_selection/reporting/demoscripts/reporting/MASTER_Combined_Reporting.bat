@ECHO OFF

:::  Master File For running all test Reports
:::  --------------------------------------------

::: ---------------  Cypress Report Execution   ------------------------
ECHO
ECHO   #####  #   #  #####   #####   ######  ####   #### 
ECHO  #     #  # #   #    #  #    #  #      #      #     
ECHO  #         #    #####   #####   #####   ####   #### 
ECHO  #     #   #    #       #   #   #          #      #
ECHO   #####    #    #       #    #  ######  ####   #### 
ECHO 

:: ------ Set Variable for cypress REPORTS scripts folder ---------
set reports_path=c:\rvd\rvd_demo_portal\cypress\scripts\reporting\combined_reports


:: ------ Run "RETENTION" set of tests
REM cd %reports_path%
REM ECHO ##########  RETENTION testSet  ##########
REM call Combined_Reporting_RETENTION.bat


:: ------ Run "WORKSHOPS" set of tests
cd %reports_path%
ECHO ##########  WORKSHOPS testSet  ##########
call Combined_Reporting_WORKSHOPS.bat


:: ------ Run "USERS" set of tests
REM cd %reports_path%
REM ECHO ##########  USERS testSet  ##########
REM call Combined_Reporting_USERS.bat


REM :: ------ Run "COMPANIES" set of tests
REM cd %reports_path%
REM ECHO ##########  COMPANIES testSet  ##########
REM call Combined_Reporting_COMPANIES.bat



:: ------ Run "VEHICLES" set of tests
REM cd %reports_path%
REM ECHO ##########  VEHICLES testSet  ##########
REM call Combined_Reporting_VEHICLES.bat


:: ------ Run "VEHICLES" set of tests
REM cd %reports_path%
REM ECHO ##########  VEHICLES testSet  ##########
REM call Merge_ALL.bat



:: ------ Announcing the end of the test
ECHO DONE

