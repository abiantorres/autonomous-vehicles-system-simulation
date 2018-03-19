package concert_msgs;

public interface LinkNode extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/LinkNode";
  static final java.lang.String _DEFINITION = "# Representation of a concert client node in the implementation graph\n\n# unique identifier\nstring id\n\n# rocon uri representing the required resource, e.g. rocon:/turtlebot/*#turtle_concert/turtle_stroll\nstring resource\n\n# Constraints on how many of these nodes may exist\n#   min, max not set -> min = 1, max = 1\n#   min not set -> min = 1\n#   max not set -> max = UNLIMITED_RESOURCE\n# Zero is a valid minimum value\nint8 UNLIMITED_RESOURCE=-1\nint8 min\nint8 max\n\n# Force matching of robot name (only really useful for demos)\nbool force_name_matching\n\n# public parameters for node\nrocon_std_msgs/KeyValue parameters\n";
  static final byte UNLIMITED_RESOURCE = -1;
  java.lang.String getId();
  void setId(java.lang.String value);
  java.lang.String getResource();
  void setResource(java.lang.String value);
  byte getMin();
  void setMin(byte value);
  byte getMax();
  void setMax(byte value);
  boolean getForceNameMatching();
  void setForceNameMatching(boolean value);
  rocon_std_msgs.KeyValue getParameters();
  void setParameters(rocon_std_msgs.KeyValue value);
}
