REM =================================
goto :main
REM =================================


REM =================================
REM call :REMOVEFILES <files to remove>
REM call :REMOVEFILES c:\del
REM =================================
:REMOVEFILES
echo Removing %1 ...
rd /q /s %1 >NUL 2>>&1
takeown /f %1 /r /D Y >NUL 2>>&1
rd /q /s %1 >NUL 2>>&1

exit /b
REM =================================


REM =================================
:main
REM =================================

REM rd /s /q E:\DEL

call :REMOVEFILES E:\Shares\Admin\DEL	
call :REMOVEFILES E:\Shares\Library\DEL	
call :REMOVEFILES E:\Shares\Media\DEL
call :REMOVEFILES E:\Shares\NetBackup\DEL
call :REMOVEFILES E:\Shares\Photos\DEL
call :REMOVEFILES E:\Shares\Software\DEL
call :REMOVEFILES E:\Shares\Users\DEL

REM =================================

set path=%path%;"E:\Shares\Admin\PortableApps\Portable Python 2.7.6.1\App"

REM cleanup, keep last 3 dir, debug is 0(off)
echo call E:\Shares\NetBackup\recycle\cleanup.py.cmd 3 0 
call E:\Shares\NetBackup\recycle\cleanup.py.cmd 3 0 