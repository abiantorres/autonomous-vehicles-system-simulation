// Auto-generated. Do not edit!

// (in-package costum_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SimulationMetadataMsg = require('./SimulationMetadataMsg.js');
let GlobalSimulationResultsMsg = require('./GlobalSimulationResultsMsg.js');
let GlobalSegmentResultsMsg = require('./GlobalSegmentResultsMsg.js');
let IndividualIterationResultsMsg = require('./IndividualIterationResultsMsg.js');

//-----------------------------------------------------------

class SimulationMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.metadata = null;
      this.global_simulation_results = null;
      this.global_segments_results = null;
      this.individual_iterations_results = null;
    }
    else {
      if (initObj.hasOwnProperty('metadata')) {
        this.metadata = initObj.metadata
      }
      else {
        this.metadata = new SimulationMetadataMsg();
      }
      if (initObj.hasOwnProperty('global_simulation_results')) {
        this.global_simulation_results = initObj.global_simulation_results
      }
      else {
        this.global_simulation_results = new GlobalSimulationResultsMsg();
      }
      if (initObj.hasOwnProperty('global_segments_results')) {
        this.global_segments_results = initObj.global_segments_results
      }
      else {
        this.global_segments_results = [];
      }
      if (initObj.hasOwnProperty('individual_iterations_results')) {
        this.individual_iterations_results = initObj.individual_iterations_results
      }
      else {
        this.individual_iterations_results = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SimulationMsg
    // Serialize message field [metadata]
    bufferOffset = SimulationMetadataMsg.serialize(obj.metadata, buffer, bufferOffset);
    // Serialize message field [global_simulation_results]
    bufferOffset = GlobalSimulationResultsMsg.serialize(obj.global_simulation_results, buffer, bufferOffset);
    // Serialize message field [global_segments_results]
    // Serialize the length for message field [global_segments_results]
    bufferOffset = _serializer.uint32(obj.global_segments_results.length, buffer, bufferOffset);
    obj.global_segments_results.forEach((val) => {
      bufferOffset = GlobalSegmentResultsMsg.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [individual_iterations_results]
    // Serialize the length for message field [individual_iterations_results]
    bufferOffset = _serializer.uint32(obj.individual_iterations_results.length, buffer, bufferOffset);
    obj.individual_iterations_results.forEach((val) => {
      bufferOffset = IndividualIterationResultsMsg.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SimulationMsg
    let len;
    let data = new SimulationMsg(null);
    // Deserialize message field [metadata]
    data.metadata = SimulationMetadataMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [global_simulation_results]
    data.global_simulation_results = GlobalSimulationResultsMsg.deserialize(buffer, bufferOffset);
    // Deserialize message field [global_segments_results]
    // Deserialize array length for message field [global_segments_results]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.global_segments_results = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.global_segments_results[i] = GlobalSegmentResultsMsg.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [individual_iterations_results]
    // Deserialize array length for message field [individual_iterations_results]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.individual_iterations_results = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.individual_iterations_results[i] = IndividualIterationResultsMsg.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += SimulationMetadataMsg.getMessageSize(object.metadata);
    length += 112 * object.global_segments_results.length;
    object.individual_iterations_results.forEach((val) => {
      length += IndividualIterationResultsMsg.getMessageSize(val);
    });
    return length + 112;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costum_msgs/SimulationMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1fc04017a8937851069ea4d1e0d47bfe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    SimulationMetadataMsg metadata
    GlobalSimulationResultsMsg global_simulation_results
    GlobalSegmentResultsMsg[] global_segments_results
    IndividualIterationResultsMsg[] individual_iterations_results
    
    ================================================================================
    MSG: costum_msgs/SimulationMetadataMsg
    string simulation_hash
    string robot_file
    string world_file
    string plan_file
    string map_file
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
    
    ================================================================================
    MSG: costum_msgs/GlobalSimulationResultsMsg
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
    
    ================================================================================
    MSG: costum_msgs/GlobalSegmentResultsMsg
    int64 segment_index
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
    
    ================================================================================
    MSG: costum_msgs/IndividualIterationResultsMsg
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
    const resolved = new SimulationMsg(null);
    if (msg.metadata !== undefined) {
      resolved.metadata = SimulationMetadataMsg.Resolve(msg.metadata)
    }
    else {
      resolved.metadata = new SimulationMetadataMsg()
    }

    if (msg.global_simulation_results !== undefined) {
      resolved.global_simulation_results = GlobalSimulationResultsMsg.Resolve(msg.global_simulation_results)
    }
    else {
      resolved.global_simulation_results = new GlobalSimulationResultsMsg()
    }

    if (msg.global_segments_results !== undefined) {
      resolved.global_segments_results = new Array(msg.global_segments_results.length);
      for (let i = 0; i < resolved.global_segments_results.length; ++i) {
        resolved.global_segments_results[i] = GlobalSegmentResultsMsg.Resolve(msg.global_segments_results[i]);
      }
    }
    else {
      resolved.global_segments_results = []
    }

    if (msg.individual_iterations_results !== undefined) {
      resolved.individual_iterations_results = new Array(msg.individual_iterations_results.length);
      for (let i = 0; i < resolved.individual_iterations_results.length; ++i) {
        resolved.individual_iterations_results[i] = IndividualIterationResultsMsg.Resolve(msg.individual_iterations_results[i]);
      }
    }
    else {
      resolved.individual_iterations_results = []
    }

    return resolved;
    }
};

module.exports = SimulationMsg;
