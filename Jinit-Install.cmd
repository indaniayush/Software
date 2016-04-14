@echo off
:: =================================================================================
:: Author : Kamlesh Parmar, Tata Consultancy Services Ltd.

:: Installs Oracle JInitiator 1.3.1.26, if its not already installed.
:: Installs Ultimatix Certs in Jinitiator certdb.txt
:: Installs Ultimatix CA's root certificates in machine certificate store
:: =================================================================================
setlocal

:: Set network location where setup file is kept & name of each files
Set ScriptVer=1.0
Set SourcePath=\\india.tcs.com\netlogon\
Set jInitInstallSetup=oajinit1.3.1.26.exe
Set JinitCertSetup=ultimatix_cert.exe
:: // space separated list of certificate file names
Set TCSRootCerts=eTCS-CA-2027.cer TCS-CA-2013.cer TCS-CIO-2012.cer TCS-CIO-2016.cer
Set LogFileName="%temp%\%~n0.log"

:: Set file which should exist to verify that jinit installation is successful
set JinitVerifyPath=%programfiles%\Oracle\JInitiator 1.3.1.26\bin\java.exe

:: ****** Nothing to change beyond this line ******
Echo. Running %~n0 %ScriptVer% ...
Echo.
Echo. This is new version of Jinitiator required to access some of the applications in Ultimatix.
Echo. This one time installation should not take more than a minute.
Echo. Thank you for your patience !
echo.
Echo. >> %LogFileName%
Echo. ************** Script Run Started on %date% %time% ******************** >> "%LogFileName%"
Echo. >> "%LogFileName%" 
:: If network path is not found then assume files are in same folder as script
if not exist "%sourcePath%" set sourcePath=%~DP0

Echo. %time%  Verifying Oracle Jinitiator is installed or not ... >> "%LogFileName%"
Echo. %time%  Verifying Oracle Jinitiator is installed or not ...
:: Verify software is already installed or not ?
:: If already installed, quit
if exist "%JinitVerifypath%" goto :JinitAlreadyInstalled

:: Start the installation
Echo.
Echo.
Echo. %time%  Installing Jinitiator 1.3.1.26...
Echo. %time%  Installing Jinitiator 1.3.1.26... >> "%LogFileName%"
start "Installing Jinitiator 1.3.1.26 ..." /WAIT /HIGH "%SourcePath%%jInitInstallSetup%"  -s -a -s
Echo. %time%  Jinitiator 1.3.1.26 Installation Ended >> "%LogFileName%"
Echo. %time%  Jinitiator 1.3.1.26 Installation Ended
if not exist "%JinitVerifypath%" (
	Echo %time% Jinitiator 1.3.1.26 Installation failed >> "%LogFileName%"
	goto :END
)

Echo.
Echo %time% Jinitiator 1.3.1.26 Installation Successful >> "%LogFileName%"
Echo %time% Jinitiator 1.3.1.26 Installation Successful


:JinitAlreadyInstalled

:: Install ultimatix jinitiator certs
Echo.
Echo.
Echo. %time%  Installing Ultimatix Jinitiator certs >> "%LogFileName%"
Echo. %time%  Installing Ultimatix Jinitiator certs

set CertDB="%ProgramFiles%\Oracle\JInitiator 1.3.1.26\lib\security\certdb.txt"

type %certdb% | find /i "New eTCS CA"

