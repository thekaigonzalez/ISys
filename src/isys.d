//The main interpreter for ISys

import ilex;
import std.stdio;
void main() {
 LexState ls = new LexState("PRINT hello world");
 writeln(ls.key());
 writeln(ls.next());
 writeln(ls.next());
}
