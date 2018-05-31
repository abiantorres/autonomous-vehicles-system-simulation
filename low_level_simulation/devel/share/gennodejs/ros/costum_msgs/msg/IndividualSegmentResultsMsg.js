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

class IndividualSegmentResultsMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.segment_index = null;
      this.time = null;
      this.distance = null;
      this.speed = null;
      this.failure = null;
    }
    else {
      if (initObj.hasOwnProperty('segment_index')) {
        this.segment_index = initObj.segment_index
      }
      else {
        this.segment_index = 0;
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
      if (initObj.hasOwnProperty('failure')) {
        this.failure = initObj.failure
      }
      else {
        this.failure = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IndividualSegmentResultsMsg
    // Serialize message field [segment_index]
    bufferOffset = _serializer.int64(obj.segment_index, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.float64(obj.time, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float64(obj.speed, buffer, bufferOffset);
    // Serialize message field [failure]
    bufferOffset = _serializer.bool(obj.failure, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IndividualSegmentResultsMsg
    let len;
    let data = new IndividualSegmentResultsMsg(null);
    // Deserialize message field [segment_index]
    data.segment_index = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [failure]
    data.failure = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/IndividualSegmentResultsMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8203f1ba3a513f2e426062e0f95d02d8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new IndividualSegmentResultsMsg(null);
    if (msg.segment_index !== undefined) {
      resolved.segment_index = msg.segment_index;
    }
    else {
      resolved.segment_index = 0
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

    if (msg.failure !== undefined) {
      resolved.failure = msg.failure;
    }
    else {
      resolved.failure = false
    }

    return resolved;
    }
};

module.exports = IndividualSegmentResultsMsg;
