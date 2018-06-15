package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.database;

import java.net.UnknownHostException;

import org.bson.Document;

// Mongodb dependencies
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

// Utilities
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.Constants;

public class DatabaseService {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	/* MongoDB client instance which will allow us to to
	 * provide persistence to our simulation system */
	private static MongoClient mongoClient;
	private static MongoDatabase mongoDatabase;
	private static MongoCollection<Document> highLevelResultsCollection;
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
	
	/***********
	 * METHODS *
	 **********/

	/** @return the isConnected */
	public static Boolean isConnected() {
		return isConnected;
	}

	
}
