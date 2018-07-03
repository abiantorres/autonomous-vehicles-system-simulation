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
	private RosBridge bridge;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	public ROSListener() {}
	
	/***********
	 * METHODS *
	 **********/
	
	/** Establish the ROS connection */
	public void connectToRos() {
		// First, connect to database to save results when the simulation
		// finalize
		DatabaseService.connectToDatabase();
		// Opens the connection with ROS via WebSockets (Using Jetty 9)
		//this.bridge = RosBridge.createConnection(Constants.getRosUri());
		// Waiting to establish the connection with the ROS server
		this.bridge = RosBridge.createConnection(Constants.getRosUri());
		bridge.waitForConnection();
	}
	
	/**
	 * @param nExperiments
	 * @param nJanitors
	 * @param nDoctors
	 * @param nAutoChairs
	 * @param nManualChairs
	 * @param patientsPerArrival
	 * @param minutesBetweenArrivals
	 * @param manualFactor
	 * @param days
	 */
	public void listen(final Integer nExperiments, final Integer nJanitors, final Integer nDoctors, 
			final Integer nAutoChairs, final Integer nManualChairs, final Integer patientsPerArrival,
			final Integer minutesBetweenArrivals, final Double manualFactor, final Integer days) {
		// Conect to ROS
		connectToRos();
		// Subscribe to the simulation data topic and wait for results
		this.bridge.subscribe(Constants.getLowLevelDataTopic(), Constants.getLowLevelDataMsgType(),
				new RosListenDelegate() {
					public void receive(JsonNode data, String stringRep) {	
						// Parses the information in such a way that it can
						// be used by high-level simulation
						ROSResults results = DataProcessing.parseOfflineResultsJson(data);
						//DatabaseService.insertResults(results.getDocument());	
						new WheelChairsExperiment(nExperiments, results, nJanitors, nDoctors, 
								nManualChairs, nAutoChairs, patientsPerArrival,
								minutesBetweenArrivals, manualFactor, 
								new Long(0), new Long(days*24*60*60) ).start();
					}});
	}
}