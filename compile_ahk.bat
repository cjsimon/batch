@ECHO OFF
:: Directory Tree
:: ==============
::
:: +--\
:: |  +--Startup\
:: |  |  +--ahk_script1.ahk
:: |  |  +--ahk_script2.ahk
:: |  |  +--ahk_script3.ahk
:: |  +--Startup Icons\
:: |  |  +--ahk_script1.ico
:: |  |  +--ahk_script2.ico
:: |  |  +--ahk_script3.ico
::
:: Description:
:: Compiles all ahk scripts found in "Startup" using the ahk2exe.bat program.
:: Icons for the newly created exes are located in "Startup Icons"


:: Set the location of AHK compiler
:: @see https://github.com/cjsimon/batch/blob/master/ahk2exe.bat
SET AHK2EXE="%~dp0AHK2EXE\ahk2exe.bat"

:: Move to the Startup directory where the .ahk files are located
CD Startup
:: For each file that ends with .ahk
FOR /F "delims=|" %%f in ('dir /b .\*.ahk') do (
	:: Convert the file using the AHK2EXE batch file
	:: The input .ico file is hardcoded to be located in "Startup Icons",
	:: under the same name as the filename as the ahk script
	%AHK2EXE% "%%~ff" "../Startup Icons/%%~nf.ico"
)

:: Back out to the original directory
:: TODO: Not going up one level
CD ..
EXIT /B