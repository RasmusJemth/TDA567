/*
  1.
  Based on the post-conditions the method is valid for all values
  of x, hence a pre-condition isn't needed.
*/

method Abs(x : int) returns (y : int)
  // return value doesn't deviate from intended value
  ensures 0 <= x ==> y == x;
  ensures x < 0 ==> y == -x;
   // return value is greater or equal to zero
  ensures 0 <= y;
{
  if (x < 0)
   { y := -x; }
  else
   { y := x; }
}

/*
  2.

*/

/*
  3.
  As no values are modified, a function is more suitable as they
  are the implementation of "pure methods".
*/
