package ssala.zoo;//creo il mio rhino bob e valuto che si chiami proprio così
//mi creo il rinoceronte, tipo bob, e verificare che bob sia stato creato e che si chiami proprio cosi


import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class RhinoTest {

	@Test
	void bobTsBob() {
		Rhino bob = new Rhino("bob");
		assertEquals("bob", bob.getName());
	}

}
