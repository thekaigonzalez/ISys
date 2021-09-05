// Lexer for The ISys Programming language.

import istate;
 /* need LexerStatement Class. */

class LexState
{
 string stat;
 LexStatement state;
 public:
  this(string statement) {
   stat = statement;
   state = new LexStatement(stat);
  }
  string key() {
   return state.current_word();
  }
}
