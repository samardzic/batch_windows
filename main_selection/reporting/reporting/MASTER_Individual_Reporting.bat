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
set reports_path=c:\rvd\rvd_demo_portal\cypress\scripts\reporting\individual_reports


:: ------ Run "USERS" set of tests
cd %reports_path%
ECHO ##########  USERS testSet  ##########
call Individual_Reporting_USERS.bat


:: ------ Run "COMPANIES" set of tests
cd %reports_path%
ECHO ##########  COMPANIES testSet  ##########
call Individual_Reporting_COMPANIES.bat


:: ------ Run "WORKSHOPS" set of tests
cd %reports_path%
ECHO ##########  WORKSHOPS testSet  ##########
call Individual_Reporting_WORKSHOPS.bat


:: ------ Run "RETENTION" set of tests
cd %reports_path%
ECHO ##########  RETENTION testSet  ##########
call Individual_Reporting_RETENTION.bat

:: ------ Run "COMMON" set of tests
cd %reports_path%
ECHO ##########  COMMON testSet  ##########
call Individual_Reporting_COMMON.bat


:: ------ Run "VEHICLES" set of tests
REM cd %reports_path%
REM ECHO ##########  VEHICLES testSet  ##########
REM call Individual_Reporting_VEHICLES.bat

:: ------ Run "OTHERS" set of tests
REM cd %reports_path%
REM ECHO ##########  OTHERS testSet  ##########
REM call Individual_Reporting_OTHERS.bat



:: ------ Announcing the end of the test
ECHO DONE

