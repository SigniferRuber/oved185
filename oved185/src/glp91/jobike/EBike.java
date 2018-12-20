package glp91.jobike;

public class EBike extends Bike {

	private static int charge;

	public EBike(String id, boolean broken, String position, float cost) {
		super(id, broken, position, cost);

	}

	public void charge(int charge) {
		this.charge = charge;
	}

	public static int getCharge() {
		return charge;
	}

	public static void setCharge(int charge) {
		EBike.charge = charge;
	}

}
