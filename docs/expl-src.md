# Exploring the Source code (ISys)

## Files

- ivm.d - Code handlers, Bytecode machine
- istate.d - Core statement handler
- ifunction.d - Boolean evaluator
- iif.d - IF Statement

(that's only some)

## Build Files

The `IF`, `EXECUTE` and `OS` functions should aid you in creating quick build files for your applications.

A simple build file would look like this.

```isys

** build <project>

IF Windows DO (EXECUTE gcc app.c);
IF Linux DO (EXECUTE gcc linapp.c);
IF MAC DO (EXECUTE gcc macapp.c && gcc handlers.c);

```

And to have a buildfile project:

```json

{
 "name": "Build File for <project>",
 "entry": "build.isys",
 "init": ""
}

```
