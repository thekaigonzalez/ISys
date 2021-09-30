OUTLIB=libisys.a
FLAGS=-O -lib -L-llua5.4
MAINFILE=isys.d
SRC=istate.d ifunchandler.d lua_extension.o ibyte.d isyslib.d iilocal.d istd.d iarg.d ilex.d iword.d iisolated.d ifunction.d iif.d istring.d ivm.d iiad.d iiop.d irunner.d iparse.d iinclude.d \
    istdlib.d ilua.d iluae.d \
       ierr.d igc.d ifile.d isys_copyright.d 
LUALOADERFILES=lua_extension.c
CC=gcc
CFLAGS=-O2 -c -llua5.4
LNK=libisys.a
OUTFILE=../bin/isys 
OUTRUN=../bin/isysrun

all:
	$(CC) $(CFLAGS) $(LUALOADERFILES) -D__SUPPORT_LUA_FRONTEND -c

	dmd $(SRC) $(FLAGS) -of$(OUTLIB) 
	dmd $(MAINFILE) $(LNK) -O -of$(OUTFILE) -L-llua5.4
	dmd imanager.d -O -L-llua5.4 $(LNK) -of../bin/sypkg
	dmd isysrun.d $(LNK) -O -of$(OUTRUN)  -L-llua5.4
	dmd isystest.d $(LNK) -O -of../bin/test -L-llua5.4
no_lua:
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
