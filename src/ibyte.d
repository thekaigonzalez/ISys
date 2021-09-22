///Byte Printer

import std.stdio;
import iarg;
import istd;
import istring;
import core.stdc.stdlib;
import ilex;
/// The default class for the **Byte Printer** function.
/// ```
///
/// UPRINT <bytes> <string>
///
/// ```
class BytePrinter {
	private:
		string statement;
		LexState ls;
		ArgState as;
	public:
		this(string stat) {
			statement = stat;
			ls = new LexState(statement);
			as = new ArgState(ls);
		}
		this (LexState l) {
			ls = l;
			as = new ArgState(ls);
		}
		/// gets the first argument (bytes)
		int get_bytes() {
			return as.checkNum();
		}
		/// gets the dynamic string after.
		string getstring() {
			string ns;
			int i = 0;
			foreach(string key ;ls.self()) {
				if (i == 0) {
					i = i + 1;
				} else if (i == 1) {
					i = i + 1;
				} else {
					ns = ns~key~" ";
			
				}
			}

			return ns;
		}
		/// allocates the bytes and prints the string.
		void print() {
			malloc(get_bytes());
			writeln(getstring());
		}
}
