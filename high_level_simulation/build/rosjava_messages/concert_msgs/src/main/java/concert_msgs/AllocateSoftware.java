package concert_msgs;

public interface AllocateSoftware extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/AllocateSoftware";
  static final java.lang.String _DEFINITION = "string user \nstring software\nbool allocate\nrocon_std_msgs/KeyValue[] parameters\n---\nbool success\nrocon_std_msgs/KeyValue[] parameters\nstring namespace # if success\nstring error_message # if fails\n";
}
