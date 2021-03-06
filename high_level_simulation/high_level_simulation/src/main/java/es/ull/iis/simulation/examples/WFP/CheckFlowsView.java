/**
 * 
 */
package es.ull.iis.simulation.examples.WFP;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.TreeSet;

import es.ull.iis.simulation.info.ElementActionInfo;
import es.ull.iis.simulation.info.ElementActionInfo.Type;
import es.ull.iis.simulation.info.ElementInfo;
import es.ull.iis.simulation.info.SimulationEndInfo;
import es.ull.iis.simulation.info.SimulationInfo;
import es.ull.iis.simulation.info.SimulationStartInfo;
import es.ull.iis.simulation.model.flow.ActivityFlow;
import es.ull.iis.simulation.model.flow.Flow;
import es.ull.iis.simulation.model.flow.ParallelFlow;
import es.ull.iis.simulation.model.flow.RequestResourcesFlow;

/**
 * @author Iv�n Castilla Rodr�guez
 * 
 */
public class CheckFlowsView extends WFPTestView {
	FlowNode flow;
	TreeMap<RequestResourcesFlow, Long> durations = new TreeMap<RequestResourcesFlow, Long>();
	ArrayList<TreeSet<EventToCheck>> futureFlow;
	private boolean ok = true;

	public CheckFlowsView(Flow f, TreeMap<RequestResourcesFlow, Long> durations) {
		this(f, durations, true);
	}

