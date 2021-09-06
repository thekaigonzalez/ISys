all:
	dmd istate.d -lib -ofstate.a
	dmd ilex.d state.a -lib -oflex.a
	dmd iif.d -lib -ofif.a
	dmd iword.d -lib -ofword.a
	dmd isys_copyright -lib -ofcopyright.a
	dmd ifunction.d -lib -offunction.a
	dmd istring.d -lib -ofstring.a
	dmd igc.d lex.a word.a  -lib -ofgc.a
	dmd isys.d word.a gc.a state.a if.a copyright.a function.a lex.a string.a -of../bin/ISys
windows:
	dmd istate.d -lib -ofstate.lib
	dmd ilex.d state.lib -lib -oflex.lib
	dmd iif.d -lib -ofif.lib
	dmd iword.d -lib -ofword.lib
	dmd isys_copyright -lib -ofcopyright.lib
	dmd ifunction.d -lib -offunction.lib
	dmd istring.d -lib -ofstring.lib
	dmd igc.d lex.lib word.lib  -lib -ofgc.lib
	dmd isys.d word.lib gc.lib state.lib if.lib copyright.lib function.lib lex.lib string.lib -of../bin/ISys.exe


clean:
	rm src/*.a
