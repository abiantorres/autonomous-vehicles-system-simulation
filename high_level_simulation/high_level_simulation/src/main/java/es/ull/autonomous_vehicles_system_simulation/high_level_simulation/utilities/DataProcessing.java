package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.utilities;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;

import javax.swing.JOptionPane;
import javax.swing.JProgressBar;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import org.bson.Document;

//JSON tree structures handling 
import com.fasterxml.jackson.databind.JsonNode;

import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.PSIGHOSResults;
// Simulation Structures
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSResults;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.results_structures.ROSSegment;
import es.ull.autonomous_vehicles_system_simulation.high_level_simulation.simulation.WheelChairsSimulation;
import es.ull.iis.simulation.model.Element;
import es.ull.iis.simulation.model.Resource;
import es.ull.iis.simulation.model.TimeUnit;

final public class DataProcessing {
	
	/***********
	 * METHODS *
	 **********/
	
	public static ROSResults parseOfflineResultsJson(JsonNode data) {
		/* Explores the JSON tree obtained from ROS in search of the main content of 
		 * the message, and return an OfflineRosResults which will be used by the
		 * PSIGHOS simulation*/
		ROSResults results = new ROSResults();
		results.setSimulationHash(data.get("msg").get("metadata").get("simulation_hash").textValue());
		results.setRobotFile(data.get("msg").get("metadata").get("robot_file").textValue());
		results.setWorldFile(data.get("msg").get("metadata").get("world_file").textValue());
		results.setPlanFile(data.get("msg").get("metadata").get("plan_file").textValue());
		results.setMapFile(
				data.get("msg").get("metadata").get("map_file").textValue());
		results.setDate(
				data.get("msg").get("metadata").get("date").textValue());
		results.setnSegments(
				data.get("msg").get("metadata").get("n_segments").intValue());
		results.setnIterations(
				data.get("msg").get("metadata").get("n_iterations").intValue());
		results.setTimeoutFactor(
				data.get("msg").get("metadata").get("timeout_factor").intValue());
		results.setUsefulSimulation(
				data.get("msg").get("metadata").get("useful_simulation").booleanValue());
		results.setLocalPlanner(data.get("msg").get("metadata").get("local_planner").textValue());
		results.setGlobalPlanner(data.get("msg").get("metadata").get("global_planner").textValue());
		// Get individual times only for future uses.
		final JsonNode individualIterationsResults = data.get("msg").get("individual_iterations_results");
		// Travel over the array searching for each section information
		final JsonNode segments = data.get("msg").get("global_segments_results");
		if(segments.isArray() && individualIterationsResults.isArray()) {
			for(final JsonNode segmentNode : segments) {
				ROSSegment segment = new ROSSegment();
				segment.setIndex(segmentNode.get("segment_index").intValue());
				segment.setFailures(segmentNode.get("n_failures").intValue());
				segment.setTimeAverage(segmentNode.get("time_mean").doubleValue());
				segment.setTimeout(data.get("msg").get("metadata").get("segments_metadata")
						.get("segments_metadata").get(segment.getIndex()).get("segment_simulation_timeout").intValue());
				segment.setTimeStandardDeviation(segmentNode.get("time_stdev").doubleValue());
				// Search for the distance between obstacles for this segment
				segment.setDistanceBetweenObstacles(data.get("msg").get("metadata").get("segments_metadata")
						.get("segments_metadata").get(segment.getIndex()).get("distance_between_obstacles")
						.doubleValue());
				// Append individual iterations times to the individualTimes array
				for(final JsonNode iterationNode : individualIterationsResults) {
					segment.getIndividualTimes().add(iterationNode.get("segments_results")
							.get(segment.getIndex()).get("time").doubleValue());
				}
				results.addSegment(segment);
			}
		}
		return results;
	}
	
