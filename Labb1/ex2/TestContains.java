import static org.junit.Assert.*;
import org.junit.Test;

public class TestContains {

	@Test
	public void test1() {
		Set s = new Set();
		s.insert(1);
		s.insert(2);
		s.insert(4);
		
		assertFalse(s.containsArithTriple());
	}
	
	@Test
	public void test2() {
		Set s = new Set();
		
		assertFalse(s.containsArithTriple());
	}
	
	@Test 
	public void test3(){
		Set s = new Set();
		s.insert(3);
		s.insert(4);
		s.insert(5);
		
		assertTrue(s.containsArithTriple());
	}
	
}
