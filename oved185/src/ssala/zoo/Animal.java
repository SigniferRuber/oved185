package ssala.zoo;
//classe astratta: non lo posso testare
public abstract class Animal {//basta astratta per dirle chenon è implementabile.
	//nome privato o protetto?? privato, nessuno lo può usare
	
	private String name;
	
	//costruttore di default? non ha senso creare un animale senza nome.
	public Animal(String name) {
		this.name =name; //il nome di questo ogetto(property name) deve prendere come riferimento il nome che sto passando come parametro
	}
	
	
	public String getName() {
		return name;
	}

}
