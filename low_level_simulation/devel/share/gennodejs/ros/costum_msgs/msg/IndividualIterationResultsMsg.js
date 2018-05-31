// Auto-generated. Do not edit!

// (in-package costum_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let IndividualSegmentResultsMsg = require('./IndividualSegmentResultsMsg.js');

//-----------------------------------------------------------

class IndividualIterationResultsMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.iteration_index = null;
      this.failure = null;
      this.failure_segment_index = null;
      this.time = null;
      this.distance = null;
      this.speed = null;
      this.segments_results = null;
    }
    else {
      if (initObj.hasOwnProperty('iteration_index')) {
        this.iteration_index = initObj.iteration_index
      }
      else {
        this.iteration_index = 0;
      }
      if (initObj.hasOwnProperty('failure')) {
        this.failure = initObj.failure
      }
      else {
        this.failure = false;
      }
      if (initObj.hasOwnProperty('failure_segment_index')) {
        this.failure_segment_index = initObj.failure_segment_index
      }
      else {
        this.failure_segment_index = 0;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0.0;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('segments_results')) {
        this.segments_results = initObj.segments_results
      }
      else {
        this.segments_results = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IndividualIterationResultsMsg
    // Serialize message field [iteration_index]
    bufferOffset = _serializer.int64(obj.iteration_index, buffer, bufferOffset);
    // Serialize message field [failure]
    bufferOffset = _serializer.bool(obj.failure, buffer, bufferOffset);
    // Serialize message field [failure_segment_index]
    bufferOffset = _serializer.int64(obj.failure_segment_index, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.float64(obj.time, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float64(obj.speed, buffer, bufferOffset);
    // Serialize message field [segments_results]
    // Serialize the length for message field [segments_results]
    bufferOffset = _serializer.uint32(obj.segments_results.length, buffer, bufferOffset);
    obj.segments_results.forEach((val) => {
      bufferOffset = IndividualSegmentResultsMsg.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IndividualIterationResultsMsg
    let len;
    let data = new IndividualIterationResultsMsg(null);
    // Deserialize message field [iteration_index]
    data.iteration_index = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [failure]
    data.failure = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [failure_segment_index]
    data.failure_segment_index = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [segments_results]
    // Deserialize array length for message field [segments_results]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.segments_results = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.segments_results[i] = IndividualSegmentResultsMsg.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 33 * object.segments_results.length;
    return length + 45;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/IndividualIterationResultsMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '823819fb8874f57d0dd2530f62254e3d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 iteration_index
    bool failure
    int64 failure_segment_index
    float64 time
    float64 distance
    float64 speed
    IndividualSegmentResultsMsg[] segments_results
    
    ================================================================================
    MSG: costum_msgs/IndividualSegmentResultsMsg
    int64 segment_index
    float64 time
    float64 distance
    float64 speed
    bool failure
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IndividualIterationResultsMsg(null);
    if (msg.iteration_index !== undefined) {
      resolved.iteration_index = msg.iteration_index;
    }
    else {
      resolved.iteration_index = 0
    }

    if (msg.failure !== undefined) {
      resolved.failure = msg.failure;
    }
    else {
      resolved.failure = false
    }

    if (msg.failure_segment_index !== undefined) {
      resolved.failure_segment_index = msg.failure_segment_index;
    }
    else {
      resolved.failure_segment_index = 0
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0.0
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.segments_results !== undefined) {
      resolved.segments_results = new Array(msg.segments_results.length);
      for (let i = 0; i < resolved.segments_results.length; ++i) {
        resolved.segments_results[i] = IndividualSegmentResultsMsg.Resolve(msg.segments_results[i]);
      }
    }
    else {
      resolved.segments_results = []
    }

    return resolved;
    }
};

module.exports = IndividualIterationResultsMsg;
