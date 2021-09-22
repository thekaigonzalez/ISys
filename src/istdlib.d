import isyslib;
import std.stdio;
import iarg;
import ilex;
import istring;
///function library
///you can add custom functions to this library.
///Contains

///LengthMeter ( Syntax: LEN <str> ) -> Returns length of <str>
///DoIf ( Syntax: DOIF <check> { 
///	PRINT hello;
///} )

class LengthMeter {
	private:
		string stat;
	public:
		this(string st) {
			stat = st;
		}
		ulong lencheck() {
			ArgState as = new ArgState(stat);
			return as.checkdynstring(1).length;
		}
}

class DoIf {
	private:
		string stat;
	public:
		this(string st) {
			stat = st;
		}
		void exec() {
			ArgState as = new ArgState(stat);
			string fword = as.checkword();
			if (fword == "_WIN32") {
				version (Windows) {
					string ftwo = as.checkdynstring(2);
					writeln(ftwo);
				}
			}	
		}
}

class MemHandle {
	private:
		string memstat;
	public:
		this(string st) {
			memstat =st;
		}

}

///printer which parses '\n', '\r', '\b', variables, etc ...
/// before:
///MEMORY world world!
/// **PRINT hello %world%**
/// -> PRINT hello %world%
/// after:
/// **PRINT hello %world%
/// PRINT hello world!
class RawPrinter {
	private:
		string rstat;
		LexState ls;
		ArgState as;
	public:
		this (string s) {
			rstat = s;
		}
		this (LexState l) {
			ls = l;
		}
		this (ArgState sas) {
			as = sas;
		}
		void print() {
			string stp = new StringState(ls).outString();
			string nstp;
			foreach (char c; stp) {
				writeln(c);
			}
		}
}
