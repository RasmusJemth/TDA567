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
  Q -> wp(S,R)

Q = {}
S = if(x>=0) then y:=x else y:=-x
R = (y >= 0) ∧ (x >= 0 ==> y == x) ∧ (x < 0 ==> y == -x)

{} -> wp(if(x>=0) then y:=x else y:=-x, (y >= 0) ∧ (x >= 0 ==> y == x) ∧ (x < 0 ==> y == -x))
	
    (Conditional rule)  ==> (x>=0 -> wp(y:=x, (y >= 0) ∧ (x >= 0 ==> y == x) ∧ (x < 0 ==> y == -x)
		∧ (x<0 -> wp(y:=-x, (y >= 0) ∧ (x >= 0 ==> y == x) ∧ (x < 0 ==> y == -x)

	==> (x>=0 -> wp(y:=x, (y >= 0) ∧ (x >= 0 ==> y == x) ∧
		∧ (x<0 -> wp(y:=-x, (y >= 0) ∧ (x < 0 ==> y == -x)

    (Assignment rule)  ==> (x>=0 -> x>=0 ∧ x==X) ∧ (x<0 -> -x >= 0 ∧ -x == -x)
 
		= true

*/

/*
  3.
  As no values are modified, a function is more suitable as they
  are the implementation of "pure methods".
*/
