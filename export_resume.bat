@ECHO OFF
:: Enable delayed expansion for proper variable handling in for loops
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS

::CALL :UNQUOTE INPUTFILE %1
SET INPUTFILE="%~f1"

:: Check if an input file was specified and whether it exists or not
IF [%INPUTFILE%] == [] (
	:: Since delayed expension is set, two carrot escape
	:: characters need to be added in order to display a single !
	ECHO "Error^^! Please input a docx file to convert!"
) ELSE (
	IF EXIST %INPUTFILE% (
		CALL :COPYFILE
	) ELSE (
		ECHO Error^^! %INPUTFILE% does not exist!
		EXIT /B
	)
)
GOTO :EOF

:: Copy the INPUTFILE to the DESTFILE.
:: In this case, we're only using it to copy resumes to the desktop
:COPYFILE
	SET DESTFILE="%USERPROFILE%\Desktop\Christopher Simon Resume.docx"
	ECHO F | XCOPY /F /Y %INPUTFILE% %DESTFILE%
	GOTO :EOF

:: Strip quotes off of an input argument
:: @param %1 The variable to strip the quotes off of
:: @param %2 Used to store the modified %1 without quotes
:UNQUOTE
  SET %1=%~2
  GOTO :EOF