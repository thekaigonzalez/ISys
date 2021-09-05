//The main interpreter for ISys

import igc;
import iif;
import iword;
import std.stdio;
import isys_copyright;


void repl() {
 writeln("ISys (C) Copyright 2021 "~ISYS_AUTHORS);
 while (true) {
  write(">");
  string st = readln();
  if (return_generated_reserve(st) == RESERVED_EX.ISYS_IF) {
   BoolState bs = new BoolState(st);
   gc_eval_machine(bs.execute());
  } else {
   gc_machine(st);
  }
 }
}

void main() {
 repl();
}
