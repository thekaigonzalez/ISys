// File for handling statements

import std.stdio;

class Statement
{
 string statement;
 public:
  this(string st) {
   statement = st;
  }
  /* initialize a new statement from within an existing one */
  Statement statement() {
   return new Statement;
  }
  /* take the initial statement and break it down*/
  string[] break_down() {
    return statement.split;
  }
}


