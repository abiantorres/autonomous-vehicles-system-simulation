package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

//Data Structures
import java.util.ArrayList;
//JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

final public class DataProcessing {
	
	/***********
	 * METHODS *
	 **********/
	
	public static ArrayList<Double> parseRosJson(JsonNode data) {
		/* Explores the JSON tree obtained from ROS in search of the main content of 
		 * the message, and then transform the JsonNode Array to an ArrayList via ObjectMapper
		 * convertValue method */
		@SuppressWarnings("unchecked")
		ArrayList<Double> routeTimes = new ArrayList<Double>(
				new ObjectMapper().convertValue(data.get("msg").get("times"), ArrayList.class));
		return routeTimes;
	}
}
