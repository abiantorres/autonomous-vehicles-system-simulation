package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.bridge;

// Data structures
import java.util.ArrayList;
// JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;
// Communication with ROS via WebSockets (Jetty 9)
import ros.RosBridge;
import ros.RosListenDelegate;
// Utilities
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.Constants;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.DataProcessing;

public class Listener /*extends Experiment*/ {

	/**************
	 * ATRIBUTTES *
	 *************/
	
	/* - times: will keep the times required by the vehicle to reach each
	 * point established on the route (average times) */
	protected static ArrayList<Double> times;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	
	public Listener() {
		Listener.times = new ArrayList<Double>();
	}
	
	/********
	 * MAIN *
	 *******/
	
	public static void main(String[] args) {
		// Opens the connection with ROS via WebSockets (Using Jetty 9)
		RosBridge bridge = RosBridge.createConnection("ws://localhost:9090");
		// Waiting to establish the connection with the ROS server
		bridge.waitForConnection();
		// Defines what actions to take when receiving data from the topic defined and
		// with which type of ROS message. (We should get a JSON Tree structure)
		bridge.subscribe(Constants.getLowLevelDataTopic(), Constants.getLowLevelDataMsgType(),
			new RosListenDelegate() {
				public void receive(JsonNode data, String stringRep) {	
					// Parses the information in such a way that it can
					// be used by high-level simulation
					setTimes(DataProcessing.parseRosJson(data));
				}});
	}

	/** @return the times */
	public static ArrayList<Double> getTimes() {
		return Listener.times;
	}

	/** @param times the times to set */
	public static void setTimes(ArrayList<Double> times) {
		Listener.times = times;
	}
	
}