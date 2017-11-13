import static org.junit.Assert.*;
import org.junit.Test;


public class TestMember {
	
	@Test
	public void test1() {
		Set s = new Set();
		s.insert(1);
		
		assertFalse(s.member(0));
	}
	
	@Test
	public void test2() {
		Set s = new Set();
		s.insert(1);
		
		assertTrue(s.member(1));
	}
	
	@Test
	public void test3() {
		Set s = new Set();
		s.insert(1);
		
		assertFalse(s.member(3));
	}
	

}
