import std.stdio;
import iword;
import igc;
import ivm;
import ilex;
// Allows modules to be passed in and run at Runtime.
class RuntimeFSState
{
	//idea: create an api which includes files with special functions like "RETURN", "#[no_parse]", And "$ARGS"
	private:
		string st;
	public:
		this(string stat){
			st =stat;
		}
		void _stack() {
			LexState ls = new LexState(st); // create a new lexer instance
			if (return_generated_reserve(ls.key()) == RESERVED_EX.ISYS_NULL)
			{
					
			}	
		}
		
}
