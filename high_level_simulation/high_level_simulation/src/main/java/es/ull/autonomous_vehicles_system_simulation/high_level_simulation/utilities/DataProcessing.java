package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

import java.util.UUID;

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
		results.setSimulationHash(data.get("msg").get("metadata").get("simulation_hash").textValue());
		results.setRobotFile(data.get("msg").get("metadata").get("robot_file").textValue());
		results.setWorldFile(data.get("msg").get("metadata").get("world_file").textValue());
		results.setPlanFile(data.get("msg").get("metadata").get("plan_file").textValue());
		results.setMapFile(
				data.get("msg").get("metadata").get("map_file").textValue());
		results.setDate(
				data.get("msg").get("metadata").get("date").textValue());
		results.setnSegments(
				data.get("msg").get("metadata").get("n_segments").intValue());
		results.setnIterations(
				data.get("msg").get("metadata").get("n_iterations").intValue());
		results.setTimeoutFactor(
				data.get("msg").get("metadata").get("timeout_factor").intValue());
		results.setUsefulSimulation(
				data.get("msg").get("metadata").get("useful_simulation").booleanValue());
		results.setLocalPlanner(data.get("msg").get("metadata").get("local_planner").textValue());
		results.setGlobalPlanner(data.get("msg").get("metadata").get("global_planner").textValue());
		// Get individual times only for future uses.
		final JsonNode individualIterationsResults = data.get("msg").get("individual_iterations_results");
		// Travel over the array searching for each section information
		final JsonNode segments = data.get("msg").get("global_segments_results");
		if(segments.isArray() && individualIterationsResults.isArray()) {
			for(final JsonNode segmentNode : segments) {
				ROSSegment segment = new ROSSegment();
				segment.setIndex(segmentNode.get("segment_index").intValue());
				segment.setFailures(segmentNode.get("n_failures").intValue());
				segment.setTimeAverage(segmentNode.get("time_mean").doubleValue());
				segment.setTimeStandardDeviation(segmentNode.get("time_stdev").doubleValue());
				// Search for the distance between obstacles for this segment
				segment.setDistanceBetweenObstacles(data.get("msg").get("metadata").get("segments_metadata")
						.get("segments_metadata").get(segment.getIndex()).get("distance_between_obstacles")
						.doubleValue());
				// Append individual iterations times to the individualTimes array
				for(final JsonNode iterationNode : individualIterationsResults) {
					segment.getIndividualTimes().add(iterationNode.get("segments_results")
							.get(segment.getIndex()).get("time").doubleValue());
				}
				results.addSegment(segment);
			}
		}
		return results;
	}
	
	public static String generateUniqueSimulationID() {
		return UUID.randomUUID().toString();
	}
	
}
