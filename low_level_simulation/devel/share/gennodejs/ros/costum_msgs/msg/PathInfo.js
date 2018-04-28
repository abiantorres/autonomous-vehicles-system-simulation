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
      this.plan_file = null;
      this.date = null;
      this.simulations = null;
      this.global_time_average = null;
      this.global_distance_average = null;
      this.global_velocity_average = null;
      this.global_linear_velocity_average = null;
      this.global_maximum_linear_velocity = null;
      this.global_failures = null;
      this.sections = null;
    }
    else {
      if (initObj.hasOwnProperty('plan_file')) {
        this.plan_file = initObj.plan_file
      }
      else {
        this.plan_file = '';
      }
      if (initObj.hasOwnProperty('date')) {
        this.date = initObj.date
      }
      else {
        this.date = '';
      }
      if (initObj.hasOwnProperty('simulations')) {
        this.simulations = initObj.simulations
      }
      else {
        this.simulations = 0;
      }
      if (initObj.hasOwnProperty('global_time_average')) {
        this.global_time_average = initObj.global_time_average
      }
      else {
        this.global_time_average = 0.0;
      }
      if (initObj.hasOwnProperty('global_distance_average')) {
        this.global_distance_average = initObj.global_distance_average
      }
      else {
        this.global_distance_average = 0.0;
      }
      if (initObj.hasOwnProperty('global_velocity_average')) {
        this.global_velocity_average = initObj.global_velocity_average
      }
      else {
        this.global_velocity_average = 0.0;
      }
      if (initObj.hasOwnProperty('global_linear_velocity_average')) {
        this.global_linear_velocity_average = initObj.global_linear_velocity_average
      }
      else {
        this.global_linear_velocity_average = 0.0;
      }
      if (initObj.hasOwnProperty('global_maximum_linear_velocity')) {
        this.global_maximum_linear_velocity = initObj.global_maximum_linear_velocity
      }
      else {
        this.global_maximum_linear_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('global_failures')) {
        this.global_failures = initObj.global_failures
      }
      else {
        this.global_failures = 0;
      }
      if (initObj.hasOwnProperty('sections')) {
        this.sections = initObj.sections
      }
      else {
        this.sections = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PathInfo
    // Serialize message field [plan_file]
    bufferOffset = _serializer.string(obj.plan_file, buffer, bufferOffset);
    // Serialize message field [date]
    bufferOffset = _serializer.string(obj.date, buffer, bufferOffset);
    // Serialize message field [simulations]
    bufferOffset = _serializer.int16(obj.simulations, buffer, bufferOffset);
    // Serialize message field [global_time_average]
    bufferOffset = _serializer.float64(obj.global_time_average, buffer, bufferOffset);
    // Serialize message field [global_distance_average]
    bufferOffset = _serializer.float64(obj.global_distance_average, buffer, bufferOffset);
    // Serialize message field [global_velocity_average]
    bufferOffset = _serializer.float64(obj.global_velocity_average, buffer, bufferOffset);
    // Serialize message field [global_linear_velocity_average]
    bufferOffset = _serializer.float64(obj.global_linear_velocity_average, buffer, bufferOffset);
    // Serialize message field [global_maximum_linear_velocity]
    bufferOffset = _serializer.float64(obj.global_maximum_linear_velocity, buffer, bufferOffset);
    // Serialize message field [global_failures]
    bufferOffset = _serializer.int16(obj.global_failures, buffer, bufferOffset);
    // Serialize message field [sections]
    // Serialize the length for message field [sections]
    bufferOffset = _serializer.uint32(obj.sections.length, buffer, bufferOffset);
    obj.sections.forEach((val) => {
      bufferOffset = GoalInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PathInfo
    let len;
    let data = new PathInfo(null);
    // Deserialize message field [plan_file]
    data.plan_file = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [date]
    data.date = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [simulations]
    data.simulations = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [global_time_average]
    data.global_time_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [global_distance_average]
    data.global_distance_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [global_velocity_average]
    data.global_velocity_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [global_linear_velocity_average]
    data.global_linear_velocity_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [global_maximum_linear_velocity]
    data.global_maximum_linear_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [global_failures]
    data.global_failures = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [sections]
    // Deserialize array length for message field [sections]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.sections = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.sections[i] = GoalInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.plan_file.length;
    length += object.date.length;
    object.sections.forEach((val) => {
      length += GoalInfo.getMessageSize(val);
    });
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/PathInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '406f78da04ae6e0a1419c2646f9bbca9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string plan_file
    string date
    int16 simulations
    float64 global_time_average
    float64 global_distance_average
    float64 global_velocity_average
    float64 global_linear_velocity_average
    float64 global_maximum_linear_velocity
    int16 global_failures
    GoalInfo[] sections
    ================================================================================
    MSG: costum_msgs/GoalInfo
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
    const resolved = new PathInfo(null);
    if (msg.plan_file !== undefined) {
      resolved.plan_file = msg.plan_file;
    }
    else {
      resolved.plan_file = ''
    }

    if (msg.date !== undefined) {
      resolved.date = msg.date;
    }
    else {
      resolved.date = ''
    }

    if (msg.simulations !== undefined) {
      resolved.simulations = msg.simulations;
    }
    else {
      resolved.simulations = 0
    }

    if (msg.global_time_average !== undefined) {
      resolved.global_time_average = msg.global_time_average;
    }
    else {
      resolved.global_time_average = 0.0
    }

    if (msg.global_distance_average !== undefined) {
      resolved.global_distance_average = msg.global_distance_average;
    }
    else {
      resolved.global_distance_average = 0.0
    }

    if (msg.global_velocity_average !== undefined) {
      resolved.global_velocity_average = msg.global_velocity_average;
    }
    else {
      resolved.global_velocity_average = 0.0
    }

    if (msg.global_linear_velocity_average !== undefined) {
      resolved.global_linear_velocity_average = msg.global_linear_velocity_average;
    }
    else {
      resolved.global_linear_velocity_average = 0.0
    }

    if (msg.global_maximum_linear_velocity !== undefined) {
      resolved.global_maximum_linear_velocity = msg.global_maximum_linear_velocity;
    }
    else {
      resolved.global_maximum_linear_velocity = 0.0
    }

    if (msg.global_failures !== undefined) {
      resolved.global_failures = msg.global_failures;
    }
    else {
      resolved.global_failures = 0
    }

    if (msg.sections !== undefined) {
      resolved.sections = new Array(msg.sections.length);
      for (let i = 0; i < resolved.sections.length; ++i) {
        resolved.sections[i] = GoalInfo.Resolve(msg.sections[i]);
      }
    }
    else {
      resolved.sections = []
    }

    return resolved;
    }
};

module.exports = PathInfo;
