package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;


import java.util.Map.Entry;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.database.DatabaseService;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.CompleteResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.PSIGHOSResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.iis.simulation.info.ElementActionInfo;
import es.ull.iis.simulation.info.ElementInfo;
import es.ull.iis.simulation.info.ResourceUsageInfo;
import es.ull.iis.simulation.info.SimulationEndInfo;
import es.ull.iis.simulation.info.SimulationInfo;
import es.ull.iis.simulation.inforeceiver.View;
import es.ull.iis.simulation.model.Element;
import es.ull.iis.simulation.model.TimeUnit;

public class WheelchairInfoListener extends View {
	/**************
	 * ATTRIBUTES *
	 *************/
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
		WheelchairInfoListener.setPsighosResults(new PSIGHOSResults(unit, nJanitors, nDoctors, nAutoChairs, nManualChairs, 
				maxJanitors, maxDoctors, maxAutoChairs, maxManualChairs, patientsPerArrival,
				minutesBetweenArrivals, manualFactor));
		WheelchairInfoListener.setRosResults(rosResults);
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
				psighosResults.times.put(eInfo.getElement(), -eInfo.getTs());
			}
			else {
				long initTime = psighosResults.times.get(eInfo.getElement());
				psighosResults.times.put(eInfo.getElement(), eInfo.getTs() + initTime);
				psighosResults.patientEndCounter++;
			}
			
		}
		else if (info instanceof ElementActionInfo) {
			final ElementActionInfo eInfo = (ElementActionInfo)info; 
			switch(eInfo.getType()) {
			case ACQ:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) | 
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					final long t = eInfo.getTs() - psighosResults.waitForDoctorTimes.get(eInfo.getElement());
					if (t > 0) {
						psighosResults.nPatientsWaitForDoctor++;
					}
					if (psighosResults.cummWaitForDoctorTimes.containsKey(eInfo.getElement())) {
						psighosResults.cummWaitForDoctorTimes.put(eInfo.getElement(),
								psighosResults.cummWaitForDoctorTimes.get(eInfo.getElement()) + t);
					}
					else {
						psighosResults.cummWaitForDoctorTimes.put(eInfo.getElement(), t);
					}
				}
				else {
					final long t = eInfo.getTs() - psighosResults.waitForJanitorTimes.get(eInfo.getElement());
					if (!psighosResults.cummWaitForJanitorTimes.containsKey(eInfo.getElement())) {
						psighosResults.cummWaitForJanitorTimes.put(eInfo.getElement(), t);
						if (t > 0) {
							psighosResults.nPatientsWaitForJanitor++;
						}
					}
					else if (t > 0) {
						psighosResults.cummWaitForJanitorTimes.put(eInfo.getElement(),
								psighosResults.cummWaitForJanitorTimes.get(eInfo.getElement()) + t);
					}
				}
				break;
			case END:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) |
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					psighosResults.appointmentTimes.put(eInfo.getElement(), 
							eInfo.getTs() + psighosResults.appointmentTimes.get(eInfo.getElement()));
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_REQ_CHAIR) | 
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_STAND) |
						eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_STAND)) {
					psighosResults.accomodationTimes.put(eInfo.getElement(), 
							eInfo.getTs() + psighosResults.accomodationTimes.get(eInfo.getElement()));					
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_SECTION)) {
					psighosResults.routeTimes.put(eInfo.getElement(),
							eInfo.getTs() + psighosResults.routeTimes.get(eInfo.getElement()));					
				}
				break;
			case INTACT:
				break;
			case REL:
				break;
			case REQ:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) 
						| eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					psighosResults.waitForDoctorTimes.put(eInfo.getElement(), eInfo.getTs());
				}
				else {
					psighosResults.waitForJanitorTimes.put(eInfo.getElement(), eInfo.getTs());
				}
				break;
			case RESACT:
				break;
			case START:
				if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_APPOINTMENT) 
						| eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_APPOINTMENT)) {
					psighosResults.appointmentTimes.put(eInfo.getElement(), -eInfo.getTs());					
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_REQ_CHAIR)) {
					psighosResults.accomodationTimes.put(eInfo.getElement(), -eInfo.getTs());					
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_A_STAND) 
						| eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_M_STAND)) {
					psighosResults.accomodationTimes.put(eInfo.getElement(),
							psighosResults.accomodationTimes.get(eInfo.getElement()) - eInfo.getTs());										
				}
				else if (eInfo.getActivity().getDescription().contains(WheelChairsSimulation.STR_SECTION)) {
					if (!psighosResults.routeTimes.containsKey(eInfo.getElement()))
						psighosResults.routeTimes.put(eInfo.getElement(), -eInfo.getTs());
					else
						psighosResults.routeTimes.put(eInfo.getElement(),
								psighosResults.routeTimes.get(eInfo.getElement()) - eInfo.getTs());					
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
				psighosResults.rTimes.put( eInfo.getResource(), eInfo.getTs());
				break;
			case RELEASED:
				final long usageTime = eInfo.getTs() - psighosResults.rTimes.get(eInfo.getResource());
				final String description = eInfo.getResource().getDescription();
				if (description.contains(WheelChairsSimulation.STR_AUTO_CHAIR)) {
					psighosResults.aChairCounter++;
					if (psighosResults.aChairUsage.containsKey(eInfo.getResource())) { //Si ya hay un tiempo acumulado, se suma
						psighosResults.aChairUsage.put(eInfo.getResource(), 
								psighosResults.aChairUsage.get(eInfo.getResource()) + usageTime);
					}
					else {
						psighosResults.aChairUsage.put(eInfo.getResource(), usageTime);						
					}
				}
				else if (description.contains(WheelChairsSimulation.STR_MANUAL_CHAIR)) {
					psighosResults.mChairCounter++;
					if (psighosResults.mChairUsage.containsKey(eInfo.getResource())) { //Si ya hay un tiempo acumulado, se suma
						psighosResults.mChairUsage.put(eInfo.getResource(), 
								psighosResults.mChairUsage.get(eInfo.getResource()) + usageTime);
					}
					else {
						psighosResults.mChairUsage.put(eInfo.getResource(), usageTime);						
					}
				}
				else if (description.contains(WheelChairsSimulation.STR_DOCTOR)) {
					psighosResults.doctorCounter++;
					if (psighosResults.doctorUsage.containsKey(eInfo.getResource())) {
						psighosResults.doctorUsage.put(eInfo.getResource(), 
								psighosResults.doctorUsage.get(eInfo.getResource()) + usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
					}
					else {
						psighosResults.doctorUsage.put(eInfo.getResource(), usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
					}
				}				
				else if (description.contains(WheelChairsSimulation.STR_JANITOR)) {
					psighosResults.janitorCounter++;
					if (psighosResults.janitorUsage.containsKey(eInfo.getResource())) {
						psighosResults.janitorUsage.put(eInfo.getResource(),
								psighosResults.janitorUsage.get(eInfo.getResource()) + usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
					}
					else {
						psighosResults.janitorUsage.put(eInfo.getResource(), usageTime);  //Si no hay tiempo anterior, éste es el tiempo acumulado		
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
			for (Entry<Element, Long> entry : psighosResults.times.entrySet()) {
				if (entry.getValue() < 0) {
					entry.setValue(endTs + entry.getValue());
				}
			}
			for (Entry<Element, Long> entry : psighosResults.accomodationTimes.entrySet()) {
				if (entry.getValue() < 0) {
					entry.setValue(endTs + entry.getValue());
				}
			}
			
			getPsighosResults().setEndTs(endTs);
			DatabaseService.insertResults(
					new CompleteResults(psighosResults, rosResults).getDocument());
		}
	}
	
	/**
	 * @return the results
	 */
	public static PSIGHOSResults getPsighosResults() {
		return psighosResults;
	}

	/**
	 * @param results the results to set
	 */
	public static void setPsighosResults(PSIGHOSResults results) {
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

}