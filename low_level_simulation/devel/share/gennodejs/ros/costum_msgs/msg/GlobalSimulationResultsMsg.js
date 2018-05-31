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

class GlobalSimulationResultsMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.n_failures = null;
      this.time_mean = null;
      this.time_stdev = null;
      this.time_max = null;
      this.time_min = null;
      this.distance_mean = null;
      this.distance_stdev = null;
      this.distance_max = null;
      this.distance_min = null;
      this.speed_mean = null;
      this.speed_stdev = null;
      this.speed_max = null;
      this.speed_min = null;
    }
    else {
      if (initObj.hasOwnProperty('n_failures')) {
        this.n_failures = initObj.n_failures
      }
      else {
        this.n_failures = 0;
      }
      if (initObj.hasOwnProperty('time_mean')) {
        this.time_mean = initObj.time_mean
      }
      else {
        this.time_mean = 0.0;
      }
      if (initObj.hasOwnProperty('time_stdev')) {
        this.time_stdev = initObj.time_stdev
      }
      else {
        this.time_stdev = 0.0;
      }
      if (initObj.hasOwnProperty('time_max')) {
        this.time_max = initObj.time_max
      }
      else {
        this.time_max = 0.0;
      }
      if (initObj.hasOwnProperty('time_min')) {
        this.time_min = initObj.time_min
      }
      else {
        this.time_min = 0.0;
      }
      if (initObj.hasOwnProperty('distance_mean')) {
        this.distance_mean = initObj.distance_mean
      }
      else {
        this.distance_mean = 0.0;
      }
      if (initObj.hasOwnProperty('distance_stdev')) {
        this.distance_stdev = initObj.distance_stdev
      }
      else {
        this.distance_stdev = 0.0;
      }
      if (initObj.hasOwnProperty('distance_max')) {
        this.distance_max = initObj.distance_max
      }
      else {
        this.distance_max = 0.0;
      }
      if (initObj.hasOwnProperty('distance_min')) {
        this.distance_min = initObj.distance_min
      }
      else {
        this.distance_min = 0.0;
      }
      if (initObj.hasOwnProperty('speed_mean')) {
        this.speed_mean = initObj.speed_mean
      }
      else {
        this.speed_mean = 0.0;
      }
      if (initObj.hasOwnProperty('speed_stdev')) {
        this.speed_stdev = initObj.speed_stdev
      }
      else {
        this.speed_stdev = 0.0;
      }
      if (initObj.hasOwnProperty('speed_max')) {
        this.speed_max = initObj.speed_max
      }
      else {
        this.speed_max = 0.0;
      }
      if (initObj.hasOwnProperty('speed_min')) {
        this.speed_min = initObj.speed_min
      }
      else {
        this.speed_min = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GlobalSimulationResultsMsg
    // Serialize message field [n_failures]
    bufferOffset = _serializer.int64(obj.n_failures, buffer, bufferOffset);
    // Serialize message field [time_mean]
    bufferOffset = _serializer.float64(obj.time_mean, buffer, bufferOffset);
    // Serialize message field [time_stdev]
    bufferOffset = _serializer.float64(obj.time_stdev, buffer, bufferOffset);
    // Serialize message field [time_max]
    bufferOffset = _serializer.float64(obj.time_max, buffer, bufferOffset);
    // Serialize message field [time_min]
    bufferOffset = _serializer.float64(obj.time_min, buffer, bufferOffset);
    // Serialize message field [distance_mean]
    bufferOffset = _serializer.float64(obj.distance_mean, buffer, bufferOffset);
    // Serialize message field [distance_stdev]
    bufferOffset = _serializer.float64(obj.distance_stdev, buffer, bufferOffset);
    // Serialize message field [distance_max]
    bufferOffset = _serializer.float64(obj.distance_max, buffer, bufferOffset);
    // Serialize message field [distance_min]
    bufferOffset = _serializer.float64(obj.distance_min, buffer, bufferOffset);
    // Serialize message field [speed_mean]
    bufferOffset = _serializer.float64(obj.speed_mean, buffer, bufferOffset);
    // Serialize message field [speed_stdev]
    bufferOffset = _serializer.float64(obj.speed_stdev, buffer, bufferOffset);
    // Serialize message field [speed_max]
    bufferOffset = _serializer.float64(obj.speed_max, buffer, bufferOffset);
    // Serialize message field [speed_min]
    bufferOffset = _serializer.float64(obj.speed_min, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GlobalSimulationResultsMsg
    let len;
    let data = new GlobalSimulationResultsMsg(null);
    // Deserialize message field [n_failures]
    data.n_failures = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [time_mean]
    data.time_mean = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time_stdev]
    data.time_stdev = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time_max]
    data.time_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time_min]
    data.time_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_mean]
    data.distance_mean = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_stdev]
    data.distance_stdev = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_max]
    data.distance_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_min]
    data.distance_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_mean]
    data.speed_mean = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_stdev]
    data.speed_stdev = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_max]
    data.speed_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed_min]
    data.speed_min = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 104;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/GlobalSimulationResultsMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6bde56eb7238c5489a8ee01bb10e22b4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 n_failures
    float64 time_mean
    float64 time_stdev
    float64 time_max
    float64 time_min
    float64 distance_mean
    float64 distance_stdev
    float64 distance_max
    float64 distance_min
    float64 speed_mean
    float64 speed_stdev
    float64 speed_max
    float64 speed_min
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GlobalSimulationResultsMsg(null);
    if (msg.n_failures !== undefined) {
      resolved.n_failures = msg.n_failures;
    }
    else {
      resolved.n_failures = 0
    }

    if (msg.time_mean !== undefined) {
      resolved.time_mean = msg.time_mean;
    }
    else {
      resolved.time_mean = 0.0
    }

    if (msg.time_stdev !== undefined) {
      resolved.time_stdev = msg.time_stdev;
    }
    else {
      resolved.time_stdev = 0.0
    }

    if (msg.time_max !== undefined) {
      resolved.time_max = msg.time_max;
    }
    else {
      resolved.time_max = 0.0
    }

    if (msg.time_min !== undefined) {
      resolved.time_min = msg.time_min;
    }
    else {
      resolved.time_min = 0.0
    }

    if (msg.distance_mean !== undefined) {
      resolved.distance_mean = msg.distance_mean;
    }
    else {
      resolved.distance_mean = 0.0
    }

    if (msg.distance_stdev !== undefined) {
      resolved.distance_stdev = msg.distance_stdev;
    }
    else {
      resolved.distance_stdev = 0.0
    }

    if (msg.distance_max !== undefined) {
      resolved.distance_max = msg.distance_max;
    }
    else {
      resolved.distance_max = 0.0
    }

    if (msg.distance_min !== undefined) {
      resolved.distance_min = msg.distance_min;
    }
    else {
      resolved.distance_min = 0.0
    }

    if (msg.speed_mean !== undefined) {
      resolved.speed_mean = msg.speed_mean;
    }
    else {
      resolved.speed_mean = 0.0
    }

    if (msg.speed_stdev !== undefined) {
      resolved.speed_stdev = msg.speed_stdev;
    }
    else {
      resolved.speed_stdev = 0.0
    }

    if (msg.speed_max !== undefined) {
      resolved.speed_max = msg.speed_max;
    }
    else {
      resolved.speed_max = 0.0
    }

    if (msg.speed_min !== undefined) {
      resolved.speed_min = msg.speed_min;
    }
    else {
      resolved.speed_min = 0.0
    }

    return resolved;
    }
};

module.exports = GlobalSimulationResultsMsg;
