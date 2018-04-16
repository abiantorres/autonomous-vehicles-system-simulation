package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

public final class Constants {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	
	/* - LOW_LEVEL_DATA_TOPIC: Name of the topic which will publish the
	 * low-level simulation times. (times required by the vehicle to reach each
	 * point established on the route)
	 * - LOW_LEVEL_DATA_MSG_TYPE: Name of the ROS Message which establishes the low-level 
	 * time message format. */
	
	private final static String LOW_LEVEL_DATA_TOPIC = "/path_plan_info",
			LOW_LEVEL_DATA_MSG_TYPE = "costum_msgs/RouteTimes";
	
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
}
