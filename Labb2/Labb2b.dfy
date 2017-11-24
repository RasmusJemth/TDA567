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
