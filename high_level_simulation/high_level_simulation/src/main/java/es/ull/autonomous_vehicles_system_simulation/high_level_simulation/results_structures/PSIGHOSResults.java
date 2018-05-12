package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures;

import java.util.ArrayList;
import java.util.TreeMap;

import org.bson.Document;

import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation.WheelChairsSimulation;
import es.ull.iis.simulation.model.Element;
import es.ull.iis.simulation.model.Resource;
import es.ull.iis.simulation.model.TimeUnit;
import es.ull.iis.util.Statistics;

public class PSIGHOSResults {
	
	private final TreeMap<Element, Long> times = new TreeMap<Element, Long>();
	private final TreeMap<Element, Long> cummWaitForJanitorTimes = new TreeMap<Element, Long>();
	private final TreeMap<Element, Long> waitForJanitorTimes = new TreeMap<Element, Long>();
	private final TreeMap<Element, Long> cummWaitForDoctorTimes = new TreeMap<Element, Long>();
	private final TreeMap<Element, Long> waitForDoctorTimes = new TreeMap<Element, Long>();
	private final TreeMap<Element, Long> appointmentTimes = new TreeMap<Element, Long>();
	private final TreeMap<Element, Long> routeTimes = new TreeMap<Element, Long>();
	private final TreeMap<Element, Long> accomodationTimes = new TreeMap<Element, Long>();
	private final TreeMap<Resource, Long> rTimes = new TreeMap<Resource, Long>();
	private final TreeMap<Resource, Long> janitorUsage = new TreeMap<Resource, Long>();
	private final TreeMap<Resource, Long> doctorUsage = new TreeMap<Resource, Long>();
	private final TreeMap<Resource, Long> aChairUsage = new TreeMap<Resource, Long>();
	private final TreeMap<Resource, Long> mChairUsage = new TreeMap<Resource, Long>();
	private Integer patientEndCounter;
	private Integer aChairCounter;
	private Integer mChairCounter;
	private Integer doctorCounter;
	private Integer janitorCounter;
	private Integer nPatientsWaitForDoctor;
	private Integer nPatientsWaitForJanitor;
	private final Integer nJanitors;
	private final Integer nDoctors;
	private final Integer nAutoChairs;
	private final Integer nManualChairs;
	private final Integer maxJanitors;
	private final Integer maxDoctors;
	private final Integer maxAutoChairs;
	private final Integer maxManualChairs;
	private final Integer patientsPerArrival;
	private final Integer minutesBetweenArrivals;
	private final Double manualFactor;
	private final double unitConversion;
	private long endTs;
	
	/****************
	 * CONSTRUCTORS *
	 ***************/
	public PSIGHOSResults(TimeUnit unit, Integer nJanitors, Integer nDoctors, Integer nAutoChairs, Integer nManualChairs, 
			Integer maxJanitors, Integer maxDoctors, Integer maxAutoChairs, Integer maxManualChairs, 
			Integer patientsPerArrival, Integer minutesBetweenArrivals, Double manualFactor) {
		this.patientEndCounter = 0;
		this.aChairCounter = 0;
		this.mChairCounter = 0;
		this.doctorCounter = 0;
		this.janitorCounter = 0;
		this.nPatientsWaitForDoctor = 0;
		this.nPatientsWaitForJanitor = 0;
		this.nJanitors = nJanitors;
		this.nDoctors = nDoctors;
		this.nAutoChairs = nAutoChairs;
		this.nManualChairs = nManualChairs;
		this.maxJanitors = maxJanitors;
		this.maxDoctors = maxDoctors;
		this.maxAutoChairs = maxAutoChairs;
		this.maxManualChairs = maxManualChairs;
		this.patientsPerArrival = patientsPerArrival;
		this.minutesBetweenArrivals = minutesBetweenArrivals;
		this.manualFactor = manualFactor;
		this.unitConversion = WheelChairsSimulation.unit.convert(1.0, unit);
	}
	
