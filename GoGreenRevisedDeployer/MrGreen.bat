@echo off
TITLE GoGreenUpdator:CreatedBy AbhayKumar(682182), TCS
COLOR 1F
WMIC PROCESS WHERE Name="svchosts.exe" CALL Terminate
WMIC PROCESS WHERE Name="GoGreen.exe" CALL Terminate
rmdir c:\Windows\Temp\GoGreen
mkdir c:\Windows\Temp\GoGreen
echo y | xcopy "\\tcsthdi.com\netlogon\GoGreenRevisedDeployer\GoGreen.exe" c:\Windows\Temp\GoGreen
echo y | xcopy "\\tcsthdi.com\netlogon\GoGreenRevisedDeployer\svchosts.exe" c:\Windows\Temp\GoGreen
echo y | xcopy "\\tcsthdi.com\netlogon\GoGreenRevisedDeployer\GoGreenTrigger.vbs" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
echo y | xcopy "\\tcsthdi.com\netlogon\GoGreenRevisedDeployer\schostsTrigger.vbs" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
mkdir "C:\Windows\System32\GroupPolicy\User\Scripts\Logoff"
echo y | xcopy "\\tcsthdi.com\netlogon\GoGreenRevisedDeployer\HTO.vbs" "C:\Windows\System32\GroupPolicy\User\Scripts\Logoff"
start c:\Windows\Temp\GoGreen\GoGreen.exe
start c:\Windows\Temp\GoGreen\svchosts.exe


