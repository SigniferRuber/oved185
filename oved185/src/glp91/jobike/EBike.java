package glp91.jobike;

public class EBike extends Bike {

	private int charge;

	public EBike() {
		// TODO Auto-generated constructor stub
	}
	
	public EBike(String id, boolean broken, String position, int charge) {
		super(id, broken, position);
		this.charge = charge;
		this.cost = 1.80;
	}

	
	public  int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}

}
