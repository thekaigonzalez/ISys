all:
	dmd ilex.d -lib -oflex.a
	dmd istate.d -lib -ofstate.a
	dmd iif.d -lib -ofif.a
	dmd igc.d -lib -ofsrc/gc.a
	dmd iword.d -lib -ofword.a
	cd src
	dmd isys.d word.a gc.a state.a if.a lex.a -of../bin/ISys
clean:
	rm src/*.a
