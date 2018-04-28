package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.bridge;

// JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;
// Communication with ROS via WebSockets (Jetty 9)
import ros.RosBridge;
import ros.RosListenDelegate;
// Utilities
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.Constants;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.DataProcessing;

// Database
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Listener /*extends Experiment*/ {

	/**************
	 * ATRIBUTTES *
	 *************/

	/* MongoDB client instance which will allow us to to
	 * provide persistence to our simulation system */
	private static MongoClient mongoClient;
	private static MongoDatabase mongoDatabase;
	private static MongoCollection<?> resultsCollection;
	/* ROS Connection bridge */
	private static RosBridge bridge;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	
	public Listener() {}
	
	/***********
	 * METHODS *
	 **********/
	
	/** Establish the MongoDB connection */
	public static void connectDatabase() {
		// Initialize the mongodb client
		Listener.setMongoClient(new MongoClient(Constants.getMongodbUri(), 
				   Constants.getMongodbPort()));
		// Get the mongodb database
		Listener.setMongoDatabase(Listener.getMongoClient().getDatabase(
				Constants.getMongodbDbName()));
		// Get the results collection
		Listener.setResultsCollection(
				Listener.getMongoDatabase().getCollection(
						Constants.getMongodbResultsCollection()));
	}
	
	/** Establish the ROS connection */
	public static void connectRos() {
		// Opens the connection with ROS via WebSockets (Using Jetty 9)
		Listener.setBridge(RosBridge.createConnection(Constants.getRosUri()));
		// Waiting to establish the connection with the ROS server
		Listener.getBridge().waitForConnection();
	}
	
	/********
	 * MAIN *
	 *******/
	
	public static void main(String[] args) {
		Listener.connectDatabase();
		Listener.connectRos();
		// Defines what actions to take when receiving data from the topic defined and
		// with which type of ROS message. (We should get a JSON Tree structure)
		bridge.subscribe(Constants.getLowLevelDataTopic(), Constants.getLowLevelDataMsgType(),
			new RosListenDelegate() {
				public void receive(JsonNode data, String stringRep) {	
					// Parses the information in such a way that it can
					// be used by high-level simulation
					//System.out.println(data);
					DataProcessing.parseOfflineResultsJson(data).toString();
				}});
	}

	/** @return the mongoClient */
	public static MongoClient getMongoClient() {
		return Listener.mongoClient;
	}

	/** @param mongoClient the mongoClient to set */
	public static void setMongoClient(MongoClient mongoClient) {
		Listener.mongoClient = mongoClient;
	}

	/** @return the mongoDb */
	public static MongoDatabase getMongoDatabase() {
		return Listener.mongoDatabase;
	}

	/** @param mongoDb the mongoDb to set */
	public static void setMongoDatabase(MongoDatabase mongoDb) {
		Listener.mongoDatabase = mongoDb;
	}

	/** @return the bridge */
	public static RosBridge getBridge() {
		return Listener.bridge;
	}

	/** @param bridge the bridge to set */
	public static void setBridge(RosBridge bridge) {
		Listener.bridge = bridge;
	}

	/** @return the resultsCollection */
	public static MongoCollection<?> getResultsCollection() {
		return resultsCollection;
	}

	/** @param resultsCollection the resultsCollection to set */
	public static void setResultsCollection(MongoCollection<?> resultsCollection) {
		Listener.resultsCollection = resultsCollection;
	}
	
}