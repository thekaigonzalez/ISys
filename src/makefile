all:
	dmd ilex.d -lib -oflex.a
	dmd istate.d -lib -ofstate.a
	dmd iif.d -lib -ofif.a
	dmd igc.d -lib -ofgc.a
	dmd iword.d -lib -ofword.a
	dmd isys.d word.a gc.a state.a if.a lex.a -of../bin/ISys
clean:
	rm src/*.a
