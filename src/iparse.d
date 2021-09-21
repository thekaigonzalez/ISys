//Parser for ISys

//handle arguments accordingly

import ilex; // import lexer
import ivm; // import vm
import igc;
import iword;
import std.stdio;
import std.file;
import std.array;
import std.algorithm;
//Isys_checkstring(lexstate, 1);
string Isys_checkstring(LexState ls, int pos)
{
	// allocate new string 'rstr'
	string rstr;
	
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