	public static ROSResults parseROSResultsDocument(Document doc) {
		ROSResults results = new ROSResults();
		// Simulation metadata
		Document metadata = (Document) doc.get("metadata");
		// Segments metadata
		Document segmentsMetadata = (Document) metadata.get("segments_metadata");
		// Get the segments metadata list
		@SuppressWarnings("unchecked")
		ArrayList<Document> segmentsMetadataList = 
			(ArrayList<Document>) segmentsMetadata.get("segments_metadata");
		// Get the list of segments results
		@SuppressWarnings("unchecked")
		ArrayList<Document> globalSegmentsResults = 
			(ArrayList<Document>) doc.get("global_segments_results");
		// Get individual iterations results
		@SuppressWarnings("unchecked" )
		ArrayList<Document> individualIterationsResults = 
			(ArrayList<Document>) doc.get("individual_iterations_results");
		// Build ROSResults document
		results.setSimulationHash(metadata.getString("simulation_hash"));
		results.setPlanFile(metadata.getString("plan_file"));
		results.setWorldFile(metadata.getString("world_file"));
		results.setRobotFile(metadata.getString("robot_file"));
		results.setMapFile(metadata.getString("map_file"));
		results.setDate(metadata.getString("date"));
		results.setnSegments(metadata.getInteger("n_segments"));
		results.setnIterations(metadata.getInteger("n_iterations"));
		results.setTimeoutFactor(metadata.getInteger("timeout_factor"));
		results.setUsefulSimulation(metadata.getBoolean("useful_simulation"));
		results.setLocalPlanner(metadata.getString("local_planner"));
		results.setGlobalPlanner(metadata.getString("global_planner"));
		for(int i = 0; i < results.getnSegments(); i++) {
			ROSSegment segment = new ROSSegment();
			segment.setIndex(i);
			segment.setFailures(globalSegmentsResults.get(i).getInteger("n_failures"));
			segment.setDistanceBetweenObstacles(
					segmentsMetadataList.get(i).getDouble("distance_between_obstacles"));
			segment.setTimeout(
					segmentsMetadataList.get(i).getInteger("segment_simulation_timeout"));
			segment.setTimeAverage(globalSegmentsResults.get(i).getDouble("time_mean"));
			segment.setTimeStandardDeviation(globalSegmentsResults.get(i).getDouble("time_stdev"));
			ArrayList<Double> individualTimes = new ArrayList<Double>();
			// Search individual times (each simulation iteration) for the current segment
			for(int j = 0; j < results.getnIterations(); j++) {
				@SuppressWarnings("unchecked" )
				ArrayList<Document> individualSegmentsResults = 
					(ArrayList<Document>) individualIterationsResults.get(j).get("segments_results");
				individualTimes.add(individualSegmentsResults.get(i).getDouble("time"));
				
			}
			segment.setIndividualTimes(individualTimes);
			results.addSegment(segment);
		}
		return results;
	}
	
	public static ROSResults parseMergedROSResultsDocument(Document doc) {
		ROSResults results = new ROSResults();
		// Get the list of segments results
		@SuppressWarnings("unchecked")
		ArrayList<Document> segments = 
			(ArrayList<Document>) doc.get("segments");
		// Build ROSResults document
		results.setSimulationHash(doc.getString("simulationHash"));
		results.setPlanFile(doc.getString("planFile"));
		results.setWorldFile(doc.getString("worldFile"));
		results.setRobotFile(doc.getString("robotFile"));
		results.setMapFile(doc.getString("mapFile"));
		results.setDate(doc.getString("date"));
		results.setnSegments(doc.getInteger("nSegments"));
		results.setnIterations(doc.getInteger("nIterations"));
		results.setTimeoutFactor(doc.getInteger("timeoutFactor"));
		results.setUsefulSimulation(doc.getBoolean("usefulSimulation"));
		results.setLocalPlanner(doc.getString("localPlanner"));
		results.setGlobalPlanner(doc.getString("globalPlanner"));
		results.setMerged(doc.getBoolean("merged"));
		for(int i = 0; i < results.getnSegments(); i++) {

			ROSSegment segment = new ROSSegment();
			segment.setIndex(i);
			segment.setFailures(segments.get(i).getInteger("failures"));
			segment.setDistanceBetweenObstacles(
					segments.get(i).getDouble("distanceBetweenObstacles"));
			segment.setTimeout(
					segments.get(i).getInteger("timeout"));
			segment.setTimeAverage(segments.get(i).getDouble("timeAverage"));
			//segment.setMaximumTime(segments.get(i).getDouble("maximumTime"));
			//segment.setMinimumTime(segments.get(i).getDouble("minimumTime"));
			segment.setTimeStandardDeviation(segments.get(i).getDouble("timeStandardDeviation"));
			
			// Search individual times (each simulation iteration) for the current segment
			@SuppressWarnings("unchecked" )
			ArrayList<Double> individualTimes =
				(ArrayList<Double>) segments.get(i).get("individualTimes");
			segment.setIndividualTimes(individualTimes);

			results.addSegment(segment);
		}
		return results;
	}
	
