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
      this.id = null;
      this.time_average = null;
      this.distance_average = null;
      this.velocity_average = null;
      this.linear_velocity_average = null;
      this.maximum_linear_velocity = null;
      this.failures = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('time_average')) {
        this.time_average = initObj.time_average
      }
      else {
        this.time_average = 0.0;
      }
      if (initObj.hasOwnProperty('distance_average')) {
        this.distance_average = initObj.distance_average
      }
      else {
        this.distance_average = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_average')) {
        this.velocity_average = initObj.velocity_average
      }
      else {
        this.velocity_average = 0.0;
      }
      if (initObj.hasOwnProperty('linear_velocity_average')) {
        this.linear_velocity_average = initObj.linear_velocity_average
      }
      else {
        this.linear_velocity_average = 0.0;
      }
      if (initObj.hasOwnProperty('maximum_linear_velocity')) {
        this.maximum_linear_velocity = initObj.maximum_linear_velocity
      }
      else {
        this.maximum_linear_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('failures')) {
        this.failures = initObj.failures
      }
      else {
        this.failures = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoalInfo
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [time_average]
    bufferOffset = _serializer.float64(obj.time_average, buffer, bufferOffset);
    // Serialize message field [distance_average]
    bufferOffset = _serializer.float64(obj.distance_average, buffer, bufferOffset);
    // Serialize message field [velocity_average]
    bufferOffset = _serializer.float64(obj.velocity_average, buffer, bufferOffset);
    // Serialize message field [linear_velocity_average]
    bufferOffset = _serializer.float64(obj.linear_velocity_average, buffer, bufferOffset);
    // Serialize message field [maximum_linear_velocity]
    bufferOffset = _serializer.float64(obj.maximum_linear_velocity, buffer, bufferOffset);
    // Serialize message field [failures]
    bufferOffset = _serializer.int16(obj.failures, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoalInfo
    let len;
    let data = new GoalInfo(null);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [time_average]
    data.time_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_average]
    data.distance_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_average]
    data.velocity_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [linear_velocity_average]
    data.linear_velocity_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maximum_linear_velocity]
    data.maximum_linear_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [failures]
    data.failures = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.id.length;
    return length + 46;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/GoalInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3b498f03ccbc82c91ef84003efa1d87e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string id
    float64 time_average
    float64 distance_average
    float64 velocity_average
    float64 linear_velocity_average
    float64 maximum_linear_velocity
    int16 failures
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoalInfo(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.time_average !== undefined) {
      resolved.time_average = msg.time_average;
    }
    else {
      resolved.time_average = 0.0
    }

    if (msg.distance_average !== undefined) {
      resolved.distance_average = msg.distance_average;
    }
    else {
      resolved.distance_average = 0.0
    }

    if (msg.velocity_average !== undefined) {
      resolved.velocity_average = msg.velocity_average;
    }
    else {
      resolved.velocity_average = 0.0
    }

    if (msg.linear_velocity_average !== undefined) {
      resolved.linear_velocity_average = msg.linear_velocity_average;
    }
    else {
      resolved.linear_velocity_average = 0.0
    }

    if (msg.maximum_linear_velocity !== undefined) {
      resolved.maximum_linear_velocity = msg.maximum_linear_velocity;
    }
    else {
      resolved.maximum_linear_velocity = 0.0
    }

    if (msg.failures !== undefined) {
      resolved.failures = msg.failures;
    }
    else {
      resolved.failures = 0
    }

    return resolved;
    }
};

module.exports = GoalInfo;
