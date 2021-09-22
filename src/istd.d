import ivm;
import igc;
import std.stdio;
import std.algorithm.mutation;
import iarg;
import isyslib;
import std.string;

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
		int runFunc() {
			writeln(ls.key());
			if (ls.key() == "LEN") {
				writeln(as.checkdynstring(0).length);
				return 1;
			} else if (ls.key() == "REV") {
				writeln(ISys_Vsmush(as.checkdynstring(0).split.reverse));
				return 1;
			} else {
				return -1;
			}
		}

}
