extern (C) int system(const char*);
//Virtual Machine for ISys

import std.stdio;
import std.file;
import std.string;

import iif;
import ilex;
// igc.d was originally supposed to be the code executor.
// this file will serve as a replacement for igc.d

import iinclude;
import igc;
import iword;
import istring;
int vevc(int a)
{
 if (a == 1) return 1;
 else return 0;
}

string ISys_Vsmush(string[] arr)
{
 string saa;
 foreach(string tok; arr) {
  saa = saa~tok~" ";
 }
 return saa;
}



int ISys_Vexecute(string fstr) {
 switch (return_generated_reserve(fstr)) {
  case RESERVED_EX.ISYS_PRINT:
	LexState ls = new LexState(fstr);
	StringState ss = new StringState(ls); // should give outString();
	writeln(ss);
	break;

  case RESERVED_EX.ISYS_EXECUTE:
	LexState ls = new LexState(fstr);
	StringState ss = new StringState(ls);
	system(ISys_Vsmush(ss.self()).toStringz());
	break;
  case RESERVED_EX.ISYS_COMMENT:
	assert(0);
  case RESERVED_EX.ISYS_INCLUDE:
	LexState ls = new LexState(fstr);
	string file = ls.next();
	Include inc = new Include(file);
	inc.run_file();
	break;
  case RESERVED_EX.ISYS_IF:
	BoolState bs = new BoolState(fstr);
	bs.execute();
	break;
  default: break;
 }
 return 1;
}

// '\n' is just a character.
// we can split everything by '\n' and turn it back into a string.

// logic:
// PRINT
// hello
// IS
// PRINT hello
void ISys_Iexeccode(string codes) {
 string newstring;
 foreach(char tk; codes) {
  if (tk == '\n') {
   newstring = newstring~" ";
  } else {
   newstring = newstring~tk;
  }
 }
 writeln("EVAL CODE: "~newstring);
}

// Executes an entire string (of file
void ISys_Iexecfile(string filename) {
 File fname = File(filename, "r");
 while (!fname.eof()) {
  string line = fname.readln();
 }
}
