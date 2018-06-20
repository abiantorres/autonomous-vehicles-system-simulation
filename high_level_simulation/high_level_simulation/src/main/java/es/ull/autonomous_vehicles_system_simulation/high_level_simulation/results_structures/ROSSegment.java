package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures;

import java.util.ArrayList;
import java.util.Collections;

import org.bson.Document;

import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation.ElementReplicableTimeFunction;
import es.ull.iis.function.TimeFunctionFactory;

/**
 * @author parallels
 *
 */
public class ROSSegment {
	
	/**************
	 * ATRIBUTTES *
	 *************/
	
	private Integer index, failures, timeout;
	private Double timeAverage, timeStandardDeviation, distanceBetweenObstacles, maximumTime,
		minimumTime;
	private ArrayList<Double> individualTimes;

	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	
	/** Default constructor */
	public ROSSegment() {
		this(0, 0, 0.0, 0.0, 0.0, new ArrayList<Double>());
	}
	
	/*************************
	 * CONSTRUCTOR BY FIELDS *
	 ************************/
	
	public ROSSegment(Integer index, Integer failures, Double timeAverage, Double timeStandardDeviation,
			Double distanceBetweenObstacles, ArrayList<Double> individualTimes) {
		super();
		this.index = index;
		this.failures = failures;
		this.timeAverage = timeAverage;
		this.timeStandardDeviation = timeStandardDeviation;
		this.distanceBetweenObstacles = distanceBetweenObstacles;
		this.individualTimes = individualTimes;
		this.setIndividualTimes(individualTimes);
	}	

	
	/***********
	 * METHODS *
	 **********/
	
	/** Get a document object with will allow us to insert the information
	 * of this path segment to the db.
	 * @return Mongodb Document */
	public Document getDocument() {
		return new Document("index", getIndex())
                .append("failures", getFailures())
                .append("timeout", getTimeout())
                .append("timeStandardDeviation", getTimeStandardDeviation())
                .append("timeAverage", getTimeAverage())
                .append("distanceBetweenObstacles", getDistanceBetweenObstacles())
				.append("maximumTime", getMaximumTime())
				.append("individualTimes", getIndividualTimes())
				.append("minimumTime", getMinimumTime());
	}
	
	
	/**
	 * Get a replicable time function instance from this segment statistics.
	 * This time function is builded using a random normal distribution.
	 * @return An element replicable time function instance. */
	public ElementReplicableTimeFunction getElementReplicableTimeFunction() {
		return new ElementReplicableTimeFunction(
				TimeFunctionFactory.getInstance("NormalVariate", getTimeAverage(), getTimeStandardDeviation()));
	}

	/***************
	 * GET AND SET *
	 **************/

	
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

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public Double getTimeStandardDeviation() {
		return this.timeStandardDeviation;
	}

	public void setTimeStandardDeviation(Double timeStandardDeviation) {
		this.timeStandardDeviation = timeStandardDeviation;
	}

	public Double getDistanceBetweenObstacles() {
		return distanceBetweenObstacles;
	}

	public void setDistanceBetweenObstacles(Double distanceBetweenObstacles) {
		this.distanceBetweenObstacles = distanceBetweenObstacles;
	}

	public ArrayList<Double> getIndividualTimes() {
		return individualTimes;
	}

	public void setIndividualTimes(ArrayList<Double> individualTimes) {
		this.individualTimes = individualTimes;
		if(individualTimes.size() != 0) {
			this.maximumTime = Collections.max(individualTimes);
			this.minimumTime = Collections.min(individualTimes);
		}
		else {
			this.maximumTime = 0.0d;
			this.minimumTime = 0.0d;
		}
	}

	/** @return the timeout */
	public Integer getTimeout() {
		return timeout;
	}

	/** @param timeout the timeout to set */
	public void setTimeout(Integer timeout) {
		this.timeout = timeout;
	}

	/** @return the maximumTime */
	public Double getMaximumTime() {
		return maximumTime;
	}

	/** @param maximumTime the maximumTime to set */
	public void setMaximumTime(Double maximumTime) {
		this.maximumTime = maximumTime;
	}

	/**
	 * @return the minimumTime
	 */
	public Double getMinimumTime() {
		return minimumTime;
	}

	/**
	 * @param minimumTime the minimumTime to set
	 */
	public void setMinimumTime(Double minimumTime) {
		this.minimumTime = minimumTime;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ROSSegment [index=" + index + ", failures=" + failures + ", timeout=" + timeout + ", timeAverage="
				+ timeAverage + ", timeStandardDeviation=" + timeStandardDeviation + ", distanceBetweenObstacles="
				+ distanceBetweenObstacles + ", individualTimes=" + individualTimes + "]";
	}
	




}
