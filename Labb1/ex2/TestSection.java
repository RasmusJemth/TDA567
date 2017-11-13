import static org.junit.Assert.*;
import org.junit.Test;

public class TestSection {

	@Test
	public void test1() {
		Set s1 = new Set();
		Set s2 = new Set();
		s1.insert(1);
		s2.insert(1);
		
		int[] arr = {};
		
		s1.section(s2);
		
		assertArrayEquals(s1.toArray(), arr);
	}
	
	@Test
	public void test2() {
		Set s1 = new Set();
		Set s2 = new Set();
		s1.insert(1);
		s2.insert(2);
		
		s1.section(s2);
		int[] arr = {1};
		
		assertArrayEquals(s1.toArray(), arr);
	}
	
	@Test
	public void test3() {
		Set s1 = new Set();
		Set s2 = new Set();
		s1.insert(2);
		s2.insert(1);
		
		s1.section(s2);
		int[] arr = {2};
		
		assertArrayEquals(s1.toArray(), arr);
	}
	
}
