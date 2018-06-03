; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude SimulationMsg.msg.html

(cl:defclass <SimulationMsg> (roslisp-msg-protocol:ros-message)
  ((metadata
    :reader metadata
    :initarg :metadata
    :type costum_msgs-msg:SimulationMetadataMsg
    :initform (cl:make-instance 'costum_msgs-msg:SimulationMetadataMsg))
   (global_simulation_results
    :reader global_simulation_results
    :initarg :global_simulation_results
    :type costum_msgs-msg:GlobalSimulationResultsMsg
    :initform (cl:make-instance 'costum_msgs-msg:GlobalSimulationResultsMsg))
   (global_segments_results
    :reader global_segments_results
    :initarg :global_segments_results
    :type (cl:vector costum_msgs-msg:GlobalSegmentResultsMsg)
   :initform (cl:make-array 0 :element-type 'costum_msgs-msg:GlobalSegmentResultsMsg :initial-element (cl:make-instance 'costum_msgs-msg:GlobalSegmentResultsMsg)))
   (individual_iterations_results
    :reader individual_iterations_results
    :initarg :individual_iterations_results
    :type (cl:vector costum_msgs-msg:IndividualIterationResultsMsg)
   :initform (cl:make-array 0 :element-type 'costum_msgs-msg:IndividualIterationResultsMsg :initial-element (cl:make-instance 'costum_msgs-msg:IndividualIterationResultsMsg))))
)

(cl:defclass SimulationMsg (<SimulationMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimulationMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimulationMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<SimulationMsg> is deprecated: use costum_msgs-msg:SimulationMsg instead.")))

(cl:ensure-generic-function 'metadata-val :lambda-list '(m))
(cl:defmethod metadata-val ((m <SimulationMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:metadata-val is deprecated.  Use costum_msgs-msg:metadata instead.")
  (metadata m))

(cl:ensure-generic-function 'global_simulation_results-val :lambda-list '(m))
(cl:defmethod global_simulation_results-val ((m <SimulationMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_simulation_results-val is deprecated.  Use costum_msgs-msg:global_simulation_results instead.")
  (global_simulation_results m))

(cl:ensure-generic-function 'global_segments_results-val :lambda-list '(m))
(cl:defmethod global_segments_results-val ((m <SimulationMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_segments_results-val is deprecated.  Use costum_msgs-msg:global_segments_results instead.")
  (global_segments_results m))

(cl:ensure-generic-function 'individual_iterations_results-val :lambda-list '(m))
(cl:defmethod individual_iterations_results-val ((m <SimulationMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:individual_iterations_results-val is deprecated.  Use costum_msgs-msg:individual_iterations_results instead.")
  (individual_iterations_results m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimulationMsg>) ostream)
  "Serializes a message object of type '<SimulationMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'metadata) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'global_simulation_results) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'global_segments_results))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'global_segments_results))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'individual_iterations_results))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'individual_iterations_results))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimulationMsg>) istream)
  "Deserializes a message object of type '<SimulationMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'metadata) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'global_simulation_results) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'global_segments_results) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'global_segments_results)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'costum_msgs-msg:GlobalSegmentResultsMsg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'individual_iterations_results) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'individual_iterations_results)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'costum_msgs-msg:IndividualIterationResultsMsg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimulationMsg>)))
  "Returns string type for a message object of type '<SimulationMsg>"
  "costum_msgs/SimulationMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimulationMsg)))
  "Returns string type for a message object of type 'SimulationMsg"
  "costum_msgs/SimulationMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimulationMsg>)))
  "Returns md5sum for a message object of type '<SimulationMsg>"
  "f76726cea71170d43f3772c8670bcc3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimulationMsg)))
  "Returns md5sum for a message object of type 'SimulationMsg"
  "f76726cea71170d43f3772c8670bcc3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimulationMsg>)))
  "Returns full string definition for message of type '<SimulationMsg>"
  (cl:format cl:nil "SimulationMetadataMsg metadata~%GlobalSimulationResultsMsg global_simulation_results~%GlobalSegmentResultsMsg[] global_segments_results~%IndividualIterationResultsMsg[] individual_iterations_results~%~%================================================================================~%MSG: costum_msgs/SimulationMetadataMsg~%string plan_file~%string date~%int64 n_segments~%SegmentsMetadataMsg segments_metadata~%int64 n_iterations~%int64 timeout_factor~%bool useful_simulation~%string local_planner~%string global_planner~%~%================================================================================~%MSG: costum_msgs/SegmentsMetadataMsg~%SegmentMetadataMsg[] segments_metadata~%~%================================================================================~%MSG: costum_msgs/SegmentMetadataMsg~%int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: costum_msgs/GlobalSimulationResultsMsg~%int64 n_failures~%float64 time_mean~%float64 time_stdev~%float64 time_max~%float64 time_min~%float64 distance_mean~%float64 distance_stdev~%float64 distance_max~%float64 distance_min~%float64 speed_mean~%float64 speed_stdev~%float64 speed_max~%float64 speed_min~%~%================================================================================~%MSG: costum_msgs/GlobalSegmentResultsMsg~%int64 segment_index~%int64 n_failures~%float64 time_mean~%float64 time_stdev~%float64 time_max~%float64 time_min~%float64 distance_mean~%float64 distance_stdev~%float64 distance_max~%float64 distance_min~%float64 speed_mean~%float64 speed_stdev~%float64 speed_max~%float64 speed_min~%~%================================================================================~%MSG: costum_msgs/IndividualIterationResultsMsg~%int64 iteration_index~%bool failure~%int64 failure_segment_index~%float64 time~%float64 distance~%float64 speed~%IndividualSegmentResultsMsg[] segments_results~%~%================================================================================~%MSG: costum_msgs/IndividualSegmentResultsMsg~%int64 segment_index~%float64 time~%float64 distance~%float64 speed~%bool failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimulationMsg)))
  "Returns full string definition for message of type 'SimulationMsg"
  (cl:format cl:nil "SimulationMetadataMsg metadata~%GlobalSimulationResultsMsg global_simulation_results~%GlobalSegmentResultsMsg[] global_segments_results~%IndividualIterationResultsMsg[] individual_iterations_results~%~%================================================================================~%MSG: costum_msgs/SimulationMetadataMsg~%string plan_file~%string date~%int64 n_segments~%SegmentsMetadataMsg segments_metadata~%int64 n_iterations~%int64 timeout_factor~%bool useful_simulation~%string local_planner~%string global_planner~%~%================================================================================~%MSG: costum_msgs/SegmentsMetadataMsg~%SegmentMetadataMsg[] segments_metadata~%~%================================================================================~%MSG: costum_msgs/SegmentMetadataMsg~%int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: costum_msgs/GlobalSimulationResultsMsg~%int64 n_failures~%float64 time_mean~%float64 time_stdev~%float64 time_max~%float64 time_min~%float64 distance_mean~%float64 distance_stdev~%float64 distance_max~%float64 distance_min~%float64 speed_mean~%float64 speed_stdev~%float64 speed_max~%float64 speed_min~%~%================================================================================~%MSG: costum_msgs/GlobalSegmentResultsMsg~%int64 segment_index~%int64 n_failures~%float64 time_mean~%float64 time_stdev~%float64 time_max~%float64 time_min~%float64 distance_mean~%float64 distance_stdev~%float64 distance_max~%float64 distance_min~%float64 speed_mean~%float64 speed_stdev~%float64 speed_max~%float64 speed_min~%~%================================================================================~%MSG: costum_msgs/IndividualIterationResultsMsg~%int64 iteration_index~%bool failure~%int64 failure_segment_index~%float64 time~%float64 distance~%float64 speed~%IndividualSegmentResultsMsg[] segments_results~%~%================================================================================~%MSG: costum_msgs/IndividualSegmentResultsMsg~%int64 segment_index~%float64 time~%float64 distance~%float64 speed~%bool failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimulationMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'metadata))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'global_simulation_results))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'global_segments_results) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'individual_iterations_results) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimulationMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'SimulationMsg
    (cl:cons ':metadata (metadata msg))
    (cl:cons ':global_simulation_results (global_simulation_results msg))
    (cl:cons ':global_segments_results (global_segments_results msg))
    (cl:cons ':individual_iterations_results (individual_iterations_results msg))
))
