# ISys installer

How to install ISys

## Windows (tested)
ISys has supported windows makefile, to install, first you need Digital Mars D (DMD), you can install it @ https://s3.us-west-2.amazonaws.com/downloads.dlang.org/releases/2021/dmd-2.097.2.exe

After you've installed it, you're going to need a Unix-like environment, because you need Make.	You can use MinGW-MSYS (tested), or something like CyGWin.

After, run `make windows` in the top level directory (or `src`), and let it build.

## Unix (macOS, Linux, BSDs)
Install ISys using the following commands

```

$ git clone https://github.com/thekaigonzalez/ISys.git
$ cd ISys
$ make && sudo make install
$ isys

```

## ISys files

`sypkg` - The ISys package manager

`isys` - The ISys REPL

`isysrun` - The quick runner for ISys files.

(NOT INCLUDED) `test` - tests ISys beta features.
