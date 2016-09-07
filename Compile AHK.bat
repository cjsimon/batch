@ECHO off
SET AHK2EXE="%~dp0AHK2EXE\ahk2exe.bat"

CD Startup
FOR /F "delims=|" %%f in ('dir /b .\*.ahk') do (
	%AHK2EXE% "%%~ff" "../Startup Icons/%%~nf.ico"
)

CD ..