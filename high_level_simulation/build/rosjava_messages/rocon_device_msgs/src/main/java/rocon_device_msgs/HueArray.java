package rocon_device_msgs;

public interface HueArray extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_device_msgs/HueArray";
  static final java.lang.String _DEFINITION = "Hue[] hue_list\n";
  java.util.List<rocon_device_msgs.Hue> getHueList();
  void setHueList(java.util.List<rocon_device_msgs.Hue> value);
}
