package glp91.jobike;

public abstract class Bike {
	
	protected static String id;
	protected static float cost;
	protected static String position;
	protected static boolean broken;
	
	
	public Bike(String number, boolean broken, String position, float cost) {
		this.id = id;
		this.broken = broken;
		this.cost = cost;
		this.position = position;
				
	}


	public static String getId() {
		return id;
	}


	public static float getCost() {
		return cost;
	}


	public static String getposition() {
		return position;
	}


	public static boolean isBroken() {
		return broken;
	}


	public static String getPosition() {
		return position;
	}


	public static void setPosition(String position) {
		Bike.position = position;
	}


	public static void setNumber(String id) {
		Bike.id = id;
	}


	public static void setCost(float cost) {
		Bike.cost = cost;
	}


	public static void setBroken(boolean broken) {
		Bike.broken = broken;
	}
	
	
	
}
