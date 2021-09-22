// File for generating Code

extern (C) int system(const char*);

// Generation of code should work like this:
// input code -> generate -> output code

// Allow:
// input code -> translated code
import std.net.curl;
import std.stdio;
import ilex;
import iword;
import iisolated;
import iinclude;
import istring;
import iif;
import std.string;
import std.process;
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
 } else if (ls.key() == Reserved[5]) { return RESERVED_EX.ISYS_INCLUDE; }
 else if (ls.key().startsWith("(")) { return RESERVED_EX.ISYS_ISO; }
 else if (ls.key() == "ADD") { return RESERVED_EX.ISYS_ADD; }
 else if (ls.key() == "UPRINT") { return RESERVED_EX.ISYS_UPRINT; }
 else if (ls.key() == "LEN") { return RESERVED_EX.ISYS_LEN; }
 else {
  return RESERVED_EX.ISYS_NULL;
 }
 
}
/**
 * Evaluates ISys code to machine code
 * PRINT hello
 * ->
 * writeln hello
 */
void gc_eval_machine(string abcdef)
{
 if (abcdef == "NULL") { writeln("Error: NULL"); }
 else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_PRINT) {
  LexState ls = new LexState(abcdef);
  StringState c = new StringState(ls);
  writeln(c.outString());
 } else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_INCLUDE) {
  LexState ls = new LexState(abcdef);
  StringState c = new StringState(ls);
  string ipath = ls.next();
  Include inc = new Include(ipath);
  writeln(ipath);
 } else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_ISO) {
  IsolatedState ist = new IsolatedState(abcdef);
  ist.run();
 }
}
/**
 
  Does the same as gc_eval_machine but in a nested state.
 
 **/
void gc_machine(string abcdef) {
 // insert an attempt
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
  if (bs.execute() == "NULL") { writeln("ISYS_NULL"); }
  else { gc_eval_machine(bs.execute()); }
 } else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_COMMENT) {
  writeln("");
 }
 else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_INCLUDE) {
  LexState ls = new LexState(abcdef);
  string ipath = ls.next();
  Include inc = new Include(ipath);
  inc.run_file();
 } else if (return_generated_reserve(abcdef) == RESERVED_EX.ISYS_ISO) {
  IsolatedState ist = new IsolatedState(abcdef);
  ist.run();
 } else {
  writeln("Error: Enum not found (ISYS_NULL): ISYS_"~abcdef.split()[0]~". ");
 }
}
