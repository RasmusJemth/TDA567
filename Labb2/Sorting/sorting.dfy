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
    sortArray(a) == sortArray(b)
}

method SortArray(a : seq<int>) returns (aArr : array<int>)
{
  var i := |a| - 1;
  aArr := new int[|a|];
  while(i >= 0)
  decreases i
  {
    aArr[i] := a[i];
    i := i - 1;
  }
  var j, max;
  i := j;
  while(i > 0)
  decreases i
  {
    j := i - 1;
    max := i;
    while(j >= 0)
    decreases j
    {
      if (aArr[max] < aArr[j]){
        max := j;
      }
      j := j - 1;
    }
    var tempInt := aArr[i];
    aArr[i] := aArr[max];
    aArr[max] := tempInt;
    i := i - 1;
  }
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
