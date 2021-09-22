// addition

import ivm;
import igc;
import iparse;
import ilex;
import iarg;
import std.stdio;
import std.file;

class AdditionState {
	private:
		string st;
		LexState ls;
	public:
		this(string stat)
		{
			st = stat;
			ls = new LexState(st);
		}
		this (LexState l) {
			ls = l;
		}
		int add()
		{
			ArgState as = new ArgState(ls);
			int one = as.checkNum();
			int two = as.checkNum();
			return one + two;
		}
}
