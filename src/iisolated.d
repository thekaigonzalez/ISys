//File for parsing Isolated statement code

import std.stdio;
import igc;
import ivm;
// isolated statements are statements in which comments don't conflict with the
// syntax of the expression.

// PRINT hello ** print (hello print)
// (PRINT hello) ** print (hello)

class IsolatedState
{
private:
 string statement;
public:
 this(string st) {
  statement = st;
 }
 void run() {
  string expe;
  /*get char up to ')'*/
  foreach(char c; statement) {
   if (c == '(') { continue; }
   else if (c == ')') { break; }
   else {
    expe = expe~c;
   }
  }
  ISys_Vsemi(expe);
 }
}
