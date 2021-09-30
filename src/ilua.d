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
    string fname = fulldata.pop();
    const char* tfwd = ("./"~fname~".lua").toStringz();
    if (CHECKLOAD(tfwd, ISys_Vsmush(fulldata.remove(0)).toStringz()) == -1) {
        return -1;
    } else {
        return 0;
    }
}