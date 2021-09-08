//File for handling string operations

import std.stdio;


/* bring string[] into string */
string ISys_VJumble(string[] array)
{
 string news;
 foreach(string s; array) {
  news = news~s;
 }
 return news;
}

