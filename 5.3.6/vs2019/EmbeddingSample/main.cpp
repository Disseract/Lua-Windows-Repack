#include <filesystem>
#include <iostream>
#include <lua.hpp>
#include <string>

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>

using namespace std;

int main() {
	const auto L = luaL_newstate();
	luaL_openlibs(L);
	char cur_dir[MAX_PATH];
	GetModuleFileNameA(nullptr, cur_dir, sizeof(cur_dir));
	if (luaL_dofile(L, (string(cur_dir).substr(0, string(cur_dir).find_last_of('\\'))
		+ "\\..\\lua\\main.lua").c_str())) {
		const auto err = lua_tostring(L, -1);
		cout << "[ERROR] " << err << endl;
	}
	lua_close(L);
	system("pause >nul");
	return 0;
}
