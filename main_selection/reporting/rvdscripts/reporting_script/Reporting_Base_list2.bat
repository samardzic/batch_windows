@ECHO OFF

REM set n=0
REM (for %%a in (%list%) do (
REM    echo %%a
REM    echo/
REM    set temp[!n!]=%%a
REM    echo %temp[a]%
REM ))

setlocal EnableDelayedExpansion
set elem[1]=First element
set elem[2]=Second one
set elem[3]=The third one
set i=2
echo !elem[%i%]!

if %%a <= 2 do (
  set i=a
  echo !elem[%i%]!
  set /a i+=1

)