package concert_msgs;

public interface UpdateServiceConfigRequest extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/UpdateServiceConfigRequest";
  static final java.lang.String _DEFINITION = "ServiceProfile service_profile\n";
  concert_msgs.ServiceProfile getServiceProfile();
  void setServiceProfile(concert_msgs.ServiceProfile value);
}
