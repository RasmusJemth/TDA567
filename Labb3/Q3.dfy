/*
1.
Because we can't modify the input parameters inside the method body.
*/

/*
2.
The method multiplies the parameters and returns the result.
So adding the post-condition "ensures n0 * m0 == res;" ensures
that the return value is the product of m0 and n0.
*/

method Q3(n0 : int, m0 : int) returns (res : int)
  ensures res == m0 * n0;
{
  var n, m : int;
  res := 0;
  if (n0 >= 0)
       {n,m := n0, m0;}
  else
       {n,m := -n0, -m0;}
  while (0 < n)
  decreases n
  invariant m0 * n0 == res + (m * n);
  {
    res := res + m;
    n := n - 1;
  }
}
