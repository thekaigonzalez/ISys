# Build your own ISys parser in Python (or any other language).

ISys can literally be built in any language, Don't believe me? view this book and you'll know everything you need to know.

## 1. Base

The base parser is as follows.

```python

class Statement: # create statement (ISys statement)
    def __init__(self, statement ):
        self.stat = statement
    def split_down(self):
        return self.stat.split(" ")


```

This block of code creates a statement class, just like ISys.

After creating the statement, we need a couple of helper functions and a lexer.

```python3

def Tstring(array):
    strig = ""
    for i in array:
        strig += i
    return strig

class LexerState(Statement): # Create Lexer
    def __init__(self, statement):
        self.statobj = Statement(statement)
        self.statarr = self.statobj.split_down()
        self.pos = 0
        self.stat = statement;
    def next(self):
        self.pos += 1
        return self.statarr[self.pos]
    def current(self):
        return self.statarr[self.pos]
    def this(self):
        return self.statarr
    def remove(self, indice):
        self.statarr.remove(indice)

```

**Tstring**

Returns a glob array

**LexerState**

Breaks down code and returns pieces, based off of the ISys lexer.

## 2. Printing 

Now we're going to implement a print function.

Add these to the top of your code.

```python

data = ["PRINT"]
datap = ["ISYS_PRINT"]

```

And add this to the bottom.

```python3

def return_reserve(stri: str):
    ls = LexerState(stri)
    starr = ls.split_down()
    if (starr[0] == "PRINT"):
        return datap[0]

class PrintState:
    def __init__(self, stat):
        self.stat = stat
        self.lexer = LexerState(self.stat)
    def printstring(self):
        i = 0
        del self.lexer.statarr[0]
        ns = " ".join(self.lexer.statarr)
        #implement "ISys String" algorithm.
        print(ns)

```

**return_reserve**

Direct bind to the "return_generated_reserve" function in the ISys API.

**PrintState**

Initializes a Printer, this will aid in using print functions like

`PRINT hello, world!`

**PrintState.printstring()**

Prints the string from a statement.

## 3. Runner

Now we need a runner (or generator). Try this:

```python3

class Generator:
    def __init__(self, lexer):
        self.lexer = lexer
    def generate(self):
        if (return_reserve(self.lexer.stat) == "ISYS_PRINT"):
            prs = PrintState(self.lexer.stat);
            prs.printstring()
def execute(string):
    ls = LexerState(string)
    
    gen = Generator(ls)
    
    gen.generate()
    return 1;

```

What this code is doing is it's initializing a new lexer in `self`, which is a supplied Lexer.

Then it takes that code and checks if it's ISYS_PRINT, if so, then it'll initialize the PrintState and print the string.

The next function wraps around the `Generator` class and does the exact same thing, only with a string this time.

## 4. Test

This statement was tested, you can try to make your own!

`PRINT hello, world!`

```python3
# prints hello, world!
execute("PRINT hello, world!")
```

