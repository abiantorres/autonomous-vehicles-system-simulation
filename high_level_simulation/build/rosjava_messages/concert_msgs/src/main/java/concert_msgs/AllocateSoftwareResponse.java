package concert_msgs;

public interface AllocateSoftwareResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/AllocateSoftwareResponse";
  static final java.lang.String _DEFINITION = "bool success\nrocon_std_msgs/KeyValue[] parameters\nstring namespace # if success\nstring error_message # if fails";
  boolean getSuccess();
  void setSuccess(boolean value);
  java.util.List<rocon_std_msgs.KeyValue> getParameters();
  void setParameters(java.util.List<rocon_std_msgs.KeyValue> value);
  java.lang.String getNamespace();
  void setNamespace(java.lang.String value);
  java.lang.String getErrorMessage();
  void setErrorMessage(java.lang.String value);
}
