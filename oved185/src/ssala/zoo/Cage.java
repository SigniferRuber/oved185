package ssala.zoo;



import java.util.HashSet;
import java.util.Iterator;
import java.util.Optional;
import java.util.Set;

public class Cage<T extends Animal>
//cage è dipendente da un tipo: voglio che T sia una classe derivato da animale, qui rinoc e zebra. voglio siano solo animali, quindi T
//quando istanzio la mia cage, istanzio anche il nome dell'animale che ci voglio dentro.Zoo class
{
	static int lastId =0;
	//perchè dobbiamo tenere traccia dell'id utilizzati. lastid mi tiene traccia dell'ultimo id utilizzato.
	private Set <T> guests; //sono gli animali ospitati nella gabbia.
	//sappiamo che animale è solo quando la gabbia viene creata. non so che animale sia(zebra o rinoceronte), sappiamo solo che è un animla eper questo ho scritto <animale>
	
	private int id;
	private int max; //id e max vanno inizializzati. dobbimao chiederlo all'utente di questa classe
	// è giusto che sia responsabilità della gabbia valutare il suo massimo. l' id mi arriva dal programma e ci vuole qualcosa che mi dica che veramente incrementi l id. è la classe cage che si gestisce l id. 
	//cage ha dentro di sè un contatore che mi gestisca il numero di gabbie che entrano. : 1 caso cpon contatore interno
	//in cage anche se togli una gabbia, l id non cambia. è di cage la responsabilità, quindi spetta a lei mettere il contatore.
	//classe gestione che gestisce le gabbie e gestisce lei i numeri e passa gli id.; 2 caso.: è responsabilità di gestione tenersi la mappa tra gabbia e ciò che contiene le gabbie. allora non ha senso che l id stia qui.
	//chi aggoiunge gabbie è gestione, ma non è detto che l id sia a carico suo.
	//DECISIONE: A ZOO L 'ID
	
	
	//costruttore di cage
	public Cage(int max) {
		guests= new HashSet<>();//capisce che guests è un set di animal
		//multithread: uno entra e mi crea il guest; entra un altro e mi crea il guest: quindi l indice si incrementa e viene un casino.
		//questo programma viene creato per singoli thread. non è funzionale per multithread.
		
		lastId += 1; //scritto anche come lastId ++;
		this.id =lastId;
		this.max = max; //viene inizializzato con questo parametro. 
		//this.max è la property dell'oggetto.
	}
	
	public int getId() {
		return id;
	}
	//prende l input in T 
	//public void add(T animal)//meglio non far ritornare void, vogliamo un booleano
	public boolean add(T animal) {
		//TODO la add deve cambiare la sua funzionalità
 if(max==guests.size()) {//max non sarà più di size perchè il controllo si ferma prima. così controllo che non superi il valore massimo.
	 return false;
                        }
	guests.add(animal);
	return true;
}
	//remove animal che mi tornerà l 'animale. dobbiamo rimuoverlo dalla lista
	public Optional<T> remove(String name){
		//non mi deve tornare un booleano perchè mi deve ritornare l'oggetto: perchè devo spostarlo e non posso usare un semplice booleano. 
	//solo un metodo remove per togliere l animale, poi sarà l'allevatore che decide cosa fare, se spostarlo in altra gabbia oppure ucciderlo
	//remove mi torna l animale; se invece è vuoto, mi mette l'eccezione. oppurre optional , che mi torna un optional, come un piccolo contenitore che mi torna uno o zero elmenti. (0 se non c 'è rhino, altrimenti 1 se c è.
		Iterator<T> it = guests.iterator();
		while(it.hasNext()) {
		 T animal = it.next();
		 if(animal.getName().equals(name)) //le stringhe possono essere in locazione di memoria diverse, ma  devono avere gli stessi oggetti dentro.
		 {
			 guests.remove(animal);
			 return Optional.of(animal);
			 //la size cambia automaticamente perchè è gestita da guests.
		 }
		}
		return Optional.empty();
		} //iteratore= tipo puntatore. qui il cilo for è stato riscritto come un while. iteratore come puntatore inizializzato all'elemento prima della collezione.
	//allora faccio un loop con un while. finchè c'è un successsore nell iteratore (mi posso muovere avanti all'elemento?) mi torna true, per cui entro nel cilo. metodo next che mi sposta l iteratore in avanti, e mi ritorna il valore associato a quella locazione.
	//animal è l animale su cui sto lavorando su questo animale. qui l animale del primo set. next next fino a che non arrivo sull ultimo. ho finito, mi ritoirna false, quindi ha finito. 
	//allora ritornerò optinal empty, come null, ma più sicuro, perchè sono forzata a vedere ciò che ho dentro.
	//se lo trovo mi ritorna alla mia collezione 
	//voglio che la remove mi tornasse dentro l animale. lo inscatolo dentro l optional, che è un contenitore piccolo( 0 elemnto o 1 elemnto).
	//se in optional voglio qualcosa, chiamo il metodo of.
	
	
	//check per vedere se l'animale è presente
	@Override
	public String toString() {
		
		return "{Cage" + id + ":" + guests + "}";
	}
	//toString è definita da object: mi stampa l indirizzo di memoria di quell'oggetto. 
	}