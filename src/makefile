all:
	dmd istate.d -lib -ofstate.a
	dmd ilex.d state.a -lib -oflex.a
	dmd iif.d -lib -ofif.a
	dmd iword.d -lib -ofword.a
	dmd istring.d -lib -ofstring.a
	dmd igc.d lex.a word.a  -lib -ofgc.a
	dmd isys.d word.a gc.a state.a if.a lex.a string.a -of../bin/ISys

clean:
	rm src/*.a
