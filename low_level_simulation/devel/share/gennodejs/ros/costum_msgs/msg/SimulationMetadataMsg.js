// Auto-generated. Do not edit!

// (in-package costum_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SegmentsMetadataMsg = require('./SegmentsMetadataMsg.js');

//-----------------------------------------------------------

class SimulationMetadataMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.plan_file = null;
      this.date = null;
      this.n_segments = null;
      this.segments_metadata = null;
      this.n_iterations = null;
      this.timeout_factor = null;
      this.useful_simulation = null;
      this.local_planner = null;
      this.global_planner = null;
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
      if (initObj.hasOwnProperty('n_segments')) {
        this.n_segments = initObj.n_segments
      }
      else {
        this.n_segments = 0;
      }
      if (initObj.hasOwnProperty('segments_metadata')) {
        this.segments_metadata = initObj.segments_metadata
      }
      else {
        this.segments_metadata = new SegmentsMetadataMsg();
      }
      if (initObj.hasOwnProperty('n_iterations')) {
        this.n_iterations = initObj.n_iterations
      }
      else {
        this.n_iterations = 0;
      }
      if (initObj.hasOwnProperty('timeout_factor')) {
        this.timeout_factor = initObj.timeout_factor
      }
      else {
        this.timeout_factor = 0;
      }
      if (initObj.hasOwnProperty('useful_simulation')) {
        this.useful_simulation = initObj.useful_simulation
      }
      else {
        this.useful_simulation = false;
      }
      if (initObj.hasOwnProperty('local_planner')) {
        this.local_planner = initObj.local_planner
      }
      else {
        this.local_planner = '';
      }
      if (initObj.hasOwnProperty('global_planner')) {
        this.global_planner = initObj.global_planner
      }
      else {
        this.global_planner = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SimulationMetadataMsg
    // Serialize message field [plan_file]
    bufferOffset = _serializer.string(obj.plan_file, buffer, bufferOffset);
    // Serialize message field [date]
    bufferOffset = _serializer.string(obj.date, buffer, bufferOffset);
    // Serialize message field [n_segments]
    bufferOffset = _serializer.int64(obj.n_segments, buffer, bufferOffset);
    // Serialize message field [segments_metadata]
    bufferOffset = SegmentsMetadataMsg.serialize(obj.segments_metadata, buffer, bufferOffset);
    // Serialize message field [n_iterations]
    bufferOffset = _serializer.int64(obj.n_iterations, buffer, bufferOffset);
    // Serialize message field [timeout_factor]
    bufferOffset = _serializer.int64(obj.timeout_factor, buffer, bufferOffset);
    // Serialize message field [useful_simulation]
    bufferOffset = _serializer.bool(obj.useful_simulation, buffer, bufferOffset);
    // Serialize message field [local_planner]
    bufferOffset = _serializer.string(obj.local_planner, buffer, bufferOffset);
    // Serialize message field [global_planner]
    bufferOffset = _serializer.string(obj.global_planner, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SimulationMetadataMsg
    let len;
    let data = new SimulationMetadataMsg(null);
    // Deserialize message field [plan_file]
    data.plan_file = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [date]
    data.date = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [n_segments]
    data.n_segments = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [segments_metadata]
    data.segments_metadata = SegmentsMetadataMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [n_iterations]
    data.n_iterations = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [timeout_factor]
    data.timeout_factor = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [useful_simulation]
    data.useful_simulation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [local_planner]
    data.local_planner = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [global_planner]
    data.global_planner = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.plan_file.length;
    length += object.date.length;
    length += SegmentsMetadataMsg.getMessageSize(object.segments_metadata);
    length += object.local_planner.length;
    length += object.global_planner.length;
    return length + 41;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/SimulationMetadataMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '771eda917b6244b8b3956c84b90f4902';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string plan_file
    string date
    int64 n_segments
    SegmentsMetadataMsg segments_metadata
    int64 n_iterations
    int64 timeout_factor
    bool useful_simulation
    string local_planner
    string global_planner
    
    ================================================================================
    MSG: costum_msgs/SegmentsMetadataMsg
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
    const resolved = new SimulationMetadataMsg(null);
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

    if (msg.n_segments !== undefined) {
      resolved.n_segments = msg.n_segments;
    }
    else {
      resolved.n_segments = 0
    }

    if (msg.segments_metadata !== undefined) {
      resolved.segments_metadata = SegmentsMetadataMsg.Resolve(msg.segments_metadata)
    }
    else {
      resolved.segments_metadata = new SegmentsMetadataMsg()
    }

    if (msg.n_iterations !== undefined) {
      resolved.n_iterations = msg.n_iterations;
    }
    else {
      resolved.n_iterations = 0
    }

    if (msg.timeout_factor !== undefined) {
      resolved.timeout_factor = msg.timeout_factor;
    }
    else {
      resolved.timeout_factor = 0
    }

    if (msg.useful_simulation !== undefined) {
      resolved.useful_simulation = msg.useful_simulation;
    }
    else {
      resolved.useful_simulation = false
    }

    if (msg.local_planner !== undefined) {
      resolved.local_planner = msg.local_planner;
    }
    else {
      resolved.local_planner = ''
    }

    if (msg.global_planner !== undefined) {
      resolved.global_planner = msg.global_planner;
    }
    else {
      resolved.global_planner = ''
    }

    return resolved;
    }
};

module.exports = SimulationMetadataMsg;
