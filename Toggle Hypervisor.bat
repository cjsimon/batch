@ECHO OFF
:begin
ECHO Select a task:
ECHO ==============
ECHO 1) Hypervisor On
ECHO 2) Hypervisor Off

SET /P op=Type Option: 
IF "%op%"=="1" (
	CLS
	GOTO On
)
IF "%op%"=="2" (
	CLS
	GOTO Off
)

ECHO Please Pick an option:
GOTO begin

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 2 GOTO Off
IF ERRORLEVEL 1 GOTO On
GOTO End

:On
bcdedit /set hypervisorlaunchtype auto
ECHO Hypervisor will be enabled after restart
GOTO End

:Off
bcdedit /set hypervisorlaunchtype off
ECHO Hypervisor will be disabled after restart
GOTO End

:End
pause