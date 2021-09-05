// File for handling statements

import std.stdio;
import std.array;


/* array state to capture arrays and do specific operations */
class ArrayState
{
string[] array;
public:

 this(string[] arr) {
  array = arr;
 }

 string[] mulret() {
  return array;
 }

 string first() {
  return array[0];
 }
 string skip(int __iterator) {
  return array[__iterator+1];
 }

}

class Statement
{
 string sstatement;
 public:
  this(string st) { /* initialize with a statement "obviously" */
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

class LexStatement /* Lexical statement that gets broken down into different words */
{
 string statement; /* change: add current statement and do operations accordingly ? */

 int current = 0; /* skip keyword */
 public:
  this(string stt) {
   statement = stt;
  }
  void change_current(int num) {
   current = num;
  }
  string next() {
   ArrayState as = new ArrayState(statement.split);
   return as.skip(current);
  }
  string current_word() {
   ArrayState as = new ArrayState(statement.split);
   return as.mulret()[current];
  }
  string at(int pos) {
   return statement.split[pos];
  }
}

