// Auto-generated. Do not edit!

// (in-package costum_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GoalInfo = require('./GoalInfo.js');

//-----------------------------------------------------------

class PathInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PathInfo
    // Serialize message field [data]
    // Serialize the length for message field [data]
    bufferOffset = _serializer.uint32(obj.data.length, buffer, bufferOffset);
    obj.data.forEach((val) => {
      bufferOffset = GoalInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PathInfo
    let len;
    let data = new PathInfo(null);
    // Deserialize message field [data]
    // Deserialize array length for message field [data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.data[i] = GoalInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 64 * object.data.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/PathInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '787d6ccfed1205277495425c79499d72';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    GoalInfo[] data
    ================================================================================
    MSG: costum_msgs/GoalInfo
    float64 x_position
    float64 y_position
    float64 z_position
    float64 x_orientation
    float64 y_orientation
    float64 z_orientation
    float64 w_orientation
    float64 time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PathInfo(null);
    if (msg.data !== undefined) {
      resolved.data = new Array(msg.data.length);
      for (let i = 0; i < resolved.data.length; ++i) {
        resolved.data[i] = GoalInfo.Resolve(msg.data[i]);
      }
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = PathInfo;
