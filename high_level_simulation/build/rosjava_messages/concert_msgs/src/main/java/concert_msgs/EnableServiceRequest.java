package concert_msgs;

public interface EnableServiceRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/EnableServiceRequest";
  static final java.lang.String _DEFINITION = "string name \nbool enable\n";
  java.lang.String getName();
  void setName(java.lang.String value);
  boolean getEnable();
  void setEnable(boolean value);
}