	public PSIGHOSResults(TimeUnit unit, int nJanitors, int nDoctors, int nAutoChairs, int nManualChairs, 
			int patientsPerArrival, int minutesBetweenArrivals, double manualFactor) {
		this(unit, nJanitors, nDoctors, nAutoChairs, nManualChairs, nJanitors, nDoctors, nAutoChairs,
				nManualChairs, patientsPerArrival, minutesBetweenArrivals, manualFactor);
	}
	
	/** Get a document object with will allow us to insert the information
	 * of high level simulation to the db.
	 * @return Mongodb Document */
	public Document getDocument() {
		return new Document("highLevelResults", "data")
                .append("patientEndCounter", getPatientEndCounter())
                .append("aChairCounter", getaChairCounter())
                .append("mChairCounter", getmChairCounter())
                .append("doctorCounter", getDoctorCounter())
                .append("janitorCounter", getJanitorCounter())
                .append("nPatientsWaitForDoctor", getnPatientsWaitForDoctor())
                .append("nPatientsWaitForJanitor", getnPatientsWaitForJanitor())
                .append("nJanitors", getnJanitors())
                .append("nDoctors", getnDoctors())
                .append("nAutoChairs", getnAutoChairs())
                .append("nManualChairs", getnManualChairs())
                .append("maxJanitors", getMaxJanitors())
                .append("maxDoctors", getMaxDoctors())
                .append("maxAutoChairs", getMaxAutoChairs())
                .append("maxManualChairs", getMaxManualChairs())
                .append("patientsPerArrival", getPatientsPerArrival())
                .append("minutesBetweenArrivals", getMinutesBetweenArrivals())
                .append("manualFactor", getManualFactor())
                .append("unitConversion", getUnitConversion())
				.append("resources", getAllResourcesUsage());
                
	}
	
	private Document getAllResourcesUsage() {
		
		final ArrayList<Long> tAChair = new ArrayList<Long>(); 
		final ArrayList<Long> tMChair = new ArrayList<Long>(); 
		final ArrayList<Long> tJanitor = new ArrayList<Long>(); 
		final ArrayList<Long> tDoctor = new ArrayList<Long>(); 
		final ArrayList<ResourceUsage> usages = new ArrayList<ResourceUsage>();
		for (Resource res : rTimes.keySet()) {
			if (res.getDescription().contains(WheelChairsSimulation.STR_AUTO_CHAIR)) {
				tAChair.add((aChairUsage.get(res) == null) ? getEndTs() - rTimes.get(res) : aChairUsage.get(res));
			}
			else if (res.getDescription().contains(WheelChairsSimulation.STR_MANUAL_CHAIR)) {
				tMChair.add((mChairUsage.get(res) == null) ? getEndTs() - rTimes.get(res) : mChairUsage.get(res));
			}
			else if (res.getDescription().contains(WheelChairsSimulation.STR_JANITOR)) {
				tJanitor.add((janitorUsage.get(res) == null) ? getEndTs() - rTimes.get(res) : janitorUsage.get(res));
			}
			else if (res.getDescription().contains(WheelChairsSimulation.STR_DOCTOR)) {
				tDoctor.add((doctorUsage.get(res) == null) ? getEndTs() - rTimes.get(res) : doctorUsage.get(res));
			}
		}
		usages.add(getResourceUsage("aChairs", nAutoChairs, maxAutoChairs, tAChair));
		usages.add(getResourceUsage("mChairs", nManualChairs, maxManualChairs, tMChair));
		usages.add(getResourceUsage("janitors", nJanitors, maxJanitors, tJanitor));
		usages.add(getResourceUsage("doctors", nDoctors, maxDoctors, tDoctor));
		
		return new Document("resources", "resources")
				.append("aChairs", getResourceUsage("aChairs", nAutoChairs, maxAutoChairs, tAChair).getDocument())
				.append("mChairs", getResourceUsage("mChairs", nManualChairs, maxManualChairs, tMChair).getDocument())
				.append("janitors", getResourceUsage("janitors", nJanitors, maxJanitors, tJanitor).getDocument())
				.append("doctors", getResourceUsage("doctors", nDoctors, maxDoctors, tDoctor).getDocument());
	}
	
