package rocon_device_msgs;

public interface Devices extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_device_msgs/Devices";
  static final java.lang.String _DEFINITION = "Device[] devices\n";
  java.util.List<rocon_device_msgs.Device> getDevices();
  void setDevices(java.util.List<rocon_device_msgs.Device> value);
}
