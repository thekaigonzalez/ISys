import std.stdio;
import igc;
import iif;
import ilex;
import iword;
import isyslib;
import iparse;
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
 ISys_dostring(unew);
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
  } else if (args[i] == "-e") {
	ISys_dostring(args[i++]);
  } else {
	  if (args[i-1] != "-e") {
		  file = args[i];
  	}
 }
}
 if (file != "NONE") {
  execute_file(args[1]);
 }
}
