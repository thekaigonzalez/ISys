//File for handling string statements

import istate;
import iword;
import ilex;
import igc;
class StringState {

 LexState l;

public:

  this(LexState lex) {
   l = lex;
  }
  /* remove keyword from a string */
  string outString() {
   string pub = "";
   foreach (string key; l.self()) {
    /// only comment.
    /// fix 3: fix PRINT and other keywords not printing.
    if (return_generated_reserve(key) != RESERVED_EX.ISYS_COMMENT) {
	pub=pub~key~" ";
    }
   }
   return pub;
  }
  string[] self() {
  	return l.self();
  }
}
