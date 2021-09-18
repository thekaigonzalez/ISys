extern (C) int system(const char*);
import std.conv;
import std.json;
import std.string;
import std.algorithm;
import std.file;
import std.stdio;
import ivm;
//dmd 

void main(string[] args) {
	if ("./isysproject.json".exists() && args[1] == "run")
	{
		writeln("loading project...");
		string jsstring;
		File f = File("./isysproject.json", "r");
		while (!f.eof) {
			string fn = f.readln();
			jsstring = jsstring~fn~"\n";
		}
		f.close();
		JSONValue j = parseJSON(jsstring);
		writeln("Name: "~j["name"].str);
		system(j["init"].str.toStringz());
		if (system(("isysrun "~j["entry"].str).toStringz()) == -1)
		{
			writeln("error: ISys is not installed.");
			writeln("please install it using `gitstrap install ISys` or `git clone https://github.com/thekaigonzalez/ISys && cd ISys && make && sudo make install`");
		}
	}
}