	public CheckFlowsView(Flow f, TreeMap<RequestResourcesFlow, Long> durations, boolean detailed) {
		super("Checking flows...", detailed);
		addEntrance(ElementInfo.class);
		addEntrance(ElementActionInfo.class);
		addEntrance(SimulationEndInfo.class);
		addEntrance(SimulationStartInfo.class);
		this.durations = durations;
		this.flow = createFlow(f);
		futureFlow = new ArrayList<TreeSet<EventToCheck>>(
				WFPTestSimulationFactory.DEFNELEMENTS);
		for (int i = 0; i < WFPTestSimulationFactory.DEFNELEMENTS; i++) 
			futureFlow.add(new TreeSet<EventToCheck>());

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * es.ull.iis.simulation.inforeceiver.InfoReceiver#infoEmited(es.ull.iis.simulation.info.SimulationInfo)
	 */
	@Override
	public void infoEmited(SimulationInfo info) {
		EventToCheck ev;
		if (info instanceof ElementActionInfo) {
			ElementActionInfo eInfo = (ElementActionInfo) info;
			if (detailed)
				System.out.print(eInfo + "...\t");
			switch(eInfo.getType()) {
			case REQ:
				ev = new EventToCheck(Type.REQ, eInfo.getActivity().getIdentifier(), eInfo.getTs());
				printResult(futureFlow.get(eInfo.getElement().getIdentifier()).remove(ev), "unexpected event!"); 
				// deber�a chequear los recursos
				futureFlow.get(eInfo.getElement().getIdentifier()).add(new EventToCheck(Type.START, eInfo.getActivity().getIdentifier(), eInfo.getTs()));
				break;
			case START:
				ev = new EventToCheck(Type.START, eInfo.getActivity().getIdentifier(), eInfo.getTs());
				printResult(futureFlow.get(eInfo.getElement().getIdentifier()).remove(ev), "unexpected event!"); 
				long nextTs = eInfo.getTs() + durations.get(eInfo.getActivity());
				futureFlow.get(eInfo.getElement().getIdentifier()).add(new EventToCheck(Type.END, eInfo.getActivity().getIdentifier(), nextTs));
				break;
			case END:
				ev = new EventToCheck(Type.END, eInfo.getActivity().getIdentifier(), eInfo.getTs());
				printResult(futureFlow.get(eInfo.getElement().getIdentifier()).remove(ev), "unexpected event!"); 
				SingleFlowNode f = flow.search(eInfo.getActivity().getIdentifier());
				if (f.next != null)
					f.next.add2FutureFlow(eInfo.getElement().getIdentifier(), eInfo.getTs());
				break;
			}
		}
		else if (info instanceof ElementInfo) {
			ElementInfo eInfo = (ElementInfo) info;
			switch(eInfo.getType()) {
			case START:
				flow.add2FutureFlow(eInfo.getElement().getIdentifier(), eInfo.getTs());
				break;
			case FINISH:
				if (detailed)
					System.out.print(eInfo + "...\t");
				printResult(futureFlow.get(eInfo.getElement().getIdentifier()).isEmpty(), "unexpected end: not all the events were executed!"); 
				break;
			}
		}
		else if (info instanceof SimulationEndInfo) {
			System.out.println();
			notifyResult(ok);			
		}
		else if (info instanceof SimulationStartInfo) {
			System.out.println("--------------------------------------------------");
			System.out.println("Checking " + info.getSimul().getDescription());
			System.out.println();
		}
	}

	private void printResult(boolean result, String errMsg) {
		if (!detailed) {
			if (!result)
				ok = false;
		}
		else if (result)
			System.out.println("PASSED");
		else {
			System.out.println("ERROR " + errMsg);
			ok = false;
		}
	}
	
	private FlowNode createFlow(Flow f) {
		if (f instanceof ActivityFlow) {
			ActivityFlow sf = (ActivityFlow) f;
			int actId = sf.getIdentifier();
			if (sf.getSuccessor() == null)
				return new SingleFlowNode(sf.getIdentifier(), actId, durations.get(sf), null);
			return new SingleFlowNode(sf.getIdentifier(), actId, durations.get(sf), createFlow(sf.getSuccessor()));
		}
		if (f instanceof ParallelFlow) {
			ParallelFlow pf = (ParallelFlow) f;
			GroupFlowNode gf = new GroupFlowNode();
			for (Flow aux : pf.getSuccessorList())
				gf.addNode(createFlow(aux));
			return gf;
		}
		
		return null;
	}

	interface FlowNode {
		void add2FutureFlow(int eId, double ts);
		SingleFlowNode search(int id);
	}

	class SingleFlowNode implements FlowNode {
		int actId;
		double duration;
		FlowNode next;
		int id;

		/**
		 * @param actId
		 * @param duration
		 * @param next
		 */
		public SingleFlowNode(int id, int actId, double duration, FlowNode next) {
			this.id = id;
			this.actId = actId;
			this.duration = duration;
			this.next = next;
		}

		public void add2FutureFlow(int eId, double ts) {
			futureFlow.get(eId).add(
					new EventToCheck(ElementActionInfo.Type.REQ, actId, ts));
		}

		public SingleFlowNode search(int id) {
			if (this.id == id)
				return this;
			if (next != null)
				return next.search(id);
			return null;
		}
	}

	class GroupFlowNode implements FlowNode {
		ArrayDeque<FlowNode> list;

		public GroupFlowNode() {
			super();
			list = new ArrayDeque<FlowNode>();
		}

		public void addNode(FlowNode f) {
			list.add(f);
		}
		
		public void add2FutureFlow(int eId, double ts) {
			for (FlowNode f : list)
				f.add2FutureFlow(eId, ts);
		}

		public SingleFlowNode search(int id) {
			for (FlowNode f : list) {
				SingleFlowNode sf = f.search(id);
				if (sf != null)
					return sf;
			}
			return null;
		}
	}

	class EventToCheck implements Comparable<EventToCheck> {
		final ElementActionInfo.Type type;
		final int actId;
		final double ts;

		/**
		 * @param type
		 * @param ts
		 */
		public EventToCheck(Type type, int actId, double ts) {
			this.type = type;
			this.actId = actId;
			this.ts = ts;
		}

		public int compareTo(EventToCheck o) {
			if (type.ordinal() > o.type.ordinal())
				return 1;
			if (type.ordinal() < o.type.ordinal())
				return -1;
			if (actId > o.actId)
				return 1;
			if (actId < o.actId)
				return -1;
			return 0;
		}
	}
}
