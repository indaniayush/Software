@echo off

cls
echo Activating Windws 7... Please wait as this might take several minutes...
echo.
cscript //B "%windir%\system32\slmgr.vbs" /skms 172.17.9.198
cscript //B "%windir%\system32\slmgr.vbs" /ato

echo Activation complete!