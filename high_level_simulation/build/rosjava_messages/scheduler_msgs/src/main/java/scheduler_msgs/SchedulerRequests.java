package scheduler_msgs;

public interface SchedulerRequests extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "scheduler_msgs/SchedulerRequests";
  static final java.lang.String _DEFINITION = "### Scheduler Requests\n#\n#   Rocon services send this message on the scheduler\'s input topic to\n#   make or update their resource requests.  All resources they\n#   currently have or desire should be included.\n#\n#   If not all of the requested resources are immediately available,\n#   the scheduler will queue those requests and provide feedback using\n#   a message of the same type.  The requester should wait until\n#   feedback indicates the associated resources are available.  It may\n#   cancel some requests at any time via an new allocation message.\n#\nHeader header                   # Time of this status, frame_id irrelevant\nuuid_msgs/UniqueID requester    # Requester identifier\nRequest[] requests              # Status of every currently-known request\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  uuid_msgs.UniqueID getRequester();
  void setRequester(uuid_msgs.UniqueID value);
  java.util.List<scheduler_msgs.Request> getRequests();
  void setRequests(java.util.List<scheduler_msgs.Request> value);
}
