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
    forall i :: 0 <= i < |a| ==> a[i] in b
}

method checkSeq(a : seq<int>, b : seq<int>) returns (b : bool)
{
  var bArr := array(b);
  var i := 0;
  while (i < |a|)
  {
    if(a[i] in bArr){
      var j := i;
        while (j <= |bArr|)
        {
          if (a[i] == bArr[j]){
          b := b[..j-1] + b[j-1..];
        } else {
          j := j + 1;
        }
      }
    }else {
      return false;
    }
    i := i + 1;
  }
    return true;
  }
}

function sort(a : array<int>)
modifies this.a;
requires a != null;
ensures sorted2(), p2(old(a), a);
{
}
