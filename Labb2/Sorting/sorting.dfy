predicate sorted(s: seq<int>)
{
    forall i, j :: 0 <= j < i < |s| ==> s[i] >= s[j]
}

predicate sorted2(s: seq<int>)
{
    forall i :: 1 <= i < |s| ==> s[i] >= s[i-1]
}

ghost method equivalentSort(s : seq<int>)
requires sorted(s)
ensures sorted2(s)
{
}

ghost method equivalentSort2(s : seq<int>)
requires sorted2(s)
ensures sorted(s)
{
}

predicate p(a : seq<int>, b : seq<int>)
{
   multiset(a) == multiset(b)
}

predicate p2(a : seq<int>, b : seq<int>)
{
    forall i :: 0 < i < |a| ==> Count(a[i],a) == Count(a[i],b)
}

function Count(val : int, s : seq<int>) : int
{
  if |s| == 0 then 0 else
  if val == s[0] then Count(val, s[1..]) else Count(val, s[1..])
}

method sort(a : array<int>)
modifies a;
requires a != null;
ensures sorted2(a[..]) && p(old(a)[..], a[..]);
{
}

method sort2(a : array<int>)
modifies a;
requires a != null;
ensures sorted2(a[..]);
{
  //Implement sorting algorithm that removes duplicates
}
