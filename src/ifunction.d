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

  if (Function == "Windows")
  {
   version(Windows) {
    return true;
   } else { return false; }
  } else if (Function == "Linux") {
   version(linux) {
    return true;
   } else { return false; }
  } else if (Function == "MAC") {
   version(OSX) {
    return true;
   } else { return false; }
  }
  return false;
 }
}
