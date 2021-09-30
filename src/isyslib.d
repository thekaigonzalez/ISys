//Library for ISys
//Contains a full parser for ISys!

extern (C) int system(const char*);

import std.string;
import istdlib;
import ilua;
import iarg;
import igc;
import istd;
import iword;
import ivm;
import ilex;
import ibyte;
import std.conv;
import std.stdio;
import std.file;
import iif;
import std.process;
import istring;
import iiad;
import iinclude;
import iisolated;
import iilocal;

void execute(string statement)
{
	if (statement != null && statement.length > 1) {	
		if (return_generated_reserve(statement) == RESERVED_EX.ISYS_PRINT)
		{
			LexState ls =new LexState(statement);
			ls.skip();
			StringState ss = new StringState(ls);
			writeln(ss.outString());
		}
		else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_ISO)
		{
			IsolatedState iso = new IsolatedState(statement);
			iso.run();
		} 
		else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_COMMENT)
		{
			assert(1);
		} else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_EXECUTE) {
			LexState ls = new LexState(statement);
			StringState ss = new StringState(ls);
			system(ss.outString().toStringz());
		} else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_IF) {
			BoolState bs = new BoolState(statement);
			bs.execute();
		} else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_INCLUDE) {
			LexState ls = new LexState(statement);
			string file = ls.next();
			Include inc = new Include(file);
			inc.run_file();
		} else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_ADD) {
			AdditionState as = new AdditionState(statement);
			writeln(as.add());
		} else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_UPRINT) {
			BytePrinter bp = new BytePrinter(statement);
			bp.print();
		} else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_LEN) {
			///not builtin, instead function
			LengthMeter lm = new LengthMeter(statement);
			writeln(lm.lencheck());
		} else if (return_generated_reserve(statement) == RESERVED_EX.ISYS_RAW) {
			RawPrinter rp = new RawPrinter(statement);
			rp.print();
		} else {
			Fstd fstd = new Fstd(new LexState(statement));
			if (fstd.runFunc() == -1) {
				if (RunLuaExtension(statement.split) == -1) {
					writeln(statement~"\n^\nError: unknown function or keyword (--Eunfound-word 2203)");
				}
			}
			
		}	
    }
}

void ISys_dostring(string st) {
	string[] defs = st.split(";");
	
	foreach (string def; defs) {
		if (def.length > 1 && def != null) {	
			execute(def);
		}
	}
}
