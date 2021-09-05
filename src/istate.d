// File for handling statements

import std.stdio;
import std.array;

class ArrayState
{
string[] array;
public:

 this(string[] arr) {
  array = arr;
 }

 string first() {
  return array[0];
 }
 string skip(int __iterator) {
  return array[__iterator++];
 }

}

class Statement
{
 string sstatement;
 public:
  this(string st) {
   sstatement = st;
  }
  /* initialize a new statement from within an existing one */
  Statement statement(string sta) {
   return new Statement(sta);
  }
  /* take the initial statement and break it down*/
  string[] break_down() {
    return sstatement.split;
  }
}

class LexStatement
{
 string statement;

 Statement st = new Statement(statement);

 ArrayState as = new ArrayState(st.break_down);

 int current = 1; /* skip keyword */
 public:
  this(string stt) {
   statement = stt;
  }
  string next() {
   return as.skip(current);
   current += 1;
  }
}

