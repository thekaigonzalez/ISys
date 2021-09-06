//File for ISys Exceptions
import std.stdio;

class ISysException {
private:
 string err_note;
public:
 this(string errnote) {
  writeln("Error: ISysException was thrown!\nwhat(): "~errnote);
 }
 this() {
  writeln("Error: ISysException was thrown!\nwhat(): ?");
 }
}
