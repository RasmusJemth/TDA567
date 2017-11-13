import static org.junit.Assert.*;
import org.junit.Test;


public class TestInsert {
	
	@Test
	public void test1() {
		Set s = new Set();
		s.insert(2);
		s.insert(3);
		s.insert(4);
		
		s.insert(1);
		
		int[] expected = {1,2,3,4};
		
		assertArrayEquals(s.toArray(), expected);
	}
	@Test
	public void test2() {
		Set s = new Set();
		s.insert(1);
		s.insert(2);
		s.insert(3);
		
		s.insert(1);
		
		int[] expected = {1,2,3};
		
		assertArrayEquals(s.toArray(), expected);
	}
	
	@Test
	public void test3() {
		Set s = new Set();
		s.insert(1);
		
		s.insert(9);
		
		int[] expected = {1,9};
		
		assertArrayEquals(s.toArray(), expected);
	}

}
