package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;

import es.ull.iis.simulation.info.ElementInfo;
import es.ull.iis.simulation.info.SimulationInfo;
import es.ull.iis.simulation.inforeceiver.View;

public class WheelChairsEndListener extends View{
	
	/**************
	 * ATTRIBUTES *
	 *************/
	// Counter for patients
	private int counter; 

	/***********************
	 * DEFAULT CONSTRUCTOR *
	 **********************/
	
	/** Build a Listener for the end condition */
	public WheelChairsEndListener() {
		super("Listener to determine if all patients have been attended");
		addEntrance(ElementInfo.class);
		counter = 0;
	}

	/***********
	 * METHODS *
	 **********/
	@Override
	public void infoEmited(SimulationInfo info) {
		// Process the simulation information to get how many patients
		// have been attended.
		if (info instanceof ElementInfo) {
			final ElementInfo eInfo = (ElementInfo)info;
			if (eInfo.getType() == ElementInfo.Type.START) {
				this.counter++;
			}
			else {
				this.counter--;
			}			
		}
	}
	
	/** Checks if the simulation has finished.
	 * @return true if the simulation has finished, otherwise false. */
	public boolean isSimulationFinished() {
		return (counter == 0);
	}
}
