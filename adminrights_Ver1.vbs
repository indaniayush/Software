'///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'////////////////////////////////////Script to remove stray admin rights on Desktop and Laptops/////////////////////////////////////////////////
'////////////////////////////////////      and provide Admin rights only for valid CRs        //////////////////////////////////////////////////
'////////////////////////////////////           Admin Rights Script Version 1.0              ///////////////////////////////////////////////////
'///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Dim Admin_user
Dim Admin_Validity
Dim cdate
Dim strhostname
cdate = date()
on error resume next

Dim network, group, user 
Set network = CreateObject("WScript.Network")
strhostname = network.ComputerName
Set group = GetObject("WinNT://" & network.ComputerName & "/Administrators,group") 
For Each user In group.members 
If UCase(user.name) <> "CONTROLLER" And UCase(user.name) <> "DOMAIN ADMINS" And UCase(user.name) <> "ADMINISTRATOR" And UCase(user.name) <> "ADMINMUMVIK" And UCase(user.name) <> "LADMIN" And UCase(user.name) <> "ADMINMUMVIB" And UCase(user.name) <> "ADMINVKR" And UCase(user.name) <> "L1_ADMIN" And UCase(user.name) <> "SA01.INMUMVIKSMS" Then 
group.remove user.adspath 
End If 
Next 

'************************Connection to Database***************************************************************************************************************************************************************************************************

Const adOpenStatic = 3
Const adLockOptimistic = 3

Set objConnection = CreateObject("ADODB.Connection")
Set objRecordSet = CreateObject("ADODB.Recordset")

objConnection.Open _
    "Provider=SQLOLEDB;Data Source=BPOVIKIMG01.INDIA.TCS.COM;" & _
        "Trusted_Connection=Yes;Initial Catalog=IDM_DRMS;"

objRecordSet.Open "select Admin, Expiry from systemrequest where hostname = '" & strhostname & "' and accesstype = 'Admin Rights' and status = '1'", _
        objConnection, adOpenStatic, adLockOptimistic

Do Until objRecordset.EOF

    Admin_user = objRecordset.Fields.Item("Admin")
    Admin_Validity = objRecordset.Fields.Item("expiry")

if Admin_Validity >= cdate then
Set network = CreateObject("WScript.Network") 
Set group = GetObject("WinNT://" & network.ComputerName & "/Administrators,group") 
group.add("WinNT://INDIA/" & Admin_user & ",user")

else
end if

objRecordSet.MoveNext
Loop

objRecordSet.Close
objConnection.Close

'***************************************************End of Script********************************************************************************************************************************************************************************