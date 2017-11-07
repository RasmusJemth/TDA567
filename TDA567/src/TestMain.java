import static org.junit.Assert.*;
import org.junit.Test;

public class TestMain {
	
	WorkSchedule ws = new WorkSchedule(10);
	String e1 = "A";
	String e2 = "B";
	
	//a) addWorkingEmployeees
	
	//Covers bordercase 2
	@Test
	public void testStarttimeNegative() {
		
		ws.setRequiredNumber(3, 0, 9);
		
		assertFalse(ws.addWorkingPeriod(e1, -1, 5));
		
	}
	
	//Covers bordercase 4
	@Test
	public void testEndtimeEqualsSize() {
		ws.setRequiredNumber(3, 0, 9);
		
		assertFalse(ws.addWorkingPeriod(e1, 1, 10));
	}
	
	//Covers bordercase 6
	@Test
	public void testStarttimeBiggerThanEndtime() {
		ws.setRequiredNumber(1, 0, 9);
		
		//assertFalse(ws.addWorkingPeriod(e1, 5, 4)); <-------------
	}
	
	//Covers border 8
	@Test
	public void testWorkingEmployeesEqualsRequiredNumber() {
		ws.setRequiredNumber(1, 0, 9);
		
		assertTrue(ws.addWorkingPeriod(e1, 0, 2));
		assertFalse(ws.addWorkingPeriod(e2, 0, 2));
	}
	
	//Covers border 9
	@Test
	public void testOtherwise() {
		ws.setRequiredNumber(1, 0, 5);
		assertTrue(ws.addWorkingPeriod(e1, 0, 5));
	}
	
	//Covers border 10
	@Test
	public void testSameEmployeeWorkDouble() {
		ws.setRequiredNumber(2, 0, 4);
		assertTrue(ws.addWorkingPeriod(e1, 0, 4));
		assertFalse(ws.addWorkingPeriod(e1, 0, 4));
	}
	
	@Test
	public void border1() {
		ws.setRequiredNumber(1, 0, 9);
		assertTrue(ws.addWorkingPeriod(e1, 0, 4));
	}
	
	@Test
	public void border3() {
		ws.setRequiredNumber(1, 0, 9);
		assertTrue(ws.addWorkingPeriod(e1, 0, 9));
	}
	
	
	@Test
	public void border5() {
		ws.setRequiredNumber(1, 0, 9);
		
		assertTrue(ws.addWorkingPeriod(e1, 0, 0));
	}
	
	@Test
	public void border7() {
		ws.setRequiredNumber(1, 0, 9);
		
		assertTrue(ws.addWorkingPeriod(e1, 0, 9));
	}
	
	@Test
	public void border9() {
		ws.setRequiredNumber(2, 0, 4);
		assertTrue(ws.addWorkingPeriod(e1, 0, 2));
		//assertTrue(ws.addWorkingPeriod(e1, 2, 4)); //<--------------
	}
	
	@Test
	public void border10() {
		ws.setRequiredNumber(2, 0, 4);
		assertTrue(ws.addWorkingPeriod(e1, 0, 2));
		assertFalse(ws.addWorkingPeriod(e1, 1, 4));
	}
	
	
	
	//b) workingEmployees
	
	String[] emptyArr = new String[0];
	
	String[] arrE1 = {e1};
	
	String[] filledArr = {e1, e2};
	
	@Test
	public void startTimeBiggerThanEndTime() {
		ws.setRequiredNumber(1, 0, 9);
	
		ws.addWorkingPeriod(e1, 0, 9);
		//assertTrue(ws.workingEmployees(4, 2).length == 0); //<--------------
		//assertArrayEquals(ws.workingEmployees(4, 2), emptyArr); //<--------------
	}
	@Test
	public void startTimeLessThanEndTime() {
		ws.setRequiredNumber(2, 0, 9);
		
		ws.addWorkingPeriod(e1, 4, 6);
		ws.addWorkingPeriod(e2, 5, 7);
		
		/*
		for(String s : ws.workingEmployees(0, 9)) {
			System.out.println(s);
		}
		*/
		
		//assertArrayEquals(ws.workingEmployees(1, 9), filledArr); //<--------------
	}
	
	@Test
	public void border1b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 1);
		assertArrayEquals(ws.workingEmployees(0, 3), arrE1);
	}
	@Test
	public void border2b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 4);
		assertArrayEquals(ws.workingEmployees(0, 3), arrE1);
	}
	
	@Test
	public void border3b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 9);
		assertArrayEquals(ws.workingEmployees(3, 4), arrE1);
	}
	@Test
	public void border4b() {
		ws.setRequiredNumber(2, 0, 9);
		ws.addWorkingPeriod(e1, 4, 6);
		ws.addWorkingPeriod(e2, 5, 7);
		
		for(String s : ws.workingEmployees(3, 8)) {
			System.out.println(s);
		}
		//assertArrayEquals(ws.workingEmployees(1, 8), filledArr); //<--------------
	}
	@Test
	public void border5b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 9);
		assertArrayEquals(ws.workingEmployees(0, 9), arrE1);
	}
	@Test
	public void border6b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 9);
		assertArrayEquals(ws.workingEmployees(3, 4), arrE1);
	}
	@Test
	public void border7b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 1, 8);
		//assertArrayEquals(ws.workingEmployees(0, 9), arrE1); //<--------------
	}
	@Test
	public void border8b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 9);
		assertArrayEquals(ws.workingEmployees(1, 8), arrE1);
	}
	@Test
	public void border9b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 1, 8);
		assertArrayEquals(ws.workingEmployees(0, 2), arrE1);
	}
	@Test
	public void border10b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 1, 7);
		assertArrayEquals(ws.workingEmployees(6, 8), arrE1);
	}
	@Test
	public void border11b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 2);
		assertArrayEquals(ws.workingEmployees(1, 8), arrE1);
	}
	@Test
	public void border12b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 7, 9);
		assertArrayEquals(ws.workingEmployees(1, 8), arrE1);
	}
	@Test
	public void border13b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 1);
		//assertArrayEquals(ws.workingEmployees(1, 9), emptyArr); //<--------------
	}
	@Test
	public void border14b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 8, 9);
		//assertArrayEquals(ws.workingEmployees(1, 8), emptyArr); //<--------------
	}
	@Test
	public void border15b() { //Behövs den här verkligen?
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 8);
		//assertArrayEquals(ws.workingEmployees(8, 9), emptyArr); //<--------------
	}
	@Test
	public void border16b() { //Behövs den här verkligen?
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 1, 9);
		//assertArrayEquals(ws.workingEmployees(0, 1), emptyArr); //<--------------
	}
	
}