	public static PSIGHOSResults mergePSIGHOSResults(ArrayList<PSIGHOSResults> resultsList) {
		if(resultsList != null && resultsList.size() > 1) {

			// Initialize the PSIGHOS Results instance
			PSIGHOSResults results = new PSIGHOSResults(
					TimeUnit.MINUTE,
					resultsList.get(0).getnJanitors(),
					resultsList.get(0).getnDoctors(),
					resultsList.get(0).getnAutoChairs(),
					resultsList.get(0).getnManualChairs(),
					resultsList.get(0).getMaxJanitors(),
					resultsList.get(0).getMaxDoctors(),
					resultsList.get(0).getMaxAutoChairs(),
					resultsList.get(0).getMaxManualChairs(),
					resultsList.get(0).getPatientsPerArrival(),
					resultsList.get(0).getMinutesBetweenArrivals(),
					resultsList.get(0).getManualFactor()
					);
			
			ArrayList<Long> tmp = new ArrayList<Long>();
			// Get the accomodationTimes average for each element
			Set<Element> keySet = resultsList.get(0).getAccomodationTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getAccomodationTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getAccomodationTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getAccomodationTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			// Get the Times average for each element
			keySet = resultsList.get(0).getTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			// Get the CummWaitForJanitorTimes average for each element
			keySet = resultsList.get(0).getCummWaitForJanitorTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getCummWaitForJanitorTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getCummWaitForJanitorTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getCummWaitForJanitorTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			// Get the WaitForJanitorTimes average for each element
			keySet = resultsList.get(0).getWaitForJanitorTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getWaitForJanitorTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getWaitForJanitorTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getWaitForJanitorTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			// Get the CummWaitForDoctorTimes average for each element
			keySet = resultsList.get(0).getCummWaitForDoctorTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getCummWaitForDoctorTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getCummWaitForDoctorTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getCummWaitForDoctorTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			// Get the WaitForDoctorTimes average for each element
			keySet = resultsList.get(0).getWaitForDoctorTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getWaitForDoctorTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getWaitForDoctorTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getWaitForDoctorTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			// Get the AppointmentTimes average for each element
			keySet = resultsList.get(0).getAppointmentTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getAppointmentTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getAppointmentTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getAppointmentTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			// Get the RouteTimes average for each element
			keySet = resultsList.get(0).getRouteTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getRouteTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getRouteTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getRouteTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
	
			keySet.clear();
			// Get the AccomodationTimes average for each element
			keySet = resultsList.get(0).getAccomodationTimes().keySet();
			for(Element element : keySet) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getAccomodationTimes().get(element);
					if(v != null)
						tmp.add(resultsList.get(i).getAccomodationTimes().get(element));
				}
				if(tmp != null && tmp.size() > 0)
					results.getAccomodationTimes().put(element, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			keySet.clear();
			
			
			// Get the rTimes average for each resource
			Set<Resource> keySet2 = resultsList.get(0).getrTimes().keySet();
			for(Resource resource : keySet2) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getrTimes().get(resource);
					if(v != null)
						tmp.add(resultsList.get(i).getrTimes().get(resource));
				}
				if(tmp != null && tmp.size() > 0)
					results.getrTimes().put(resource, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			// Get the JanitorUsage average for each resource
			keySet2.clear();
			keySet2 = resultsList.get(0).getJanitorUsage().keySet();
			for(Resource resource : keySet2) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getJanitorUsage().get(resource);
					if(v != null)
						tmp.add(resultsList.get(i).getJanitorUsage().get(resource));
				}
				if(tmp != null && tmp.size() > 0)
					results.getJanitorUsage().put(resource, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			// Get the DoctorUsage average for each resource
			keySet2.clear();
			keySet2 = resultsList.get(0).getDoctorUsage().keySet();
			for(Resource resource : keySet2) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getDoctorUsage().get(resource);
					if(v != null)
						tmp.add(resultsList.get(i).getDoctorUsage().get(resource));
				}
				if(tmp != null && tmp.size() > 0)
					results.getDoctorUsage().put(resource, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			// Get the aChairUsage average for each resource
			keySet2.clear();
			keySet2 = resultsList.get(0).getaChairUsage().keySet();
			for(Resource resource : keySet2) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getaChairUsage().get(resource);
					if(v != null)
						tmp.add(resultsList.get(i).getaChairUsage().get(resource));
				}
				if(tmp != null && tmp.size() > 0)
					results.getaChairUsage().put(resource, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			// Get the aChairUsage average for each resource
			keySet2.clear();
			keySet2 = resultsList.get(0).getaChairUsage().keySet();
			for(Resource resource : keySet2) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getaChairUsage().get(resource);
					if(v != null)
						tmp.add(resultsList.get(i).getaChairUsage().get(resource));
				}
				if(tmp != null && tmp.size() > 0)
					results.getaChairUsage().put(resource, MathUtil.meanLong(tmp));
				tmp.clear();
			}

