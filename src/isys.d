//The main interpreter for ISys

import istate;
import std.stdio;
void main() {
 Statement state = new Statement("PRINT hello");
 writeln(state.break_down());
}
