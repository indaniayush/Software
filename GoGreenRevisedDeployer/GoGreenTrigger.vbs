'***********************************************************************************************
'* FILE NAME   : GoGreenTrigger.vbs
'*
'* AUTHOR      : Abhay Kumar(682182) , TCS
'*               Corporate ADS Team
'* DATE	       : 20-Jan-2014
'* PURPOSE     : Run GoGreen on machine
'* USAGE       : Cscript GoGreenTrigger.vbs
'* OUTPUT      : Script will check Whether GoGreen is running or not.
'*               If not then run GoGreen.exe from (c:\windows\temp) path
'* Version Update : search the GoGreen tool in Task Processes with logged in User and no do anything 
'*		    if found else run the GoGreen Tool
'***********************************************************************************************


On error resume next

Dim objShell
Set objShell = WScript.CreateObject( "WScript.Shell" )

Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" _
    & "." & "\root\cimv2")

Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process " _
    & "Where Name = 'GoGreen.exe'")

For Each objProcess in colProcesses
    ProcessId = objProcess.ProcessId
    colProperties = objProcess.GetOwner(strNameOfUser,strUserDomain)

    cInfo = strUserDomain & "\" & strNameOfUser

Set objNet = CreateObject("WScript.NetWork") 
	uInfo = objNet.UserDomain & "\" & objNet.UserName
	

	If (lcase(uinfo)<>lcase(cInfo)) Then
		objShell.Run "cmd /c C:\Windows\Temp\GoGreen\GoGreen.exe", 0, False 
	End If
	
Next

If ProcessId="" Then
		objShell.Run "cmd /c C:\Windows\Temp\GoGreen\GoGreen.exe", 0, False 
End If