			// Get the mChairUsage average for each resource
			keySet2.clear();
			keySet2 = resultsList.get(0).getmChairUsage().keySet();
			for(Resource resource : keySet2) {
				for(int i = 0; i < resultsList.size(); i++) {
					Long v = resultsList.get(i).getmChairUsage().get(resource);
					if(v != null)
						tmp.add(v);
				}
				if(tmp != null && tmp.size() > 0)
					results.getmChairUsage().put(resource, MathUtil.meanLong(tmp));
				tmp.clear();
			}
			
			ArrayList<Integer> tmp2 = new ArrayList<Integer>();
			for(int i = 0; i < resultsList.size(); i++) {
				if(!resultsList.get(i).getPatientEndCounter().equals(null))
					tmp2.add(resultsList.get(i).getPatientEndCounter());
			}
			if(tmp2 != null && tmp2.size() > 0)
				results.setPatientEndCounter(MathUtil.meanInteger(tmp2));
			
			tmp2.clear();
			for(int i = 0; i < resultsList.size(); i++) {
				if(!resultsList.get(i).getaChairCounter().equals(null))
					tmp2.add(resultsList.get(i).getaChairCounter());
			}
			if(tmp2 != null && tmp2.size() > 0)
				results.setaChairCounter(MathUtil.meanInteger(tmp2));
			
			tmp2.clear();
			for(int i = 0; i < resultsList.size(); i++) {
				if(!resultsList.get(i).getmChairCounter().equals(null))
					tmp2.add(resultsList.get(i).getmChairCounter());
			}
			if(tmp2 != null && tmp2.size() > 0)
				results.setmChairCounter(MathUtil.meanInteger(tmp2));
			
			tmp2.clear();
			for(int i = 0; i < resultsList.size(); i++) {
				if(!resultsList.get(i).getDoctorCounter().equals(null))
					tmp2.add(resultsList.get(i).getDoctorCounter());
			}
			if(tmp2 != null && tmp2.size() > 0)
				results.setDoctorCounter(MathUtil.meanInteger(tmp2));
			
			tmp2.clear();
			for(int i = 0; i < resultsList.size(); i++) {
				if(!resultsList.get(i).getJanitorCounter().equals(null))
					tmp2.add(resultsList.get(i).getJanitorCounter());
			}
			if(tmp2 != null && tmp2.size() > 0)
				results.setJanitorCounter(MathUtil.meanInteger(tmp2));
			
			tmp2.clear();
			for(int i = 0; i < resultsList.size(); i++) {
				if(!resultsList.get(i).getnPatientsWaitForDoctor().equals(null))
					tmp2.add(resultsList.get(i).getnPatientsWaitForDoctor());
			}
			if(tmp2 != null && tmp2.size() > 0)
				results.setnPatientsWaitForDoctor(MathUtil.meanInteger(tmp2));
			
			tmp2.clear();
			for(int i = 0; i < resultsList.size(); i++) {
				if(!resultsList.get(i).getnPatientsWaitForJanitor().equals(null))
					tmp2.add(resultsList.get(i).getnPatientsWaitForJanitor());
			}
			if(tmp2 != null && tmp2.size() > 0)
				results.setnPatientsWaitForJanitor(MathUtil.meanInteger(tmp2));
			
			tmp.clear();
			for(int i = 0; i < resultsList.size(); i++) {
				Long v = resultsList.get(i).getEndTs();
				if(!v.equals(null))
					tmp.add(resultsList.get(i).getEndTs());
			}
			if(tmp != null && tmp.size() > 0)
				results.setEndTs(MathUtil.meanLong(tmp));
			
