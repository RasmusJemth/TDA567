
//1a
predicate sorted(s: seq<int>)
{
    forall i, j :: 0 <= j < i < |s| ==> s[i] >= s[j]
}

//1b
predicate sorted2(s: seq<int>)
{
    forall i :: 1 <= i < |s| ==> s[i] >= s[i-1]
}

//2a
ghost method equivalentSort(s : seq<int>)
requires sorted(s)
ensures sorted2(s)
{
}

/*
//2a, Dafny does not manage to prove this lemma
ghost method equivalentSort2(s : seq<int>)
requires sorted2(s)
ensures sorted(s)
{
}
*/


predicate p(a : seq<int>, b : seq<int>)
{
   multiset(a) == multiset(b)
}

//3b
predicate p2(a : seq<int>, b : seq<int>)
{
    forall i :: 0 < i < |a| ==> Count(a[i],a) == Count(a[i],b)
}
//3b
function Count(val : int, s : seq<int>) : int
{
  if |s| == 0 then 0 else
  if val == s[0] then 1 + Count(val, s[1..]) else Count(val, s[1..])
}

//4a
method sort(a : array<int>)
modifies a;
requires a != null;
ensures sorted2(a[..]) && p(old(a)[..], a[..]);
{
}
/*
//4b, does not work
method sort2(a : array<int>)
modifies a;
requires a != null && a.Length >= 2;
ensures sorted2(a[..]);
{
  var i := a.Length - 1;
  while (i >= 0)
  decreases i
 {
     a[i] := i;
     i := i - 1;
 }
}
*/
