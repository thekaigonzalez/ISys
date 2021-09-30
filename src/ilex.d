// Lexer for The ISys Programming language.

import istate;
 /* need LexerStatement Class. */

import std.stdio;
import std.algorithm;
import std.string;

/**

LexState -> Lexer State
This is an interactive class which iterates or DEiterates through
keywords.

*/
class LexState
{
  /// the statement to be used
 string stat;
 /// The Lexer Statement wraparound.
 LexStatement state;
 /// the iterator.
 int iter = 0;
 public:
  ///the only possible constructor, only statement strings are allowed. States are wrapped around by this class.
  this(string statement) {
   stat = statement;
   state = new LexStatement(stat);
  }
  string[] without(int befores) {
    for (int i = 0; i < befores; ++ i) {
      writeln(this.self()[i]);
    }
    return [];
  }
  /// return the current keyword.
  string key() {
   return state.current_word();
  }
  ///move to the next keyword and return it.
  string next() {
   iter = iter + 1;
   state.change_current(iter);
   if (state.at(iter).endsWith(" ")) {
     return state.at(iter).chop();
   }
   return state.at(iter);
  }
  /// Return the entire array.
  string[] self() {
   return state.self();
  }
  /// Silently skip a Keyword without returning.
  void skip() 
  {
	  iter = iter + 1;
	  state.change_current(iter);
  }
  /// set the "iter" variable without moving in the state, or printing or returning anything.
  void setpos(int n) {
	  iter = n;
  }

  /** collects the rest of a string starting at index "aat" */
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
