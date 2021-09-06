//Handling running files in ISys

import std.stdio;
import std.file;
import std.array;
import iword;
import igc;
import iif;
class FileState
{
private:
 string file;
public:
 this(string f)
 {
  file = f;
 }
 void run() {
  File f = File(file, "r");
  while (!f.eof()) {
   string line = f.readln();
   if (line != null && line.length != 1) {
    if (return_generated_reserve(line) == RESERVED_EX.ISYS_IF) {
     BoolState state = new BoolState(line);
     gc_eval_machine(state.execute());
    } else if (return_generated_reserve(line) == RESERVED_EX.ISYS_COMMENT) { write(""); }
   else {
    gc_machine(line);
   }
  }
 }

 }
}
