package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.database;

import java.net.UnknownHostException;
import java.util.ArrayList;

import org.bson.Document;
// Mongodb dependencies
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.gte;
import static com.mongodb.client.model.Filters.lte;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSSimulationMetadata;
// Utilities
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.Constants;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.DataProcessing;

public class DatabaseService {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	/* MongoDB client instance which will allow us to to
	 * provide persistence to our simulation system */
	private static MongoClient mongoClient;
	private static MongoDatabase mongoDatabase;
	private static MongoCollection<Document> highLevelResultsCollection;
	private static MongoCollection<Document> lowLevelResultsCollection;
	private static MongoCollection<Document> simulationsMetadataCollection;
	private static Boolean isConnected;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	public DatabaseService() {
		DatabaseService.isConnected = false;
	}
	
	/***********
	 * METHODS *
	 **********/
	/** Establish the MongoDB connection 
	 * @throws UnknownHostException */
	public static void connectToDatabase()  {
		DatabaseService.mongoClient = new MongoClient(Constants.getMongodbUri(), 
				   Constants.getMongodbPort());
		DatabaseService.isConnected = true;
		// Get the mongodb database
		DatabaseService.mongoDatabase = DatabaseService.mongoClient.getDatabase(Constants.getMongodbDbName());
		// Get the results collection
		DatabaseService.highLevelResultsCollection = 
				DatabaseService.mongoDatabase.getCollection(
						Constants.getMongodbHighLevelResultsCollection());
		DatabaseService.lowLevelResultsCollection = 
				DatabaseService.mongoDatabase.getCollection(
						Constants.getMongodbLowLevelResultsCollection());
		DatabaseService.simulationsMetadataCollection = DatabaseService.mongoDatabase.getCollection(
				Constants.getMongodbSimulationsMetadataCollection());
	}
	
	/** Close the MongoDB connection 
	 * @throws UnknownHostException */
	public static void closeConnection()  {
		DatabaseService.mongoClient.close();
	}
	
	public static void insertResults(Document data) {
		if(DatabaseService.isConnected) {
			DatabaseService.highLevelResultsCollection.insertOne(data);
		}
	}
	
	public static ArrayList<ROSResults> getLowLevelResultsByHash(String simulationHash) {
		if(DatabaseService.isConnected) {
			ArrayList<ROSResults> lowLevelResults = new ArrayList<ROSResults>();
			// Get the low level results for the simulation hash especified
			FindIterable<Document> iterable = 
					DatabaseService.lowLevelResultsCollection.find(eq("metadata.simulation_hash", simulationHash));
			for (Document doc : iterable) {	
				ROSResults results = DataProcessing.parseROSResultsDocument(doc);
				lowLevelResults.add(results);
			}
			return lowLevelResults;
		}
		return null;
	}
	
	// DBO: Distance between obstacles.
	/** Get Low Level Results by the hash and the distance between obstacles
	 * @param simulationHash simulation configuration hash
	 * @param segmentIndex segment index
	 * @param lowLimit lower value for the distance between obstacles
	 * @param highLimit higher value for the distance between obstacles
	 * @return
	 */
	public static ArrayList<ROSResults> getLowLevelResultsByHashAndDBO(
			String simulationHash, Integer segmentIndex, Integer lowLimit, Integer highLimit) {
		if(DatabaseService.isConnected) {
			ArrayList<ROSResults> lowLevelResults = new ArrayList<ROSResults>();
			// Get the low level results for the simulation hash especified
			FindIterable<Document> iterable = 
					DatabaseService.lowLevelResultsCollection.find(and(
							// Filter by the simulation hash
							eq("metadata.simulation_hash", simulationHash),
							// Filter by segment index
							eq("metadata.segments_metadata.segments_metadata.segment_index", segmentIndex),
							// Filter by the lowest distance between obstacles value allowed
							lte("metadata.segments_metadata.segments_metadata.distance_between_obstacles", highLimit),
							// Filter by the highest distance between obstacles value allowed
							gte("metadata.segments_metadata.segments_metadata.distance_between_obstacles", lowLimit)));
			// Convert documents to be processed by the high simulation
			for (Document doc : iterable) {	
				ROSResults results = DataProcessing.parseROSResultsDocument(doc);
				System.out.println(results);
				lowLevelResults.add(results);
			}
		}
		return null;
	}
	
	public static ArrayList<ROSSimulationMetadata> getLowLevelSimulations() {
		if(DatabaseService.isConnected) {
			ArrayList<ROSSimulationMetadata> simulationsMetadata = new ArrayList<ROSSimulationMetadata>();
			FindIterable<Document> iterable = DatabaseService.simulationsMetadataCollection.find();
			for (Document doc : iterable) {
				ROSSimulationMetadata simulation = new ROSSimulationMetadata();
				simulation.setSimulationHash(doc.getString("simulation_hash"));
				simulation.setPlanFile(doc.getString("plan_file"));
				simulation.setRobotFile(doc.getString("robot_file"));
				simulation.setWorldFile(doc.getString("world_file"));
				simulation.setMapFile(doc.getString("map_file"));
				simulationsMetadata.add(simulation);
			}
			return simulationsMetadata;
		}
		return null;
	}
	
	/***********
	 * METHODS *
	 **********/

	/** @return the isConnected */
	public static Boolean isConnected() {
		return isConnected;
	}

	
}
