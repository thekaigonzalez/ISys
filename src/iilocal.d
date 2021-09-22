///Load local functions with a special handler

import ilex;
import std.stdio;

class FunctionHandler {
	private:
		string lstat;
		LexState ls;
	public:
		this(string st) {
			lstat = st;
			ls = new LexState(lstat);
		}
		void run(string c) {
			writeln("fun");
		}
}
