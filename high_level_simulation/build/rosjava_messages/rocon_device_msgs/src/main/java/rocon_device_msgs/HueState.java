package rocon_device_msgs;

public interface HueState extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "rocon_device_msgs/HueState";
  static final java.lang.String _DEFINITION = "#pre-define color\nstring OFF = \"OFF\"\nstring WHITE = \"WHITE\"\nstring RED = \"RED\"\nstring GREEN = \"GREEN\"\nstring BLUE = \"BLUE\"\nstring YELLOW = \"YELLOW\"\nstring ORANGE = \"ORANGE\"\nstring MAGENTA = \"MAGENTA\"\nstring VIOLET = \"VIOLET\"\n\n#light on/off status true:on /false:off\nbool on \n\n#color coordination in HSV color space \n#http://en.wikipedia.org/wiki/HSL_and_HSV\nuint16 hue #h\nuint8 sat #s\nuint8 bri #v\n\n#light valid status - valid:on /invalid:off\nbool reachable  \n\n#for set color with pre-define color\nstring color";
  static final java.lang.String OFF = "\"OFF\"";
  static final java.lang.String WHITE = "\"WHITE\"";
  static final java.lang.String RED = "\"RED\"";
  static final java.lang.String GREEN = "\"GREEN\"";
  static final java.lang.String BLUE = "\"BLUE\"";
  static final java.lang.String YELLOW = "\"YELLOW\"";
  static final java.lang.String ORANGE = "\"ORANGE\"";
  static final java.lang.String MAGENTA = "\"MAGENTA\"";
  static final java.lang.String VIOLET = "\"VIOLET\"";
  boolean getOn();
  void setOn(boolean value);
  short getHue();
  void setHue(short value);
  byte getSat();
  void setSat(byte value);
  byte getBri();
  void setBri(byte value);
  boolean getReachable();
  void setReachable(boolean value);
  java.lang.String getColor();
  void setColor(java.lang.String value);
}
