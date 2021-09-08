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
 this(Statement st) {
  array = st.break_down();
 }
 string[] mulret() {
  return array;
 }
 string Fat(int p)
 {
  return array[p];
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
 string statement = "NULL"; /* change: add current statement and do operations accordingly ? */
 ArrayState as;
 int current = 0; /* skip keyword */
 public:
  this(string stt) {
   statement = stt;
   as = new ArrayState(new Statement(stt));
  }
  void change_current(int num) {
   current = num;
  }
  string next() {
   return as.skip(current);
  }
  string current_word() {
   try {
   return as.mulret()[current];
   }
   catch (Exception e) {
    writeln("Something went out of range!");
    writeln("dont worry, this is a compiler error. Please submit an issue on github.");
    return "ERORR";
   }
  }
  string at(int pos) {
   try {
   return as.Fat(pos);
   } catch (Exception e) { writeln("stdin: ' '");  }
   return null;
  }
  string[] self() {
   return as.mulret();
  }
}

