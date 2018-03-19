package scheduler_msgs;

public interface CurrentStatus extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "scheduler_msgs/CurrentStatus";
  static final java.lang.String _DEFINITION = "### ROCON resource current status.\n#\n#   A ROCON scheduler uses this message to report the status of each\n#   resource it manages.\n#\n\n##############################################################################\n# Resource Identification\n##############################################################################\n\n#   A canonical ROCON Uniform Resource Identifier describing this\n#   resource, a fully-resolved character string in the form:\n#\n#      rocon:/platform/name/framework/os\n#\nstring uri\n\n##############################################################################\n# Status\n##############################################################################\n\nuint8 status            # Current status of this resource\n\n#  Status value labels:\nuint8 AVAILABLE   = 0   # Available for use\nuint8 ALLOCATED   = 1   # Allocated to some ROCON request\nuint8 MISSING     = 2   # Not currently responding\nuint8 GONE        = 3   # Has left the concert (cleanly)\n\n#   The owner is the unique identifier of the Request message to which\n#   this resource is currently assigned, or a zero UUID if it is not\n#   assigned.  An AVAILABLE resource never has an owner, but a MISSING\n#   one might.\nuuid_msgs/UniqueID owner\n\n#   The priority of an ALLOCATED resource is the priority of its\n#   owning request.  An AVAILABLE resource never has a non-zero\n#   priority, but a MISSING one might.\nint16 priority\n\n#   List of ROCON application names currently available with this\n#   resource. The name string is usually a ROS \"package/node\"\n#   identifier, unique because ROS package names are unique.  The\n#   contents of this list could change over time due to the device\'s\n#   own activities.\nstring[] rapps\n";
  static final byte AVAILABLE = 0;
  static final byte ALLOCATED = 1;
  static final byte MISSING = 2;
  static final byte GONE = 3;
  java.lang.String getUri();
  void setUri(java.lang.String value);
  byte getStatus();
  void setStatus(byte value);
  uuid_msgs.UniqueID getOwner();
  void setOwner(uuid_msgs.UniqueID value);
  short getPriority();
  void setPriority(short value);
  java.util.List<java.lang.String> getRapps();
  void setRapps(java.util.List<java.lang.String> value);
}
