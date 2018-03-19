package rocon_device_msgs;

public interface GetDeviceListResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_device_msgs/GetDeviceListResponse";
  static final java.lang.String _DEFINITION = "Device[] devices";
  java.util.List<rocon_device_msgs.Device> getDevices();
  void setDevices(java.util.List<rocon_device_msgs.Device> value);
}
