import java.util.Arrays;
import java.util.Random;

public class BinarySearch {
  
  /**
   * requires: - 'array' is not null.
   *           - the array is sorted by increasing value, i.e. for each index
   *             'i' and index 'j', if 'i' < 'j' then 'array[i]' < 'array[j]'.
   * ensures:  - if there is an index 'i' such that 'array[i] == value', the
   *             method returns true.
   *           - otherwise, it returns false.
   *           - in either case, 'array' is left unchanged.
   **/
  public static boolean search(int[] array, int value) {
    int left = 0;
    int right = array.length - 1;
    int counter = 0;
    while (left <= right) {
    	System.out.println("Run : " + counter + " left = " + left + " right : " + right);
    	counter++;
      int index = (right + left) / 2;
      if (array[index] == value)
        return true;
      if (array[index] > value)
        right = index - 1;
      else
        left = index + 1;
    }
    return false;

  }

  public static void main(String[] arg) {
    int[] array = {1,2,3,5,6,7,8};
    int value = 8 ;

    if (search(array,value))
       System.out.println("The value " + value + " is in the array.");
    else {
       System.out.println("The value " + value + " is not in the array.");
    }    
  }
}