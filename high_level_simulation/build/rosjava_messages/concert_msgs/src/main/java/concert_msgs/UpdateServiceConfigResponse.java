package concert_msgs;

public interface UpdateServiceConfigResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/UpdateServiceConfigResponse";
  static final java.lang.String _DEFINITION = "bool success\nstring error_message";
  boolean getSuccess();
  void setSuccess(boolean value);
  java.lang.String getErrorMessage();
  void setErrorMessage(java.lang.String value);
}
