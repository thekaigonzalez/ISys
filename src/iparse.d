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
