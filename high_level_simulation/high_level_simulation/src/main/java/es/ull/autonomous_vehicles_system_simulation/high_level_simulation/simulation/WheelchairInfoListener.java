package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Map.Entry;
import java.util.TreeMap;

import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.PSIGHOSResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.iis.simulation.info.ElementActionInfo;
import es.ull.iis.simulation.info.ElementInfo;
import es.ull.iis.simulation.info.ResourceUsageInfo;
import es.ull.iis.simulation.info.SimulationEndInfo;
import es.ull.iis.simulation.info.SimulationInfo;
import es.ull.iis.simulation.inforeceiver.View;
import es.ull.iis.simulation.model.Element;
import es.ull.iis.simulation.model.Resource;
import es.ull.iis.simulation.model.TimeUnit;
import es.ull.iis.util.Statistics;

public class WheelchairInfoListener extends View {
	/**************
	 * ATTRIBUTES *
	 *************/
	private final static String MISSING_VALUE = ".";
	private final boolean detailed;
	private final double unitConversion;
	private static PrintStream out = System.out;
	private static PSIGHOSResults psighosResults;
	private static ROSResults rosResults;
	
	/****************
	 * CONSTRUCTORS *
	 ***************/
	public WheelchairInfoListener(TimeUnit unit, Integer nJanitors, Integer nDoctors, Integer nAutoChairs,
			Integer nManualChairs, Integer maxJanitors, Integer maxDoctors, Integer maxAutoChairs, 
			Integer maxManualChairs, Integer patientsPerArrival, Integer minutesBetweenArrivals,
			Double manualFactor, Boolean detailed, ROSResults rosResults) {
		super("Information listener for wheel chairs simulation");
		this.detailed = detailed;
		WheelchairInfoListener.setResults(new PSIGHOSResults(unit, nJanitors, nDoctors, nAutoChairs, nManualChairs, 
				maxJanitors, maxDoctors, maxAutoChairs, maxManualChairs, patientsPerArrival,
				minutesBetweenArrivals, manualFactor));
		WheelchairInfoListener.setRosResults(rosResults);
		this.unitConversion = WheelChairsSimulation.unit.convert(1.0, unit);
		addEntrance(ResourceUsageInfo.class);
		addEntrance(ElementInfo.class);
		addEntrance(ElementActionInfo.class);
		addEntrance(SimulationEndInfo.class);
	}
	
	public WheelchairInfoListener(TimeUnit unit, int nJanitors, int nDoctors, int nAutoChairs, int nManualChairs, 
			int patientsPerArrival, int minutesBetweenArrivals, double manualFactor,
			boolean detailed, ROSResults rosResults) {
		this(unit, nJanitors, nDoctors, nAutoChairs, nManualChairs, nJanitors, nDoctors, nAutoChairs,
				nManualChairs, patientsPerArrival, minutesBetweenArrivals, manualFactor, detailed, rosResults);
	}
	
