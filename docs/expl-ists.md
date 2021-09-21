# The weird ISys type system

ISys's type system works in such ways it cannot be described to the average person, lets break down how it works,
and how you can modify it.

## ISys types

The supported types are

- int
- string
- bool
- float

## ISys strings

ISys strings are handled in a weird way. They aren't handled as traditional strings (""),
but instead as a sentence.

A traditional string is formed like

```

"My String"

```

In ISys, this is just

```

My String

```

## Placement

Placement usually is as follows

```

FUNC <u> <ds>

```

**u**

Usual types. (Bool, string (word), float, int)

**ds**

Dynamic String (handles ALL options, use wisely)
