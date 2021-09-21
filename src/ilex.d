// Lexer for The ISys Programming language.

import istate;
 /* need LexerStatement Class. */
import std.algorithm;

class LexState
{
 string stat;
 LexStatement state;
 int iter = 0;
 public:
  this(string statement) {
   stat = statement;
   state = new LexStatement(stat);
  }
  string key() {
   return state.current_word();
  }
  string next() {
   iter = iter + 1;
   state.change_current(iter);
   return state.at(iter);
  }
  string[] self() {
   return state.self();
  }
  void skip() {
	  iter = iter + 1;
  }
  void setpos(int n) {
	  iter = n;
  }
  /* collects the rest of a string starting at index "aat" */
  string[] collect(int aat) {
   string[] arr = state.self();
   int i = 0;
   while (i < aat) {
    arr = arr.remove(i);
    i++;
   }
   return arr;
  }
}
