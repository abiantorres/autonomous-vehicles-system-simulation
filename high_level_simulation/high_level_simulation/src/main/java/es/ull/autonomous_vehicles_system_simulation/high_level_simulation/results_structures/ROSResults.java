package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures;

import java.util.ArrayList;
import org.bson.Document;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation.ElementReplicableTimeFunction;

public class ROSResults {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	
	private ROSSimulationMetadata metadata;
	private String date, localPlanner, globalPlanner;
	private Integer nFailures, nIterations, nSegments, timeoutFactor;
	private Boolean usefulSimulation, merged;
	private ArrayList<ROSSegment> segments;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	
	public ROSResults() {
		this("", "", "", "", "", "", "", "", 0, 0, 0, 0, false, new ArrayList<ROSSegment> (), false);
	}
	
	/*************************
	 * CONSTRUCTOR BY FIELDS *
	 ************************/
	
	/**
	 * @param simulationHash
	 * @param planFile
	 * @param robotFile
	 * @param worldFile
	 * @param mapFile
	 * @param date
	 * @param localPlanner
	 * @param globalPlanner
	 * @param nFailures
	 * @param nIterations
	 * @param nSegments
	 * @param timeoutFactor
	 * @param usefulSimulation
	 * @param segments */
	public ROSResults(String simulationHash, String planFile, String robotFile, String worldFile, String mapFile,
			String date, String localPlanner, String globalPlanner, Integer nFailures, Integer nIterations,
			Integer nSegments, Integer timeoutFactor, Boolean usefulSimulation, ArrayList<ROSSegment> segments, Boolean merged) {
		super();
		this.metadata = new ROSSimulationMetadata();
		this.metadata.setSimulationHash(simulationHash);
		this.metadata.setPlanFile(planFile);
		this.metadata.setRobotFile(robotFile);
		this.metadata.setWorldFile(worldFile);
		this.metadata.setMapFile(mapFile);
		this.date = date;
		this.localPlanner = localPlanner;
		this.globalPlanner = globalPlanner;
		this.nFailures = nFailures;
		this.nIterations = nIterations;
		this.nSegments = nSegments;
		this.timeoutFactor = timeoutFactor;
		this.usefulSimulation = usefulSimulation;
		this.segments = segments;
		this.merged = merged;
	}
	
	/***********
	 * METHODS *
	 **********/
	
	/** Get a document object with will allow us to insert the information
	 * of this path simulation to the db.
	 * @return Mongodb Document */
	public Document getDocument() {
		// Get all sections documents
		ArrayList<Document> segmentsDocuments = new ArrayList<Document>();
		for(int i = 0; i < getSegments().size(); i++) {
			segmentsDocuments.add(getSegments().get(i).getDocument());
		}
		return new Document("simulationHash", getMetadata().getSimulationHash())
                .append("planFile", getMetadata().getPlanFile())
                .append("worldFile", getMetadata().getWorldFile())
                .append("robotFile", getMetadata().getRobotFile())
                .append("mapFile", getMetadata().getMapFile())
                .append("date", getDate())
                .append("nFailures", getnFailures())
                .append("nIterations", getnIterations())
                .append("nSegments", getnSegments())
                .append("timeoutFactor", getTimeoutFactor())
                .append("usefulSimulation", getUsefulSimulation())
                .append("localPlanner", getLocalPlanner())
                .append("globalPlanner", getGlobalPlanner())
                .append("segments", segmentsDocuments)    
				.append("merged", getMerged());
	}
	
	/** Add a section results
	 * @param section new section results */
	public void addSegment(ROSSegment segment) {
		segments.add(segment);
	}
	
	/** Add a section results 
	 * @param id Section identifier
	 * @param failures vehicle failures
	 * @param timeAverage Traveled time average for this section
	 * @param distanceAverage Traveled distance average for this section
	 * @param velocityAverage Velocity average for this section (distance / time)
	 * @param linearVelocityAverage Linear velocity average for this section
	 * @param maximumLinearVelocity Maximum linear velocity peak for this section
	 * @param density density of obstacle for this seg,e
	 * @param obstacleLength
	 * @param maxObstacleShiftment
	 * @param timeStandardDeviation */
	public void addSegment(String id, Integer failures, Double timeAverage, 
			Double distanceAverage,Double velocityAverage, Double linearVelocityAverage, 
			Double maximumLinearVelocity, Double density, Double obstacleLength, Double maxObstacleShiftment,
			Double timeStandardDeviation) {
		getSegments().add(new ROSSegment());
	}
	
	
	/**
	 * Get a replicable time function array instance from all segment statistics.
	 * This time functions are builded using a random normal distribution.
	 * @return An element replicable time function instance.
	 */
	public ArrayList<ElementReplicableTimeFunction> getElementReplicableTimeFunctions() {
		
		return new ArrayList<ElementReplicableTimeFunction>() {
			private static final long serialVersionUID = 1441472047785325027L;
		{
			for (int i = 0; i < getSegments().size(); i++) {
				add(getSegments().get(i).getElementReplicableTimeFunction());
			}
		}};
	}

