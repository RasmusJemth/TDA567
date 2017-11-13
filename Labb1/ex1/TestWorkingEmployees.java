import static org.junit.Assert.*;
import org.junit.Test;

public class TestWorkingEmployees {

	WorkSchedule ws = new WorkSchedule(10);
	String e1 = "A";
	String e2 = "B";
	
	String[] emptyArr = new String[0];
	
	String[] arrE1 = {e1};
	
	String[] filledArr = {e1, e2};
	
	@Test
	public void partion1b() {
		ws.setRequiredNumber(1, 0, 9);
	
		ws.addWorkingPeriod(e1, 0, 9);
		assertArrayEquals(ws.workingEmployees(4, 2), emptyArr); 
	}
	@Test
	public void partion2b1() {
		ws.setRequiredNumber(2, 0, 9);
		
		ws.addWorkingPeriod(e1, 0, 4);
		
		assertArrayEquals(ws.workingEmployees(0, 9), arrE1);
	}
	@Test
	public void partion2b2() {
		ws.setRequiredNumber(2, 0, 9);
		
		ws.addWorkingPeriod(e1, 0, 9);
		ws.addWorkingPeriod(e2, 0, 5);
		
		assertArrayEquals(ws.workingEmployees(0, 9), filledArr);
		
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
		ws.setRequiredNumber(2, 0, 9);
		ws.addWorkingPeriod(e1, 2, 7);
		
		assertArrayEquals(ws.workingEmployees(1, 8), arrE1);
	}
	@Test
	public void border4b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 9);
		assertArrayEquals(ws.workingEmployees(0, 9), arrE1);
	}
	@Test
	public void border5b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 9);
		assertArrayEquals(ws.workingEmployees(1, 8), arrE1);
	}
	
	@Test
	public void border6b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 1, 8);
		assertArrayEquals(ws.workingEmployees(0, 2), arrE1);
	}
	@Test
	public void border7b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 1, 7);
		assertArrayEquals(ws.workingEmployees(6, 8), arrE1);
	}
	@Test
	public void border8b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 2);
		assertArrayEquals(ws.workingEmployees(1, 8), arrE1);
	}
	@Test
	public void border9b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 7, 9);
		assertArrayEquals(ws.workingEmployees(1, 8), arrE1);
	}
	@Test
	public void border10b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 0, 1);
		assertArrayEquals(ws.workingEmployees(1, 9), emptyArr);
	}
	@Test
	public void border11b() {
		ws.setRequiredNumber(1, 0, 9);
		ws.addWorkingPeriod(e1, 8, 9);
		assertArrayEquals(ws.workingEmployees(1, 8), emptyArr);
	}
	
	
}
