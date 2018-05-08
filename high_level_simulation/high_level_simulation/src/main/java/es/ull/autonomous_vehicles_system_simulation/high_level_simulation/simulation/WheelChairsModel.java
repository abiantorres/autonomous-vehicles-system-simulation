package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;

import java.util.ArrayList;
import java.util.HashMap;

import es.ull.iis.simulation.model.Simulation;
import es.ull.iis.simulation.model.TimeUnit;

public class WheelChairsModel extends Simulation{
	
	/*************
	 * CONSTANTS *
	 *************/
	// Model Events
	final private static String REQ_CHAIR = "Request chair"; 
	final private static String REQ_JANITOR = "Request janitor";
	final private static String DROP_CHAIR = "Drop chair";
	final private static String DROP_JANITOR = "Drop janitor";
	final private static String M_APPOINTMENT = "Appointment with manual chair";
	final private static String A_APPOINTMENT = "Appointment with autonomus chair";
	final private static String M_STAND = "Stand up from a manual chair";
	final private static String A_STAND = "Stand up from an autonomus chair";
	
	// Model elements and sources
	final private static String SEGMENT = "Segment"; 
	final private static String JANITOR = "Janitor"; 
	final private static String DOCTOR = "Doctor"; 
	final private static String PATIENT = "Patient";
	final private static String A_CHAIR = "Autonomous Chair"; 
	final private static String M_CHAIR = "Manual Chair"; 

	// Simulation times (in seconds):
	/** Simulation start sencond */
	final private static long START_TIME = 0;
	/** Simulation length: 8 hours (in seconds) */
	final private static long END_TIME = 28800;
	/** Last arrival of patients: one hour before simulation end (7h) */ 
	final private static long LAST_ARRIVAL = 25200;
	/** End condition for simulation */
	final private WheelChairsEndListener END_CONDITION;
	
	// Densities of obstacles
	public static enum Density {
		LOW,
		MEDIUM_LOW,
		MEDIUM_HIGH,
		HIGH
	}
	
	// Path attributes. 
	/** Segments times */ 
	HashMap<Density, ArrayList<ElementReplicableTimeFunction>> segments;
	
	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	public WheelChairsModel(int id, String description, TimeUnit unit, long startTs, long endTs) {
		
		// Set simulation information
		super(id, description, TimeUnit.SECOND, START_TIME, END_TIME);
		
		// Set the simulation end condition
		END_CONDITION = new WheelChairsEndListener();
		addInfoReceiver(END_CONDITION);
		
		// Instantiate a segments times container that will build from low simulation data
		HashMap<Density, ArrayList<ElementReplicableTimeFunction>> segments;
	}



}