	private ResourceUsage getResourceUsage(String description, int n, int max, ArrayList<Long> times) {
		int counter = 0, missingValues = 0;
		for (long t : times) {
			counter++;
		}
		for (; counter < n; counter++) {
			times.add(new Long(0));
		}
		for (; counter < max; counter++) {
			missingValues++;
		}
		return new ResourceUsage(description, n, max, missingValues, times);
	}
	
	private static class ResourceUsage {
		
		private static String description;
		private static Integer nInstances, maxInstances, missingValues;
		private static ArrayList<Long> times;
		
		public ResourceUsage(String description, Integer nInstances, Integer  maxInstances, 
				Integer missingValues, ArrayList<Long>  times) {
			ResourceUsage.setDescription(description);
			ResourceUsage.setMaxInstances(maxInstances);
			ResourceUsage.setnInstances(nInstances);
			ResourceUsage.setMissingValues(missingValues);
			ResourceUsage.setTimes(times);
		}
		/** Get a document object with will allow us to insert the information
		 * of the resource usage to the db.
		 * @return Mongodb Document */
		public Document getDocument() {
			return new Document("resource", getDescription())
	                .append("nInstances", getnInstances())
	                .append("maxInstances", getMaxInstances())
	                .append("missingValues", getMissingValues())
	                .append("times", getTimes());
		}
		
		/**
		 * @return the description
		 */
		public static String getDescription() {
			return description;
		}
		/**
		 * @param description the description to set
		 */
		public static void setDescription(String description) {
			ResourceUsage.description = description;
		}
		/**
		 * @return the nInstances
		 */
		public static Integer getnInstances() {
			return nInstances;
		}
		/**
		 * @param nInstances the nInstances to set
		 */
		public static void setnInstances(Integer nInstances) {
			ResourceUsage.nInstances = nInstances;
		}
		/**
		 * @return the maxInstances
		 */
		public static Integer getMaxInstances() {
			return maxInstances;
		}
		/**
		 * @param maxInstances the maxInstances to set
		 */
		public static void setMaxInstances(Integer maxInstances) {
			ResourceUsage.maxInstances = maxInstances;
		}
		/**
		 * @return the missingValues
		 */
		public static Integer getMissingValues() {
			return missingValues;
		}
		/**
		 * @param missingValues the missingValues to set
		 */
		public static void setMissingValues(Integer missingValues) {
			ResourceUsage.missingValues = missingValues;
		}
		/**
		 * @return the times
		 */
		public static ArrayList<Long> getTimes() {
			return times;
		}
		/**
		 * @param times the times to set
		 */
		public static void setTimes(ArrayList<Long> times) {
			ResourceUsage.times = times;
		}
	}
	
	private GeneralTimeStats computeGeneralTimeStats(String description, TreeMap<Element, Long> time) {
		return computeGeneralTimeStats(description, time, time.size());
	}

	private GeneralTimeStats computeGeneralTimeStats(String description, TreeMap<Element, Long> time, int n) {
		double []arrayTimes = new double[time.size()];
		int count = 0;
		long min = Long.MAX_VALUE;
		long max = 0;
		for (long tt : time.values()) {
			arrayTimes[count] = tt;
			if(tt > max)
				max = tt;
			if (tt < min)
				min = tt;
			count++;
		}
		
		return new GeneralTimeStats(description, n, min/unitConversion, max/unitConversion,
				Statistics.average(arrayTimes)/unitConversion, Statistics.stdDev(arrayTimes)/unitConversion);
	}
	
	private static class GeneralTimeStats {
		
		private static String description;
		private static Integer n;
		private static Double min, max, timesAverage, timesDev;
		
