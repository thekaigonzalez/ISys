extern (C) int system(const char*);
//Virtual Machine for ISys
import std.stdio;
import std.file;
import std.string;
import iif;
import ilex;
import iisolated;


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
 if (fstr != null && fstr.length > 0) {
 switch (return_generated_reserve(fstr)) {
  case RESERVED_EX.ISYS_PRINT:
	LexState ls = new LexState(fstr);
	StringState ss = new StringState(ls); // should give outString();
	writeln(ss.outString());
	break;
  case RESERVED_EX.ISYS_ISO:
	IsolatedState iso = new IsolatedState(fstr);
	iso.run();
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
 }
 return 1;
}

void ISys_Vsemi(string codes)
{
 string abcdef = codes;
 bool errors = false;
 string[] prestate = abcdef.split("\n");
 foreach(string st; prestate) {
  if (!st.endsWith(";") && st != " " && st != null) {
   writeln("Error: "~st~": expected ';'");errors=true;
  }
 }
 if (errors) {
  writeln("fatal errors detected. Exiting.");
 } else {
  string[] statements = abcdef.split(";");
  int curst = 0;
  foreach (string statement; statements) {
   if (statement != null && statement.length > 1) {
    ISys_Vexecute(statement);
   }
  }
 }
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
 gc_machine(newstring);
}
//LineIterator li = new LineIterator("PRINT hello\nPRINT goodbye!");
// li.current_line() -- PRINT hello
// li.next() -- PRINT goodbye!
// li = new LineIterator("(PRINT\nhello)")
//(PRINT
//hello)
//li.current_line() -- (PRINT
// li.next() -- hello)
// li.other() -- (PRINT hello)
class LineIterator {
string lsi;
string[] lsep;
int current=0;
public:
 this(string lse) {
  lsi = lse;
  lsep = lsi.split("\n");
 }
 
 string current_line() {
  return lsep[current];
 }
 string next() {
  current += 1;
  return lsep[current];
 }
 string other() {
  if (return_generated_reserve(lsep[current]) == RESERVED_EX.ISYS_ISO) {
   bool found_end = false;
   foreach (char tk; lsep[current]) {
     if (tk == '(') {
	continue;
     }
     else if (tk == ')') {
	found_end = true;
	break;
     }
    }
   }
  return "";
  }
}


class MultiLineState
{
string st;
public:
 this(string sta) {
 st = sta;
 }
 
}

/// manages ISys code.
/// Input:
/// (PRINT
///   hello)
///Output:
/// hello
void ISys_Imanage(string entiret)
{
 switch (return_generated_reserve(entiret)) {
  case RESERVED_EX.ISYS_ISO:
	
	break;
  default: break;
 }
}

// Executes an entire string (of file
void ISys_Iexecfile(string filename) {
 File fname = File(filename, "r");
 while (!fname.eof()) {
  string line = fname.readln();
 }
}
