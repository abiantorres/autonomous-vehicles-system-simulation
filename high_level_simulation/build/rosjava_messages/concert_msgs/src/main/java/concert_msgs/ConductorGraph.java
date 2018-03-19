package concert_msgs;

public interface ConductorGraph extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/ConductorGraph";
  static final java.lang.String _DEFINITION = "# \n# Provide the conductor graph of all concert clients according to their current state (see\n# ConcertClientState.msg for a list of states and always sync with that!).\n# Compared to the regular ConcertClients topic, this includes\n# all those not in use by this concert, which is useful for introspection and debugging.\n#\n# It will typically show up in /concert/conductor/graph. Do not use this topic for\n# runtime handling (use only for introspection) as it will consume cycles. If no-one is\n# listening, this topic is lazy.  \n#\nconcert_msgs/ConcertClient[] pending\nconcert_msgs/ConcertClient[] available\nconcert_msgs/ConcertClient[] missing\nconcert_msgs/ConcertClient[] gone\n";
  java.util.List<concert_msgs.ConcertClient> getPending();
  void setPending(java.util.List<concert_msgs.ConcertClient> value);
  java.util.List<concert_msgs.ConcertClient> getAvailable();
  void setAvailable(java.util.List<concert_msgs.ConcertClient> value);
  java.util.List<concert_msgs.ConcertClient> getMissing();
  void setMissing(java.util.List<concert_msgs.ConcertClient> value);
  java.util.List<concert_msgs.ConcertClient> getGone();
  void setGone(java.util.List<concert_msgs.ConcertClient> value);
}
