package ssala.zoo;
//facciamo un test circa per ogni metodo: test ricco che valga almeno due istanze
//test sulla getId: crearti una cage, poi un altra cage e poi vedere se rispettano i risultati.
import static org.junit.jupiter.api.Assertions.*;//importa tutto quello che è in quella classe, cioè tutti i metodi statici presenti in quella classe

import java.util.Optional;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class CageTest {
	static Cage<Rhino> firstRhinoCage;
	static Cage<Zebra> firstZebraCage;
	//ogni test case deve essere come isolato dal mondo
	
	@BeforeAll //@indica le annotazioni che servono per arricchire.beforeall funziona solo per i metodi statici, non per le annotazioni.
	           //lo uso poco(beforeall) perchè cerco di evitare le dipendenze.
	            //@before non è per la statica
	public static void initializer() {
		firstRhinoCage = new Cage<>(3);
		firstZebraCage = new Cage<>(2);
	}
	@Test
	void idFirst() {
		//Cage<Rhino> cage = new Cage<>(9);
		//funzioni di test:
		//creare una gabbia e vedere se l id è corretto.
		assertEquals(1, firstRhinoCage.getId());
		assertEquals(2, firstZebraCage.getId());//non devono avere lo stesso numero: altrimenti errore
		//per essere sicuro che abbia 1. l ho inizializzato con un annotazione
		//id non lo posso testare in maniera indipendente dagli altri, per cui deevo creare una dipendenza:deve esserci questa dipendenza: beforeall cioè lo faccio una sola volta prima di tutti
		//la firstrhinocage è la prima dichiarata: Così ho la certezza che sia il primo, perchè la java virtual machine non capisce che deve farlo per primo e cosi invece abbiamo la certezza che lo faccia.
		// la java virtual machine non capisce che deve fare prima una cosa poi un'altra.
		//test su addanimal: nuova zebra presente
	}
	
	@Test
void cageTest() {
	}
	

	@Test
	void tooMuchAnimals() {
		//try to create more animals than max for cage
		//dobbiamo settare un valore massimo, e poi valutare se si riesca a superare
		//indico il massimo settandolo nelle parentesi() esempio: new Cage<>(8), indica che il massimo è 8.
		
		//ho creato sopra una variabile statica.
		Cage<Rhino> cage= new Cage<>(2);
		assertTrue(cage.add(new Rhino("a")));
		assertTrue(cage.add(new Rhino("b")));
		assertFalse(cage.add(new Rhino("c")));
		
		Rhino rhino =new Rhino("b");
		boolean result = cage.add(rhino);
		assertFalse(result);
	}
	
	//Testiamo add/remove degli animali. check if inserted animal could be removed
	@Test
	void addAndRemove() {
		Cage<Rhino> cage= new Cage<>(2);
		assertTrue(cage.add(new Rhino("a")));//mi sono creata un rinoceronte e l ho messo nella gabbia
		Optional<Rhino> rhino=cage.remove("a");
		assertTrue(rhino.isPresent());
		assertEquals("a", rhino.get().getName());//come va usato il get: devo fare il check sul nome. devo fare che mmi sia stato dato l animale giusto. ma lo faccio solo dopo vaer rfatto il controllo sul present.
		//faccio il getName perchè prima abbiamo visto che sia davvero presente.
		//optional: optional che mi ritorna rhino: è una piccola scatola che può contenere o zero o 1. is present mi ritorna true se c'è qualcosa dentro, altrimenti se è vuoto mi ritorna false.
		//mi sono messa nell'optional per evitare di usare i null. per questo si usa optional, per eviatre di usare i get e quindi i null.
		//abbimao il metodo if present che mi dice se è presente.
		
	}
	
	//non voglio che mi venga rimosso un animale da una gabbia vuota.è un test negativo che deve fallire.
	@Test
	void removeNegative() {
		//check if remove of animal not in cage fails
		Cage<Rhino> cage= new Cage<>(2);
		Optional<Rhino> rhino=cage.remove("c");
		assertFalse(rhino.isPresent());
		//sto calutando se la gabbia sia vuota
	}
	//bisognerebbe valutare il string to string
	
	
	
	//metodo per vedere se bob  è nella gabbia corrente: CHANGE REQUEST, DOPO AVER CAMBIATO LE COSE.
}
