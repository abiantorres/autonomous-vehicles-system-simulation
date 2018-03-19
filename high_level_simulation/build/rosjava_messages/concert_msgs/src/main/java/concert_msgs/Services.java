package concert_msgs;

public interface Services extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/Services";
  static final java.lang.String _DEFINITION = "ServiceProfile[] services\n";
  java.util.List<concert_msgs.ServiceProfile> getServices();
  void setServices(java.util.List<concert_msgs.ServiceProfile> value);
}
