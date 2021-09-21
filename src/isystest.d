import ivm;
import iparse;
import ilex;
import std.stdio;

void main() {
  LexState L = new LexState("ISTRUE 1 2 3 4 5");
  writeln(Isys_nextnumber(L));
}
