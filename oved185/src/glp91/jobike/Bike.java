package glp91.jobike;

public abstract class Bike {
	
	private String id;
	protected double cost;
	private String position;
	private boolean broken;
	
	public Bike() {
		// TODO Auto-generated constructor stub
	}
	public Bike(String id, boolean broken, String position) {
		this.id = id;
		this.broken = broken;
		
		this.position = position;
				
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public double getCost() {
		return cost;
	}


	public void setCost(double cost) {
		this.cost = cost;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	public boolean isBroken() {
		return broken;
	}


	public void setBroken(boolean broken) {
		this.broken = broken;
	}


	
	
	
	
}
