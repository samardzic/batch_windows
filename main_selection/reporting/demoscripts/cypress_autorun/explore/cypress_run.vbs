

Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c c:\rvd\rvd_portal\cypress\scripts\cypress_support.bat"
oShell.Run strArgs, 0, false