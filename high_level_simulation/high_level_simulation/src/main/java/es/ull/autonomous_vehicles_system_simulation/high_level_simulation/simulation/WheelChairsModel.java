package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;

import java.util.ArrayList;
import es.ull.iis.function.TimeFunction;
import es.ull.iis.function.TimeFunctionFactory;
import es.ull.iis.function.TimeFunctionParams;
import es.ull.iis.simulation.condition.ResourceTypeAcquiredCondition;
import es.ull.iis.simulation.model.ElementType;
import es.ull.iis.simulation.model.ResourceType;
import es.ull.iis.simulation.model.Simulation;
import es.ull.iis.simulation.model.SimulationPeriodicCycle;
import es.ull.iis.simulation.model.SimulationTimeFunction;
import es.ull.iis.simulation.model.TimeDrivenElementGenerator;
import es.ull.iis.simulation.model.TimeUnit;
import es.ull.iis.simulation.model.WorkGroup;
import es.ull.iis.simulation.model.flow.ActivityFlow;
import es.ull.iis.simulation.model.flow.DelayFlow;
import es.ull.iis.simulation.model.flow.ExclusiveChoiceFlow;
import es.ull.iis.simulation.model.flow.ReleaseResourcesFlow;
import es.ull.iis.simulation.model.flow.RequestResourcesFlow;

public class WheelChairsModel extends Simulation{
	
	/*************
	 * CONSTANTS *
	 *************/
	// Model Events
	final static String STR_REQ_CHAIR = "Request chair"; 
	final static String STR_REQ_JANITOR = "Request janitor";
	final static String STR_REL_CHAIR = "Drop chair";
	final static String STR_REL_JANITOR = "Drop janitor";
	final static String STR_M_APPOINTMENT = "Appointment with manual chair";
	final static String STR_A_APPOINTMENT = "Appointment with autonomus chair";
	final static String STR_M_STAND = "Stand up from a manual chair";
	final static String STR_A_STAND = "Stand up from an autonomus chair";
	
	// Predefined events times (Random uniform distribution)
	final private static ElementReplicableTimeFunction T_APPOINTMENT 
		= new ElementReplicableTimeFunction(TimeFunctionFactory.getInstance("UniformVariate", 600, 900));
	final private static ElementReplicableTimeFunction T_M_SEAT 
		= new ElementReplicableTimeFunction(TimeFunctionFactory.getInstance("UniformVariate", 60, 180));
	final private static ElementReplicableTimeFunction T_A_SEAT 
		= new ElementReplicableTimeFunction(TimeFunctionFactory.getInstance("UniformVariate", 60, 180));
	final private static ElementReplicableTimeFunction T_M_STAND 
		= new ElementReplicableTimeFunction(TimeFunctionFactory.getInstance("UniformVariate", 60, 180));
	final private static ElementReplicableTimeFunction T_A_STAND 
		= new ElementReplicableTimeFunction(TimeFunctionFactory.getInstance("UniformVariate", 60, 180));
	
	// Model elements and sources
	final static String STR_SECTION = "Segment"; 
	final static String STR_JANITOR = "Janitor"; 
	final static String STR_DOCTOR = "Doctor"; 
	final static String STR_PATIENT = "Patient";
	final static String STR_AUTO_CHAIR = "Autonomous Chair"; 
	final static String STR_MANUAL_CHAIR = "Manual Chair"; 

	// Simulation times (in seconds):
	/** Simulation start sencond */
	final private static long START_TIME = 0;
	/** Simulation length: 8 hours (in seconds) */
	final private static long END_TIME = 28800;
	/** Last arrival of patients: one hour before simulation end (7h) */ 
	final private static long LAST_ARRIVAL = 25200;
	
	final static TimeUnit unit = TimeUnit.SECOND;
	
	/** End condition for simulation */
	final private WheelChairsEndListener END_CONDITION;
	
