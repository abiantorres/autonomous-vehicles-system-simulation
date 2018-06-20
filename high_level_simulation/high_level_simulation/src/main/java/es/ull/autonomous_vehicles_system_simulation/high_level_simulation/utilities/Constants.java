package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

public final class Constants {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	
	/* - LOW_LEVEL_DATA_TOPIC: Name of the topic which will publish the
	 * low-level simulation times. (times required by the vehicle to reach each
	 * point established on the route)
	 * - LOW_LEVEL_DATA_MSG_TYPE: Name of the ROS Message which establishes the low-level 
	 * time message format. 
	 * - ROS_URI: URI connection for ROS.
	 * - MONGODB_URI: URI connection for MongoDB access. 
	 * - MONGODB_DB_NAME: UName of the MongoDB database.
	 * - MONGODB_RESULTS_COLLECTION: results MongoDB collection */
	
	private final static String 
			LOW_LEVEL_DATA_TOPIC = "/simulation_data",
			LOW_LEVEL_DATA_MSG_TYPE = "costum_msgs/SimulationMsg", 
			MONGODB_URI = "localhost",
			ROS_URI = "ws://localhost:9090",
			MONGODB_DB_NAME = "avss",
			MONGODB_SIMULATIONS_METADATA_COLLECTION = "simulations_collection",
			MONGODB_HIGH_LEVEL_RESULTS_COLLECTION = "high_level_collection",
			MONGODB_LOW_LEVEL_RESULTS_COLLECTION = "low_level_collection",
			MONGODB_MERGED_COLLECTION = "merged_collection";
	/* ROS connection port */
	private final static Integer 
			MONGODB_PORT = 27017;
	
	/*******
	 * GET *
	 ******/

	/** @return the lowLevelDataTopic */
	public static String getLowLevelDataTopic() {
		return LOW_LEVEL_DATA_TOPIC;
	}

	/** @return the lowLevelDataMsgType */
	public static String getLowLevelDataMsgType() {
		return LOW_LEVEL_DATA_MSG_TYPE;
	}

	/** @return the mongodbUri */
	public static String getMongodbUri() {
		return MONGODB_URI;
	}

	/** @return the mongodbPort */
	public static Integer getMongodbPort() {
		return MONGODB_PORT;
	}

	/** @return the rosUri */
	public static String getRosUri() {
		return ROS_URI;
	}

	/** @return the mongodbDbName */
	public static String getMongodbDbName() {
		return MONGODB_DB_NAME;
	}

	/** @return the mongodbResultsCollection */
	public static String getMongodbHighLevelResultsCollection() {
		return MONGODB_HIGH_LEVEL_RESULTS_COLLECTION;
	}

	/** @return the mongodbSimulationsMetadataCollection */
	public static String getMongodbSimulationsMetadataCollection() {
		return MONGODB_SIMULATIONS_METADATA_COLLECTION;
	}

	/** @return the mongodbLowLevelResultsCollection */
	public static String getMongodbLowLevelResultsCollection() {
		return MONGODB_LOW_LEVEL_RESULTS_COLLECTION;
	}

	/** @return the mongodbMergedCollection */
	public static String getMongodbMergedCollection() {
		return MONGODB_MERGED_COLLECTION;
	}
}
