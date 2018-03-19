package concert_msgs;

public interface ConcertClients extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/ConcertClients";
  static final java.lang.String _DEFINITION = "\n# Clients that have been invited to this concert and can be used\nconcert_msgs/ConcertClient[] clients\n\n# Clients that have disappeared from the gateway network without formally leaving. \n# Usually this will mean they have dropped off the wireless\nconcert_msgs/ConcertClient[] missing_clients\n\n# Clients that are on the gateway network, but haven\'t been invited by this concert yet\n# We do not have any implementation that can invite except by a conductor\'s auto_invite yet.\nconcert_msgs/ConcertClient[] pending_clients\n";
  java.util.List<concert_msgs.ConcertClient> getClients();
  void setClients(java.util.List<concert_msgs.ConcertClient> value);
  java.util.List<concert_msgs.ConcertClient> getMissingClients();
  void setMissingClients(java.util.List<concert_msgs.ConcertClient> value);
  java.util.List<concert_msgs.ConcertClient> getPendingClients();
  void setPendingClients(java.util.List<concert_msgs.ConcertClient> value);
}