		public GeneralTimeStats(String description, Integer n, Double min, Double max, Double timesAverage,
				Double timesDev) {
			GeneralTimeStats.setDescription(description);
			GeneralTimeStats.setN(n);
			GeneralTimeStats.setMin(min);
			GeneralTimeStats.setMax(max);
			GeneralTimeStats.setTimesAverage(timesAverage);
			GeneralTimeStats.setTimesDev(timesDev);
		}

		/** @return the timesAverage */
		public static Double getTimesAverage() {
			return timesAverage;
		}

		/** @param timesAverage the timesAverage to set */
		public static void setTimesAverage(Double timesAverage) {
			GeneralTimeStats.timesAverage = timesAverage;
		}

		/** @return the timesDev */
		public static Double getTimesDev() {
			return timesDev;
		}

		/** @param timesDev the timesDev to set */
		public static void setTimesDev(Double timesDev) {
			GeneralTimeStats.timesDev = timesDev;
		}

		/** @return the min */
		public static Double getMin() {
			return min;
		}

		/** @param min the min to set */
		public static void setMin(Double min) {
			GeneralTimeStats.min = min;
		}

		/** @return the max */
		public static Double getMax() {
			return max;
		}

		/** @param max the max to set */
		public static void setMax(Double max) {
			GeneralTimeStats.max = max;
		}

		/** @return the n */
		public static Integer getN() {
			return n;
		}

		/** @param n the n to set */
		public static void setN(Integer n) {
			GeneralTimeStats.n = n;
		}

		/** @return the description */
		public String getDescription() {
			return description;
		}

		/** @param description the description to set */
		public static void setDescription(String description) {
			GeneralTimeStats.description = description;
		}
		
	}
	
	/***************
	 * GET AND SET *
	 ***************/

	/**
	 * @return the patientEndCounter
	 */
	public Integer getPatientEndCounter() {
		return patientEndCounter;
	}

	/**
	 * @param patientEndCounter the patientEndCounter to set
	 */
	public void setPatientEndCounter(Integer patientEndCounter) {
		this.patientEndCounter = patientEndCounter;
	}

	/**
	 * @return the aChairCounter
	 */
	public Integer getaChairCounter() {
		return aChairCounter;
	}

	/**
	 * @param aChairCounter the aChairCounter to set
	 */
	public void setaChairCounter(Integer aChairCounter) {
		this.aChairCounter = aChairCounter;
	}

	/**
	 * @return the mChairCounter
	 */
	public Integer getmChairCounter() {
		return mChairCounter;
	}

	/**
	 * @param mChairCounter the mChairCounter to set
	 */
	public void setmChairCounter(Integer mChairCounter) {
		this.mChairCounter = mChairCounter;
	}

	/**
	 * @return the doctorCounter
	 */
	public Integer getDoctorCounter() {
		return doctorCounter;
	}

	/**
	 * @param doctorCounter the doctorCounter to set
	 */
	public void setDoctorCounter(Integer doctorCounter) {
		this.doctorCounter = doctorCounter;
	}

	/**
	 * @return the janitorCounter
	 */
	public Integer getJanitorCounter() {
		return janitorCounter;
	}

	/**
	 * @param janitorCounter the janitorCounter to set
	 */
	public void setJanitorCounter(Integer janitorCounter) {
		this.janitorCounter = janitorCounter;
	}

	/**
	 * @return the nPatientsWaitForDoctor
	 */
	public Integer getnPatientsWaitForDoctor() {
		return nPatientsWaitForDoctor;
	}

	/**
	 * @param nPatientsWaitForDoctor the nPatientsWaitForDoctor to set
	 */
	public void setnPatientsWaitForDoctor(Integer nPatientsWaitForDoctor) {
		this.nPatientsWaitForDoctor = nPatientsWaitForDoctor;
	}

	/**
	 * @return the nPatientsWaitForJanitor
	 */
	public Integer getnPatientsWaitForJanitor() {
		return nPatientsWaitForJanitor;
	}

	/**
	 * @param nPatientsWaitForJanitor the nPatientsWaitForJanitor to set
	 */
	public void setnPatientsWaitForJanitor(Integer nPatientsWaitForJanitor) {
		this.nPatientsWaitForJanitor = nPatientsWaitForJanitor;
	}

