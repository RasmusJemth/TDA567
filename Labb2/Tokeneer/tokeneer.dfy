class Token{
  var fp : int;
  var cl : int;

  //for clearance: 0 = Low, 1 = Medium and 2 = High
  //should -1 = invalid
  method Init(fingerPrint : int, clearance : int)
  modifies this;
  requires validClearance(clearance);
  ensures fp == fingerPrint && cl == clearance;
  {
    fp := fingerPrint;
    cl := clearance;
  }
  method InvalidateToken()
  modifies this`cl;
  requires this != null;
  ensures cl == -1;
  {
    cl := -1;
  }
  //Method to change clearance level?
}

class EnrollmentStn {
  var fpSet : set<int>;

  method Init()
  modifies this;
  //ensures fresh(fpSet);
  ensures fpSet == {};
  {
    fpSet := {};
  }

  method IssueToken(fingerPrint : int, clearance : int) returns (t : Token)
  modifies this`fpSet;
  requires validClearance(clearance)
  requires fingerPrint !in fpSet;
  ensures fingerPrint in fpSet && t != null;
  ensures fresh (t);
  {
    t := new Token;
    t.Init(fingerPrint, clearance);
    fpSet := fpSet + {fingerPrint};
    return t;
  }
}
class IDStn {
  var clearanceLevel : int;
  var alarm : bool;
  var doorOpen : bool;

  method Init(clearance : int)
  modifies this;
  requires validClearance(clearance);
  ensures clearanceLevel == clearance && alarm == false && doorOpen == false;
  {
    clearanceLevel := clearance;
    alarm := false;
    doorOpen := false;
  }

  method TryOpenDoor(fingerPrint : int, t : Token)
  modifies this`alarm, this`doorOpen, t`cl;
  requires t != null;
  ensures alarm == true || doorOpen == true; //implement xor?
  {
    if(t.fp != fingerPrint || t.cl < clearanceLevel){
      t.InvalidateToken();
      alarm := true;
    } else {
      doorOpen := true;
    }
  }

  method CloseDoor()
  modifies this`doorOpen;
  ensures doorOpen == false;
  {
    doorOpen := false;
  }
}

predicate validClearance(clearance : int)
{
   0 <= clearance <= 2
}

method TestMain()
{
  //test case 1
  var enrStn := new EnrollmentStn;
  enrStn.Init();

  var idStn := new IDStn;
  idStn.Init(0);

  var t1 := enrStn.IssueToken(1,2);

  idStn.TryOpenDoor(1, t1);
  assert idStn.doorOpen;

}
