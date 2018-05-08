package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation;

import es.ull.iis.simulation.info.ElementInfo;
import es.ull.iis.simulation.info.SimulationInfo;
import es.ull.iis.simulation.inforeceiver.View;

public class WheelChairsEndListener extends View{
	
	private int counter;

	public WheelChairsEndListener() {
		super("Listener to determine if all patients have been attended");
		addEntrance(ElementInfo.class);
		counter = 0;
	}

	@Override
	public void infoEmited(SimulationInfo info) {
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
	
	public boolean isSimulationFinished() {
		return (counter == 0);
	}
}
