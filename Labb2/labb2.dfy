// A LIFO queue (aka a stack) with limited capacity.
class LimitedStack{

      var capacity : int; // capacity, max number of elements allowed on the stack.
      var arr : array<int>; // contents of stack.
      var top : int; // The index of the top of the stack, or -1 if the stack is empty

      // This predicate express a class invariant: All objects of this calls should satisfy this.
    predicate Valid() //arr : array<int>, top : int, capacity : int
      //requires arr != null
      reads this; // Does this mean it reads all the variables?
      {
        /*
          arr != null &&
          forall capacity : int :: capacity > 0 &&
		      forall capacity : int :: arr.Length == capacity &&
		      forall top : int, capacity : int :: top >= -1 && top < capacity
        */
        arr != null && capacity > 0 && arr.Length == capacity
        && top >= -1 && top < capacity
      }

      predicate Empty() //top : int
      reads this; // Should this be "this"?
      {
        //forall top : int :: top == -1
        top == -1
      }

      predicate method Full() //top : int, capacity : int
      reads this; // Should this be "this"?
      {
        //forall top : int, capacity : int :: top == capacity - 1
        top >= (capacity-1)
      }

      predicate NotFull()
      reads this;
      {
        top != capacity -1
      }

      method Init(c : int)
        modifies this;
        requires c > 0
        ensures fresh(arr); // ensures arr is a newly created object.
        // Additional post-condition to be given here!
        ensures Valid(); //arr, top, c
        ensures Empty() && capacity == c; //top
        {
          capacity := c;
          arr := new int[c];
          top := -1;
      }

      method isEmpty() returns (res : bool)
      //reads this.top;
      {
        //var res : bool;
        //^ måste tydligen inte deklarera variabler om de står som returns
        //Får inte använda predicate i metoder, bara i specification
        res := (top == -1); //top
      }



      // Returns the top element of the stack, without removing it.
      method Peek() returns (elem : int)
      //reads this.arr, this.top;
      requires Valid() && !Empty(); //arr, top, capacity
      {
        //var elem : int;
        //^ måste tydligen inte deklarera variabler om de står som returns
        elem := arr[top];
      }



      // Pushed an element to the top of a (non full) stack.
      method Push(elem : int)
      //reads this.arr, this.top, this.capacity;
      //Should we put this as an ensures or in an if?
      modifies this`top, this.arr;
      requires !Full(); //&& Valid();
      //requires top != capacity - 1; //<-- this works for some reason
      //requires NotFull();
      requires Valid(); //top, capacity && arr, top, capacity
      ensures Valid() && !Empty() && arr[top] == elem && top == old(top) + 1;
      //ensures Valid() && !Empty();
      {
        //var booly := Full();
        //print booly;
       //if !Full(){ //or as an if
          top := top + 1;
          arr[top] := elem;
        //}
      }

      // Pops the top element off the stack.
      method Pop() returns (elem : int)
      //reads this.arr, this.top;
      modifies this`top, this.arr;
      requires !Empty() && Valid(); //top && arr, top, capacity
      ensures Valid() && top == old(top) - 1 && elem == old(arr[top]); //arr, top, capacity
      {
        //var elem : int;
        elem := arr[top];
        top := top - 1;
        print top;
      }

      method Shift()
      requires Valid() && !Empty() //arr, top, capacity && top
      ensures Valid(); //arr, top, capacity
      ensures forall i : int :: 0 <= i < capacity - 1 ==> arr[i] == old(arr[i + 1]);
      ensures top == old(top) - 1;
      modifies this.arr, this`top;
      {
        var i : int := 0;
        while (i < capacity - 1 )
        invariant 0 <= i < capacity;
        invariant top == old(top);
        invariant forall j : int :: 0 <= j < i ==> arr[j] == old(arr[j + 1]);
        invariant forall j : int :: i <= j < capacity ==> arr[j] == old(arr[j]);
        {
          arr[i] := arr[i + 1];
          i := i + 1;
        }
        top := top - 1;
      }


      //Push onto full stack, oldest element is discarded.
      method Push2(elem : int)
      //reads this.arr, this.top, this.capacity;
      modifies this.arr, this`top;
      requires Valid(); //arr, top, capacity
      ensures Valid() /*&& arr[top-1] == elem*/; //arr, top, capacity
      {
        if Full() //top, capacity
        {
          Shift();
        }
        Push(elem);
      }

      //FOR TESTING
      method getTop() returns (topRet : int)
      {
        topRet := top;
      }


// When you are finished,  all the below assertions should be provable.
// Feel free to add extra ones as well.
      method Main(){
           var s := new LimitedStack;
           s.Init(3);
                var whyyyyyyy := s.getTop();
                print whyyyyyyy;
           assert s.Empty() && !s.Full();
                var why := s.getTop();
                print why;
           s.Push(27);
           assert !s.Empty();
                var fuckThisFuckingShit := s.getTop();
                print fuckThisFuckingShit;
           var e := s.Pop();
           print e;
           assert e == 27;
                var p := s.getTop();
                print p;

           s.Push(5);
           var p1 := s.getTop();
           print p1;
 /*
           s.Push(32);
           s.Push(9);
           assert s.Full();

           var e2 := s.Pop();
           assert e2 == 9 && !s.Full();
           assert s.arr[0] == 5;

           s.Push(e2);
           s.Push2(99);

           var e3 := s.Peek();
           assert e3 == 99;
           assert s.arr[0] == 32;
           */
       }
}
