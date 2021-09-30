# Lua Extension Feature

ISys now allows Lua extensions!

Basically you can add Lua to the current directory, and then run it from ISys!]

## Example

test.lua

```lua

print("This is a test.. You also said: " .. arginfo)

```

istest.isys

```lua

test hello

```

Outputs:

`This is a test.. You also said: hello`
