@echo off
cls
setlocal

:START:
set "LUA_VERSION=5.3.6"

set "CWD=%~dp0"
set "TEMP_DIR=%CWD%.temp"
cd "%CWD%"

if exist "%LUA_VERSION%\src" goto END
if not exist "%LUA_VERSION%" mkdir "%LUA_VERSION%"

set "FILENAME=lua-%LUA_VERSION%.tar.gz"
set "DOWNLOAD_URL=http://www.lua.org/ftp/%FILENAME%"
set "DOWNLOAD_PATH=%TEMP_DIR%\%FILENAME%"

:DOWNLOAD:
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo Lua version   : %LUA_VERSION%
echo Download URL  : %DOWNLOAD_URL%
echo Download path : %DOWNLOAD_PATH%
bitsadmin /transfer LuaDownload /download /priority high "%DOWNLOAD_URL%" "%DOWNLOAD_PATH%"

:EXTRACT:
tar -xvzf "%DOWNLOAD_PATH%" -C "%TEMP_DIR%" *.c *.h *.hpp
move /Y "%TEMP_DIR%\lua-%LUA_VERSION%\src" "%CWD%%LUA_VERSION%"

:CLEANUP:
rem timeout /T 5 /NOBREAK
rmdir /S /Q "%TEMP_DIR%"
rem del /S /Q "%DOWNLOAD_PATH%"
rem rmdir /S /Q "%TEMP_DIR%\lua-%LUA_VERSION%"

:END:
endlocal

echo.
echo Done :)
pause >nul
