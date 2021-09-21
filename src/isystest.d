import ivm;
import iparse;
import ilex;
import std.stdio;

void main() {
  LexState L = new LexState("ISTRUE true");
  if (Isys_firstbool(L)) {
	  writeln("The type system rocks!");
  }
}
