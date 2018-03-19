package concert_msgs;

public interface SoftwareProfile extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/SoftwareProfile";
  static final java.lang.String _DEFINITION = "# Configurations\nstring resource_name\nstring name\nstring description\nstring author\nstring launch\nint16  max_count\nrocon_std_msgs/KeyValue[] parameters\n";
  java.lang.String getResourceName();
  void setResourceName(java.lang.String value);
  java.lang.String getName();
  void setName(java.lang.String value);
  java.lang.String getDescription();
  void setDescription(java.lang.String value);
  java.lang.String getAuthor();
  void setAuthor(java.lang.String value);
  java.lang.String getLaunch();
  void setLaunch(java.lang.String value);
  short getMaxCount();
  void setMaxCount(short value);
  java.util.List<rocon_std_msgs.KeyValue> getParameters();
  void setParameters(java.util.List<rocon_std_msgs.KeyValue> value);
}
