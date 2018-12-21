package ssala.zoo;

public class Zoo {
 public static void main(String[] args) {
	 Cage<Rhino> rhinos = new Cage <>(3);
	 //oppure new Cage<Rhino>(1,3)
	 
	// così dico che in questa gabbia ci stanno solo rinoceronti: idem vale per zebra. mi fa il check la virtual machine.
	 //istanziando la gabbia il tipo di anmale è stato definito.
 }
}
