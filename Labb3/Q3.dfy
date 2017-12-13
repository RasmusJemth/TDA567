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


/*
3

Q -> wp(S,R)

Q = {}

S = {S1, S2, S3, S4}

R = res == n0*m0

	S1 = res:=0
	S2 = if(n0>=0) then n:=n0, m=m0
	S3 = else then n=-n0, m = -m0
	S4 = the while loop

Q -> wp(s1; S2; S3; S4, R) = 
  (By Sequential rule) = wp(S1, wp(S2, wp(S3, wp(S4, R))))

	B = n>0
	I = m0*n0 == res + m*n
	S = res:=res + m, n:= n-1


wp(S4, R) = wp(while B I S, R)
	
= I
  && (B && I ==> wp(S,I))
  && (!B && I ==> R)

= m0*n0 == res + m*n
  && (n>0 && m0*n0 == res + m*n ==> wp(S,I))
  && (n<=0 && m0*n0 == res + m*n ==> res == n0*m0)


	wp(S,I) = wp(res:=res + m; n:= n-1, m0*n0 == res + m*n)
	
		(With assignment rule) = wp(m0*n0 == (res+m) + m*(n-1))
		
		= wp(m0*n0 == res + m + m*n - m) = wp(m0*n0 == res + m*n) = m0*n0 == res + m*n
	

1) = m0*n0 == res + m*n 
2)  && (n>0 && m0*n0 == res + m*n ==> m0*n0 == res + m*n)
3)  && (n<=0 && m0*n0 == res + m*n ==> res == n0*m0) 

1 & 2 is true if "m0*n0 == res + m*n" is true"

3) (n<=0 && m0*n0 == res + m*n ==> res == n0*m0)

		(m0*n0 == res + m*n ==> res == n0*m0) = m*n = 0
3) (n<=0 && m*n==0)

wp(S4, R) = m0*n0 == res + m*n && (n<=0 ==>m*n==0)




wp(S1; S2; S3, wp(m0*n0 == res + m*n && (n<=0 ==>m*n==0))

(Apply conditional rule)

wp(res:=0, (n0>0 ==> wp(n:=n0, m=m0, m0*n0 == res + m*n && (n<=0 ==>m*n==0))
	&& (n0<=0 ==> wp(n=-n0, m = -m0, m0*n0 == res + m*n && (n<=0 ==>m*n==0)))

(Assignment rule)

=wp(res:=0, (n0>0 ==> wp(m0*n0 == 0 + m0*n0 && (n0<=0 ==>m0*n0==0))
	&& (n0<=0 ==> wp(m0*n0 == 0 + -m0*-n0 && (-n0<=0 ==>-m0*-n0==0)))


=wp((n0>=0 ==> wp(n0<=0 ==>m0*n0==0))
	&& (n0<=0 ==> wp(n0<=0 ==>-m0*-n0==0)))


=wp((n0>=0 ==> n0<=0 ==>m0*n0==0)
	&& (n0<=0 ==> n0<=0 ==>-m0*-n0==0))

=wp((n==0 ==>m0*n0==0)
	&& (n0<=0 ==>-m0*-n0==0))

=wp((true)
	&& (n0<=0 ==>-m0*-n0==0))

= n0<=0 ==> -m0*-n0==0

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
