package concert_msgs;

public interface AllocateSoftwareRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/AllocateSoftwareRequest";
  static final java.lang.String _DEFINITION = "string user \nstring software\nbool allocate\nrocon_std_msgs/KeyValue[] parameters\n";
  java.lang.String getUser();
  void setUser(java.lang.String value);
  java.lang.String getSoftware();
  void setSoftware(java.lang.String value);
  boolean getAllocate();
  void setAllocate(boolean value);
  java.util.List<rocon_std_msgs.KeyValue> getParameters();
  void setParameters(java.util.List<rocon_std_msgs.KeyValue> value);
}
