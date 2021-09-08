import std.stdio;
import igc;
import iif;
import iword;
import ivm;
void execute_file(string file)
{
 string unew = "";
 File f = File(file, "r");
 while (!f.eof()) {
  string line = f.readln();
  if (line != null && line.length != 1) {
   if (return_generated_reserve(line) == RESERVED_EX.ISYS_IF) {
    BoolState state = new BoolState(line);
    unew = unew~state.execute();
   }
   unew = unew~line;
  }
 }
 ISys_Vsemi(unew);
}

void main(string[] args) {
 execute_file(args[1]);
}
