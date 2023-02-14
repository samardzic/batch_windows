:: ==================================================================================
:: TITLE        : Test Data for PRELIVE env
:: DESCRIPTION  : Modify test data to acomodate "prelive" envinronment
:: PROJECT      : RVD
:: VERSION      : 0.1
:: ==================================================================================


:: ---------------  Variables   ------------------------

:: Project ROOT path
set root_path=c:\rvd

:: CYPRESS folder location
set cypress_location=rvd_demo_portal

:: NODE_MODULES location
set node_location=c:\rvd\rvd_demo_portal\node_modules\.bin

:: Test data ACTIVE location
set test_data_active=cypress\test_data

:: Test data PRELIVE location
set test_data_prelive=cypress\test_data\prelive



:: ---------------  Setting PRELIVE env as active   ------------------------

:: CD to Cypress folder 
cd %root_path%\%cypress_location%

:: Deletes existing ACTIVE test data file
del %root_path%\%cypress_location%\%test_data_active%\testData.active.js

:: Copies PRELIVE test data file ACTIVE test data folder
xcopy %root_path%\%cypress_location%\%test_data_prelive%\test_data_prelive.js %root_path%\%cypress_location%\%test_data_active%

:: Renames PRELIVE test data file to ACTIVE test data file, and sets it as ACTIVE test data file
rename %root_path%\%cypress_location%\%test_data_active%\test_data_prelive.js testData.active.js



:: ---------------  Executing tests ------------------------

:: cmd /k %node_location%\cypress run --headed
Cmd /k %node_location%\cypress run --spec "c:\rvd\rvd_demo_portal\cypress\specs\*.*"
