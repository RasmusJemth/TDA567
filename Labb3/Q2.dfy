/*
Question 1
The program failed to verify as x and y can be equal and then
big and small will also be equal which is not allowed by the
post-condition.
*/

/*
Question 2
BEVIS HÄR
*/

/*
Fixing the program
The program can either be fixed by a pre-condition such as:
requires x > y || y > x;
or by simply chaning the post-condition to allow for big and small
to be equal.
If we're allowed to change the method we can simply add another if
and set the values to something arbitrary as this doesn't violate
the post-condition.
*/
//Fixed by pre-condition - Question 1
method Q2(x : int, y : int) returns (big : int, small : int)
  requires x > y || y > x;
  ensures big > small;
{
  if (x > y)
   {big, small := x, y;}
  else
   {big, small := y, x;}
}
//Fixed by post-condition - Question 2
method Q2(x : int, y : int) returns (big : int, small : int)
  ensures big >= small;
{
  if (x > y)
   {big, small := x, y;}
  else
   {big, small := y, x;}
}
//Fixed by method - Bonus Question
method Q2(x : int, y : int) returns (big : int, small : int)
  ensures big >= small;
{
  if (x == y)
  {big, small := 1, 0;}
  else{
    if (x > y)
      {big, small := x, y;}
      else
      {big, small := y, x;}
    }
}
/*
Additional post-conditions should be added to ensure that the
values of big and small actually come from the parameters x and y.
*/
method Q2(x : int, y : int) returns (big : int, small : int)
  requires x > y || y > x;
  ensures big > small;
  ensures x > y ==> big == x && small == y;
  ensures x < y ==> big == y && small == x;
{
  if (x > y)
   {big, small := x, y;}
  else
   {big, small := y, x;}
}
