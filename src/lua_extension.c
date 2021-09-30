/// insert library front & backend codes

#include "lua_extension.h"
/**
 * lua_pushnumber(l, i);
            lua_setglobal(l, "foo");

            lua_getglobal(l, "test_f");
            if (lua_pcall(l, 0, 0, 0) != 0)
            {
                    printf( "%s", lua_tostring(l, -1));
            }
 */
int CHECKLOAD(const char* fname, const char* data) {
    lua_State* L = luaL_newstate();
    luaL_openlibs(L);
    
    lua_pushstring(L, data);
    lua_setglobal(L, "arginfo");
    luaL_dofile(L, fname);
    return 0;
}
