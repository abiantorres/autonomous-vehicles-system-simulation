package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

//JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

// ROS simulation results components
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results.OfflineResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results.PathSection;

final public class DataProcessing {
	
	/***********
	 * METHODS *
	 **********/
	
	public static OfflineResults parseOfflineResultsJson(JsonNode data) {
		/* Explores the JSON tree obtained from ROS in search of the main content of 
		 * the message, and return an OfflineRosResults which will be used by the
		 * PSIGHOS simulation*/
		OfflineResults results = new OfflineResults();
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
		// Travel over the array searching for each section information
		final JsonNode sections = data.get("msg").get("sections");
		if(sections.isArray()) {
			for(final JsonNode sectionNode : sections) {
				PathSection section = new PathSection();
				section.setId(sectionNode.get("id").textValue());
				section.setTimeAverage(sectionNode.get("time_average").doubleValue());
				section.setDistanceAverage(sectionNode.get("distance_average").doubleValue());
				section.setVelocityAverage(sectionNode.get("velocity_average").doubleValue());
				section.setLinearVelocityAverage(
						sectionNode.get("linear_velocity_average").doubleValue());
				section.setMaximumLinearVelocity(
						sectionNode.get("maximum_linear_velocity").doubleValue());
				section.setFailures(sectionNode.get("failures").intValue());
				results.addSection(section);
			}
		}
		return results;
	}
	
	public static DBObject getOfflineResultsDbObject(JsonNode data) {
		return (DBObject)JSON.parse(data.get("msg").asText());
	}
}
