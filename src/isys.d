//The main interpreter for ISys

import igc;
import iif;
import std.stdio;

void repl() {
 while (true) {
  write(">");
  string st = readln();
  gc_machine(st);
 }
}

void main() {
 BoolState bs = new BoolState("IF a DO PRINT hello");
 writeln(bs.condition());
}
