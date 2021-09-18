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

   if (return_generated_reserve(line) != RESERVED_EX.ISYS_COMMENT) {

   	if (return_generated_reserve(line) == RESERVED_EX.ISYS_IF) {
   	 BoolState state = new BoolState(line);
   	 unew = unew~state.execute();
   	} else {
   	unew = unew~line;
	}
	
    }

   }
 }
 ISys_Vsemi(unew);
}
void inf_stdout() {
 while (true) {
  string line = readln();
  ISys_Vsemi(line);
 }
}

void main(string[] args) {
 string file = "NONE";
 for (int i = 1; i < args.length; i++) {
  if (args[i] == "-") {
   inf_stdout();
  } else {
   file = args[i];
  }
 }
 execute_file(args[1]);
}
