Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c powercfg -x -hibernate-timeout-ac 60"
oShell.Run strArgs, 0, false