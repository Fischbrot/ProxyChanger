@echo off
:reasure
NETSH WLAN SHOW INTERFACE | findstr /r "LBS*"  
IF NOT ERRORLEVEL 1 (
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^ /v ProxyEnable /t REG_DWORD /d 1 /f
	set inProxy=1
	echo Activated Proxy
	timeout /T 5 /NOBREAK
	goto:reasure
) ELSE (
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^ /v ProxyEnable /t REG_DWORD /d 0 /f
	set inProxy=0
	echo Deactivated Proxy
	timeout /T 5 /NOBREAK
	goto:reasure
)



