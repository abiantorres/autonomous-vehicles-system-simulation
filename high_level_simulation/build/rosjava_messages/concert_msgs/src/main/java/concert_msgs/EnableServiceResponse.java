package concert_msgs;

public interface EnableServiceResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/EnableServiceResponse";
  static final java.lang.String _DEFINITION = "bool success\nstring error_message";
  boolean getSuccess();
  void setSuccess(boolean value);
  java.lang.String getErrorMessage();
  void setErrorMessage(java.lang.String value);
}
