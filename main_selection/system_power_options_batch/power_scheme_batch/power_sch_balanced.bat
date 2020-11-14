@echo off


REM Description      : This script calls the python script that grabs the cammera frame/picture

echo "Setting variables..."  
set pf=powercfg 
set av=setacvalueindex 

REM set "Testing" scheme
set testing=06d3d99a-2b05-4a0d-bae7-ba88ed2931a2 
set balanced=381b4222-f694-41f0-9685-ff5bb260df2e
set high_performance=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
set power_saver=a1841308-3541-4fab-bc81-f71556f20b4a


REM List Available power schemes
echo/
echo Available power schemes:
echo/
powercfg /list


echo "Setting power scheme %balanced% to active mode for computer: %computername%"
powercfg /setactive %balanced%
echo/

echo.
echo "Changing power configuration settings for power scheme: %balanced% on Computer: %computername%"


 
 
 
 
 
