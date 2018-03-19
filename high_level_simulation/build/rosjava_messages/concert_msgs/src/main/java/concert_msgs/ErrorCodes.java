package concert_msgs;

public interface ErrorCodes extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "concert_msgs/ErrorCodes";
  static final java.lang.String _DEFINITION = "# Error types for concert components\n\n# General\nint8 SUCCESS = 0\n\n# Concert Service\nint8 SERVICE_UNEXPECTED_ERROR = 31\nint8 SERVICE_INSUFFICIENT_CLIENTS = 32\nint8 SERVICE_NOT_READY = 33\n";
  static final byte SUCCESS = 0;
  static final byte SERVICE_UNEXPECTED_ERROR = 31;
  static final byte SERVICE_INSUFFICIENT_CLIENTS = 32;
  static final byte SERVICE_NOT_READY = 33;
}
