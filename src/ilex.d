// Lexer for The ISys Programming language.

import istate;
 /* need LexerStatement Class. */

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
  /* collects the rest of a string starting at index "aat" */
  string[] collect(int aat) {
   string[] arr = state.self();
   int i = 0;
   while (i < aat) {
    arr.remove(i);
    i += 1;
   }
   return arr;
  }
}
