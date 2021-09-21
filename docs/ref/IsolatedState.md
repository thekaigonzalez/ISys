# IsolatedState

Isolated functionalities are a part of ISys (Lisp), check it out!

## Nesting

As of 1.4-fix 2, Nesting is now allowed!

```

(PRINT
	hello;
PRINT
	goodbye);

```

## Parsing

Isolated Statements are handled like so

```

(PRINT hello); - PRINT hello

```

But also allow newlines and other statements to be passed.
