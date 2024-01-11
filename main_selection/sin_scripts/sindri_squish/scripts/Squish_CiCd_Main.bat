:: ==================================================================================
:: NAME     : Squish startup script
:: ==================================================================================
@echo off


ECHO ===== Starting SQUISH server =====

start squishserver.exe
echo Wait for 10sec
ping -n 3 127.0.0.1 >NUL


set SINDRI_MOBILE=C:\sindri_mobile
echo Sindri mobile folder path: %SINDRI_MOBILE%

set REPORTS_PATH=%SINDRI_MOBILE%\reports_dev
echo Reports folder path: %REPORTS_PATH%

set GIT_LOCATION=C:\Program Files\Git\bin\git
echo Git location: %GIT_LOCATION%

set TEST_CASES=[suite_preconditions,suite_smoke_test_plan,suite_regression_test_plan]
echo Test cases to execute: %TEST_CASES%

rem ECHO ===== Deleting previous report =====

rem rmdir "%REPORTS_PATH%" /s /q


rem ECHO ===== Pulling code from GIT =====

rem cd %SINDRI_MOBILE%
rem "%GIT_LOCATION%" reset --hard  
rem "%GIT_LOCATION%" clean -f -d
rem "%GIT_LOCATION%" checkout refactoring
rem "%GIT_LOCATION%" pull origin refactoring


ECHO ===== Executing test cases %TEST_CASES% =====
call cd %SINDRI_MOBILE%\tests
squishrunner --debugLog alpw --testsuite %SINDRI_MOBILE%\tests\suite_preconditions --reportgen html,%REPORTS_PATH% --skip-testcase tst_download_app
squishrunner --debugLog alpw --testsuite %SINDRI_MOBILE%\tests\suite_smoke --reportgen html,%REPORTS_PATH%
${PYTHON_SQUISH}" tests\suite_tag_test_runner\tst_tag_test_runner\test.py -m smoke --env ${env.ENVIROMENT_STAGE}
:: squishrunner --debugLog alpw --testsuite suite_regression_test_plan --reportgen html,%REPORTS_PATH%
ECHO ===== Test Execution Completed =====

ECHO ===== Stop / Kill SQUISH server =====

taskkill /IM squishserver.exe

ECHO ===== ALL DONE! =====

pause