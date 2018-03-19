package concert_msgs;

public interface SoftwareInstances extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/SoftwareInstances";
  static final java.lang.String _DEFINITION = "SoftwareInstance[] instances\n";
  java.util.List<concert_msgs.SoftwareInstance> getInstances();
  void setInstances(java.util.List<concert_msgs.SoftwareInstance> value);
}
