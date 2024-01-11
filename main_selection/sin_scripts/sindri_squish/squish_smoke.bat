:: ==================================================================================
:: NAME     : Squish startup script
:: ==================================================================================
@echo off


:: ['CICD', 'VV']
set TEST_ENV=VV
echo Execution envinronment: %TEST_ENV%


:: ["user_nenad_android", "user_nenad_ios", "user_cicd"] 
set TEST_USER=user_nenad_android
echo TEST_USER: %TEST_USER%

:: ['smoke', 'precondition', 'regression']
set TEST_SUITE=smoke
echo Executed Test Suite: %TEST_SUITE%

:: set TEST_CASES=[suite_preconditions,suite_smoke_test_plan,suite_regression_test_plan]
:: echo Test cases to execute: %TEST_CASES%

:: Root project directory
set SINDRI_MOBILE=C:\sindri_mobile
echo Project root directory: %SINDRI_MOBILE%

:: Location of SQUISH installation
set SQUISH_DIR=C:\Squish
echo SQUISH installation directory: %SQUISH_DIR%

:: Squish install Python interpreter
set PYTHON_SQUISH=%SQUISH_DIR%\python3\python.exe
echo Squish Python interpreter path: %PYTHON_SQUISH%

:: Squish generated reports path
set REPORTS_PATH=%SINDRI_MOBILE%\reports_dev
echo Reports folder path: %REPORTS_PATH%

:: Path to PROPERTIES_INI file
set PROPERTIES_INI=C:\sindri_mobile\common\web_api\utilities
echo PROPERTIES_INI file location: %PROPERTIES_INI%

set GIT_LOCATION=C:\Program Files\Git\bin\git
echo Git location: %GIT_LOCATION%



:: Squish server startup sequence
:: /************************************************************************************/

echo.
ECHO ===== Stoping running SQUISH service =====
echo.

call taskkill /F /IM squishserver.exe
echo.


echo.
ECHO ===== Starting SQUISH server from "%SQUISH_DIR%" =====
start %SQUISH_DIR%\bin\squishserver.exe
echo Wait for 3 seconds
ping -n 3 127.0.0.1 >NUL
:: /************************************************************************************/



rem ECHO ===== Pulling the code from GIT =====

rem cd %SINDRI_MOBILE%
rem "%GIT_LOCATION%" reset --hard  
rem "%GIT_LOCATION%" clean -f -d
rem "%GIT_LOCATION%" checkout refactoring
rem "%GIT_LOCATION%" pull origin refactoring



:: Start SQUISH Test suite execution
:: /************************************************************************************/
echo.
ECHO ===== Start SQUISH Test execution SUITE:%TEST_SUITE%  ENV:%TEST_ENV%  USER:%TEST_USER% =====
echo.

ECHO --- CD to Root project directory "%SINDRI_MOBILE%" ---
call cd /d C:\
echo.


ECHO --- RUNNING "%TEST_SUITE%" test suite in "%TEST_ENV%" envinronment USER:%TEST_USER% ---
%PYTHON_SQUISH% %SINDRI_MOBILE%\tests\suite_tag_test_runner\tst_tag_test_runner\test.py -m %TEST_SUITE% --env %TEST_ENV% --user %TEST_USER%

:: squishrunner --debugLog alpw --testsuite %SINDRI_MOBILE%\tests\suite_smoke --reportgen html,%REPORTS_PATH% --scriptargs --env %TEST_ENV% -m %TEST_SUITE% --user %TEST_USER%




echo.
:: /************************************************************************************/
:: "${PYTHON_SQUISH}" configuration.py -u %USER_NAME_ADMIN% -p %ADMIN_PASSWORD% -ci %CLIENT_ID% -cs %CLIENT_SECRET% -e
:: %ENVIROMENT_STAGE% -clm %USER_NAME_CLM%
:: "${PYTHON_SQUISH}" tests\\suite_tag_test_runner\\tst_tag_test_runner\\test.py -m precondition --env ${env.ENVIROMENT_STAGE}
:: "${PYTHON_SQUISH}" tests\\suite_tag_test_runner\\tst_tag_test_runner\\test.py -m smoke --env ${env.ENVIROMENT_STAGE}
:: bat "py tests\\suite_tag_test_runner\\tst_download_app_parallel\\test.py --env ${env.ENVIROMENT_STAGE}"
:: bat "py c:\\sindri_mobile\\common\\methods\\merge_html_report.py -from ${env.report_dir} -to ${env.WORKSPACE_REPORT} -build_number ${currentBuild.number}"
:: squishrunner --debugLog alpw --testsuite c:\sindri_mobile\tests\suite_smoke --reportgen html,c:\sindri_mobile\reports_dev --scriptargs --env CICD -m smoke --user user_nenad_android
:: Calling command: squishrunner --debugLog alpw --testsuite c:\sindri_mobile\tests\suite_smoke --reportgen html,c:\sindri_mobile\reports_dev --scriptargs --env VV -m smoke --user user_nenad_android
:: call %PYTHON_SQUISH% %SINDRI_MOBILE%\tests\suite_tag_test_runner\tst_tag_test_runner\test.py -m %TEST_SUITE% --env %TEST_ENV%
:: squishrunner --debugLog alpw --testsuite %SINDRI_MOBILE%\tests\suite_smoke --reportgen html,%REPORTS_PATH%
:: call squishrunner --debugLog alpw --testsuite %SINDRI_MOBILE%\tests\suite_smoke --reportgen html,%REPORTS_PATH% --scriptargs --env %TEST_ENV% -m %TEST_SUITE% --user %TEST_USER%


