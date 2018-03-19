package concert_msgs;

public interface Strings extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/Strings";
  static final java.lang.String _DEFINITION = "# Some commonly used constant strings in the concert.\n#\n# Note: avoid using hardcoded topic_name strings here. Prefer rostopic.find_by_type\n# and rosservice.rosservice_find for getting services that should be unique\n# (e.g. gateway/interactions). Refer to rocon_python_comms for some wrappers around these.\n\n# Parameters\nstring PARAM_ROCON_SCREEN = /rocon/screen\n\n# Scheduler\nstring SCHEDULER_UNALLOCATED_RESOURCE = unallocated\n\n# Conductor\nstring CONCERT_CLIENTS = /concert/conductor/concert_clients\n\n# Namespaces\nstring SERVICE_NAMESPACE = /services\nstring SOFTWARE_NAMESPACE = /software\n";
  static final java.lang.String PARAM_ROCON_SCREEN = "/rocon/screen";
  static final java.lang.String SCHEDULER_UNALLOCATED_RESOURCE = "unallocated";
  static final java.lang.String CONCERT_CLIENTS = "/concert/conductor/concert_clients";
  static final java.lang.String SERVICE_NAMESPACE = "/services";
  static final java.lang.String SOFTWARE_NAMESPACE = "/software";
}
