//Quick file handler for #[include]
// the macro system in ISYs is a 1.1.2 build feature.
// It allows for bindings in D.
// As well as other languages.
// Current macros are..
// #[include]
// #[run] (alias to include)
import std.stdio;
import ifile;
// the #[include] directive allows other files to be run.
// #[include] filetorun.isys

class Include
{
string path;
public:
 /* Include inc = new Include("hello.isys") */
 this(string f) {
  path = f;
 }
 void run_file() {
  FileState fs = new FileState(path);
  fs.run();
 }
}
