import ivm;
import igc;
import std.stdio;
import std.digest: toHexString;
import core.stdc.stdlib;
import std.algorithm.mutation;
import iarg;
import isyslib;
import std.string;

/// contains global variables
string[] glob;

import ilex;
///standard library

/// Fstd func = new Fstd("")
class Fstd {
	private:
		string stat;
		LexState ls;
		ArgState as;
	public:
		this(string state) {
			ls = new LexState(state);
			as = new ArgState(state);
		}
		this (LexState lp) {
			ls = lp;
			as = new ArgState(lp);
		}
		/// runs an STD function
		/// 1: function exists, run success
		/// 0: function doesn't exist, or run not successful
		int runFunc() {
			
			if (ls.key() == "LEN") {
				writeln(as.checkdynstring(1).length);
				return 1;
			} else if (ls.key() == "REV") {
				writeln(ISys_Vsmush(as.checkdynstring(0).split.reverse));
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
			} else {
				return -1;
			}
		}

}
