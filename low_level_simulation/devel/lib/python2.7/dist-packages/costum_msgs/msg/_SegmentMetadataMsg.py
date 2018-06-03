# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from costum_msgs/SegmentMetadataMsg.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg

class SegmentMetadataMsg(genpy.Message):
  _md5sum = "b238c42fedf53903e2cf5776ff7562f0"
  _type = "costum_msgs/SegmentMetadataMsg"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """int64 segment_index
geometry_msgs/Point initial_point
geometry_msgs/Point end_point
float64 distance_between_obstacles
int64 segment_simulation_timeout

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
"""
  __slots__ = ['segment_index','initial_point','end_point','distance_between_obstacles','segment_simulation_timeout']
  _slot_types = ['int64','geometry_msgs/Point','geometry_msgs/Point','float64','int64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       segment_index,initial_point,end_point,distance_between_obstacles,segment_simulation_timeout

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SegmentMetadataMsg, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.segment_index is None:
        self.segment_index = 0
      if self.initial_point is None:
        self.initial_point = geometry_msgs.msg.Point()
      if self.end_point is None:
        self.end_point = geometry_msgs.msg.Point()
      if self.distance_between_obstacles is None:
        self.distance_between_obstacles = 0.
      if self.segment_simulation_timeout is None:
        self.segment_simulation_timeout = 0
    else:
      self.segment_index = 0
      self.initial_point = geometry_msgs.msg.Point()
      self.end_point = geometry_msgs.msg.Point()
      self.distance_between_obstacles = 0.
      self.segment_simulation_timeout = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_q7dq().pack(_x.segment_index, _x.initial_point.x, _x.initial_point.y, _x.initial_point.z, _x.end_point.x, _x.end_point.y, _x.end_point.z, _x.distance_between_obstacles, _x.segment_simulation_timeout))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.initial_point is None:
        self.initial_point = geometry_msgs.msg.Point()
      if self.end_point is None:
        self.end_point = geometry_msgs.msg.Point()
      end = 0
      _x = self
      start = end
      end += 72
      (_x.segment_index, _x.initial_point.x, _x.initial_point.y, _x.initial_point.z, _x.end_point.x, _x.end_point.y, _x.end_point.z, _x.distance_between_obstacles, _x.segment_simulation_timeout,) = _get_struct_q7dq().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_q7dq().pack(_x.segment_index, _x.initial_point.x, _x.initial_point.y, _x.initial_point.z, _x.end_point.x, _x.end_point.y, _x.end_point.z, _x.distance_between_obstacles, _x.segment_simulation_timeout))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.initial_point is None:
        self.initial_point = geometry_msgs.msg.Point()
      if self.end_point is None:
        self.end_point = geometry_msgs.msg.Point()
      end = 0
      _x = self
      start = end
      end += 72
      (_x.segment_index, _x.initial_point.x, _x.initial_point.y, _x.initial_point.z, _x.end_point.x, _x.end_point.y, _x.end_point.z, _x.distance_between_obstacles, _x.segment_simulation_timeout,) = _get_struct_q7dq().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_q7dq = None
def _get_struct_q7dq():
    global _struct_q7dq
    if _struct_q7dq is None:
        _struct_q7dq = struct.Struct("<q7dq")
    return _struct_q7dq
