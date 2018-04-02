package es.ull.autonomous_vehicles_system_simulation.high_level_simulation;

import com.fasterxml.jackson.databind.JsonNode;
import ros.RosBridge;
import ros.RosListenDelegate;
import ros.SubscriptionRequestMsg;
import ros.msgs.std_msgs.PrimitiveMsg;
import ros.tools.MessageUnpacker;


public class RosTest {

	public static void main(String[] args) {


		RosBridge bridge = new RosBridge();
		bridge.connect("ws://localhost:9090", true);

		bridge.subscribe(SubscriptionRequestMsg.generate("/path_plan_info")
					.setType("costum_msgs/PathInfo")
					.setThrottleRate(1)
					.setQueueLength(1),
				new RosListenDelegate() {
					public void receive(JsonNode data, String stringRep) {
						MessageUnpacker<PrimitiveMsg<String>> unpacker = new MessageUnpacker<PrimitiveMsg<String>>(PrimitiveMsg.class);
						PrimitiveMsg<String> msg = unpacker.unpackRosMessage(data);
						System.out.println(stringRep);
					}
				}
		);

	}

}