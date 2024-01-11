@echo off

ECHO ===== Starting SQUISH server =====

start squishserver.exe
echo Wait for 10sec
ping -n 10 127.0.0.1 >NUL
set SINDRI_MOBILE=C:\sindri_mobile
echo Sindri mobile folder path: %SINDRI_MOBILE%

set REPORTS_PATH=C:\simulation_automation
echo Reports folder path: %REPORTS_PATH%

set TEST_CASES=[suite_test_simulation]
echo Test cases to execute: %TEST_CASES%

ECHO ===== Executing test cases %TEST_CASES% =====
cd %SINDRI_MOBILE%
squishrunner --debugLog alpw --testsuite suite_test_simulation --reportgen html,%REPORTS_PATH%
squishrunner --debugLog alpw --testsuite tests\suite_tag_test_runner\tst_tag_test_runner\test.py --reportgen html,%REPORTS_PATH% --scriptargs --env %TEST_ENV% -m %TEST_SUITE% --user %TEST_USER%
ECHO ===== Test Execution Completed =====

ECHO ===== Stop / Kill SQUISH server =====

taskkill /IM squishserver.exe

ECHO ===== ALL DONE! =====