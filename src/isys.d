//The main interpreter for ISys

import istate;
import std.stdio;
void main() {
 LexStatement ls = new LexStatement("PRINT hello world");
 writeln(ls.next());
}
