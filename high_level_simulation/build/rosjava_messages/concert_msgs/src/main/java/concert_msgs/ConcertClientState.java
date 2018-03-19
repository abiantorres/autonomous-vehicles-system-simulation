package concert_msgs;

public interface ConcertClientState extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/ConcertClientState";
  static final java.lang.String _DEFINITION = "# States of concert clients, these should always be synced with what is provided in ConductorGraph.msg\n# (for completeness, but also because I do some funny magic to extra the possible list of states from there). \n\n# pending introspection, the client has been detected, but hasn\'t signalled that it wants to work with us yet\nstring PENDING   = pending\n# the ip is invalid, unreachable or some other problem meaning we have to absolutely ignore it\nstring BAD       = bad\n# is available for use inside this concert\nstring AVAILABLE = available\n# has lost connection (wireless)\nstring MISSING   = missing\n# has left the concert\nstring GONE      = gone\n";
  static final java.lang.String PENDING = "pending";
  static final java.lang.String BAD = "bad";
  static final java.lang.String AVAILABLE = "available";
  static final java.lang.String MISSING = "missing";
  static final java.lang.String GONE = "gone";
}
