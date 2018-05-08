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
      this.time_standard_deviation = null;
      this.distance_average = null;
      this.velocity_average = null;
      this.linear_velocity_average = null;
      this.maximum_linear_velocity = null;
      this.density = null;
      this.max_obstacle_shiftment = null;
      this.obstacle_length = null;
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
      if (initObj.hasOwnProperty('time_standard_deviation')) {
        this.time_standard_deviation = initObj.time_standard_deviation
      }
      else {
        this.time_standard_deviation = 0.0;
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
      if (initObj.hasOwnProperty('density')) {
        this.density = initObj.density
      }
      else {
        this.density = 0.0;
      }
      if (initObj.hasOwnProperty('max_obstacle_shiftment')) {
        this.max_obstacle_shiftment = initObj.max_obstacle_shiftment
      }
      else {
        this.max_obstacle_shiftment = 0.0;
      }
      if (initObj.hasOwnProperty('obstacle_length')) {
        this.obstacle_length = initObj.obstacle_length
      }
      else {
        this.obstacle_length = 0.0;
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
    // Serialize message field [time_standard_deviation]
    bufferOffset = _serializer.float64(obj.time_standard_deviation, buffer, bufferOffset);
    // Serialize message field [distance_average]
    bufferOffset = _serializer.float64(obj.distance_average, buffer, bufferOffset);
    // Serialize message field [velocity_average]
    bufferOffset = _serializer.float64(obj.velocity_average, buffer, bufferOffset);
    // Serialize message field [linear_velocity_average]
    bufferOffset = _serializer.float64(obj.linear_velocity_average, buffer, bufferOffset);
    // Serialize message field [maximum_linear_velocity]
    bufferOffset = _serializer.float64(obj.maximum_linear_velocity, buffer, bufferOffset);
    // Serialize message field [density]
    bufferOffset = _serializer.float64(obj.density, buffer, bufferOffset);
    // Serialize message field [max_obstacle_shiftment]
    bufferOffset = _serializer.float64(obj.max_obstacle_shiftment, buffer, bufferOffset);
    // Serialize message field [obstacle_length]
    bufferOffset = _serializer.float64(obj.obstacle_length, buffer, bufferOffset);
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
    // Deserialize message field [time_standard_deviation]
    data.time_standard_deviation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_average]
    data.distance_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_average]
    data.velocity_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [linear_velocity_average]
    data.linear_velocity_average = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [maximum_linear_velocity]
    data.maximum_linear_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [density]
    data.density = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_obstacle_shiftment]
    data.max_obstacle_shiftment = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obstacle_length]
    data.obstacle_length = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [failures]
    data.failures = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.id.length;
    return length + 78;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/GoalInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5759e1e10a4cf0239c09042d29b09f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string id
    float64 time_average
    float64 time_standard_deviation
    float64 distance_average
    float64 velocity_average
    float64 linear_velocity_average
    float64 maximum_linear_velocity
    float64 density
    float64 max_obstacle_shiftment
    float64 obstacle_length
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

    if (msg.time_standard_deviation !== undefined) {
      resolved.time_standard_deviation = msg.time_standard_deviation;
    }
    else {
      resolved.time_standard_deviation = 0.0
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

    if (msg.density !== undefined) {
      resolved.density = msg.density;
    }
    else {
      resolved.density = 0.0
    }

    if (msg.max_obstacle_shiftment !== undefined) {
      resolved.max_obstacle_shiftment = msg.max_obstacle_shiftment;
    }
    else {
      resolved.max_obstacle_shiftment = 0.0
    }

    if (msg.obstacle_length !== undefined) {
      resolved.obstacle_length = msg.obstacle_length;
    }
    else {
      resolved.obstacle_length = 0.0
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
