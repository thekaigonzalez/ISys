#include <stdio.h>


/// check if the user wants a Lua frontend.
#ifdef __SUPPORT_LUA_FRONTEND
    #define __DO_SUPPORT_LUA
#else
    #define __EXIT_NO_LUA
#endif

#ifdef __DO_SUPPORT_LUA
    #include <lua.h>
    #include <lualib.h>
    #include <lauxlib.h>
#elif defined __EXIT_NO_LUA
    /// define later
#endif

int CHECKLOAD(const char*, const char*);