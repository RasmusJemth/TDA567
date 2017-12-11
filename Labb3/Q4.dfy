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
