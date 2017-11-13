
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)

@Suite.SuiteClasses({
	TestInsert.class,
	TestMember.class,
	TestSection.class,
	TestContains.class
})

public class SetTestSuite {
	
}
