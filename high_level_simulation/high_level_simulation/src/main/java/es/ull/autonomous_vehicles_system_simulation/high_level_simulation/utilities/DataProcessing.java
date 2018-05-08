package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

//JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;
// Simulation Structures
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSSegment;

final public class DataProcessing {
	
	/***********
	 * METHODS *
	 **********/
	
	public static ROSResults parseOfflineResultsJson(JsonNode data) {
		/* Explores the JSON tree obtained from ROS in search of the main content of 
		 * the message, and return an OfflineRosResults which will be used by the
		 * PSIGHOS simulation*/
		ROSResults results = new ROSResults();
		results.setPlanFile(data.get("msg").get("plan_file").textValue());
		results.setDate(data.get("msg").get("date").textValue());
		results.setSimulations(data.get("msg").get("simulations").intValue());
		results.setGlobalFailures(data.get("msg").get("global_failures").intValue());
		results.setGlobalTimeAverage(
				data.get("msg").get("global_time_average").doubleValue());
		results.setGlobalDistanceAverage(
				data.get("msg").get("global_distance_average").doubleValue());
		results.setGlobalVelocityAverage(
				data.get("msg").get("global_velocity_average").doubleValue());
		results.setGlobalLinearVelocityAverage(
				data.get("msg").get("global_linear_velocity_average").doubleValue());
		results.setGlobalMaximumLinearVelocity(
				data.get("msg").get("global_maximum_linear_velocity").doubleValue());
		results.setLocalPlanner(data.get("msg").get("local_planner").textValue());
		results.setGlobalPlanner(data.get("msg").get("global_planner").textValue());
		// Travel over the array searching for each section information
		final JsonNode segments = data.get("msg").get("sections");
		if(segments.isArray()) {
			for(final JsonNode segmentNode : segments) {
				ROSSegment segment = new ROSSegment();
				segment.setId(segmentNode.get("id").textValue());
				segment.setTimeAverage(segmentNode.get("time_average").doubleValue());
				segment.setDistanceAverage(segmentNode.get("distance_average").doubleValue());
				segment.setVelocityAverage(segmentNode.get("velocity_average").doubleValue());
				segment.setLinearVelocityAverage(
						segmentNode.get("linear_velocity_average").doubleValue());
				segment.setMaximumLinearVelocity(
						segmentNode.get("maximum_linear_velocity").doubleValue());
				segment.setFailures(segmentNode.get("failures").intValue());
				segment.setDensity(segmentNode.get("density").doubleValue());
				segment.setMaxObstacleShiftment(segmentNode.get("max_obstacle_shiftment").doubleValue());
				segment.setObstacleLength(segmentNode.get("obstacle_length").doubleValue());
				segment.setTimeStandardDeviation(segmentNode.get("time_standard_deviation").doubleValue());
				results.addSegment(segment);
			}
		}
		return results;
	}
	
}
