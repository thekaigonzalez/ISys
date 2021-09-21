import iparse;
import std.stdio;

void main() {
	LexState L = new LexState("ADD 1 2");
	writeln(Isys_checknumber(L, 1));
}
