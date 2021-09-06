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
	dmd istate.d -lib -ofstate.dll
	dmd ilex.d state.dll -lib -oflex.dll
	dmd iif.d -lib -ofif.dll
	dmd iword.d -lib -ofword.dll
	dmd isys_copyright -lib -ofcopyright.dll
	dmd ifunction.d -lib -offunction.dll
	dmd istring.d -lib -ofstring.dll
	dmd igc.d lex.dll word.dll  -lib -ofgc.dll
	dmd isys.d word.dll gc.dll state.dll if.dll copyright.dll function.dll lex.dll string>


clean:
	rm src/*.a
