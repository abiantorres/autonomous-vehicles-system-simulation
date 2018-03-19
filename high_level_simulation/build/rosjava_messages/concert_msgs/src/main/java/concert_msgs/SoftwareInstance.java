package concert_msgs;

public interface SoftwareInstance extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/SoftwareInstance";
  static final java.lang.String _DEFINITION = "# Runtime\nstring  resource_name\nstring  name\n\nint16   max_count\nstring  namespace\nstring[] users\nrocon_std_msgs/KeyValue[] parameters\n";
  java.lang.String getResourceName();
  void setResourceName(java.lang.String value);
  java.lang.String getName();
  void setName(java.lang.String value);
  short getMaxCount();
  void setMaxCount(short value);
  java.lang.String getNamespace();
  void setNamespace(java.lang.String value);
  java.util.List<java.lang.String> getUsers();
  void setUsers(java.util.List<java.lang.String> value);
  java.util.List<rocon_std_msgs.KeyValue> getParameters();
  void setParameters(java.util.List<rocon_std_msgs.KeyValue> value);
}
