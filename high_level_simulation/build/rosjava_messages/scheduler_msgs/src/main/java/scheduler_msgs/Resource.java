package scheduler_msgs;

public interface Resource extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "scheduler_msgs/Resource";
  static final java.lang.String _DEFINITION = "### ROCON resource request or response.\n#\n#   A scheduler_msgs/Request message includes one Resource message for\n#   each desired resource.  The scheduler responds using this same\n#   message to identify exactly what corresponding resource it has\n#   granted.\n\n# This is usually a uniquely identifying ros_package/rapp name\n# identifier, which is unique because ros packages are unique.\nstring rapp\n\n# Unique identifier assigned by the requester to track resources\n# assigned in the scheduler feedback.\nuuid_msgs/UniqueID id\n\n# Uniform Resource Identifier for the platform.  ROCON defines two\n# kinds of URI strings:\n#\n# 1) A \"resource description URI\" is a canonical string for a specific\n#    device.  All components are fully resolved to their most specific\n#    values, like:\n#\n#      \"rocon:/turtlebot/dude3/hydro/precise\"\n#\n#    The scheduler provides fully resolved resource description URIs\n#    in its feedback for requests that have been granted.\n#\n# 2) A \"request URI\" may provide a similar descriptive representation,\n#    or may include patterns for matching multiple alternative\n#    platforms.  Omitted or \'*\' patterns match any valid value:\n#\n#      \"\"                               # (empty string): any platform\n#      \"rocon:/turtlebot\"               # any turtlebot\n#      \"rocon:/(turtlebot|segbot)\"      # any robot of either type\n#      \"rocon:/*/dude3\"                 # any device named dude3\n#      \"rocon:/*/*/ros/ubuntu\"          # any ROS Ubuntu platform\n#\nstring uri\n\n# Remappings which get passed on for starting the rapps. Also potentially for\n# more esoteric use cases such as checking whether an app is sharable.\nrocon_std_msgs/Remapping[] remappings\nrocon_std_msgs/KeyValue[] parameters\n";
  java.lang.String getRapp();
  void setRapp(java.lang.String value);
  uuid_msgs.UniqueID getId();
  void setId(uuid_msgs.UniqueID value);
  java.lang.String getUri();
  void setUri(java.lang.String value);
  java.util.List<rocon_std_msgs.Remapping> getRemappings();
  void setRemappings(java.util.List<rocon_std_msgs.Remapping> value);
  java.util.List<rocon_std_msgs.KeyValue> getParameters();
  void setParameters(java.util.List<rocon_std_msgs.KeyValue> value);
}
