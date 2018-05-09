package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;

import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.iis.simulation.model.Simulation;
import es.ull.iis.simulation.model.TimeUnit;

public class WheelChairsSimulation {
	
	final static private int DEF_N_JANITORS = 1; //número de bedeles que están en el modelo
	final static private int DEF_N_DOCTORS = 2;
	final static private int DEF_N_CHAIRS = 6;
	final static private int DEF_N_PATIENTS_PER_ARRIVAL = 4;
	final static private int DEF_MINUTES_BETWEEN_ARRIVALS = 30;
	final static private double DEF_MANUAL_FACTOR = 1.0;
	final static private int N_EXPERIMENTS = 5;
	
	public static void runSimulation(ROSResults results) {
		WheelchairListener.printHeader(DEF_N_JANITORS, DEF_N_DOCTORS, DEF_N_CHAIRS, 0);
		for (int i = 0; i < N_EXPERIMENTS; i++) {
			for (int j = 0; j < 2; j++) {
				Simulation sim = new WheelChairsModel(i, DEF_N_JANITORS, DEF_N_DOCTORS, DEF_N_CHAIRS + j, 0, 
						DEF_N_PATIENTS_PER_ARRIVAL, DEF_MINUTES_BETWEEN_ARRIVALS, DEF_MANUAL_FACTOR, 
						results.getElementReplicableTimeFunctions());
				final WheelchairListener listener = new WheelchairListener(TimeUnit.MINUTE, DEF_N_JANITORS, 
						DEF_N_DOCTORS, DEF_N_CHAIRS + j, 0, DEF_N_JANITORS, DEF_N_DOCTORS, DEF_N_CHAIRS + j, 0,
						DEF_N_PATIENTS_PER_ARRIVAL, DEF_MINUTES_BETWEEN_ARRIVALS, DEF_MANUAL_FACTOR, false);
				sim.addInfoReceiver(listener);
				sim.run();
			}
			WheelChairsModel.resetTimeFunctions();
		}
		WheelchairListener.printLegend();
	}

}
