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
 } else if (ls.key() == Reserved[3]) {
  return RESERVED_EX.ISYS_COMMENT;
 } else {
  return RESERVED_EX.ISYS_NULL;
 }
 return RESERVED_EX.ISYS_NULL;
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
}
