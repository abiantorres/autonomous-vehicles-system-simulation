package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures;

public class ROSSimulationMetadata {
	
	private String simulationHash, planFile, robotFile, worldFile, mapFile;
	
	public ROSSimulationMetadata() {
		this("", "", "", "", "");
	}



	/**
	 * @param simulationHash
	 * @param planFile
	 * @param robotFile
	 * @param worldFile
	 * @param mapFile
	 */
	public ROSSimulationMetadata(String simulationHash, String planFile, String robotFile, String worldFile,
			String mapFile) {
		super();
		this.simulationHash = simulationHash;
		this.planFile = planFile;
		this.robotFile = robotFile;
		this.worldFile = worldFile;
		this.mapFile = mapFile;
	}

	/** @param simulationHash the simulationHash to set */
	public void setSimulationHash(String simulationHash) {
		this.simulationHash = simulationHash;
	}
	
	/** @return the simulationHash */
	public String getSimulationHash() {
		return simulationHash;
	}
	

	/** @return the planFile */
	public String getPlanFile() {
		return planFile;
	}

	/** @param planFile the planFile to set */
	public void setPlanFile(String planFile) {
		this.planFile = planFile;
	}

	/** @return the robotFile */
	public String getRobotFile() {
		return robotFile;
	}

	/** @param robotFile the robotFile to set */
	public void setRobotFile(String robotFile) {
		this.robotFile = robotFile;
	}

	/** @return the worldFile */
	public String getWorldFile() {
		return worldFile;
	}

	/** @param worldFile the worldFile to set */
	public void setWorldFile(String worldFile) {
		this.worldFile = worldFile;
	}

	/** @return the mapFile */
	public String getMapFile() {
		return mapFile;
	}

	/** @param mapFile the mapFile to set */
	public void setMapFile(String mapFile) {
		this.mapFile = mapFile;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ROSSimulationMetadata [simulationHash=" + simulationHash + ", planFile=" + planFile + ", robotFile="
				+ robotFile + ", worldFile=" + worldFile + ", mapFile=" + mapFile + "]";
	}
	
	
}
