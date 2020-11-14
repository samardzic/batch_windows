@echo off


REM Description: This script sets the windows "Turn off display" to 25 minutes
echo Set "Turn off display" to 25 minutes:
powercfg -change -monitor-timeout-ac 25


 
REM monitor-timeout-ac <minutes>
REM monitor-timeout-dc <minutes>
REM disk-timeout-ac <minutes>
REM disk-timeout-dc <minutes>
REM standby-timeout-ac <minutes>
REM standby-timeout-dc <minutes>
REM hibernate-timeout-ac <minutes>
REM hibernate-timeout-dc <minutes>