	/***********
	 * METHODS *
	 **********/
	@Override
	public void infoEmited(SimulationInfo info) {
		// Capture and procces information
		if (info instanceof ElementInfo) {
			final ElementInfo eInfo = (ElementInfo)info;
			
			if (eInfo.getType() == ElementInfo.Type.START) {
				getResults().getTimes().put(eInfo.getElement(), -eInfo.getTs());
				if (detailed)
					out.println(eInfo.getElement() + "\tARRIVE\t" + (- 
							getResults().getTimes().get(eInfo.getElement())));
			}
			else {
				long initTime = getResults().getTimes().get(eInfo.getElement());
				getResults().getTimes().put(eInfo.getElement(), eInfo.getTs() + initTime);
				if (detailed)
					out.println(eInfo.getElement() + "\tLEAVE\t" + 
							getResults().getTimes().get(eInfo.getElement()));
				getResults().setPatientEndCounter(getResults().getPatientEndCounter() + 1);
			}
			
		}
		else if (info instanceof ElementActionInfo) {
			final ElementActionInfo eInfo = (ElementActionInfo)info; 
			switch(eInfo.getType()) {
			case ACQ:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) | 
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					final long t = eInfo.getTs() - getResults().getWaitForDoctorTimes().get(eInfo.getElement());
					if (t > 0) {
						getResults().setnPatientsWaitForDoctor(getResults().getnPatientsWaitForDoctor() + 1);
					}
					if (getResults().getCummWaitForDoctorTimes().containsKey(eInfo.getElement())) {
						getResults().getCummWaitForDoctorTimes().put(eInfo.getElement(),
								getResults().getCummWaitForDoctorTimes().get(eInfo.getElement()) + t);
					}
					else {
						getResults().getCummWaitForDoctorTimes().put(eInfo.getElement(), t);
					}
				}
				else {
					final long t = eInfo.getTs() - getResults().getWaitForJanitorTimes().get(eInfo.getElement());
					if (!getResults().getCummWaitForJanitorTimes().containsKey(eInfo.getElement())) {
						getResults().getCummWaitForJanitorTimes().put(eInfo.getElement(), t);
						if (t > 0) {
							getResults().setnPatientsWaitForJanitor(getResults().getnPatientsWaitForJanitor() + 1);
						}
					}
					else if (t > 0) {
						getResults().getCummWaitForJanitorTimes().put(eInfo.getElement(),
								getResults().getCummWaitForJanitorTimes().get(eInfo.getElement()) + t);
					}
				}
				break;
			case END:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) |
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					getResults().getAppointmentTimes().put(eInfo.getElement(), 
							eInfo.getTs() + getResults().getAppointmentTimes().get(eInfo.getElement()));
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_REQ_CHAIR) | 
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_STAND) |
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_STAND)) {
					getResults().getAccomodationTimes().put(eInfo.getElement(), 
							eInfo.getTs() + getResults().getAccomodationTimes().get(eInfo.getElement()));					
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_SECTION)) {
					getResults().getRouteTimes().put(eInfo.getElement(),
							eInfo.getTs() + getResults().getRouteTimes().get(eInfo.getElement()));					
				}
				break;
			case INTACT:
				break;
			case REL:
				break;
			case REQ:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) 
						| eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					getResults().getWaitForDoctorTimes().put(eInfo.getElement(), eInfo.getTs());
				}
				else {
					getResults().getWaitForDoctorTimes().put(eInfo.getElement(), eInfo.getTs());
				}
				break;
			case RESACT:
				break;
			case START:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) 
						| eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					getResults().getAppointmentTimes().put(eInfo.getElement(), -eInfo.getTs());					
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_REQ_CHAIR)) {
					getResults().getAppointmentTimes().put(eInfo.getElement(), -eInfo.getTs());					
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_STAND) 
						| eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_STAND)) {
					getResults().getAppointmentTimes().put(eInfo.getElement(),
							getResults().getAppointmentTimes().get(eInfo.getElement()) - eInfo.getTs());										
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_SECTION)) {
					if (!getResults().getRouteTimes().containsKey(eInfo.getElement()))
						getResults().getRouteTimes().put(eInfo.getElement(), -eInfo.getTs());
					else
						getResults().getRouteTimes().put(eInfo.getElement(),
								getResults().getRouteTimes().get(eInfo.getElement()) - eInfo.getTs());					
				}
				break;
			default:
				break;
			
			}
		}
		else if (info instanceof ResourceUsageInfo) {
			final ResourceUsageInfo eInfo = (ResourceUsageInfo)info;
			switch(eInfo.getType()) {
			case CAUGHT:
				getResults().getrTimes().put( eInfo.getResource(), eInfo.getTs());
				break;
			case RELEASED:
				final long usageTime = eInfo.getTs() - getResults().getrTimes().get(eInfo.getResource());
				final String description = eInfo.getResource().getDescription();
				if (description.contains(WheelChairsSimulation.STR_AUTO_CHAIR)) {
					getResults().setaChairCounter(getResults().getaChairCounter() + 1);
					if (getResults().getaChairUsage().containsKey(eInfo.getResource())) { //Si ya hay un tiempo acumulado, se suma
						getResults().getaChairUsage().put(eInfo.getResource(), 
								getResults().getaChairUsage().get(eInfo.getResource()) + usageTime);
					}
					else {
						getResults().getaChairUsage().put(eInfo.getResource(), usageTime);						
					}
				}
				else if (description.contains(WheelChairsSimulation.STR_MANUAL_CHAIR)) {
					getResults().setmChairCounter(getResults().getmChairCounter() + 1);
					if (getResults().getmChairUsage().containsKey(eInfo.getResource())) { //Si ya hay un tiempo acumulado, se suma
						getResults().getmChairUsage().put(eInfo.getResource(), getResults().getmChairUsage().get(eInfo.getResource()) + usageTime);
					}
					else {
						getResults().getmChairUsage().put(eInfo.getResource(), usageTime);						
					}
				}
				else if (description.contains(WheelChairsSimulation.STR_DOCTOR)) {
					getResults().setDoctorCounter(getResults().getDoctorCounter() + 1);
					if (getResults().getDoctorUsage().containsKey(eInfo.getResource())) {
						getResults().getDoctorUsage().put(eInfo.getResource(), 
								getResults().getDoctorUsage().get(eInfo.getResource()) + usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
					}
					else {
						getResults().getDoctorUsage().put(eInfo.getResource(), usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
					}
				}				
				else if (description.contains(WheelChairsSimulation.STR_JANITOR)) {
					getResults().setJanitorCounter(getResults().getJanitorCounter() + 1);
					if (getResults().getJanitorUsage().containsKey(eInfo.getResource())) {
						getResults().getJanitorUsage().put(eInfo.getResource(),
								getResults().getJanitorUsage().get(eInfo.getResource()) + usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
					}
					else {
						getResults().getJanitorUsage().put(eInfo.getResource(), usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
					}
				}				
				
				break;
			default:
				break;
			
			}
		}
		else if (info instanceof SimulationEndInfo) {
			final long endTs = ((SimulationEndInfo) info).getTs();
			// con esto contaríamos el tiemp de las tareas que no hubiesen terminado como
			//"Tiempo fin de simulación" - "tiempo de comienzo de tarea"
			for (Entry<Element, Long> entry : getResults().getTimes().entrySet()) {
				if (entry.getValue() < 0) {
					entry.setValue(endTs + entry.getValue());
				}
			}
			for (Entry<Element, Long> entry : getResults().getAccomodationTimes().entrySet()) {
				if (entry.getValue() < 0) {
					entry.setValue(endTs + entry.getValue());
				}
			}
			getResults().setEndTs(endTs);
			//out.print(endTs/unitConversion + "\t" + patientsPerArrival + "\t" + minutesBetweenArrivals + "\t" + manualFactor);
			/*for (int i = 0; i < density.length; i++)
				out.print("\t" + density[i]);*/
			//out.print("\t" + nDoctors + "\t" + nJanitors +"\t" + nAutoChairs + "\t" + nManualChairs + "\t" + patientEndCounter);
			/*printGeneralTimeStats(times);
			printGeneralTimeStats(appointmentTimes);
			printGeneralTimeStats(accomodationTimes);
			printGeneralTimeStats(routeTimes);
			printGeneralTimeStats(cummWaitForJanitorTimes, nPatientsWaitForJanitor);
			printGeneralTimeStats(cummWaitForDoctorTimes, nPatientsWaitForDoctor);
			printAllResourcesUsage(endTs);
			out.println();*/
		}
	}

	private void printGeneralTimeStats(TreeMap<Element, Long> time) {
		printGeneralTimeStats(time, time.size());
	}

	private void printGeneralTimeStats(TreeMap<Element, Long> time, int n) {
		double []arrayTimes = new double[time.size()];
		int cont = 0;
		long minimo = Long.MAX_VALUE;
		long maximo = 0;
		for (long tt : time.values()) {
			arrayTimes[cont] = tt;
			if(tt > maximo)
				maximo = tt;
			if (tt < minimo)
				minimo = tt;
			cont++;
		}
		out.print("\t" + n + "\t" + minimo/unitConversion + "\t" + maximo/unitConversion + "\t" + Statistics.average(arrayTimes)/unitConversion + "\t" + Statistics.stdDev(arrayTimes)/unitConversion);	
	}
	
	/*private void printAllResourcesUsage(long endTs) {
		final ArrayList<Long> tAChair = new ArrayList<Long>(); 
		final ArrayList<Long> tMChair = new ArrayList<Long>(); 
		final ArrayList<Long> tJanitor = new ArrayList<Long>(); 
		final ArrayList<Long> tDoctor = new ArrayList<Long>(); 
		for (Resource res : rTimes.keySet()) {
			if (res.getDescription().contains(WheelChairsSimulation.STR_AUTO_CHAIR)) {
				tAChair.add((aChairUsage.get(res) == null) ? endTs - rTimes.get(res) : aChairUsage.get(res));
			}
			else if (res.getDescription().contains(WheelChairsSimulation.STR_MANUAL_CHAIR)) {
				tMChair.add((mChairUsage.get(res) == null) ? endTs - rTimes.get(res) : mChairUsage.get(res));
			}
			else if (res.getDescription().contains(WheelChairsSimulation.STR_JANITOR)) {
				tJanitor.add((janitorUsage.get(res) == null) ? endTs - rTimes.get(res) : janitorUsage.get(res));
			}
			else if (res.getDescription().contains(WheelChairsSimulation.STR_DOCTOR)) {
				tDoctor.add((doctorUsage.get(res) == null) ? endTs - rTimes.get(res) : doctorUsage.get(res));
			}
		}
		out.print("\t" + aChairCounter);
		printResourceUsage(nAutoChairs, maxAutoChairs, tAChair);
		out.print("\t" + mChairCounter);
		printResourceUsage(nManualChairs, maxManualChairs, tMChair);
		out.print("\t" + janitorCounter);
		printResourceUsage(nJanitors, maxJanitors, tJanitor);
		out.print("\t" + doctorCounter);
		printResourceUsage(nDoctors, maxDoctors, tDoctor);
	}*/
	
	private void printResourceUsage(int n, int max, ArrayList<Long> times) {
		int counter = 0;
		for (long t : times) {
			out.print("\t" + t/unitConversion);
			counter++;
		}
		for (; counter < n; counter++)
			out.print("\t0");
		for (; counter < max; counter++)
			out.print("\t" + MISSING_VALUE);
	}
	
	public static void printHeader(/*BasicHUNSCSimulation.Density[] density,*/ int nJanitors, int nDoctors, int nAutoChairs, int nManualChairs) {
		out.print(Legend.TIME.shortName + "\t" + Legend.PXA.shortName + "\t" + Legend.TBA.shortName + "\t" + Legend.MF.shortName);
		/*for (int i = 0; i < density.length; i++)
			out.print("\t" + Legend.D.shortName + i);*/
		out.print("\t" + Legend.ND.shortName + "\t" + Legend.NJ.shortName + "\t" + Legend.NAW.shortName + "\t" + Legend.NMW.shortName);
		out.print("\t" + Legend.PEND.shortName + "\t" + Legend.PSTART.shortName + "\t" + Legend.TMIN.shortName + "\t" + Legend.TMAX.shortName +
				 "\t" + Legend.TAVG.shortName + "\t" + Legend.TSD.shortName);
		out.print("\t" + Legend.NAPP.shortName + "\t" + Legend.AMIN.shortName + "\t" + Legend.AMAX.shortName + "\t" + Legend.AAVG.shortName + 
				"\t" + Legend.ASD.shortName);
		out.print("\t" + Legend.NACC.shortName + "\t" + Legend.ACMIN.shortName + "\t" + Legend.ACMAX.shortName + "\t" + Legend.ACAVG.shortName + 
				"\t" + Legend.ACSD.shortName);
		out.print("\t" + Legend.NROU.shortName + "\t" + Legend.RMIN.shortName + "\t" + Legend.RMAX.shortName + "\t" + Legend.RAVG.shortName + 
				"\t" + Legend.RSD.shortName);
		out.print("\t" + Legend.NWAITJ.shortName + "\t" + Legend.WMINJ.shortName + "\t" + Legend.WMAXJ.shortName + "\t" + Legend.WAVGJ.shortName +
				 "\t" + Legend.WSDJ.shortName);
		out.print("\t" + Legend.NWAITD.shortName + "\t" + Legend.WMIND.shortName + "\t" + Legend.WMAXD.shortName + "\t" + Legend.WAVGD.shortName +
				 "\t" + Legend.WSDD.shortName);
		out.print("\t" + Legend.UAW.shortName);
		for (int i = 0; i < nAutoChairs; i++)
			out.print("\t" + Legend.TAW.shortName + i);
		out.print("\t" + Legend.UMW.shortName);
		for (int i = 0; i < nManualChairs; i++)
			out.print("\t" + Legend.TMW.shortName + i);
		out.print("\t" + Legend.UJ.shortName);
		for (int i = 0; i < nJanitors; i++)
			out.print("\t" + Legend.TJ.shortName + i);
		out.print("\t" + Legend.UD.shortName);
		for (int i = 0; i < nDoctors; i++)
			out.print("\t" + Legend.TD.shortName + i);
		out.println();
	}
	
	public static void printLegend() {
		out.println("LEGEND:");
		for (Legend l : Legend.values()) {
			out.println(l.shortName + "\t" + l.description);
		}
	}

	public static void setOut(PrintStream out) {
		WheelchairInfoListener.out = out;
	}
	
	/**
	 * @return the results
	 */
	public static PSIGHOSResults getResults() {
		return psighosResults;
	}

	/**
	 * @param results the results to set
	 */
	public static void setResults(PSIGHOSResults results) {
		WheelchairInfoListener.psighosResults = results;
	}

	/**
	 * @return the rosResults
	 */
	public static ROSResults getRosResults() {
		return rosResults;
	}

	/**
	 * @param rosResults the rosResults to set
	 */
	public static void setRosResults(ROSResults rosResults) {
		WheelchairInfoListener.rosResults = rosResults;
	}

	static enum Legend {
		TIME("TIME", "Simulated time"),
		PXA("PxA", "Patients per arrival"),
		TBA("TbA", "Time between arrivals"),
		MF("MF", "Manual factor"),
		//D("D", "Density of section i"),
		ND("N_D", "#Doctors"),
		NJ("N_J", "#Janitors"),
		NAW("N_AW", "#Automated wheelchairs"),
		NMW("N_MW", "#Manual wheelchairs"),
		PEND("P_END", "Patients who finished"),
		PSTART("P_STA", "Patients who started"),
		TMIN("T_MIN", "Minimum time spent by a patient"),
		TMAX("T_MAX", "Maximum time spent by a patient"),
		TAVG("T_AVG", "Average time spent by a patient"),
		TSD("T_SD", "Standard deviation of the time spent by a patient"),
		NAPP("N_APP", "Number of outpatient appointments"),
		AMIN("A_MIN", "Minimum time spent by a patient in an appointment"),
		AMAX("A_MAX", "Maximum time spent by a patient in an appointment"),
		AAVG("A_AVG", "Average time spent by a patient in an appointment"),
		ASD("A_SD", "Standard deviation of the time spent by a patient in an appointment"),
		NACC("N_ACC", "Number of patient seats/leaves"),
		ACMIN("AC_MIN", "Minimum time spent by a patient by seating/leaving from a wheelchair"),
		ACMAX("AC_MAX", "Maximum time spent by a patient by seating/leaving from a wheelchair"),
		ACAVG("AC_AVG", "Average time spent by a patient by seating/leaving from a wheelchair"),
		ACSD("AC_SD", "Standard deviation of the time spent by a patient by seating/leaving from a wheelchair"),
		NROU("N_ROU", "Number of patient routes"),
		RMIN("R_MIN", "Minimum time spent by a patient in route"),
		RMAX("R_MAX", "Maximum time spent by a patient in route"),
		RAVG("R_AVG", "Average time spent by a patient in route"),
		RSD("R_SD", "Standard deviation of the time spent by a patient in route"),
		NWAITJ("WAIT_J", "Patients who had to wait for a janitor"),
		WMINJ("W_MIN_J", "Minimum waiting time for a janitor"),
		WMAXJ("W_MAX_J", "Maximum waiting time for a janitor"),
		WAVGJ("W_AVG_J", "Average waiting time for a janitor"),
		WSDJ("W_SD_J", "Standard deviation of the waiting time for a janitor"),
		NWAITD("WAIT_D", "Patients who had to wait for a doctor"),
		WMIND("W_MIN_D", "Minimum waiting time for a doctor"),
		WMAXD("W_MAX_D", "Maximum waiting time for a doctor"),
		WAVGD("W_AVG_D", "Average waiting time for a doctor"),
		WSDD("W_SD_D", "Standard deviation of the waiting time for a doctor"),
		UAW("U_AW", "#uses of automated wheelchairs"),
		UMW("U_MW", "#uses of manual wheelchairs"),
		UJ("U_J", "#uses of janitors"),
		UD("U_D", "#uses of doctors"),
		TAW("T_AW", "Usage time of automated wheelchairs"),
		TMW("T_MW", "Usage time of manual wheelchairs"),
		TJ("T_J", "Usage time of janitors"),
		TD("T_D", "Usage time of doctors");
		
		private final String shortName;
		private final String description;
		private Legend(String shortName, String description) {
			this.shortName = shortName;
			this.description = description;
		}
	}
}