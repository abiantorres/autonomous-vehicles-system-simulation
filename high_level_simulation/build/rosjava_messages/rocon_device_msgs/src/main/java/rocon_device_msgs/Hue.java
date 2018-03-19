package rocon_device_msgs;

public interface Hue extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_device_msgs/Hue";
  static final java.lang.String _DEFINITION = "int32 light_id\nstring type\nstring name\nstring modelid\nstring swvesion\nHueState state";
  int getLightId();
  void setLightId(int value);
  java.lang.String getType();
  void setType(java.lang.String value);
  java.lang.String getName();
  void setName(java.lang.String value);
  java.lang.String getModelid();
  void setModelid(java.lang.String value);
  java.lang.String getSwvesion();
  void setSwvesion(java.lang.String value);
  rocon_device_msgs.HueState getState();
  void setState(rocon_device_msgs.HueState value);
}
