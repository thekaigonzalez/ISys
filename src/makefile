OUTLIB=libisys.a
FLAGS=-O -lib
MAINFILE=isys.d 
SRC=istate.d ifunchandler.d ibyte.d isyslib.d iloadlib.d iilocal.d istd.d iarg.d ilex.d iword.d iisolated.d ifunction.d iif.d istring.d ivm.d iiad.d iiop.d irunner.d iparse.d iinclude.d \
       ierr.d igc.d ifile.d isys_copyright.d 
LNK=libisys.a
OUTFILE=../bin/isys 
OUTRUN=../bin/isysrun

all:
	dmd $(SRC) $(FLAGS) -of$(OUTLIB)
	dmd $(MAINFILE) $(LNK) -O -of$(OUTFILE)
	dmd imanager.d -O $(LNK) -of../bin/sypkg
	dmd isysrun.d $(LNK) -O -of$(OUTRUN) 
	dmd isystest.d $(LNK) -O -of../bin/test 

windows:
	dmd $(SRC) $(FLAGS) -oflibisys.lib
	dmd $(MAINFILE) $(LNK) -O -of../bin/isys.exe 
	dmd isysrun.d $(LNK) -O -of../bin/isysrun.exe
	dmd imanager.d $(LNK) -O -of../bin/sypkg.exe
	dmd isystest.d $(LNK) -O -of../bin/isystest.exe	
clean:
	rm src/*.a
install:
	sudo cp ../bin/isys /usr/local/bin/isys
	sudo cp ../bin/sypkg /usr/local/bin/sypkg 
	sudo cp ../bin/isysrun /usr/local/bin/isysrun
webci:
	dmd $(SRC) -Dd../docs/api/ -lib
	git add ../docs/
	git commit -m "push webdoc"
	git push
