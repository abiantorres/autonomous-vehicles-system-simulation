package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.OptionalDouble;
import java.util.UUID;

import org.bson.Document;

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
				segment.setTimeout(segmentNode.get("segment_simulation_timeout").intValue());
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
	
	public static ROSResults parseROSResultsDocument(Document doc) {
		ROSResults results = new ROSResults();
		// Simulation metadata
		Document metadata = (Document) doc.get("metadata");
		// Segments metadata
		Document segmentsMetadata = (Document) metadata.get("segments_metadata");
		// Get the segments metadata list
		@SuppressWarnings("unchecked")
		ArrayList<Document> segmentsMetadataList = 
			(ArrayList<Document>) segmentsMetadata.get("segments_metadata");
		// Get the list of segments results
		@SuppressWarnings("unchecked")
		ArrayList<Document> globalSegmentsResults = 
			(ArrayList<Document>) doc.get("global_segments_results");
		// Get individual iterations results
		@SuppressWarnings("unchecked" )
		ArrayList<Document> individualIterationsResults = 
			(ArrayList<Document>) doc.get("individual_iterations_results");
		// Build ROSResults document
		results.setSimulationHash(metadata.getString("simulation_hash"));
		results.setPlanFile(metadata.getString("plan_file"));
		results.setWorldFile(metadata.getString("world_file"));
		results.setRobotFile(metadata.getString("robot_file"));
		results.setMapFile(metadata.getString("map_file"));
		results.setDate(metadata.getString("date"));
		results.setnSegments(metadata.getInteger("n_segments"));
		results.setnIterations(metadata.getInteger("n_iterations"));
		results.setTimeoutFactor(metadata.getInteger("timeout_factor"));
		results.setUsefulSimulation(metadata.getBoolean("useful_simulation"));
		results.setLocalPlanner(metadata.getString("local_planner"));
		results.setGlobalPlanner(metadata.getString("global_planner"));
		for(int i = 0; i < results.getnSegments(); i++) {
			ROSSegment segment = new ROSSegment();
			segment.setIndex(i);
			segment.setFailures(globalSegmentsResults.get(i).getInteger("n_failures"));
			segment.setDistanceBetweenObstacles(
					segmentsMetadataList.get(i).getDouble("distance_between_obstacles"));
			segment.setTimeout(
					segmentsMetadataList.get(i).getInteger("segment_simulation_timeout"));
			segment.setTimeAverage(globalSegmentsResults.get(i).getDouble("time_mean"));
			segment.setTimeStandardDeviation(globalSegmentsResults.get(i).getDouble("time_stdev"));
			ArrayList<Double> individualTimes = new ArrayList<Double>();
			// Search individual times (each simulation iteration) for the current segment
			for(int j = 0; j < results.getnIterations(); j++) {
				@SuppressWarnings("unchecked" )
				ArrayList<Document> individualSegmentsResults = 
					(ArrayList<Document>) individualIterationsResults.get(j).get("segments_results");
				individualTimes.add(individualSegmentsResults.get(i).getDouble("time"));
				
			}
			segment.setIndividualTimes(individualTimes);
			results.addSegment(segment);
		}
		return results;
	}
	
	public ROSSegment mergeROSResultsSegment(ArrayList<ROSResults> resultsList, Integer index) {
		if(resultsList != null && resultsList.size() > 1) {
			ArrayList<Double> individualTimes = new ArrayList<Double>();
			ArrayList<Double> individualTimeouts = new ArrayList<Double>();
			ArrayList<Double> individualDistancesBetweenObstacles = new ArrayList<Double>();
			Integer failures = 0;
			for(int i = 0; i < resultsList.size(); i++) {
				ROSSegment tmp = resultsList.get(i).getSegments().get(index);
				failures += tmp.getFailures();
				individualTimes.addAll(tmp.getIndividualTimes());
				individualTimeouts.add(tmp.getTimeout());
				individualDistancesBetweenObstacles.add(tmp.getDistanceBetweenObstacles());
			}
			ROSSegment segment = new ROSSegment();
			segment.setIndex(index);
			segment.setDistanceBetweenObstacles(MathUtil.mean(individualDistancesBetweenObstacles));
			segment.setTimeout(MathUtil.mean(individualTimeouts);
		}
		return null;
	}
	
	public static String generateUniqueSimulationID() {
		return UUID.randomUUID().toString();
	}
	
}
