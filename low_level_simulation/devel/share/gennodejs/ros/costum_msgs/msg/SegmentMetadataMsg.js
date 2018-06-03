// Auto-generated. Do not edit!

// (in-package costum_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class SegmentMetadataMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.segment_index = null;
      this.initial_point = null;
      this.end_point = null;
      this.distance_between_obstacles = null;
      this.segment_simulation_timeout = null;
    }
    else {
      if (initObj.hasOwnProperty('segment_index')) {
        this.segment_index = initObj.segment_index
      }
      else {
        this.segment_index = 0;
      }
      if (initObj.hasOwnProperty('initial_point')) {
        this.initial_point = initObj.initial_point
      }
      else {
        this.initial_point = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('end_point')) {
        this.end_point = initObj.end_point
      }
      else {
        this.end_point = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('distance_between_obstacles')) {
        this.distance_between_obstacles = initObj.distance_between_obstacles
      }
      else {
        this.distance_between_obstacles = 0.0;
      }
      if (initObj.hasOwnProperty('segment_simulation_timeout')) {
        this.segment_simulation_timeout = initObj.segment_simulation_timeout
      }
      else {
        this.segment_simulation_timeout = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SegmentMetadataMsg
    // Serialize message field [segment_index]
    bufferOffset = _serializer.int64(obj.segment_index, buffer, bufferOffset);
    // Serialize message field [initial_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.initial_point, buffer, bufferOffset);
    // Serialize message field [end_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.end_point, buffer, bufferOffset);
    // Serialize message field [distance_between_obstacles]
    bufferOffset = _serializer.float64(obj.distance_between_obstacles, buffer, bufferOffset);
    // Serialize message field [segment_simulation_timeout]
    bufferOffset = _serializer.int64(obj.segment_simulation_timeout, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SegmentMetadataMsg
    let len;
    let data = new SegmentMetadataMsg(null);
    // Deserialize message field [segment_index]
    data.segment_index = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [initial_point]
    data.initial_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [end_point]
    data.end_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [distance_between_obstacles]
    data.distance_between_obstacles = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [segment_simulation_timeout]
    data.segment_simulation_timeout = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 72;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/SegmentMetadataMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b238c42fedf53903e2cf5776ff7562f0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SegmentMetadataMsg(null);
    if (msg.segment_index !== undefined) {
      resolved.segment_index = msg.segment_index;
    }
    else {
      resolved.segment_index = 0
    }

    if (msg.initial_point !== undefined) {
      resolved.initial_point = geometry_msgs.msg.Point.Resolve(msg.initial_point)
    }
    else {
      resolved.initial_point = new geometry_msgs.msg.Point()
    }

    if (msg.end_point !== undefined) {
      resolved.end_point = geometry_msgs.msg.Point.Resolve(msg.end_point)
    }
    else {
      resolved.end_point = new geometry_msgs.msg.Point()
    }

    if (msg.distance_between_obstacles !== undefined) {
      resolved.distance_between_obstacles = msg.distance_between_obstacles;
    }
    else {
      resolved.distance_between_obstacles = 0.0
    }

    if (msg.segment_simulation_timeout !== undefined) {
      resolved.segment_simulation_timeout = msg.segment_simulation_timeout;
    }
    else {
      resolved.segment_simulation_timeout = 0
    }

    return resolved;
    }
};

module.exports = SegmentMetadataMsg;
