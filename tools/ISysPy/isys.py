import os
import sys

data = ["PRINT"]
datap = ["ISYS_PRINT"]

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

execute("PRINT hello, world!")
