@echo off


REM Description : This script sets the windows system option "Turn off display" to defined value
echo Disable windows "Turn off display" functionality:
powercfg -change -monitor-timeout-ac 0



