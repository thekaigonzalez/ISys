module ilua;

import iluae;

import std.stdio;
import std.file;
import std.string;
import std.algorithm;
import std.array;
import ivm;


/**

The Lua Extension Project
This aims to integrate Lua with ISys,

*/

/**

POP - returns the first item in array and removes it.

*/
string pop(string[] arr) {
    string ar = arr[0];
    arr = arr.remove(0);
    return ar;
}

int RunLuaExtension(string[] fulldata) {
    version(LUA_EXT_VERSION) {
        string fname = fulldata.pop();
        const char* tfwd = ("/usr/include/isys/std/"~fname~".lua").toStringz();
        if (CHECKLOAD(tfwd, ISys_Vsmush(fulldata).toStringz()) == -1) {
            const char* tfw2d = ("/usr/include/isys/std/"~fname~".lua").toStringz();
            if (CHECKLOAD(tfw2d, ISys_Vsmush(fulldata).toStringz()) == -1) {
                return -1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    } else {
        return -1;
    }
}