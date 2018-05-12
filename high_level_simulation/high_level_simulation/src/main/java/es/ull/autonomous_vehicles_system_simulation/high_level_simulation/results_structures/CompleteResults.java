package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures;

import java.util.ArrayList;

import org.bson.Document;

import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.DataProcessing;

public class CompleteResults {
	
	private static PSIGHOSResults psighosResults;
	private static ROSResults rosResults;
	
	/** Get a document object with will allow us to insert the information
	 * of a complete simulation to the db.
	 * @return Mongodb Document */
	public Document getDocument() {

		return new Document("simulationID", DataProcessing.generateUniqueSimulationID())
                .append("lowLevelResults", getRosResults().getDocument())
                .append("highLevelResults", getPsighosResults().getDocument());             
	}
	
	/** @return the psighosResults */
	public static PSIGHOSResults getPsighosResults() {
		return psighosResults;
	}
	
	/** @param psighosResults the psighosResults to set */
	public static void setPsighosResults(PSIGHOSResults psighosResults) {
		CompleteResults.psighosResults = psighosResults;
	}
	
	/** @return the rosResults */
	public static ROSResults getRosResults() {
		return rosResults;
	}
	
	/** @param rosResults the rosResults to set */
	public static void setRosResults(ROSResults rosResults) {
		CompleteResults.rosResults = rosResults;
	}

}
