@ECHO OFF


REM set "sources=administration binding Common firmwareUpdate fullChain proto2 prototyping regionalRestrictions Reporting"
REM set sources=ping3, proto2, pong4



setlocal enabledelayedexpansion

set folders=ping3 proto2 pong4
set i=0
set n=0
for %%i in (%folders%) do (
  set /a i+=1
  set element[!i!]=%%i
  set /a n+=1
)
set element
echo %element[n]%


REM set number=3
REM echo !element[%number%]!


REM ( 
REM     REM n=0
REM     set i=0
REM     for %%i in (%sources%) do (
REM         set /a i+=1
REM         set packageName[!i!]=%%i
REM         set packageName
REM         echo %packageName%
        
REM         ) 
REM )


REM ( 
REM     n=0
REM     i=0
REM     for %%i in (%sources%) do (
REM         set packageName=%%i
REM         echo %packageName%
REM         set /A n+=1
REM         ) 
REM )