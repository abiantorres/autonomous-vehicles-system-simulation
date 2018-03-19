package concert_msgs;

public interface ConcertClient extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/ConcertClient";
  static final java.lang.String _DEFINITION = "\n# The concert alias\nstring name\n\n# The unfriendly gateway name with the uuid suffix.\nstring gateway_name\n\n# Platform information about the concert client.\nrocon_std_msgs/MasterInfo platform_info\n\n# Is on the same machine ip as the conductor\nbool is_local_client\n\n# State of the concert client, see ConcertClientState.msg for string constants\n# PENDING, BUSY, BLOCKING, BAD, JOINING, UNINVITED, AVAILABLE, MISSING, GONE \nstring state\n\n# Statistics\nstring ip\ngateway_msgs/ConnectionStatistics conn_stats\n# time last_connection_timestamp\n\nrocon_app_manager_msgs/Rapp[] rapps\n";
  java.lang.String getName();
  void setName(java.lang.String value);
  java.lang.String getGatewayName();
  void setGatewayName(java.lang.String value);
  rocon_std_msgs.MasterInfo getPlatformInfo();
  void setPlatformInfo(rocon_std_msgs.MasterInfo value);
  boolean getIsLocalClient();
  void setIsLocalClient(boolean value);
  java.lang.String getState();
  void setState(java.lang.String value);
  java.lang.String getIp();
  void setIp(java.lang.String value);
  gateway_msgs.ConnectionStatistics getConnStats();
  void setConnStats(gateway_msgs.ConnectionStatistics value);
  java.util.List<rocon_app_manager_msgs.Rapp> getRapps();
  void setRapps(java.util.List<rocon_app_manager_msgs.Rapp> value);
}
