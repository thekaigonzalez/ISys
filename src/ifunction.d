//File for checking & defining functions.

class FuncState
{
 string Function;
public:
 this(string func) {
  Function = func;
 }
 bool ret_func_data()
 {

  if (Function == "OS(Windows_NT)")
  {
   version(Windows) {
    return true;
   } else { return false; }
  } else if (Function == "OS(Linux)") {
   version(linux) {
    return true;
   } else { return false; }
  } else if (Function == "OS(MACH)") {
   version(OSX) {
    return true;
   } else { return false; }
  }
  return false;
 }
}
