package scheduler_msgs;

public interface KnownResources extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "scheduler_msgs/KnownResources";
  static final java.lang.String _DEFINITION = "### Known resources.\n#\n#   A ROCON scheduler uses this message to report the status of all\n#   the resources it knows about and manages.\n#\nHeader header                   # Time of this status, frame_id irrelevant\nCurrentStatus[] resources       # Status of every currently-known resource\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  java.util.List<scheduler_msgs.CurrentStatus> getResources();
  void setResources(java.util.List<scheduler_msgs.CurrentStatus> value);
}