	/***************
	 * GET AND SET *
	 **************/
	
	/** @return the planFile */
	public String getPlanFile() {
		return this.getMetadata().getPlanFile();
	}
	
	/** @param planFile the planFile to set */
	public void setPlanFile(String planFile) {
		this.getMetadata().setPlanFile(planFile);
	}
	
	/** @return the date */
	public String getDate() {
		return date;
	}
	/** @param date the date to set */
	public void setDate(String date) {
		this.date = date;
	}
	
	/** @return the sections */
	public ArrayList<ROSSegment> getSegments() {
		return segments;
	}
	/** @param sections the sections to set */
	public void setSegments(ArrayList<ROSSegment> segments) {
		this.segments = segments;
	}

	/** @return the localPlanner */
	public String getLocalPlanner() {
		return localPlanner;
	}

	/** @param localPlanner the localPlanner to set */
	public void setLocalPlanner(String localPlanner) {
		this.localPlanner = localPlanner;
	}

	/** @return the globalPlanner */
	public String getGlobalPlanner() {
		return globalPlanner;
	}

	/** @param globalPlanner the globalPlanner to set */
	public void setGlobalPlanner(String globalPlanner) {
		this.globalPlanner = globalPlanner;
	}

	public String getSimulationHash() {
		return this.getMetadata().getSimulationHash();
	}

	public void setSimulationHash(String simulationHash) {
		this.getMetadata().setSimulationHash(simulationHash);
	}

	public String getRobotFile() {
		return this.getMetadata().getRobotFile();
	}

	public void setRobotFile(String robotFile) {
		this.getMetadata().setRobotFile(robotFile);
	}

	public String getWorldFile() {
		return this.getMetadata().getWorldFile();
	}

	public void setWorldFile(String worldFile) {
		this.getMetadata().setWorldFile(worldFile);
	}

	public String getMapFile() {
		return this.getMetadata().getMapFile();
	}

	public void setMapFile(String mapFile) {
		this.getMetadata().setMapFile(mapFile);
	}

	public Integer getnFailures() {
		return nFailures;
	}

	public void setnFailures(Integer nFailures) {
		this.nFailures = nFailures;
	}

	public Integer getnIterations() {
		return nIterations;
	}

	public void setnIterations(Integer nIterations) {
		this.nIterations = nIterations;
	}

	public Integer getnSegments() {
		return nSegments;
	}

	public void setnSegments(Integer nSegments) {
		this.nSegments = nSegments;
	}

	public Integer getTimeoutFactor() {
		return timeoutFactor;
	}

	public void setTimeoutFactor(Integer timeoutFactor) {
		this.timeoutFactor = timeoutFactor;
	}

	public Boolean getUsefulSimulation() {
		return usefulSimulation;
	}

	public void setUsefulSimulation(Boolean usefulSimulation) {
		this.usefulSimulation = usefulSimulation;
	}
	
	/** @return the metadata */
	public ROSSimulationMetadata getMetadata() {
		return metadata;
	}

	/** @param metadata the metadata to set */
	public void setMetadata(ROSSimulationMetadata metadata) {
		this.metadata = metadata;
	}
	
	/** @return the merged */
	public Boolean getMerged() {
		return merged;
	}

	/** @param merged the merged to set */
	public void setMerged(Boolean merged) {
		this.merged = merged;
	}

	/*************
	 * TO STRING *
	 ************/
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ROSResults [metadata=" + metadata + ", date=" + date + ", localPlanner=" + localPlanner
				+ ", globalPlanner=" + globalPlanner + ", nFailures=" + nFailures + ", nIterations=" + nIterations
				+ ", nSegments=" + nSegments + ", timeoutFactor=" + timeoutFactor + ", usefulSimulation="
				+ usefulSimulation + ", segments=" + segments + "]";
	}
		

}
