package arch.zoo;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Optional;
import java.util.Set;
// TODO: check animal in cage
// TODO: direct access to guest
// TODO: reject duplicate names
public class Cage<T extends Animal> { // Cage è una classe template che è basato sulla gerarchia Animal
	static int lastId = 0;

	private Set<T> guests; // dichiarazione

	private int id;
	private int max;

	
	
	public Cage(int max) {
		guests = new HashSet<>(); // inizializzazione di guests: lo riconosce come HashSet di tipo Animal perchè
									// guests è un set di Animal.
		lastId += 1;
		id = lastId;
		this.max = max; // la property di questa classe viene inizializzata con il valore in entrata nel
						// costruttore.
	}

	public int getId() { // niente set, la responsabilità dell'id la diamo solo a questa classe.
		return id;
	}

	public boolean add(T animal) {
		if (max == guests.size()) {
			return false;
		}
		guests.add(animal); // su un set posso applicare il metodo add, che mi aggunge in questo caso un
							// oggetto appartenente alla classe T.
		return true;
	}

	
	public Optional<T> remove(String name) {
		Iterator<T> it = guests.iterator();
		// mi creo iteratore it che punta alla casella precedente al primo elemento
		// della collezione.
		while (it.hasNext()) { // finchè c'è un successore mi dà true. E mi sposta l'iteratore avanti.
			T animal = it.next();
			if (animal.getName().equals(name)) {
				
					guests.remove(animal);
				
				return Optional.of(animal); // se lo trovo, inscatolo l'animale dentro l'optional e lo ritorno! Così da
											// non dover lanciare un'eccezione
				// o un null :) uso un iteratore perchè non ho un loop su degli indici, ho un
				// set! è più uno scan.
			}
		}

		return Optional.empty();
	} // se, avendo fatto tutto il loop, non ho trovato l'animale,
	// allora ritorno un empty.

	// override della funzione tostring: questo non è un metodo di questa classe, ma
	// di una superclasse! E' quindi un override.
	@Override
	public String toString() {

		return "{Cage " + id + ":" + guests + "}";
	}
	
	
		
	

}
