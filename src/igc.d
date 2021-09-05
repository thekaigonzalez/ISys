// File for generating Code

extern (C) int system(const char*);

// Generation of code should work like this:
// input code -> generate -> output code

// Allow:
// input code -> translated code

import std.stdio;
import ilex;
import iword;
import istring;
import iif;
import std.string;

//save
RESERVED_EX return_generated_reserve(string str) {
 // we're gonna create a lexical statement out of the string.
 LexState ls = new LexState(str);
 if (ls.key() == Reserved[0]) {
  return RESERVED_EX.ISYS_PRINT;
 } else if (ls.key() == Reserved[1]) {
  return RESERVED_EX.ISYS_IF;
 } else if (ls.key() == Reserved[2]) {
  return RESERVED_EX.ISYS_EXECUTE;
 } else if (ls.key().startsWith(Reserved[4])) {
  return RESERVED_EX.ISYS_COMMENT;
 } else {
  return RESERVED_EX.ISYS_NULL;
 }
 return RESERVED_EX.ISYS_NULL;
}

void gc_eval_machine(string abcdef)
{
 if (abcdef == "NOTHING" || abcdef == "NULL") { writeln("Error @ gc_eval_machine():L: wrong evaluation"); }
 else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_PRINT) {
  LexState ls = new LexState(abcdef);
  StringState c = new StringState(ls);
  writeln(c.outString());
 }
}

void gc_machine(string abcdef) {
 // insert a very bad attempt
 if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_PRINT) {
  LexState ls = new LexState(abcdef);
  StringState c = new StringState(ls);
  writeln(c.outString());
 }
 else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_EXECUTE)
 {
  LexState ls = new LexState(abcdef);
  StringState c = new StringState(ls);

  system(c.outString().toStringz());
 }
 else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_IF) {
  // instead of starting a lexer, we start a boolstate.
  BoolState bs = new BoolState(abcdef);
  if (bs.execute() == "NOTHING") { writeln("ISYS_NULL"); }
  else { gc_eval_machine(bs.execute()); }
 } else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_COMMENT) {
  writeln("");
 }  else {
  writeln("Error: Type not found: ISYS_"~abcdef.split()[0]~". ");
 }
}
