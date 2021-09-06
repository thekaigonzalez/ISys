import std.stdio;
import igc;
import iif;
import iword;
void execute_file(string file)
{
 File f = File(file, "r");
 while (!f.eof()) {
  string line = f.readln();
  if (line != null && line.length != 1) {
   if (return_generated_reserve(line) == RESERVED_EX.ISYS_IF) {
    BoolState state = new BoolState(line);
    gc_eval_machine(state.execute());
   } else if (return_generated_reserve(line) == RESERVED_EX.ISYS_COMMENT) { write("");  } else { gc_machine(line); }
  }
 }
}

void main(string[] args) {
 execute_file(args[1]);
}
