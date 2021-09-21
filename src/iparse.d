//Parser for ISys

//handle arguments accordingly

import ilex; // import lexer
import ivm; // import vm
import igc;
import iword;
import std.stdio;
import std.file;
import std.conv;
import std.array;
import istring;
import std.algorithm;
//Isys_checkstring(lexstate, 1);
string Isys_checkstring(LexState ls, int pos)
{
	// allocate new string 'rstr'
	string rstr;
	for (int i = 0; i < pos; i ++) {
		ls.next();
	}

	// if the keyword is NULL (not existant)
	if (return_generated_reserve(ls.key()) == RESERVED_EX.ISYS_NULL)
	{
		if (ls.next().startsWith("\""))
		{
			string f = ls.next();
			while (!f.endsWith("\""))
			{
				rstr = rstr~f;
				f = ls.next();
			}
			writeln("Final: "~f);
		}
	}
	return rstr;
}

string Isys_dynamicstring(LexState ls)
{
	StringState st = new StringState(ls);
	return st.outString();
}

int Isys_firstnumber(LexState ls)
{
	try {  
		return to!int(ls.next());
	} catch (Exception e) {
		return -1;
	}
}

float Isys_firstfloat(LexState ls)
{
	try {
		return to!int(ls.next());
	} catch ( Exception e )
	{
		return -1;
	}
}

//checks <LexState L> number at <pos> and returns it
// example:
// EX 1 2 hello world
// checknumber(L, 1)
// int 1
// checknumber(L, 2)
// int 2
// checknumber(L, 3)
// -1
// all integer functions return -1 if not found, or if there was a conversion violation.
int Isys_checknumber(LexState L, int pos)
{
	string num; // holder for conversion
	try {
		for (int i = 1; i < pos; ++ i)
		{
			L.skip();
		}
		num = L.key(); /* key is a wrapper around current_word */
	} 
	catch ( Exception e ) // range violation (most likely)
	{
		return -1;
	}
	try {
		return to!int(num);
	}
	catch ( Exception e )
	{
		return -1;
	}
	return 1; // ? nonexistant ?
}

string Isys_firstword(LexState ls)
{
	try
	{
		return to!string(ls.next());
	}
	catch ( Exception e )
	{
		return "NULL ";
	}
}

bool Isys_firstbool(LexState ls)
{
	try {
		return to!bool(ls.next());
	}
	catch ( Exception e )
	{
		return false;
	}
}
