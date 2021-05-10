The special repack of "Lua for Windows" ⸺ 9000XZ noob-friendly limited edition!

With this repack, there are no pre-compiled binaries, you need to build/compile Lua from source.  
Furtunately, this repack comes with several additions regarding the building/compiling phase, featuring:  
- Written in pure Batch, no prerequisites at all (no external dependencies; other than either VS *or* Windows SDK)
- One-click Batch script to download and extract official Lua source code
- One-click Batch script to build/compile Lua (requires Visual Studio 2019 installed)
- One-click Batch script to install Lua, setting up system environment variables (requires admin privileges)
- Visual Studio 2019 solution with 3 main projects (to compile `lua.dll` / `lua.exe` / `luac.exe` individually)
  - Includes bonus project! Fully functional, simple Lua C embedding example.

# Building / Installation

1. Start by cloning [this](https://github.com/Disseract/Lua-Windows-Repack) repository locally (requires [git](https://git-scm.com/download/win)):  
    `git clone https://github.com/Disseract/Lua-Windows-Repack Lua`
    
    - Or alternatively, you may [download a ZIP archive](https://github.com/Disseract/Lua-Windows-Repack/archive/refs/heads/main.zip) and extract it on your computer.
2. Run [download.bat](https://github.com/Disseract/Lua-Windows-Repack/blob/main/download.bat) file to download Lua source code.
3. Open the Lua version folder ([5.3.6](https://github.com/Disseract/Lua-Windows-Repack/tree/main/5.3.6)). At this point, verify that Lua source code has been downloaded, you should find it inside the `src` subfolder.
4. Next, run [build.bat](https://github.com/Disseract/Lua-Windows-Repack/blob/main/5.3.6/build.bat) file to compile Lua.
5. Last but not least, in case if you want to install this Lua version on your system, then run [setup-env-vars.bat](https://github.com/Disseract/Lua-Windows-Repack/blob/main/5.3.6/setup-env-vars.bat) as administrator.
6. At this point, you are all done and you should be able to run `lua`/`luac` from Terminal or command-line.

Also, if you want to play with Lua C API, a simple example project has been included.  
1. [Open the solution (`vs2019\Lua.sln`)](https://github.com/Disseract/Lua-Windows-Repack/blob/main/5.3.6/vs2019/Lua.sln) in [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/).
2. You will find an example project called `EmbeddingSample` in the Solution Explorer window.
3. Go ahead and build the solution, it will compile everything and you should find the binaries in the `5.3.6\bin` folder, as well as lib files which you will find in the `5.3.6\lib` folder.

By running `5.3.6\bin\EmbeddingSample.exe` it will execute [`5.3.6\lua\main.lua`](https://github.com/Disseract/Lua-Windows-Repack/blob/main/5.3.6/lua/main.lua) Lua script, at which point you should see the hello world message displayed on the screen 😃
