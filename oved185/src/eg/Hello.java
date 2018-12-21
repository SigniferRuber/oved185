package eg;

//import java.time.*//per importare tutto il package time
import java.time.LocalDate;
import java.time.Month;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Hello {
	public static void main(String[] args) {
		System.out.println("Hello @" + LocalDate.of(2019, Month.JANUARY, 7));

		System.out.println("Single is: " + findSingleSorted(new int[] { 1, 3, 2, 2, 1 } ));
		System.out.println("Single is: " + findSingleSorted(new int[] { 1, 3, 2, 1, 3 } ));
		System.out.println("Single is: " + findSingle(new int[] { 1, 3, 2, 2, 1 } ));
		System.out.println("Single is: " + findSingle(new int[] { 1, 3, 2, 1, 3 } ));
		System.out.println("Single is: " + findSingle(new int[] { 19 } ));
	}
	
	public static int findSingleSorted(int[] data) {
		if(data == null || data.length == 0) {
			throw new IllegalArgumentException("Not enough elements in input!");
		}
		if(data.length % 2 == 0) {
			throw new IllegalArgumentException("Unexpected number of elements");
		}
		if(data.length == 1)
			return data[0];

		Arrays.sort(data);

		for(int i = 0; i < data.length; i++) {
			if(i == data.length - 1) {
				return data[i];
			}
			if(data[i] != data[i+1]) {
				return data[i];
			}
			i += 1;
		}
				
		throw new IllegalArgumentException("Can't find single element");
	}
	
	public static int findSingle(int[] data) {
		if(data == null) {
			throw new IllegalArgumentException("No input data");
		}

		Map<Integer, Integer> counters = new HashMap<>();		
		for(int i = 0; i < data.length; i++) {
			int cur = data[i];
			counters.put(cur, counters.getOrDefault(cur, 0) + 1);
		}

		Iterator<Map.Entry<Integer, Integer>> it = counters.entrySet().iterator();
		while(it.hasNext()) {
			Map.Entry<Integer, Integer> entry = it.next();
			if(entry.getValue() == 1) {
				return entry.getKey();
			}
		}
		
//		Iterator<Integer> it = counters.keySet().iterator();
//		while(it.hasNext()) {
//			Integer key = it.next();
//			if(counters.get(key) == 1) {
//				return key;
//			}
//		}
				
		throw new IllegalArgumentException("Can't find any single value");
	}
	
}
