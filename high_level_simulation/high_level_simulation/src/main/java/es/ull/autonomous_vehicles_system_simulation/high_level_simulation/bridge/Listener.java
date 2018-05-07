package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.bridge;

// JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;
// Communication with ROS via WebSockets (Jetty 9)
import ros.RosBridge;
import ros.RosListenDelegate;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.database.DatabaseService;
// Utilities
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.Constants;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.DataProcessing;

public class Listener /*extends Experiment*/ {

	/**************
	 * ATRIBUTTES *
	 *************/
	/* ROS Connection bridge */
	private static RosBridge bridge;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	public Listener() {}
	
	/***********
	 * METHODS *
	 **********/
	
	/** Establish the ROS connection */
	public static void connectToRos() {
		// Opens the connection with ROS via WebSockets (Using Jetty 9)
		Listener.bridge = RosBridge.createConnection(Constants.getRosUri());
		// Waiting to establish the connection with the ROS server
		Listener.bridge.waitForConnection();
	}
	
	/********************************
	 * MAIN 					    *
	 * @throws UnknownHostException *
	 *******************************/
	
	public static void main(String[] args) {
		DatabaseService.connectToDatabase();
		Listener.connectToRos();
		// Defines what actions to take when receiving data from the topic defined and
		// with which type of ROS message. (We should get a JSON Tree structure)
		bridge.subscribe(Constants.getLowLevelDataTopic(), Constants.getLowLevelDataMsgType(),
			new RosListenDelegate() {
				public void receive(JsonNode data, String stringRep) {	
					// Parses the information in such a way that it can
					// be used by high-level simulation
					DatabaseService.insertResults(
							DataProcessing.parseOfflineResultsJson(data).getDocument());		
				}});
	}
	
}