package concert_msgs;

public interface ServiceProfile extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/ServiceProfile";
  static final java.lang.String _DEFINITION = "# Constants - service types\nstring TYPE_ROSLAUNCH = roslaunch\nstring TYPE_CUSTOM    = custom\nstring TYPE_SHADOW    = shadow\n\n# Pre-configured parameters\nstring                      resource_name\nstring                      name\nstring                      description\nstring                      author\nuint16                      priority\nrocon_std_msgs/Icon         icon\nstring                      launcher_type\nstring                      launcher\nstring                      interactions\nstring                      parameters\nrocon_std_msgs/KeyValue[]   parameters_detail\n\n# Initialised parameters (on startup)\nuuid_msgs/UniqueID          uuid\n\n# Runtime variables\nint16                       status\nbool                        enabled\n";
  static final java.lang.String TYPE_ROSLAUNCH = "roslaunch";
  static final java.lang.String TYPE_CUSTOM = "custom";
  static final java.lang.String TYPE_SHADOW = "shadow";
  java.lang.String getResourceName();
  void setResourceName(java.lang.String value);
  java.lang.String getName();
  void setName(java.lang.String value);
  java.lang.String getDescription();
  void setDescription(java.lang.String value);
  java.lang.String getAuthor();
  void setAuthor(java.lang.String value);
  short getPriority();
  void setPriority(short value);
  rocon_std_msgs.Icon getIcon();
  void setIcon(rocon_std_msgs.Icon value);
  java.lang.String getLauncherType();
  void setLauncherType(java.lang.String value);
  java.lang.String getLauncher();
  void setLauncher(java.lang.String value);
  java.lang.String getInteractions();
  void setInteractions(java.lang.String value);
  java.lang.String getParameters();
  void setParameters(java.lang.String value);
  java.util.List<rocon_std_msgs.KeyValue> getParametersDetail();
  void setParametersDetail(java.util.List<rocon_std_msgs.KeyValue> value);
  uuid_msgs.UniqueID getUuid();
  void setUuid(uuid_msgs.UniqueID value);
  short getStatus();
  void setStatus(short value);
  boolean getEnabled();
  void setEnabled(boolean value);
}
