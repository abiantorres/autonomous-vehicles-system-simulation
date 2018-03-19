package concert_msgs;

public interface LinkConnection extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/LinkConnection";
  static final java.lang.String _DEFINITION = "# Representation of a topic/action node in the \n# implementation graph\n\n# unique identifier\nstring id\n# type of the topic, e.g. std_msgs/String\nstring type\n";
  java.lang.String getId();
  void setId(java.lang.String value);
  java.lang.String getType();
  void setType(java.lang.String value);
}
