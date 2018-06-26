package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.bson.Document;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation.WheelChairsExperiment;


public class CompleteResults {
	
	private static PSIGHOSResults psighosResults;
	private static ROSResults rosResults;
	private static String simulationHash;
	
	public CompleteResults(PSIGHOSResults psighosResults, ROSResults rosResults) {
		CompleteResults.psighosResults =  psighosResults;
		CompleteResults.rosResults =  rosResults;
		CompleteResults.simulationHash = WheelChairsExperiment.simulationHash;
	}
	
	/** Get a document object with will allow us to insert the information
	 * of a complete simulation to the db.
	 * @return Mongodb Document */
	public Document getDocument() {
		// New date
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String newDate = dateFormat.format(date); //2016/11/16 12:08:43	
		
		return new Document("simulationID", CompleteResults.simulationHash)
				.append("date", newDate)
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

	/** @return the simulationHash */
	public static String getSimulationHash() {
		return simulationHash;
	}

	/** @param simulationHash the simulationHash to set */
	public static void setSimulationHash(String simulationHash) {
		CompleteResults.simulationHash = simulationHash;
	}

}
