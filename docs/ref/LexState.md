# LexState

A Lexer (*Lekkserr*) is a tool that breaks down statements in a programming language.

ISys does this too; it takes statements and breaks them down.

## Keywords

ISys doesn't break tokens, it breaks keywords, so things such as

```

PRINT hello

```

Aren't

```

P
R
I
N
...

```

Instead, they are

```

PRINT
hello

```

And occasionally, for Isys Lisp,

    ```

	(PRINT
		hello);

    ```

Is just

```

PRINT hello

```


