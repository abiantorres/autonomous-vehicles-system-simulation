package rocon_tutorial_msgs;

public interface GetAvailableResourcesRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_tutorial_msgs/GetAvailableResourcesRequest";
  static final java.lang.String _DEFINITION = "string rapp\nint16 priority\n";
  java.lang.String getRapp();
  void setRapp(java.lang.String value);
  short getPriority();
  void setPriority(short value);
}
