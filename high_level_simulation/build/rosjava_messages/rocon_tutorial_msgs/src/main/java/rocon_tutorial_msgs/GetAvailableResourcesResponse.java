package rocon_tutorial_msgs;

public interface GetAvailableResourcesResponse extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_tutorial_msgs/GetAvailableResourcesResponse";
  static final java.lang.String _DEFINITION = "string[] available_resources\nstring[] preemptible_resources";
  java.util.List<java.lang.String> getAvailableResources();
  void setAvailableResources(java.util.List<java.lang.String> value);
  java.util.List<java.lang.String> getPreemptibleResources();
  void setPreemptibleResources(java.util.List<java.lang.String> value);
}
