class Token{
  var fp : int;
  var cl : int;

  //for clearance: 0 = Low, 1 = Medium and 2 = High
  method Init(fingerPrint : int, clearance : int)
  modifies this;
  requires 0 <= clearance <= 2;
  ensures fp == fingerPrint && cl == clearance;
  {
    fp := fingerPrint;
    cl := clearance;
  }

}
