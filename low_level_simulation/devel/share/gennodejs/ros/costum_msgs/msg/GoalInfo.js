// Auto-generated. Do not edit!

// (in-package costum_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GoalInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_position = null;
      this.y_position = null;
      this.z_position = null;
      this.x_orientation = null;
      this.y_orientation = null;
      this.z_orientation = null;
      this.w_orientation = null;
      this.time = null;
    }
    else {
      if (initObj.hasOwnProperty('x_position')) {
        this.x_position = initObj.x_position
      }
      else {
        this.x_position = 0.0;
      }
      if (initObj.hasOwnProperty('y_position')) {
        this.y_position = initObj.y_position
      }
      else {
        this.y_position = 0.0;
      }
      if (initObj.hasOwnProperty('z_position')) {
        this.z_position = initObj.z_position
      }
      else {
        this.z_position = 0.0;
      }
      if (initObj.hasOwnProperty('x_orientation')) {
        this.x_orientation = initObj.x_orientation
      }
      else {
        this.x_orientation = 0.0;
      }
      if (initObj.hasOwnProperty('y_orientation')) {
        this.y_orientation = initObj.y_orientation
      }
      else {
        this.y_orientation = 0.0;
      }
      if (initObj.hasOwnProperty('z_orientation')) {
        this.z_orientation = initObj.z_orientation
      }
      else {
        this.z_orientation = 0.0;
      }
      if (initObj.hasOwnProperty('w_orientation')) {
        this.w_orientation = initObj.w_orientation
      }
      else {
        this.w_orientation = 0.0;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoalInfo
    // Serialize message field [x_position]
    bufferOffset = _serializer.float64(obj.x_position, buffer, bufferOffset);
    // Serialize message field [y_position]
    bufferOffset = _serializer.float64(obj.y_position, buffer, bufferOffset);
    // Serialize message field [z_position]
    bufferOffset = _serializer.float64(obj.z_position, buffer, bufferOffset);
    // Serialize message field [x_orientation]
    bufferOffset = _serializer.float64(obj.x_orientation, buffer, bufferOffset);
    // Serialize message field [y_orientation]
    bufferOffset = _serializer.float64(obj.y_orientation, buffer, bufferOffset);
    // Serialize message field [z_orientation]
    bufferOffset = _serializer.float64(obj.z_orientation, buffer, bufferOffset);
    // Serialize message field [w_orientation]
    bufferOffset = _serializer.float64(obj.w_orientation, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.float64(obj.time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoalInfo
    let len;
    let data = new GoalInfo(null);
    // Deserialize message field [x_position]
    data.x_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_position]
    data.y_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z_position]
    data.z_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x_orientation]
    data.x_orientation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_orientation]
    data.y_orientation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z_orientation]
    data.z_orientation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [w_orientation]
    data.w_orientation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/GoalInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5c2161efb882ab714cdc912beb12392f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new GoalInfo(null);
    if (msg.x_position !== undefined) {
      resolved.x_position = msg.x_position;
    }
    else {
      resolved.x_position = 0.0
    }

    if (msg.y_position !== undefined) {
      resolved.y_position = msg.y_position;
    }
    else {
      resolved.y_position = 0.0
    }

    if (msg.z_position !== undefined) {
      resolved.z_position = msg.z_position;
    }
    else {
      resolved.z_position = 0.0
    }

    if (msg.x_orientation !== undefined) {
      resolved.x_orientation = msg.x_orientation;
    }
    else {
      resolved.x_orientation = 0.0
    }

    if (msg.y_orientation !== undefined) {
      resolved.y_orientation = msg.y_orientation;
    }
    else {
      resolved.y_orientation = 0.0
    }

    if (msg.z_orientation !== undefined) {
      resolved.z_orientation = msg.z_orientation;
    }
    else {
      resolved.z_orientation = 0.0
    }

    if (msg.w_orientation !== undefined) {
      resolved.w_orientation = msg.w_orientation;
    }
    else {
      resolved.w_orientation = 0.0
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0.0
    }

    return resolved;
    }
};

module.exports = GoalInfo;
