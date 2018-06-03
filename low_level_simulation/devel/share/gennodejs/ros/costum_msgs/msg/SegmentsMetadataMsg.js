// Auto-generated. Do not edit!

// (in-package costum_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SegmentMetadataMsg = require('./SegmentMetadataMsg.js');

//-----------------------------------------------------------

class SegmentsMetadataMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.segments_metadata = null;
    }
    else {
      if (initObj.hasOwnProperty('segments_metadata')) {
        this.segments_metadata = initObj.segments_metadata
      }
      else {
        this.segments_metadata = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SegmentsMetadataMsg
    // Serialize message field [segments_metadata]
    // Serialize the length for message field [segments_metadata]
    bufferOffset = _serializer.uint32(obj.segments_metadata.length, buffer, bufferOffset);
    obj.segments_metadata.forEach((val) => {
      bufferOffset = SegmentMetadataMsg.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SegmentsMetadataMsg
    let len;
    let data = new SegmentsMetadataMsg(null);
    // Deserialize message field [segments_metadata]
    // Deserialize array length for message field [segments_metadata]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.segments_metadata = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.segments_metadata[i] = SegmentMetadataMsg.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 72 * object.segments_metadata.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/SegmentsMetadataMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '67c0f52ccb2c9e99b2f0c2343335cac1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SegmentsMetadataMsg(null);
    if (msg.segments_metadata !== undefined) {
      resolved.segments_metadata = new Array(msg.segments_metadata.length);
      for (let i = 0; i < resolved.segments_metadata.length; ++i) {
        resolved.segments_metadata[i] = SegmentMetadataMsg.Resolve(msg.segments_metadata[i]);
      }
    }
    else {
      resolved.segments_metadata = []
    }

    return resolved;
    }
};

module.exports = SegmentsMetadataMsg;
