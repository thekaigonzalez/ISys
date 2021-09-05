//The main interpreter for ISys

import igc;

import std.stdio;

void repl() {
 while (true) {
  write(">");
  string st = readln();
  gc_machine(st);
 }
}

void main() {
 repl();
}
