all:
	dmd istate.d -lib -ofstate.a
	dmd ilex.d state.a -lib -oflex.a
	dmd iisolated.d -lib -ofisolated.a
	dmd iif.d -lib -ofif.a
	dmd iword.d -lib -ofword.a
	dmd isys_copyright -lib -ofcopyright.a
	dmd ifunction.d -lib -offunction.a
	dmd istring.d -lib -ofstring.a
	dmd ivm.d -lib -ofvm.a
	dmd iiop.d -lib -ofop.a
	dmd irunner.d -lib -ofrunner.a
	dmd iparse.d -lib -ofparse.a
	dmd iinclude.d -lib -ofinclude.a
	dmd ierr.d -lib -oferror.a
	dmd igc.d lex.a word.a  -lib -ofgc.a
	dmd ifile.d gc.a -lib -offile.a
	dmd isys.d word.a gc.a state.a if.a isolated.a include.a error.a file.a copyright.a function.a lex.a string.a vm.a -of../bin/isys
	dmd isysrun.d vm.a  word.a gc.a state.a if.a isolated.a include.a file.a copyright.a parse.a op.a runner.a vm.a  function.a lex.a string.a -of../bin/isysrun
	dmd ./imanager.d vm.a -of../bin/sypkg
libs:
	dmd istate.d -lib -ofstate.a
	dmd ilex.d state.a -lib -oflex.a
	dmd iisolated.d -lib -ofisolated.a
	dmd iif.d -lib -ofif.a
	dmd iword.d -lib -ofword.a
	dmd isys_copyright -lib -ofcopyright.a
	dmd ifunction.d -lib -offunction.a
	dmd istring.d -lib -ofstring.a
	dmd ivm.d -lib -ofvm.a
	dmd iiop.d -lib -ofop.a
	dmd irunner.d -lib -ofrunner.a
	dmd iparse.d -lib -ofparse.a
	dmd iinclude.d -lib -ofinclude.a
	dmd ierr.d -lib -oferror.a
	dmd igc.d lex.a word.a  -lib -ofgc.a
	dmd ifile.d gc.a -lib -offile.a
	dmd isysrun.d vm.a  word.a gc.a state.a if.a isolated.a include.a file.a copyright.a function.a lex.a string.a -of../bin/isysRun

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
	dmd isys.d word.lib gc.lib state.lib if.lib iisolated.lib  ifile.lib iinclude.lib error.lib  copyright.lib function.lib lex.lib string.lib -of../bin/isys.exe 
	dmd isysrun.d word.lib gc.lib state.lib if.lib iisolated.lib iinclude.lib error.lib ifile.lib copyright.lib function.lib lex.lib string.lib -of../bin/isysRun.exe

clean:
	rm src/*.a
install:
	sudo cp ../bin/isys /usr/local/bin/isys
	sudo cp ../bin/isysrun /usr/local/bin/isysrun
