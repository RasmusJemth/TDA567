import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class TestAddWorkingPeriod {
	
	WorkSchedule ws = new WorkSchedule(10);
	String e1 = "A";
	String e2 = "B";
	
	//Covers bordercase 2
	@Test
	public void testStarttimeNegative() {
		
		ws.setRequiredNumber(3, 0, 9);
		
		
		assertFalse(ws.addWorkingPeriod(e1, -1, 5));
		
		WorkSchedule tmp = new WorkSchedule(10);
		tmp.setRequiredNumber(3, 0, 9);
		assertArrayEquals(ws.workingEmployees(0, 9), tmp.workingEmployees(0, 9));
		
	}
	
	//Covers bordercase 4
	@Test
	public void testEndtimeEqualsSize() {
		ws.setRequiredNumber(3, 0, 9);
		
		assertFalse(ws.addWorkingPeriod(e1, 1, 10));
		
		WorkSchedule tmp = new WorkSchedule(10);
		tmp.setRequiredNumber(3, 0, 9);
		assertArrayEquals(ws.workingEmployees(0, 9), tmp.workingEmployees(0, 9));
	}
	
	//Covers bordercase 6
	@Test
	public void testStarttimeBiggerThanEndtime() {
		ws.setRequiredNumber(1, 0, 9);
		
		assertFalse(ws.addWorkingPeriod(e1, 5, 4));
		
		WorkSchedule tmp = new WorkSchedule(10);
		tmp.setRequiredNumber(3, 0, 9);
		assertArrayEquals(ws.workingEmployees(0, 9), tmp.workingEmployees(0, 9));
	}
	
	//Covers border 8
	@Test
	public void testWorkingEmployeesEqualsRequiredNumber() {
		ws.setRequiredNumber(1, 0, 9);
		
		assertTrue(ws.addWorkingPeriod(e1, 0, 2));
		assertFalse(ws.addWorkingPeriod(e2, 0, 2));
		
		WorkSchedule tmp = new WorkSchedule(10);
		tmp.setRequiredNumber(3, 0, 9);
		tmp.addWorkingPeriod(e1, 0, 2);
		assertArrayEquals(ws.workingEmployees(0, 9), tmp.workingEmployees(0, 9));
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
		
		WorkSchedule tmp = new WorkSchedule(10);
		tmp.setRequiredNumber(3, 0, 9);
		tmp.addWorkingPeriod(e1, 0, 4);
		assertArrayEquals(ws.workingEmployees(0, 9), tmp.workingEmployees(0, 9));
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
		assertTrue(ws.addWorkingPeriod(e1, 2, 4)); 
	}
	
	@Test
	public void border10() {
		ws.setRequiredNumber(2, 0, 4);
		assertTrue(ws.addWorkingPeriod(e1, 0, 2));
		assertFalse(ws.addWorkingPeriod(e1, 1, 4));
		
		WorkSchedule tmp = new WorkSchedule(10);
		tmp.setRequiredNumber(3, 0, 9);
		tmp.addWorkingPeriod(e1, 0, 2);
		assertArrayEquals(ws.workingEmployees(0, 9), tmp.workingEmployees(0, 9));
	}
	
	
}
