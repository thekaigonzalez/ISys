// file for handling IF statements.

import std.stdio;
import std.array;

import istring;
import ilex;
import iword;
import igc;
import ifunction;


/* BoolState: parse IF expressions */
/*
ifs can be written like this:

IF EXPRESSION DO (EXPR)

Where EXPRESSION is:

- An OS check (OS(Name))

Where (EXPR) is:

- A specific command. (Like PRINT)
*/
class BoolState
{
 string exp;
 LexState ls;
public:
 this(string ex) {
  exp = ex;
  ls = new LexState(exp);
 }
 string condition() {
  return ls.self()[1];
 }
 void execute() {
  if (ls.current() == "IF") { //keys: IF
   string condition = ls.next();
   FuncState fs = new FuncState(condition);
   if (fs.ret_func_data()) { //keys: IF FUNCTION()
    string signal = ls.next();
    if (signal == "DO") { //keys: IF FUNCTION() DO
     /* hmm... */
     /* we need to get the rest of the string somehow. */
     /* maybe using builtin lexer functions w/ istring.d */
    }
   }
  }
 }
}