if %ERRORLEVEL% neq 0 (

Echo. >> %certdb%
Echo ####Security Certificate New eTCS CA for ETCS Oracle Apps Forms HTTPS >> %certdb%
Echo ####Certificate valid till March 2027 >> %certdb%
Echo -----BEGIN CERTIFICATE----->> %certdb%
Echo MIID1jCCAr6gAwIBAgIBADANBgkqhkiG9w0BAQUFADCBpTELMAkGA1UEBhMCSU4x>> %certdb%
Echo FDASBgNVBAgTC01haGFyYXNodHJhMQ8wDQYDVQQHEwZNdW1iYWkxDTALBgNVBAsT>> %certdb%
Echo BGVUQ1MxIjAgBgNVBAoTGVRhdGEgQ29uc3VsdGFuY3kgU2VydmljZXMxKjAoBgkq>> %certdb%
Echo hkiG9w0BCQEWG211bWJhaS51bHRpbWF0aXhkYmFAdGNzLmNvbTEQMA4GA1UEAxMH>> %certdb%
Echo ZVRDUyBDQTAeFw0wNzAzMTIwNDI0MTVaFw0yNzA0MDYwNDI0MTVaMIGlMQswCQYD>> %certdb%
Echo VQQGEwJJTjEUMBIGA1UECBMLTWFoYXJhc2h0cmExDzANBgNVBAcTBk11bWJhaTEN>> %certdb%
Echo MAsGA1UECxMEZVRDUzEiMCAGA1UEChMZVGF0YSBDb25zdWx0YW5jeSBTZXJ2aWNl>> %certdb%
Echo czEqMCgGCSqGSIb3DQEJARYbbXVtYmFpLnVsdGltYXRpeGRiYUB0Y3MuY29tMRAw>> %certdb%
Echo DgYDVQQDEwdlVENTIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA>> %certdb%
Echo 6GZ9BuYb4eimfjcb17i10JrLdmB0qck7A7YzOaLJbSD6pWTmy9oDztlOnMTtBMGJ>> %certdb%
Echo wOP6q83WB3NqGeRA8HvqyjZkd/x//4PcaZZ/LvEjcaGi1pvmwlfKbFly6ORX4am5>> %certdb%
Echo fEmR78wYuJU+Mo63FFp7lV01sqfTVSbo+NjjzUCxEz+h1ChT60yZ0Jrn0e3/l4hw>> %certdb%
Echo hnZIhqlTnW1xthbWIGRqokyDFrV8C9QAd3R2/eS1UDTxsgJnVdwLpDwgzZQl0pS+>> %certdb%
Echo Zk67zSiIFgaR/v3qt/cxS+QEL3WpWnLRln+YBXCBKwxHix7RIUUve6WqNL5MeT+A>> %certdb%
Echo Xh8NaSVsyzD491KvB4XuQQIDAQABow8wDTALBgNVHQ8EBAMCAQYwDQYJKoZIhvcN>> %certdb%
Echo AQEFBQADggEBAMHz2opJb/8Ir/c+B1+lcIgKI3QEWgrDuehc25kisWY2Nl0HeMAW>> %certdb%
Echo 8mjc7eU8Fx18N3AhN40WpEQcc9oKwoR8sYyVuUENfIkEvkVpm075Rzgd02I3HZ4H>> %certdb%
Echo ReTIJOQrDRBwBA6AnHsWYZjmoMJG4r+uMnJFf9sH8is2LiTXpZB599ShvAQdA5Fs>> %certdb%
Echo 08XpV0bvKgkEFXDpCoIreDBJUcMzXbpnGHyffL4fbp7ERvtbXbwGmpkbYMzkVn6o>> %certdb%
Echo dS30LH4lRG9Rat4LK4+JTLiRETAHBFqqKH5kRUyCDG8fOx913ndeaDcW2upAMTLV>> %certdb%
Echo zD8exROiLb/uGbYC/2pmoIS1H44g1lE9+T8=>> %certdb%
Echo -----END CERTIFICATE----->> %certdb%
)
Echo.
Echo. %time% Installation complete  >> "%LogFileName%"
Echo. %time% Installation complete

:: // Skipping next step as XP machines don't have certutil.exe installed by default
:: // Also we are pushing the certificates through GPO policy
goto :END

:Install CA Root Certificates
Echo.
Echo.
Echo. %time% Installing CA Root Certificates  >> "%LogFileName%"
Echo. %time% Installing CA Root Certificates
@echo on
For %%A in (%TCSRootCerts%) do certutil.exe -addstore Root "%SourcePath%%%A"
@echo off
Echo.
Echo. %time%  Installation complete >> "%LogFileName%"
Echo. %time%  Installation complete

:END
Echo. >> "%LogFileName%"
Echo. ************** Script Run Ended on %date% %time% ******************** >> "%LogFileName%"
