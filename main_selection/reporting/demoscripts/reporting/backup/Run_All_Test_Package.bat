cd "C:\rvd\rvd_portal\cypress\scripts\reporting\"

start /wait cmd /c Administration_Testcases.bat
start /wait cmd /c Common_Testcases.bat
start /wait cmd /c FirmwareUpdate_Testcases.bat
start /wait cmd /c Reporting_Testcases.bat
