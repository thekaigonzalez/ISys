# ISys: An Unusually awesome programming language.
ISys is an Imperative Programming language (With the option for Structured Programming) which aids in developing Build files for projects.

ISys has it's own Project manager called `sypkg` with a very basic JSON.

```json

{
 "name": "My special Project!",
 "init": "echo \"this project\"",
 "entry": "main.isys"
}

```

`name`: the name of the project

`init`: A command to run on the OS (use wisely! keep it like "" for no command.)

`entry`: The initial package to run with `sypkg run`.

## Syntax

A summary of the code goes like this:

```

If STATEMENT is recognized:
	Use the corresponding statement type
If Not:
	Check for any libraries

```

And the Lisp code works like this:

```

(STATEMENT)

if STATEMENT starts with '(':
	continue until ')':
		execute statement in '()'

```

ISys was built for simplicity and speed.

## D & C bindings

`PRINT` - writeln()

`EXECUTE` - (C) system()

`NULL` - ISYS_NULL (D)

## Custom Keywords

`#[include \<file>]` - Run file

`#[no_parse]` - (1.5-6 feature: not available yet) Disallows `isysrun` and `isys` execution, but does allow `#[include]`execution.

## Operators

`**` - Comment (Is 100% IGNORED at runtime)

## DataTypes (D)

`ISYS_PRINT` - Reserved Print keyword.

`ISYS_IF` - Reserved IF keyword.

`ISYS_EXECUTE` - Reserved EXECUTE keyword.

## Functions

ISys (as of 1.5) contains an optional feature called "functions", not like the
builtin bool functions (OS: Linux,Windows,MAC), But instead a filesystem Function.

Such as

```

If STATEMENT is not in RESERVED (is NULL):
	search PATHS
		lib/UNKNOWN_KEYWORD.isys
		func/UNKNOWN_KEYWORD.isys
		./UNKNOWN_KEYWORD.isys
		And LOAD:
			run File and Exit
				
```

## Functions VS Keywords

Functions

- Dynamic
- Working
- Faster
- More Stable
- Feature-Addable (?)
- Easy to modify
- Lua Source Code

Keywords

- Integrated
- Slower
- More Complex
- Allocated
- Less Stable
- difficult to add features
- D Source Code

## Argument Handling: Functions

(THIS SECTION IS DEPRECATED, PLEASE SEE [THIS](news/NewLuaExt.md) ARTICLE FOR UPDATED FUNCTION INFO)

Arguments in Functions are a bit complex.
They require `$ARGS` to be used.
(as of 1.5) you can add this to any statement to import the arguments.

hello.isys:

```

(UPRINT hello, world!);

```

UPRINT.isys:

```
**vvv print this vvv

PRINT $ARGS

```

# Exploring the ISys type system

[Here](expl-ists.md)

# ISys Copyright

ISys is licensed under the MIT license (Copyright (C) Kai Gonzalez)

# Other Resources

[Exploring the source Code](expl-src.md)
