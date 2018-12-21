package glp91.jobike;

import java.util.ArrayList;

import glp91.jobike.BikeStation;





public class CityBikes {
	private ArrayList <BikeStation> listStation;
	
	public void CityBikes () {
		
	} //costruttore vuoto
	
	//scriviamo i metodi
	
	public boolean searchStation(BikeStation s) {
		 boolean flag =false;
//		for(int i=0; i<listStation.size(); i++) {
//			if(listStation.get(i) == null) {
//				index = -2;
//				break;
//			} else if(listStation.get(i).getNameStation()== s.getNameStation()) {
//				index = i;
//				break;
//			}
//			
//			}
		if (listStation.contains(s)) {
				flag= true;
			}
		return flag;
			
	}
	
	public void addStation(BikeStation s) {
		if (searchStation(s)==false) {
			listStation.add(new BikeStation ());
		} 
	}

	
	public void removeStation(BikeStation s) {
		if (searchStation(s)==true) {
			listStation.remove(s);
		}
	}
	
	
	
	
	


}
