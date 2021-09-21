import ivm;
import iparse;
import ilex;
import std.stdio;
import iarg;

void main() {
  LexState L = new LexState("ADD 1 2");
  ArgState as = new ArgState(L);
  int firstint = as.checkNum(); // first index
  int secondint = as.checkNum(); // second index
  int result = firstint + secondint;
  writeln(result);
}
