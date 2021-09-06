all:
	dmd istate.d -lib -ofstate.a
	dmd ilex.d state.a -lib -oflex.a
	dmd iisolated.d -lib -ofisolated.a
	dmd iif.d -lib -ofif.a
	dmd iword.d -lib -ofword.a
	dmd isys_copyright -lib -ofcopyright.a
	dmd ifunction.d -lib -offunction.a
	dmd istring.d -lib -ofstring.a
	dmd ifile.d -lib -offile.a
	dmd iinclude.d -lib -ofinclude.a
	dmd ierr.d -lib -oferror.a
	dmd igc.d lex.a word.a  -lib -ofgc.a
	dmd isys.d word.a gc.a state.a if.a isolated.a include.a error.a file.a copyright.a function.a lex.a string.a -of../bin/ISys
	dmd isysrun.d word.a gc.a state.a if.a isolated.a include.a file.a copyright.a function.a lex.a string.a -of../bin/ISysRun
windows:
	dmd istate.d -lib -ofstate.lib
	dmd ilex.d state.lib -lib -oflex.lib
	dmd ifile.d -lib -ofifile.lib
	dmd ierr.d -lib -oferror.lib
	dmd iinclude.d -lib -ofiinclude.lib
	dmd iisolated.d -lib -ofiisolated.lib
	dmd iif.d -lib -ofif.lib
	dmd iword.d -lib -ofword.lib
	dmd isys_copyright -lib -ofcopyright.lib
	dmd ifunction.d -lib -offunction.lib
	dmd istring.d -lib -ofstring.lib
	dmd igc.d lex.lib word.lib  -lib -ofgc.lib
	dmd isys.d word.lib gc.lib state.lib if.lib iisolated.lib  ifile.lib iinclude.lib ierr.lib  copyright.lib function.lib lex.lib string.lib -of../bin/ISys.exe
	dmd isysrun.d word.dll gc.dll state.dll if.dll isolated.dll include.dll error.dll file.dll copyright.dll function.dll lex.dll string.dll -of../bin/ISysRun.exe

clean:
	rm src/*.a
