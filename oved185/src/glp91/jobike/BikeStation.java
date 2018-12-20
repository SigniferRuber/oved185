package glp91.jobike;

import java.util.HashMap;

public class BikeStation {
	
	private HashMap<String, Bike> bikes;
	
	public BikeStation() {
		
	}
	
	public BikeStation(HashMap bikes) {
		this.bikes = bikes;
		
	}

	public HashMap<String, Bike> getBikes() {
		return bikes;
	}

	public void setBikes(HashMap<String, Bike> bikes) {
		this.bikes = bikes;
	}
	
	
	public void addNewBike (String id, Bike bike) {
		this.bikes.put(id, bike);
	}
	
	public Bike searchBike (String id) {
		if (this.bikes.containsKey(id)) {
			return this.bikes.get(id);
		} else {
		return null;
		}
	}
	public boolean removeBike (String id) {
		boolean flag=false;
		if (this.bikes.containsKey(id)) {
		this.bikes.remove(id);
		flag=true;
		}
		return flag;
	
	}
	

}
