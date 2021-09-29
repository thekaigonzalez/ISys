import os
import sys

"""

ISysPy - Python replica of ISys



"""

# fix2: Remove "data"
#data = ["PRINT"]
datap = ["ISYS_PRINT", "ISYS_EXECUTE"]

class Statement: # create statement (ISys statement)
    def __init__(self, statement ):
        self.stat = statement
    def split_down(self):
        return self.stat.split(" ")

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

def return_reserve(stri: str):
    ls = LexerState(stri)
    starr = ls.split_down()
    """
    
    Returns the corresponding DataType according to Statement type.
    
    """
    if (starr[0] == "PRINT"):
        return datap[0] # return ISYS_PRINT
    elif (starr[0] == "EXECUTE"):
        return datap[1] # return ISYS_EXECUTE

class PrintState:
    def __init__(self, stat):
        self.stat = stat
        self.lexer = LexerState(self.stat)
    def printstring(self):
        i = 0
        del self.lexer.statarr[0]
        ns = " ".join(self.lexer.statarr)
        #rep: no ISys algorithm, basic Python 3.
        return ns

class ExecState:
    def __init__(self, stat):
        self.stat =stat
        self.string = PrintState(self.stat).printstring();
    def executeStatement(self):
        return os.system(self.string)
    def ok(self):
        if (os.system(self.string) == -1):
            return False;
        else:
            return True;

class Generator:
    def __init__(self, lexer):
        self.lexer = lexer
    def generate(self):
        if (return_reserve(self.lexer.stat) == "ISYS_PRINT"):
            prs = PrintState(self.lexer.stat);
            print(prs.printstring())
        elif (return_reserve(self.lexer.stat) == "ISYS_EXECUTE"):
            es = ExecState(self.lexer.stat)
            print(es.executeStatement())
def execute(string):
    ls = LexerState(string)
    
    gen = Generator(ls)
    
    gen.generate()
    return 1;

print("ISysPy demo (version 1-git)")

while (True):
    sk = input(">>")
    execute(sk)