			return results;
		}
		return null;
	}
	
	
	
	public static ROSResults mergeROSResults(ArrayList<ROSResults> resultsList) {
		if(resultsList != null && resultsList.size() > 1) {
			
			// The merged results
			ROSResults results = new ROSResults();
			
			// New date
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String newDate = dateFormat.format(date); //2016/11/16 12:08:43	
			// Set the new date
			results.setDate(newDate);
			
			Integer nIterations = 0, nFailures = 0;
			
			for(int i = 0; i < resultsList.size(); i++) {
				nIterations += resultsList.get(i).getnIterations();
				nFailures += resultsList.get(i).getnFailures();
			}
			if(nIterations - nFailures >= 2) {
				results.setUsefulSimulation(true);
			}
			
			// Set others simulation parameters
			results.setGlobalPlanner("Merged");
			results.setLocalPlanner("Merged");
			results.setPlanFile(resultsList.get(0).getPlanFile());
			results.setWorldFile(resultsList.get(0).getWorldFile());
			results.setRobotFile(resultsList.get(0).getRobotFile());
			results.setMapFile(resultsList.get(0).getMapFile());
			results.setSimulationHash(resultsList.get(0).getSimulationHash());
			results.setnSegments(resultsList.get(0).getnSegments());
			
			/* FOR EACH SEGMENT (EACH ARRAY OF SIZE EQUAL TO THE TOTAL NUMBER OF ITERATIONS)*/
			// Individual segments times
			ArrayList<Double> individualTimes = new ArrayList<Double>();
			// Individual segments timeouts
			ArrayList<Integer> individualTimeouts = new ArrayList<Integer>();
			// Individual segments distances between obstacles
			ArrayList<Double> individualDistancesBetweenObstacles = new ArrayList<Double>();
			// Individual segments failures and iterations 
			Integer individualFailures = 0;
			
			/* FOR GLOBAL RESULTS */
			// Individual simulations timeout factors
			ArrayList<Integer> individualTimeoutFactors = new ArrayList<Integer>();
			// Global simulation failures and iterations
			Integer globalFailures = 0, globalIterations = 0;
			// Useful simulation
			Boolean usefulSimulation = false;
			
			results.setMerged(true);
			ROSSegment segment = new ROSSegment();
			
			// For each results segment
			for(int i = 0; i < resultsList.get(0).getnSegments(); i++) {
				segment.setIndex(i);
				// For each results instance
				for(int j = 0; j < resultsList.size(); j++) {
					// To avoid unnecessary iterations, set the global data 
					// only in the first iteration (first segment)
					if(i == 0) {
						globalFailures += resultsList.get(j).getnFailures();
						globalIterations += resultsList.get(j).getnIterations();
						individualTimeoutFactors.add(resultsList.get(j).getTimeoutFactor());
						if(!usefulSimulation && resultsList.get(j).getUsefulSimulation()) {
							usefulSimulation = true;
						}
					}
					// Get the segment data for the simulation j 
					individualTimeouts.add(resultsList.get(j).getSegments().get(i).getTimeout());
					individualDistancesBetweenObstacles.add(
							resultsList.get(j).getSegments().get(i).getDistanceBetweenObstacles());
					individualTimes.addAll(resultsList.get(j).getSegments().get(i).getIndividualTimes());
					individualFailures += resultsList.get(j).getSegments().get(i).getFailures();
				}
				if(i == 0) {
					results.setnFailures(globalFailures);
					results.setnIterations(globalIterations);
					results.setTimeoutFactor(MathUtil.meanInteger(individualTimeoutFactors));
					individualTimeoutFactors = new ArrayList<Integer>();
				}
				// Set the segment data
				segment.setDistanceBetweenObstacles(MathUtil.mean(individualDistancesBetweenObstacles));
				segment.setTimeout(MathUtil.meanInteger(individualTimeouts));
				segment.setTimeAverage(MathUtil.mean(individualTimes));
				segment.setTimeStandardDeviation(MathUtil.sd(individualTimes));
				segment.setFailures(individualFailures);
				segment.setIndividualTimes(individualTimes);
				results.addSegment(segment);
				// Reset the arrays content to fill them with the data of the
				// next segment
				individualTimes = new ArrayList<Double>();
				individualTimeouts = new ArrayList<Integer>();
				individualDistancesBetweenObstacles = new ArrayList<Double>();
				individualFailures = 0;
				segment = new ROSSegment();
			}
			return results;
		}
		return null;
	}
	
	public static class CustomOutputStream extends OutputStream {
	    private JTextArea textArea;
	     
	    public CustomOutputStream(JTextArea textArea) {
	        this.textArea = textArea;
	    }
	     
	    @Override
	    public void write(int b) throws IOException {
	        // redirects data to the text area
	        textArea.append(String.valueOf((char)b));
	        // scrolls the text area to the end of data
	        textArea.setCaretPosition(textArea.getDocument().getLength());
	    }
	}
	
	public static void showLongTextMessageInDialog(final javax.swing.JFrame  frame) {
	    JTextArea textArea = new JTextArea(25, 100);
	    textArea.setEditable(false);
	    PrintStream printStream = new PrintStream(new CustomOutputStream(textArea)); 
	    System.setOut(printStream);
	    //System.setErr(printStream);
	    final JScrollPane scrollPane = new JScrollPane(textArea);
	   // scrollPane.add(progressBar, BorderLayout.NORTH);
	    Thread t = new Thread(new Runnable() {
	    	public void run() {
	    		JOptionPane.showMessageDialog(frame, scrollPane);
	    	}
	    });
	    t.start();
	}
	
	public static String generateUniqueSimulationID() {
		return UUID.randomUUID().toString();
	}
	
}
