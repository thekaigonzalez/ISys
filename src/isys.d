//The main interpreter for ISys

import igc;
import iif;
import iisolated;
import iword;
import std.stdio;
import std.getopt;
import isys_copyright;


void repl() {
 writeln("ISys (C) Copyright 2021 "~ISYS_AUTHORS);
 while (true) {
  write(">");
  string st = readln();
  if (st != null) {
   if (return_generated_reserve(st) == RESERVED_EX.ISYS_IF) {
    BoolState bs = new BoolState(st);
    gc_eval_machine(bs.execute());
   } else {
    gc_machine(st);
   }
  }
 }
}

void execute_file(string file)
{
 File f = File(file, "r");
 while (!f.eof()) {
  string line = f.readln();
  if (line != null && line.length != 1) {
   if (return_generated_reserve(line) == RESERVED_EX.ISYS_IF) {
    BoolState state = new BoolState(line);
    gc_eval_machine(state.execute());
   } else if (return_generated_reserve(line) == RESERVED_EX.ISYS_COMMENT) { write("");  } else { gc_machine(line); }
  }
 }
}

void main(string[] args) {
 string startupfile = "none";
 bool verbose = false;
 bool repld = true;
 bool test = false;
 string file = "none";
 try {
  getopt(args, std.getopt.config.bundling, "repl|r", &repld, "verbose|v", &verbose, "startup|s", &startupfile,
  "file|f", &file, "testes|t", &test);
 } catch (Exception e) {
  writeln("bad option");
 }
 if (startupfile != "none") {
  
 }
 if (repld) {
  repl();
 }
 if (file != "none") {
  execute_file(file);
 }
 if (test) {
  IsolatedState st = new IsolatedState("(PRINT hello) ** print");
  st.run();
 }
}
