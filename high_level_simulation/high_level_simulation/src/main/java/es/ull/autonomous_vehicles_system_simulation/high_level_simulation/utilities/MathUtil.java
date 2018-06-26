package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;
import java.util.*;
public class MathUtil {
	
	    public static double sum (List<Double> a){
	        if (a.size() > 0) {
	        	double sum = 0;
	            for (Double i : a) {
	                sum += i;
	            }
	            return sum;
	        }
	        return 0;
	    }
	    
	    public static int sumInteger (List<Integer> a){
	        if (a.size() > 0) {
	        	int sum = 0;
	            for (Integer i : a) {
	                sum += i;
	            }
	            return sum;
	        }
	        return 0;
	    }
	    
	    public static Long sumLong (List<Long> a){
	        if (a.size() > 0) {
	        	Long sum = new Long(0);
	            for (Long i : a) {
	                sum = Long.sum(i, sum);
	            }
	            return sum;
	        }
	        return new Long(0);
	    }
	    
	    
	    public static double mean (List<Double> a){
	    	double sum = sum(a);
	        double mean = 0;
	        mean = sum / (a.size() * 1.0);
	        return mean;
	    }
	    
	    public static int meanInteger (List<Integer> a){
	    	int sum = sumInteger(a);
	    	int mean = 0;
	        mean = sum / a.size();
	        return mean;
	    }
	    
	    public static Long meanLong (List<Long> a){
	    	Long sum = sumLong(a);
	    	Long mean = new Long(0);
	        mean = Long.divideUnsigned(sum, a.size());
	        return mean;
	    }
	    
	    public static double median (List<Double> a){
	        int middle = a.size()/2;
	 
	        if (a.size() % 2 == 1) {
	            return a.get(middle);
	        } else {
	           return (a.get(middle-1) + a.get(middle)) / 2.0;
	        }
	    }
	    public static double sd (List<Double> a){
	    	double sum = 0;
	        double mean = mean(a);
	 
	        for (Double i : a)
	            sum += Math.pow((i - mean), 2);
	        return Math.sqrt( sum / ( a.size() - 1 ) ); // sample
	    }
	    
}
