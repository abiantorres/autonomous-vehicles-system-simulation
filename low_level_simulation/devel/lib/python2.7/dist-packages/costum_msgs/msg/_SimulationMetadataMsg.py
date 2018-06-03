# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from costum_msgs/SimulationMetadataMsg.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import costum_msgs.msg
import geometry_msgs.msg

class SimulationMetadataMsg(genpy.Message):
  _md5sum = "771eda917b6244b8b3956c84b90f4902"
  _type = "costum_msgs/SimulationMetadataMsg"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string plan_file
string date
int64 n_segments
SegmentsMetadataMsg segments_metadata
int64 n_iterations
int64 timeout_factor
bool useful_simulation
string local_planner
string global_planner

================================================================================
MSG: costum_msgs/SegmentsMetadataMsg
SegmentMetadataMsg[] segments_metadata

================================================================================
MSG: costum_msgs/SegmentMetadataMsg
int64 segment_index
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
  __slots__ = ['plan_file','date','n_segments','segments_metadata','n_iterations','timeout_factor','useful_simulation','local_planner','global_planner']
  _slot_types = ['string','string','int64','costum_msgs/SegmentsMetadataMsg','int64','int64','bool','string','string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       plan_file,date,n_segments,segments_metadata,n_iterations,timeout_factor,useful_simulation,local_planner,global_planner

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SimulationMetadataMsg, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.plan_file is None:
        self.plan_file = ''
      if self.date is None:
        self.date = ''
      if self.n_segments is None:
        self.n_segments = 0
      if self.segments_metadata is None:
        self.segments_metadata = costum_msgs.msg.SegmentsMetadataMsg()
      if self.n_iterations is None:
        self.n_iterations = 0
      if self.timeout_factor is None:
        self.timeout_factor = 0
      if self.useful_simulation is None:
        self.useful_simulation = False
      if self.local_planner is None:
        self.local_planner = ''
      if self.global_planner is None:
        self.global_planner = ''
    else:
      self.plan_file = ''
      self.date = ''
      self.n_segments = 0
      self.segments_metadata = costum_msgs.msg.SegmentsMetadataMsg()
      self.n_iterations = 0
      self.timeout_factor = 0
      self.useful_simulation = False
      self.local_planner = ''
      self.global_planner = ''

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
      _x = self.plan_file
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.date
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_q().pack(self.n_segments))
      length = len(self.segments_metadata.segments_metadata)
      buff.write(_struct_I.pack(length))
      for val1 in self.segments_metadata.segments_metadata:
        buff.write(_get_struct_q().pack(val1.segment_index))
        _v1 = val1.initial_point
        _x = _v1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _v2 = val1.end_point
        _x = _v2
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _x = val1
        buff.write(_get_struct_dq().pack(_x.distance_between_obstacles, _x.segment_simulation_timeout))
      _x = self
      buff.write(_get_struct_2qB().pack(_x.n_iterations, _x.timeout_factor, _x.useful_simulation))
      _x = self.local_planner
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.global_planner
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.segments_metadata is None:
        self.segments_metadata = costum_msgs.msg.SegmentsMetadataMsg()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.plan_file = str[start:end].decode('utf-8')
      else:
        self.plan_file = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.date = str[start:end].decode('utf-8')
      else:
        self.date = str[start:end]
      start = end
      end += 8
      (self.n_segments,) = _get_struct_q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.segments_metadata.segments_metadata = []
      for i in range(0, length):
        val1 = costum_msgs.msg.SegmentMetadataMsg()
        start = end
        end += 8
        (val1.segment_index,) = _get_struct_q().unpack(str[start:end])
        _v3 = val1.initial_point
        _x = _v3
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _v4 = val1.end_point
        _x = _v4
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _x = val1
        start = end
        end += 16
        (_x.distance_between_obstacles, _x.segment_simulation_timeout,) = _get_struct_dq().unpack(str[start:end])
        self.segments_metadata.segments_metadata.append(val1)
      _x = self
      start = end
      end += 17
      (_x.n_iterations, _x.timeout_factor, _x.useful_simulation,) = _get_struct_2qB().unpack(str[start:end])
      self.useful_simulation = bool(self.useful_simulation)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.local_planner = str[start:end].decode('utf-8')
      else:
        self.local_planner = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.global_planner = str[start:end].decode('utf-8')
      else:
        self.global_planner = str[start:end]
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
      _x = self.plan_file
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.date
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_q().pack(self.n_segments))
      length = len(self.segments_metadata.segments_metadata)
      buff.write(_struct_I.pack(length))
      for val1 in self.segments_metadata.segments_metadata:
        buff.write(_get_struct_q().pack(val1.segment_index))
        _v5 = val1.initial_point
        _x = _v5
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _v6 = val1.end_point
        _x = _v6
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _x = val1
        buff.write(_get_struct_dq().pack(_x.distance_between_obstacles, _x.segment_simulation_timeout))
      _x = self
      buff.write(_get_struct_2qB().pack(_x.n_iterations, _x.timeout_factor, _x.useful_simulation))
      _x = self.local_planner
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.global_planner
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.segments_metadata is None:
        self.segments_metadata = costum_msgs.msg.SegmentsMetadataMsg()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.plan_file = str[start:end].decode('utf-8')
      else:
        self.plan_file = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.date = str[start:end].decode('utf-8')
      else:
        self.date = str[start:end]
      start = end
      end += 8
      (self.n_segments,) = _get_struct_q().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.segments_metadata.segments_metadata = []
      for i in range(0, length):
        val1 = costum_msgs.msg.SegmentMetadataMsg()
        start = end
        end += 8
        (val1.segment_index,) = _get_struct_q().unpack(str[start:end])
        _v7 = val1.initial_point
        _x = _v7
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _v8 = val1.end_point
        _x = _v8
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _x = val1
        start = end
        end += 16
        (_x.distance_between_obstacles, _x.segment_simulation_timeout,) = _get_struct_dq().unpack(str[start:end])
        self.segments_metadata.segments_metadata.append(val1)
      _x = self
      start = end
      end += 17
      (_x.n_iterations, _x.timeout_factor, _x.useful_simulation,) = _get_struct_2qB().unpack(str[start:end])
      self.useful_simulation = bool(self.useful_simulation)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.local_planner = str[start:end].decode('utf-8')
      else:
        self.local_planner = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.global_planner = str[start:end].decode('utf-8')
      else:
        self.global_planner = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_q = None
def _get_struct_q():
    global _struct_q
    if _struct_q is None:
        _struct_q = struct.Struct("<q")
    return _struct_q
_struct_dq = None
def _get_struct_dq():
    global _struct_dq
    if _struct_dq is None:
        _struct_dq = struct.Struct("<dq")
    return _struct_dq
_struct_2qB = None
def _get_struct_2qB():
    global _struct_2qB
    if _struct_2qB is None:
        _struct_2qB = struct.Struct("<2qB")
    return _struct_2qB
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