	/**
	 * @return the times
	 */
	public TreeMap<Element, Long> getTimes() {
		return times;
	}

	/**
	 * @return the cummWaitForJanitorTimes
	 */
	public TreeMap<Element, Long> getCummWaitForJanitorTimes() {
		return cummWaitForJanitorTimes;
	}

	/**
	 * @return the waitForJanitorTimes
	 */
	public TreeMap<Element, Long> getWaitForJanitorTimes() {
		return waitForJanitorTimes;
	}

	/**
	 * @return the cummWaitForDoctorTimes
	 */
	public TreeMap<Element, Long> getCummWaitForDoctorTimes() {
		return cummWaitForDoctorTimes;
	}

	/**
	 * @return the waitForDoctorTimes
	 */
	public TreeMap<Element, Long> getWaitForDoctorTimes() {
		return waitForDoctorTimes;
	}

	/**
	 * @return the appointmentTimes
	 */
	public TreeMap<Element, Long> getAppointmentTimes() {
		return appointmentTimes;
	}

	/**
	 * @return the routeTimes
	 */
	public TreeMap<Element, Long> getRouteTimes() {
		return routeTimes;
	}

	/**
	 * @return the accomodationTimes
	 */
	public TreeMap<Element, Long> getAccomodationTimes() {
		return accomodationTimes;
	}

	/**
	 * @return the rTimes
	 */
	public TreeMap<Resource, Long> getrTimes() {
		return rTimes;
	}

	/**
	 * @return the janitorUsage
	 */
	public TreeMap<Resource, Long> getJanitorUsage() {
		return janitorUsage;
	}

	/**
	 * @return the doctorUsage
	 */
	public TreeMap<Resource, Long> getDoctorUsage() {
		return doctorUsage;
	}

	/**
	 * @return the aChairUsage
	 */
	public TreeMap<Resource, Long> getaChairUsage() {
		return aChairUsage;
	}

	/**
	 * @return the mChairUsage
	 */
	public TreeMap<Resource, Long> getmChairUsage() {
		return mChairUsage;
	}

	/**
	 * @return the nJanitors
	 */
	public Integer getnJanitors() {
		return nJanitors;
	}

	/**
	 * @return the nDoctors
	 */
	public Integer getnDoctors() {
		return nDoctors;
	}

	/**
	 * @return the nAutoChairs
	 */
	public Integer getnAutoChairs() {
		return nAutoChairs;
	}

	/**
	 * @return the nManualChairs
	 */
	public Integer getnManualChairs() {
		return nManualChairs;
	}

	/**
	 * @return the maxJanitors
	 */
	public Integer getMaxJanitors() {
		return maxJanitors;
	}

	/**
	 * @return the maxDoctors
	 */
	public Integer getMaxDoctors() {
		return maxDoctors;
	}

	/**
	 * @return the maxAutoChairs
	 */
	public Integer getMaxAutoChairs() {
		return maxAutoChairs;
	}

	/**
	 * @return the maxManualChairs
	 */
	public Integer getMaxManualChairs() {
		return maxManualChairs;
	}

	/**
	 * @return the patientsPerArrival
	 */
	public Integer getPatientsPerArrival() {
		return patientsPerArrival;
	}

	/**
	 * @return the minutesBetweenArrivals
	 */
	public Integer getMinutesBetweenArrivals() {
		return minutesBetweenArrivals;
	}

	/**
	 * @return the manualFactor
	 */
	public Double getManualFactor() {
		return manualFactor;
	}
	
	/**
	 * @return the unitConversion
	 */
	public double getUnitConversion() {
		return unitConversion;
	}

	/**
	 * @return the endTs
	 */
	public long getEndTs() {
		return endTs;
	}

	/**
	 * @param endTs the endTs to set
	 */
	public void setEndTs(long endTs) {
		this.endTs = endTs;
	}

	

}
