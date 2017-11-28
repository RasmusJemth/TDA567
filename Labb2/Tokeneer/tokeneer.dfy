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
  {
    fpSet := {};
  }

  method issueToken(fingerPrint : int, clearance : int) returns (t : Token)
  modifies this`fpSet;
  requires validClearance(clearance) && fingerPrint !in fpSet;
  ensures fingerPrint in fpSet;
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

  method tryOpenDoor(fingerPrint : int, t : Token)
  modifies this`alarm, this`doorOpen, t;
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

  method closeDoor()
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
