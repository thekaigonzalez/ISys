import ivm;
import igc;
import std.stdio;
import std.digest: toHexString;
import core.stdc.stdlib;
import std.algorithm.mutation;
import iarg;
import isyslib;
import std.string;
import std.conv;

/// contains global variables
/// (NOT NEEDED ANYMORE, USING ASSOC ARRAYS!)
deprecated string[] tnames;
///global types (deprecated)
deprecated string[] glob;
///integer memory.
string[int] imemory;
///boolean memory.
bool[string] bmemory;
///float memory.
string[float] fmemory;

/// string memory
string[string] smemory;

import ilex;
///standard library

/// Fstd func = new Fstd("")
class Fstd {
	private:
		string stat;
		LexState ls;
		ArgState as;
	public:
	///
		this(string state) {
			ls = new LexState(state);
			as = new ArgState(state);
		}
		///
		this (LexState lp) {
			ls = lp;
			as = new ArgState(lp);
		}
		/// runs an STD function
		/// 1: function exists, run success
		/// 0: function doesn't exist, or run not successful
		int runFunc() {
			
			if (ls.key() == "LEN") {
				ulong len = as.checkdynstring("LEN").length;
				writeln(len-1);
				return 1;
			} else if (ls.key() == "REV") {
				writeln(ISys_Vsmush(as.checkdynstring("REV").split.reverse));
				return 1;
			} else if (ls.key() == "BYTE") {
				/// memory
				const int fmem = as.checkNum();
				malloc(fmem);
				return 1;
			} else if (ls.key() == "DUMP") {
				writeln(malloc(as.checkword().length));
				return 1;
			} else if (ls.key() == "HEX") {
				(cast(ubyte[]) as.checkword())    // We want raw bytes...
        		.toHexString     // ...convert them to hex...
        		.writeln;        // ...and print.

				return 1;
			} else if (ls.key() == "BOUND") {
				///
				string vname = as.checkword();
				
				///
				string vtype = as.checkword();
				
				if (vtype == "boolean") {
					try {
						///
						bool vval = as.checkbool();

						bmemory[vtype] = vval; // write changes to Boolean Memory
					}
					catch (Exception e) {
						writeln("Error: couldn't convert to boolean expression from 'BOUND'. REMEMBER: 1-0 Doesn't count!");
					}
				}
				return 1;
			} else if (ls.key() == "DEL") {
				/// DEL variable
				/// DEL IF [boolean|integer|string|float] variable IS <value>

				string vkeuy = as.checkword();
				

				if (vkeuy == "boolean") {
					string vnames = as.checkword();
					if (vnames in bmemory) {
						bmemory.remove(vnames);
					} else  {
						writeln("warning: tried to remove '"~vnames~"' but it wasn't found in boolean memory.");
					}
				} else {

				}
				return 1;
			} else if (ls.key() == "VPRINT") {
				string vtype = as.checkword();
				if (vtype == "boolean") {
					string ttc = as.checkword();
					if (ttc in bmemory) {
						writeln(bmemory[ttc]);
					} else {
						writeln("Warning: Variable "~ttc~" does not exist.");
					}
				}
				return 1;
			} else if (ls.key() == "DB") {
				writeln(bmemory);
				writeln(fmemory);
				writeln(smemory);
				writeln(imemory);
				return 1;	
			} else {
				return -1;
			}
			return -1;
		}

}
