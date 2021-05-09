@echo off

rmdir /S /Q "%~dp0\..\include"
mkdir "%~dp0\..\include"

goto SYMLINK

:COPY:
cd "%~dp0\..\src"
FOR %%G IN (lauxlib.h lua.h lua.hpp luaconf.h lualib.h) DO copy /Y %%G ..\include\
goto END

:SYMLINK:
cd "%~dp0\..\include"
FOR %%G IN (lauxlib.h lua.h lua.hpp luaconf.h lualib.h) DO mklink %%G ..\src\%%G

:END:
