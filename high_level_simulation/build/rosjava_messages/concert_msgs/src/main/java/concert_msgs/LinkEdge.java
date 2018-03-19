package concert_msgs;

public interface LinkEdge extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/LinkEdge";
  static final java.lang.String _DEFINITION = "# Edge of the implementation graph. Client-Topic, or \n# Topic-Client or Client-Action or Action-Client\n\nstring start\nstring finish\nstring remap_from\nstring remap_to";
  java.lang.String getStart();
  void setStart(java.lang.String value);
  java.lang.String getFinish();
  void setFinish(java.lang.String value);
  java.lang.String getRemapFrom();
  void setRemapFrom(java.lang.String value);
  java.lang.String getRemapTo();
  void setRemapTo(java.lang.String value);
}
