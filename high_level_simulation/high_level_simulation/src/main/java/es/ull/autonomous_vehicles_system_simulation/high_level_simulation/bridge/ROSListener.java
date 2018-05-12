package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.bridge;

// JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;
// Communication with ROS via WebSockets (Jetty 9)
import ros.RosBridge;
import ros.RosListenDelegate;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.database.DatabaseService;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation.WheelChairsExperiment;
// Utilities
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.Constants;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.DataProcessing;

public class ROSListener {

	/**************
	 * ATRIBUTTES *
	 *************/
	/* ROS Connection bridge */
	private static RosBridge bridge;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	public ROSListener() {}
	
	/***********
	 * METHODS *
	 **********/
	
	/** Establish the ROS connection */
	public static void connectToRos() {
		// Opens the connection with ROS via WebSockets (Using Jetty 9)
		ROSListener.bridge = RosBridge.createConnection(Constants.getRosUri());
		// Waiting to establish the connection with the ROS server
		ROSListener.bridge.waitForConnection();
	}
	
	/********************************
	 * MAIN 					    *
	 * @throws UnknownHostException *
	 *******************************/
	
	public static void main(String[] args) {
		DatabaseService.connectToDatabase();
		ROSListener.connectToRos();
		// Defines what actions to take when receiving data from the topic defined and
		// with which type of ROS message. (We should get a JSON Tree structure)
		bridge.subscribe(Constants.getLowLevelDataTopic(), Constants.getLowLevelDataMsgType(),
			new RosListenDelegate() {
				public void receive(JsonNode data, String stringRep) {	
					// Parses the information in such a way that it can
					// be used by high-level simulation
					ROSResults results = DataProcessing.parseOfflineResultsJson(data);
					DatabaseService.insertResults(results.getDocument());	
					new WheelChairsExperiment(100, results, 1, 2, 0, 6, 4, 30, 1.0, 
							new Long(0), new Long(7*24*60*60) ).start();
				}});
	}
}