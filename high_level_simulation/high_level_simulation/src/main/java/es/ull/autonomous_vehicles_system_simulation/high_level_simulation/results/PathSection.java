package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results;

public class PathSection {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	
	private String id;
	private Integer failures;
	private Double timeAverage, distanceAverage, velocityAverage,
		linearVelocityAverage, maximumLinearVelocity, density, obstacleLength, maxObstacleShiftment;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	
	/** Default constructor */
	public PathSection() {
		this("", 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	}
	
	/*************************
	 * CONSTRUCTOR BY FIELDS *
	 ************************/
	
	/** Build this section from fields
	 * @param id Section identifier
	 * @param failures vehicle failures
	 * @param timeAverage Traveled time average for this section
	 * @param distanceAverage Traveled distance average for this section
	 * @param velocityAverage Velocity average for this section (distance / time)
	 * @param linearVelocityAverage Linear velocity average for this section
	 * @param maximumLinearVelocity Maximum linear velocity peak for this section
	 */
	public PathSection(String id, Integer failures, Double timeAverage, Double distanceAverage,
			Double velocityAverage, Double linearVelocityAverage, Double maximumLinearVelocity, 
			Double density, Double obstacleLength, Double maxObstacleShiftment) {
		super();
		this.id = id;
		this.failures = failures;
		this.timeAverage = timeAverage;
		this.distanceAverage = distanceAverage;
		this.velocityAverage = velocityAverage;
		this.linearVelocityAverage = linearVelocityAverage;
		this.maximumLinearVelocity = maximumLinearVelocity;
		this.density = density;
		this.obstacleLength = obstacleLength;
		this.maxObstacleShiftment = maxObstacleShiftment;
	}
	
	/***************
	 * GET AND SET *
	 **************/
	
	/** @return the id */
	public String getId() {
		return id;
	}
	
	/** @param id the id to set */
	public void setId(String id) {
		this.id = id;
	}
	
	/** @return the failures */
	public Integer getFailures() {
		return failures;
	}
	
	/** @param failures the failures to set */
	public void setFailures(Integer failures) {
		this.failures = failures;
	}
	
	/** @return the timeAverage */
	public Double getTimeAverage() {
		return timeAverage;
	}
	
	/** @param timeAverage the timeAverage to set */
	public void setTimeAverage(Double timeAverage) {
		this.timeAverage = timeAverage;
	}
	
	/** @return the distanceAverage */
	public Double getDistanceAverage() {
		return distanceAverage;
	}
	
	/** @param distanceAverage the distanceAverage to set */
	public void setDistanceAverage(Double distanceAverage) {
		this.distanceAverage = distanceAverage;
	}
	
	/** @return the velocityAverage */
	public Double getVelocityAverage() {
		return velocityAverage;
	}
	
	/** @param velocityAverage the velocityAverage to set */
	public void setVelocityAverage(Double velocityAverage) {
		this.velocityAverage = velocityAverage;
	}
	
	/** @return the linearVelocityAverage */
	public Double getLinearVelocityAverage() {
		return linearVelocityAverage;
	}
	
	/** @param linearVelocityAverage the linearVelocityAverage to set */
	public void setLinearVelocityAverage(Double linearVelocityAverage) {
		this.linearVelocityAverage = linearVelocityAverage;
	}
	
	/** @return the maximumLinearVelocity */
	public Double getMaximumLinearVelocity() {
		return maximumLinearVelocity;
	}
	
	/** @param maximumLinearVelocity the maximumLinearVelocity to set */
	public void setMaximumLinearVelocity(Double maximumLinearVelocity) {
		this.maximumLinearVelocity = maximumLinearVelocity;
	}

	/** @return the density */
	public Double getDensity() {
		return density;
	}

	/** @param density the density to set */
	public void setDensity(Double density) {
		this.density = density;
	}

	/** @return the obstacleLength */
	public Double getObstacleLength() {
		return obstacleLength;
	}

	/** @param obstacleLength the obstacleLength to set */
	public void setObstacleLength(Double obstacleLength) {
		this.obstacleLength = obstacleLength;
	}

	/** @return the maxObstacleShiftment */
	public Double getMaxObstacleShiftment() {
		return maxObstacleShiftment;
	}

	/** @param maxObstacleShiftment the maxObstacleShiftment to set */
	public void setMaxObstacleShiftment(Double maxObstacleShiftment) {
		this.maxObstacleShiftment = maxObstacleShiftment;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PathSection [id=" + id + ", failures=" + failures + ", timeAverage=" + timeAverage
				+ ", distanceAverage=" + distanceAverage + ", velocityAverage=" + velocityAverage
				+ ", linearVelocityAverage=" + linearVelocityAverage + ", maximumLinearVelocity="
				+ maximumLinearVelocity + ", density=" + density + ", obstacleLength=" + obstacleLength
				+ ", maxObstacleShiftment=" + maxObstacleShiftment + "]";
	}
	
	

}