	// Instantiate the segments times container that will build from low simulation data
	private static ArrayList<ElementReplicableTimeFunction> segments;

	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	public WheelChairsModel(int id, 
			int nJanitors, int nDoctors, int nAutoChairs, int nManualChairs, int patientsPerArrival, 
			int minutesBetweenArrivals, double manualFactor, ArrayList<ElementReplicableTimeFunction> segments) {
		// Set simulation information
		super(id, "", TimeUnit.SECOND, START_TIME, END_TIME);
		setSegments(segments);
		// Set the simulation end condition
		END_CONDITION = new WheelChairsEndListener();
		addInfoReceiver(END_CONDITION);
		
		restartTimeFunctions();
		// El paciente es el elemento del modelo
		
		final ElementType etPatient = new ElementType(this, STR_PATIENT);
		
		// Los recursos son: Doctores y Silla
		
		// Bedeles
		final ResourceType rtJanitor = new ResourceType(this, STR_JANITOR);
		rtJanitor.addGenericResources(nJanitors);
		// Sillas autónomas
		final ResourceType rtAChair = new ResourceType(this, STR_AUTO_CHAIR);
		rtAChair.addGenericResources(nAutoChairs);
		// Sillas manuales
		final ResourceType rtMChair = new ResourceType(this, STR_MANUAL_CHAIR);
		rtMChair.addGenericResources(nManualChairs);
		// Doctores
		final ResourceType rtDoctor = new ResourceType(this, STR_DOCTOR);
		rtDoctor.addGenericResources(nDoctors);
		
		//Definición de los flujos de trabajo
		
		final WorkGroup wgJanitorMChair = new WorkGroup(this, new ResourceType[]
				{rtJanitor, rtMChair}, new int[] {1,1});
		final WorkGroup wgJanitor = new WorkGroup(this, rtJanitor, 1);
		final WorkGroup wgJanitorAChair = new WorkGroup(this, new ResourceType[] 
				{rtJanitor, rtAChair}, new int[] {1,1});
		final WorkGroup wgAppointment = new WorkGroup(this, new ResourceType[] {rtDoctor} , new int [] {1});

		// Creamos todos los pasos del proceso
		final DelayFlow[] actASections = new DelayFlow [getSegments().size()];
		final DelayFlow[] actASectionsBack = new DelayFlow [getSegments().size()];
		final DelayFlow[] actMSections = new DelayFlow [getSegments().size()];
		final DelayFlow[] actMSectionsBack = new DelayFlow [getSegments().size()];
		
		// Solicitud de recursos: sillas de ruedas y bedeles
		final RequestResourcesFlow reqChair = new RequestResourcesFlow(this, STR_REQ_CHAIR, 1, 2);
		reqChair.addWorkGroup(0, wgJanitorAChair, T_A_SEAT);        
		reqChair.addWorkGroup(1, wgJanitorMChair, T_M_SEAT);
		final RequestResourcesFlow reqJanitor = new RequestResourcesFlow(this, STR_REQ_JANITOR, 1, 1);
		reqJanitor.addWorkGroup(wgJanitor);
		
		// Dejar de usar recursos: sillas de ruedas y bedeles.
		final ReleaseResourcesFlow relJanitorBeforeAppointment = new ReleaseResourcesFlow(
				this, STR_REL_JANITOR, 1, wgJanitor);
		final ReleaseResourcesFlow relJanitorAfterSeat = new ReleaseResourcesFlow(this, STR_REL_JANITOR, 1, wgJanitor);
		final ReleaseResourcesFlow relChair = new ReleaseResourcesFlow(this, STR_REL_CHAIR, 1);
		
		// Creamos una actividad de consulta por cada tipo de silla
		final ActivityFlow actMAppointment = new ActivityFlow(this, STR_M_APPOINTMENT);
		actMAppointment.addWorkGroup(0, wgAppointment, T_APPOINTMENT);
		final ActivityFlow actAAppointment = new ActivityFlow(this, STR_A_APPOINTMENT);
		actAAppointment.addWorkGroup(0, wgAppointment, T_APPOINTMENT);
		
		// Creamos los tramos de la ruta que siguen las sillas
		for (int i = 0; i < getSegments().size(); i++) {
			// Sillas autónomas
			// Ruta de ida
			actASections[i] = new DelayFlow(this, STR_SECTION + i, getSegments().get(i));
			// Ruta de vuelta
			actASectionsBack[getSegments().size() - i - 1] = new DelayFlow(this, STR_SECTION +
					" (back)" + (getSegments().size() - i - 1), getSegments().get(i));
			// Sillas manuales
			// Ruta de ida
			actMSections[i] = new DelayFlow(this, STR_SECTION + i, 
					new ModifiedFunction(getSegments().get(i), manualFactor, 0.0));
			// Ruta de vuelta
			actMSectionsBack[getSegments().size() - i - 1] = new DelayFlow(this, STR_SECTION + " (back)" + 
					(getSegments().size() - i - 1), new ModifiedFunction(getSegments().get(i), manualFactor, 0.0));
		}
		
		// Conectamos los tramos de la ruta que siguen las sillas
		for (int i = 1; i < getSegments().size(); i++) {
			actASections[i-1].link(actASections[i]);
			actASectionsBack[i - 1].link(actASectionsBack[i]);
			actMSections[i-1].link(actMSections[i]);
			actMSectionsBack[i - 1].link(actMSectionsBack[i]);
		}

		final ExclusiveChoiceFlow condFlow0 = new ExclusiveChoiceFlow(this);
		
		// If the chair is automated, release the janitor after being seated 
		reqChair.link(condFlow0);
		condFlow0.link(relJanitorAfterSeat, new ResourceTypeAcquiredCondition(rtAChair)).link(actASections[0]);
		condFlow0.link(actMSections[0]);

		
		actMSections[getSegments().size() - 1].link(relJanitorBeforeAppointment).link(actMAppointment)
			.link(reqJanitor).link(actMSectionsBack[0]);
		actASections[getSegments().size() - 1].link(actAAppointment).link(actASectionsBack[0]);
		
		// Creamos una actividad para levantarse de cada tipo de silla
		final DelayFlow delMStand = new DelayFlow(this, STR_M_STAND, T_M_STAND);
		final ActivityFlow actAStand = new ActivityFlow(this, STR_A_STAND);
		
		// En el caso de las sillas automáticas, requiere un bedel
		actAStand.addWorkGroup(0, wgJanitor, T_A_STAND);
		actMSectionsBack[getSegments().size() - 1].link(delMStand).link(relChair);
		actASectionsBack[getSegments().size() - 1].link(actAStand).link(relChair);
		
		//Horario de llegada de pacientes
		final SimulationPeriodicCycle arrivalCycle = new SimulationPeriodicCycle(unit, 0, 
				new SimulationTimeFunction(unit, "ConstantVariate", minutesBetweenArrivals * 60), 
				(int)(LAST_ARRIVAL / (minutesBetweenArrivals * 60)));
		new TimeDrivenElementGenerator(this, patientsPerArrival, etPatient, reqChair, arrivalCycle);
		addInfoReceiver(END_CONDITION);
	}

	
	private static void restartTimeFunctions() {
		T_APPOINTMENT.restart();
		T_A_SEAT.restart();
		T_M_SEAT.restart();
		T_A_STAND.restart();
		T_M_STAND.restart();
		for (ElementReplicableTimeFunction function : getSegments()) {
			function.restart();
		}
	}
	
	public static void resetTimeFunctions() {
		T_APPOINTMENT.reset();
		T_A_SEAT.reset();
		T_M_SEAT.reset();
		T_A_STAND.reset();
		T_M_STAND.reset();
		for (ElementReplicableTimeFunction function : getSegments()) {
			function.reset();
		}
	}
	
	private static class ModifiedFunction extends TimeFunction {
		private double scale;
		private double offset;
		private TimeFunction function;
		
		/**
		 * @param scale
		 * @param offset
		 */
		public ModifiedFunction(TimeFunction function, double scale, double offset) {
			this.scale = scale;
			this.offset = offset;
			this.function = function;
		}

		@Override
		public double getValue(TimeFunctionParams params) {
			return scale * function.getValue(params) + offset;
		}

		@Override
		public void setParameters(Object... params) {
			// TODO Auto-generated method stub
			
		}
		
	}
	
	/***************
	 * GET AND SET *
	 **************/
	
	/** @return the segments */
	public static ArrayList<ElementReplicableTimeFunction> getSegments() {
		return segments;
	}


	/** @param segments the segments to set */
	public static void setSegments(ArrayList<ElementReplicableTimeFunction> segments) {
		WheelChairsModel.segments = segments;
	}


}
