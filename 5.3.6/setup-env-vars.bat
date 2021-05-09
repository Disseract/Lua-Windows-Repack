@echo off
cls

echo Remember to run this as admin.
echo.

setx LUA_DIR "%~dp0bin" /M
setx LUA_CPATH "?.dll;%%LUA_DIR%%\?.dll" /M
setx LUA_PATH "?.lua;%%LUA_DIR%%\lua\?.lua" /M

echo.
echo Done.
pause >nul
