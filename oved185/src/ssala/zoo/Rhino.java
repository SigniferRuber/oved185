package ssala.zoo;

//questa mia classe estende la classe animale.

public class Rhino extends Animal {
//ci dà un problema perchè animal non ha un costruttore vuoto. Rhino non può essere costrutito. prima cerca di costruire se stesso, poi animal. devo costruire un costruttore che richiami animal.
	//public Rhino() {
		//super("Unnamed"); 
	//}
//resta solo la reference da animal. setta tutto in unnamed.se non vogliamo il rinocereonte senza nome:
	public Rhino(String name) {
		super(name);
	}
	
	@Override
	public String toString () {
		return"{Rhino" + getName() + "}";

	}
}