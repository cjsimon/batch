@ECHO OFF

:begin
ECHO Select a task:
ECHO ==============
ECHO 1) Hypervisor On
ECHO 2) Hypervisor Off

:: Set the value of op using input from the user
SET /P op=Type Option: 
IF "%op%"=="1" (
	CLS
	GOTO On
)
IF "%op%"=="2" (
	CLS
	GOTO Off
)
:: No valid entry was selected. Ask again
ECHO Please Pick an option:
GOTO begin

:: List ERRORLEVELS in decreasing order
IF ERRORLEVEL 2 GOTO Off
IF ERRORLEVEL 1 GOTO On
GOTO End

:On
BCDEDIT /SET hypervisorlaunchtype auto
ECHO Hypervisor will be enabled after restart
GOTO End

:Off
BCDEDIT /SET hypervisorlaunchtype off
ECHO Hypervisor will be disabled after restart
GOTO End

:End
PAUSE
EXIT /B