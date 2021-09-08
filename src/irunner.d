//File executor for ISys

import std.stdio;

import ilex;
import iparse;
import ivm;
// handle files

File ISys_FopenFile(string fname)
{
 return File(fname, "r");
}

void handle(File f)
{
 
}
