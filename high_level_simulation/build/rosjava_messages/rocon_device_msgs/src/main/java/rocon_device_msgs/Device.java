package rocon_device_msgs;

public interface Device extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_device_msgs/Device";
  static final java.lang.String _DEFINITION = "string label\nstring type\nstring uuid\nrocon_std_msgs/KeyValue[] data\n";
  java.lang.String getLabel();
  void setLabel(java.lang.String value);
  java.lang.String getType();
  void setType(java.lang.String value);
  java.lang.String getUuid();
  void setUuid(java.lang.String value);
  java.util.List<rocon_std_msgs.KeyValue> getData();
  void setData(java.util.List<rocon_std_msgs.KeyValue> value);
}
