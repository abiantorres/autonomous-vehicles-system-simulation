package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;

import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities.DataProcessing;
import es.ull.iis.simulation.model.Experiment;
import es.ull.iis.simulation.model.Simulation;
import es.ull.iis.simulation.model.TimeUnit;

public class WheelChairsExperiment extends Experiment{
	
	private static ROSResults results;
	private static Integer nJanitors, nDoctors, nMChairs, nAChairs, nPatientsPerArrival,
		nMinutesBetweenArrivals;
	private static Double manualFactor;
	private static Long startTime, endTime;
		
	/** Build a wheel chairs model experiment
	 * @param nExperiments Number of experiments
	 * @param results results ROS results
	 * @param nJanitors Number of janitors
	 * @param nDoctors Number of doctors
	 * @param nMChairs Number of manual chairs
	 * @param nMChairs Number of Autonomous chairs
	 * @param nPatientsPerArrival Number of patients per arrival
	 * @param nMinutesBetweenArrivals Number of minutes between arrivals
	 * @param manualFactor Manual chairs simulation time factor */
	public WheelChairsExperiment(Integer nExperiments, ROSResults results, Integer nJanitors, Integer nDoctors,
			Integer nMChairs, Integer nAChairs,Integer nPatientsPerArrival, Integer nMinutesBetweenArrivals,
			Double manualFactor, Long startTime, Long endTime) {
		// Set a unique description as an id
		super(DataProcessing.generateUniqueSimulationID(), nExperiments);
		
		WheelChairsExperiment.results = results;
		WheelChairsExperiment.nJanitors = nJanitors;
		WheelChairsExperiment.nDoctors = nDoctors;
		WheelChairsExperiment.nMChairs = nMChairs;
		WheelChairsExperiment.nAChairs = nAChairs;
		WheelChairsExperiment.nPatientsPerArrival = nPatientsPerArrival;
		WheelChairsExperiment.nMinutesBetweenArrivals = nMinutesBetweenArrivals;
		WheelChairsExperiment.manualFactor = manualFactor;
		WheelChairsExperiment.startTime = startTime;
		WheelChairsExperiment.endTime = endTime;
	}

	@Override
	public Simulation getSimulation(int ind) {
		Simulation sim = new WheelChairsSimulation(Integer.parseInt(super.description), getnJanitors(), getnDoctors(), 
				getnAChairs(), getnMChairs(), getnPatientsPerArrival(), getnMinutesBetweenArrivals(),
				manualFactor, results, getStartTime(), getEndTime());
		sim.addInfoReceiver(new WheelchairInfoListener(TimeUnit.MINUTE, getnJanitors(), 
				getnDoctors(), getnAChairs(), getnMChairs(), getnJanitors(), 
				getnDoctors(), getnAChairs(), getnMChairs(), getnPatientsPerArrival(), 
				getnMinutesBetweenArrivals(), manualFactor, false, results));
		return sim;
	}

	/** @return the results */
	public static ROSResults getResults() {
		return results;
	}

	/** @param results the results to set */
	public static void setResults(ROSResults results) {
		WheelChairsExperiment.results = results;
	}

	/** @return the nJanitors */
	public static Integer getnJanitors() {
		return nJanitors;
	}

	/** @param nJanitors the nJanitors to set */
	public static void setnJanitors(Integer nJanitors) {
		WheelChairsExperiment.nJanitors = nJanitors;
	}

	/** @return the nDoctors */
	public static Integer getnDoctors() {
		return nDoctors;
	}

	/** @param nDoctors the nDoctors to set */
	public static void setnDoctors(Integer nDoctors) {
		WheelChairsExperiment.nDoctors = nDoctors;
	}

	/** @return the nMChairs */
	public static Integer getnMChairs() {
		return nMChairs;
	}

	/** @param nMChairs the nMChairs to set */
	public static void setnMChairs(Integer nMChairs) {
		WheelChairsExperiment.nMChairs = nMChairs;
	}

	/** @return the nAChairs */
	public static Integer getnAChairs() {
		return nAChairs;
	}

	/** @param nAChairs the nAChairs to set */
	public static void setnAChairs(Integer nAChairs) {
		WheelChairsExperiment.nAChairs = nAChairs;
	}

	/** @return the nPatientsPerArrival */
	public static Integer getnPatientsPerArrival() {
		return nPatientsPerArrival;
	}

	/** @param nPatientsPerArrival the nPatientsPerArrival to set */
	public static void setnPatientsPerArrival(Integer nPatientsPerArrival) {
		WheelChairsExperiment.nPatientsPerArrival = nPatientsPerArrival;
	}

	/** @return the nMinutesBetweenArrivals */
	public static Integer getnMinutesBetweenArrivals() {
		return nMinutesBetweenArrivals;
	}

	/** @param nMinutesBetweenArrivals the nMinutesBetweenArrivals to set */
	public static void setnMinutesBetweenArrivals(Integer nMinutesBetweenArrivals) {
		WheelChairsExperiment.nMinutesBetweenArrivals = nMinutesBetweenArrivals;
	}

	/** @return the manualFactor */
	public static Double getManualFactor() {
		return manualFactor;
	}

	/** @param manualFactor the manualFactor to set */
	public static void setManualFactor(Double manualFactor) {
		WheelChairsExperiment.manualFactor = manualFactor;
	}

	/** @return the startTime */
	public static Long getStartTime() {
		return startTime;
	}

	/** @param startTime the startTime to set */
	public static void setStartTime(Long startTime) {
		WheelChairsExperiment.startTime = startTime;
	}

	/** @return the endTime */
	public static Long getEndTime() {
		return endTime;
	}

	/** @param endTime the endTime to set */
	public static void setEndTime(Long endTime) {
		WheelChairsExperiment.endTime = endTime;
	}
	
	

	
}
