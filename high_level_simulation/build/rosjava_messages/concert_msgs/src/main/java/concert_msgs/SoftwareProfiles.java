package concert_msgs;

public interface SoftwareProfiles extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/SoftwareProfiles";
  static final java.lang.String _DEFINITION = "SoftwareProfile[] profiles \n";
  java.util.List<concert_msgs.SoftwareProfile> getProfiles();
  void setProfiles(java.util.List<concert_msgs.SoftwareProfile> value);
}
