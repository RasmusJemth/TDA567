method ComputeFact(n : nat) returns (res : nat)
  requires n > 0;
  ensures res == fact(n);
 {
  res := 1;
  var i := 2;
  while (i <= n)
  decreases (n-i)
  invariant 2 <= i <= n+1
  invariant res == fact(i-1)
  {
    res := res * i;
    i := i + 1;
  }
 }

 function fact(m : nat) : nat {
    if m <= 1 then 1 else m * fact(m - 1)
 }

/*
S1 = res := 1, S2 = i := 2, S3 = res := res * i, S4 = i := i + 1
R = res == fact(n), B = i <= n, D = (n-1),
I = 2 <= i <= n+1 && res == fact(i-1)
L = while (B I D (S3; S4), R)

Q -> wp(S1; S2; L; R)
by sequence rule
Q -> wp(S1, wp(S2, wp(L,R)))

wp(L,R) =
2 <= i <= n+1 && res == fact(i-1)
&& (i <= n && 2 <= i <= n+1 && res == fact(i-1)) ==> wp(S3; S4, 2 <= i <= n+1 && res == fact(i-1))
&& (i > n && 2 <= i <= n+1 && res == fact(i-1)) ==> res == fact(n)

for the last row
(i > n && 2 <= i <= n+1 && res == fact(i-1)) ==> res == fact(n)
as i > n and i > n && 2 <= i <= n+1, i has to be exactly n+1 hence we can write
(i == n+1 && res == fact(i-1)) ==> res == fact(n)
by assignment of i we get
res == fact((n + 1) -1) ==> res == fact(n)
which is equal to
res == fact(n) ==> res == fact(n)
which is trivially true for all n.

for the middle row
i <= n && 2 <= i <= n+1 && res == fact(i-1)) ==> wp(S3; S4, 2 <= i <= n+1 && res == fact(i-1)

we simplify the wp()-part of the middle row
wp(S3; S4, 2 <= i <= n+1 && res == fact(i-1)
is equal to
wp(res := res * i; i := i + 1, 2 <= i <= n+1 && res == fact(i-1))
by assignment rule
wp(res := res * i, 2 <= i+1 <= n+1 && res == fact((i+1)-1))
by arithmetics
wp(res := res * i, 1 <= i <= n && res == fact(i))
by assignment rule
1 <= i <= n && res * i == fact(i)
by arithmetics
1 <= i <= n && res == fact(i) / i
by arithmetics
1 <= i <= n && res == fact(i-1)

The middle row becomes
i <= n && 2 <= i <= n+1 && res == fact(i-1) ==> 1 <= i <= n && res == fact(i-1)
we can combine
i <= n && 2 <= i <= n+1
into
2 <= i <= n
which gives
2 <= i <= n && res == fact(i-1) ==> 1 <= i <= n && res == fact(i-1)
this is also trivially true, if n is within the bounds of 2 <= i <= n it's also inside the
bounds 1 <= i <= n and the res == fact(i-1) exists in both sides of the implication hence is true
at the same time.

wp(L,R) can as such be simplified into only the top row
wp(l,R) = 2 <= i <= n+1 && res == fact(i-1)

we now have
Q -> wp(S1, wp(S2, 2 <= i <= n+1 && res == fact(i-1)))

We simplify wp(S2, 2 <= i <= n+1 && res == fact(i-1))
wp(i := 2, 2 <= i <= n+1 && res == fact(i-1))
by assignment rule
2 <= 2 <= n+1 && res == fact(2-1)
the first part is always true and we're left with
res == fact(1)

Hence we now have
Q -> wp(res := 1, res == fact(1))
by assignment rule
Q -> 1 == fact(1)
which is always true.

Because Q is always true, the weakest precondition is {}.
*/
