@echo off
cls

call "%VS2019INSTALLDIR%\VC\Auxiliary\Build\vcvars64.bat"

rmdir /S /Q "%~dp0\bin"
mkdir "%~dp0\bin"
rmdir /S /Q "%~dp0\lib"
mkdir "%~dp0\lib"

call "%~dp0\vs2019\setup-include.bat"
cd "%~dp0\src"

cl /MD /O2 /c /DLUA_BUILD_AS_DLL *.c
rename lua.obj lua.o
rename luac.obj luac.o
link /DLL /IMPLIB:lua.lib /OUT:lua.dll *.obj
link /OUT:lua.exe lua.o lua.lib
lib /OUT:lua-static.lib *.obj
link /OUT:luac.exe luac.o lua-static.lib

del /F /Q *.obj
del /F /Q *.o
move /Y *.dll ..\bin
move /Y *.exe ..\bin
move /Y *.exp ..\lib
move /Y *.lib ..\lib

cd "%~dp0"

echo.
echo Done :)
pause >nul
