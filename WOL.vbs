' set WOL active for all the machines
' This will be  done by Creation and Implementing GPO on Computer OU.

strcomputer="."
set objWMI = GetObject("winmgmts:\\" & strcomputer & "\root\cimv2")
set colAdapters = objWMI.execquery ("SELECT * FROM Win32_NetworkAdapter")
  for each objAdapter in colAdapters
    set objWMI = GetObject("winmgmts:\\" & strComputer & "\root\WMI")
    set colDevices= objWMI.execquery("Select * from MSPOWER_DeviceWakeEnable","WQL", wbemFlagReturnImmediately+wbemFlagForwardOnly)
      for each objDevice in colDevices
        intFound=0
        intFound=instr(lcase(objDevice.InstanceName),lcase(objAdapter.PNPDeviceID ))
            if intFound > 0 then
              strDevID=objAdapter.DeviceID
              objDevice.enable="1"
              objDevice.put_()
            end if
      next
next





'*****************************************

'Wscript.Echo VbTab & "Completed"

'*****************************************