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

// so wrong
predicate p2(a : seq<int>, b : seq<int>)
{
    forall i :: 0 <= i < |a| ==> a[i] in b
}

method checkSeq(a : seq<int>, b : seq<int>) returns (equal : bool)
{
  var bArr : array<int>;
  bArr := new int[|b|];
  var i := |b| - 1;
  while (i >= 0)
    decreases i
    {
      bArr[i] := b[i];
      i := i - 1;
    }
  var j := |a| - 1;
  while (j < |a|)
  decreases j
  {
    if a[j] in bArr{
      //leta reda på elementet i bArr, ta bort det och skriv över bArr
    } else {
      return false;
    }
  }
  return true;
}

method findLargestVal(a : seq<int>) returns (val : int)
requires |a| >= 1;
//ensures val in a; //Kompilatorn säger att det här kanske inte håller
{
  var i := |a| - 1;
  val := a[0];
  while (i >= 1)
  decreases i
  {
    if (a[i] > val) {val := a[i];}
    i := i - 1 ;
  }
}

method p3(a : seq<int>, b : seq<int>) returns (equal : bool)
{
  var aLen := findLargestVal(a);
  var bLen :=findLargestVal(b);
  var aArr := new int[aLen];
  var bArr := new int[bLen];
  if(|a| != |b|) {return false;}
  var i := |a| - 1;
  while (i >= 0)
  decreases i
  {
    aArr[a[i]] := aArr[a[i]] + 1;
    bArr[b[i]] := bArr[b[i]] + 1;
  }
  return (aArr == bArr);
}


function sort(a : array<int>)
modifies this.a;
requires a != null;
ensures sorted2(), p2(old(a), a);
{
}
