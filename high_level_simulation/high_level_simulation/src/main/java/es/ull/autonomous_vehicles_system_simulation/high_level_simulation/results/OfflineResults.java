package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results;

import java.util.ArrayList;

public class OfflineResults {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	
	private String planFile, date;
	private Integer simulations, globalFailures;
	private Double globalTimeAverage, globalVelocityAverage, 
		globalLinearVelocityAverage, globalMaximumLinearVelocity, globalDistanceAverage;
	private ArrayList<PathSection> sections;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	
	public OfflineResults() {
		this("", "", 0, 0, 0.0, 0.0, 0.0, 0.0, 0.0, new ArrayList<PathSection>());
	}
	
	/*************************
	 * CONSTRUCTOR BY FIELDS *
	 ************************/
	
	/** Build this from fields
	 * @param planFile ROS simulation plan file name
	 * @param date Date when the ROS simulation was executed
	 * @param simulations Number of simulations executed in ROS
	 * @param globalFailures Number of failures counted for all ROS simulations executed
	 * @param globalTimeAverage Traveled time average to finished all the plan
	 * @param globalVelocityAverage Global velocity average (distance / traveled time)
	 * @param globalLinearVelocityAverage Global linear velocity average 
	 * @param globalMaximumLinearVelocity Maximum linear velocity peak
	 * @param sections Information for each plan section
	 */
	public OfflineResults(String planFile, String date, Integer simulations,
			Integer globalFailures, Double globalTimeAverage, Double globalVelocityAverage,
			Double globalLinearVelocityAverage, Double globalMaximumLinearVelocity, 
			Double globalDistanceAverage, ArrayList<PathSection> sections) {
		super();
		this.planFile = planFile;
		this.date = date;
		this.simulations = simulations;
		this.globalFailures = globalFailures;
		this.globalTimeAverage = globalTimeAverage;
		this.globalVelocityAverage = globalVelocityAverage;
		this.globalLinearVelocityAverage = globalLinearVelocityAverage;
		this.globalMaximumLinearVelocity = globalMaximumLinearVelocity;
		this.globalDistanceAverage = globalDistanceAverage;
		this.sections = sections;
	}
	
	/***********
	 * METHODS *
	 **********/
	
	/** Add a section results
	 * @param section new section results */
	public void addSection(PathSection section) {
		sections.add(section);
	}
	
	/** Add a section results 
	 * @param id Section identifier
	 * @param failures vehicle failures
	 * @param timeAverage Traveled time average for this section
	 * @param distanceAverage Traveled distance average for this section
	 * @param velocityAverage Velocity average for this section (distance / time)
	 * @param linearVelocityAverage Linear velocity average for this section
	 * @param maximumLinearVelocity Maximum linear velocity peak for this section
	 */
	public void addSection(String id, Integer failures, Double timeAverage, 
			Double distanceAverage,Double velocityAverage, Double linearVelocityAverage, 
			Double maximumLinearVelocity, Double globalDistanceAverage) {
		getSections().add(new PathSection(id, failures, timeAverage, distanceAverage, 
				velocityAverage, linearVelocityAverage, maximumLinearVelocity));
	}

	/***************
	 * GET AND SET *
	 **************/
	
	/** @return the planFile */
	public String getPlanFile() {
		return planFile;
	}
	
	/** @param planFile the planFile to set */
	public void setPlanFile(String planFile) {
		this.planFile = planFile;
	}
	/** @return the date */
	public String getDate() {
		return date;
	}
	/** @param date the date to set */
	public void setDate(String date) {
		this.date = date;
	}
	
	/** @return the simulations */
	public Integer getSimulations() {
		return simulations;
	}
	
	/** @param simulations the simulations to set */
	public void setSimulations(Integer simulations) {
		this.simulations = simulations;
	}
	
	/** @return the globalFailures */
	public Integer getGlobalFailures() {
		return globalFailures;
	}
	
	/** @param globalFailures the globalFailures to set */
	public void setGlobalFailures(Integer globalFailures) {
		this.globalFailures = globalFailures;
	}
	
	/** @return the globalTimeAverage */
	public Double getGlobalTimeAverage() {
		return globalTimeAverage;
	}
	
	/** @param globalTimeAverage the globalTimeAverage to set */
	public void setGlobalTimeAverage(Double globalTimeAverage) {
		this.globalTimeAverage = globalTimeAverage;
	}
	/** @return the globalVelocityAverage */
	public Double getGlobalVelocityAverage() {
		return globalVelocityAverage;
	}
	
	/** @param globalVelocityAverage the globalVelocityAverage to set */
	public void setGlobalVelocityAverage(Double globalVelocityAverage) {
		this.globalVelocityAverage = globalVelocityAverage;
	}
	
	/** @return the globalLinearVelocityAverage */
	public Double getGlobalLinearVelocityAverage() {
		return globalLinearVelocityAverage;
	}
	/** @param globalLinearVelocityAverage the globalLinearVelocityAverage to set */
	public void setGlobalLinearVelocityAverage(Double globalLinearVelocityAverage) {
		this.globalLinearVelocityAverage = globalLinearVelocityAverage;
	}
	
	/** @return the globalMaximumLinearVelocity */
	public Double getGlobalMaximumLinearVelocity() {
		return globalMaximumLinearVelocity;
	}
	
	/** @param globalMaximumLinearVelocity the globalMaximumLinearVelocity to set */
	public void setGlobalMaximumLinearVelocity(Double globalMaximumLinearVelocity) {
		this.globalMaximumLinearVelocity = globalMaximumLinearVelocity;
	}
	
	/** @return the sections */
	public ArrayList<PathSection> getSections() {
		return sections;
	}
	/** @param sections the sections to set */
	public void setSections(ArrayList<PathSection> sections) {
		this.sections = sections;
	}

	/** @return the globalDistanceAverage */
	public Double getGlobalDistanceAverage() {
		return globalDistanceAverage;
	}

	/** @param globalDistanceAverage the globalDistanceAverage to set */
	public void setGlobalDistanceAverage(Double globalDistanceAverage) {
		this.globalDistanceAverage = globalDistanceAverage;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "OfflineResults [planFile=" + planFile + ", date=" + date + 
				", simulations=" + simulations
				+ ", globalFailures=" + globalFailures + ", globalTimeAverage=" + 
				globalTimeAverage
				+ ", globalVelocityAverage=" + globalVelocityAverage + 
				", globalLinearVelocityAverage="
				+ globalLinearVelocityAverage + ", globalMaximumLinearVelocity=" + 
				globalMaximumLinearVelocity
				+ ", globalDistanceAverage=" + globalDistanceAverage + ", sections=" + 
				sections + "]";
	}
	
}
