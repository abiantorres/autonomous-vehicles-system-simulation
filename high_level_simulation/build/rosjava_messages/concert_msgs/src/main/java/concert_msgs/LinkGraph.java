package concert_msgs;

public interface LinkGraph extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/LinkGraph";
  static final java.lang.String _DEFINITION = "# A list of \'named\' nodes, e.g. linux.*.ros.robosem.rocon_teleop\n\nLinkNode[]        nodes\nLinkConnection[]  topics\nLinkConnection[]  actions\nLinkConnection[]  services\nLinkEdge[]        edges\n";
  java.util.List<concert_msgs.LinkNode> getNodes();
  void setNodes(java.util.List<concert_msgs.LinkNode> value);
  java.util.List<concert_msgs.LinkConnection> getTopics();
  void setTopics(java.util.List<concert_msgs.LinkConnection> value);
  java.util.List<concert_msgs.LinkConnection> getActions();
  void setActions(java.util.List<concert_msgs.LinkConnection> value);
  java.util.List<concert_msgs.LinkConnection> getServices();
  void setServices(java.util.List<concert_msgs.LinkConnection> value);
  java.util.List<concert_msgs.LinkEdge> getEdges();
  void setEdges(java.util.List<concert_msgs.LinkEdge> value);
}
