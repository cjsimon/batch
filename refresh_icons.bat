@ECHO OFF

:: Kill Explorer
PSKILL EXPLORER

:: Keep looping until explorer is not running
:: @see http://stackoverflow.com/a/8185270/2104168
:LOOP1
PSLIST EXPLORER >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE1
) ELSE (
  ECHO Explorer is still running
  SLEEP 1
  GOTO LOOP1
)

:: Now that explorer isn't running, 
:: delete the icon IconCache and start explorer again
:CONTINUE1
DEL %APPDATA%\Local\IconCache.db
START EXPLORER

:: Wait for explorer to start back
:: up again before ending the script
:LOOP2
PSLIST EXPLORER >nul 2>&1
IF ERRORLEVEL 1 (
  ECHO Explorer is not running
  SLEEP 1
  GOTO LOOP2
)
EXIT /B