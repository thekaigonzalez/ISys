# State

States in ISys are breakpoints which help debug code and fix errors within it.

## Functions

A State usually has (or derives) these functions.

**constructor**

**statement** - Nested Statement

**break_down** - Breaks a string into an array of strings.

-----------

And the lexer (derivative of Statement), contains these functions.

```

change_current(number) - Changes iterator to <number>

next() - Moves to the next keyword

current_word() - Returns the current word

at(pos) - Returns a word at <pos>

self() - Returns the entire array of strings.

```

## References

[LexState](LexState.md)
