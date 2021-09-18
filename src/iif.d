// file for handling IF statements.

import std.stdio;
import std.array;
import std.algorithm;
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

- An OS check (OSName)
- A NOTNULL check (NOTNULL <COMMAND>)

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
 // return the expression if TRUE, if not, return NOTHING
 string execute() {
  if (ls.key() == "IF") { //keys: IF
   string condition = ls.next();
   FuncState fs = new FuncState(condition);
   if (fs.ret_func_data()) { //keys: IF FUNCTION()
    string signal = ls.next();
    if  (signal == null)
	    writeln("Syntax Error: IF Statements require a \"DO\" Directive.");
    if (signal == "DO") { //keys: IF FUNCTION() DO (0, 1, 2);
     /*.. */
     string[] expr = ls.collect(2); // 0=CONDITION 1...= Expr
     expr = expr.remove(0); //1...
     string expression = "";
     foreach (string constructor; expr) {
      expression = expression~constructor~" ";
     }
     return expression;
    } else { return "Bad IF Expression"; }
   } else { return "NOTHING"; }
  } else { return "NOTHING"; }
 }
}

