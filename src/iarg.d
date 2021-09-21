// argument handlers

import ivm;
import std.conv;
import std.stdio;
import ilex;
import igc;
import iparse;
import iword;
//arghandler - Argument Handler
// "ArgState"
// usage:
// ArgState as = new ArgState("PRINT hello, world!;")
// OR
// LexState ls = new LexState("PRINT hello, world!;")
// ArgState as = new ArgState(ls);
class ArgState
{
	private:
		string stat;
		LexState ls;
		int iter;
	public:
		this(string st)
		{
			//change 'stat' to 'st'
			stat = st;
			
			//create a new lexer
			ls = new LexState(stat);
			// if the datatype of the key is not null
			if (return_generated_reserve(ls.key()) != RESERVED_EX.ISYS_NULL)
			{
				// then skip, because it's a reserved identifier.
				ls.skip();
			}
		}
		this(LexState l)
		{
			ls = l;
		}
		// static_type() - ISYS_NULL | ISYS_PRINT ...
		RESERVED_EX static_type() {
			return return_generated_reserve(ls.key());
		}
		//checkNum() - shifts the position and returns 
		int checkNum() {
			return to!int(ls.next());
		}
		// move(int): Moves the iterator position by <shifts>
		void move(int shifts)
		{
			iter = iter + shifts;
		}
		//checkword(): moves the iterator by 1 and returns the word before it.
		string checkword() {
			return to!string(ls.next());
		}
		//checkbool(): same as checkword() and checkNum()
		bool checkbool() {
			return to!bool(ls.next());
		}
		//...
		float checkfloat() {
			return to!float(ls.next());
		}

		
}
