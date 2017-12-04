predicate p2(a : seq<int>, b : seq<int>)
{
    forall i :: 0 < i < |a| ==> Count(a[i],a) == Count(a[i],b)
}

function Count(val : int, s : seq<int>) : int
{
  if |s| == 0 then 0 else
  if val == s[0] then Count(val, s[1..]) else Count(val, s[1..])
}

method Main()
{
    var s1 := [1,2,2,3,4];
    var s2 := [1,3,4,2,2];
    assert p2(s1,s2);
}
