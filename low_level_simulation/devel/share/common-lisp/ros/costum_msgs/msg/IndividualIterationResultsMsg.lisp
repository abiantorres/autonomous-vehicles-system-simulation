; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude IndividualIterationResultsMsg.msg.html

(cl:defclass <IndividualIterationResultsMsg> (roslisp-msg-protocol:ros-message)
  ((iteration_index
    :reader iteration_index
    :initarg :iteration_index
    :type cl:integer
    :initform 0)
   (failure
    :reader failure
    :initarg :failure
    :type cl:boolean
    :initform cl:nil)
   (failure_segment_index
    :reader failure_segment_index
    :initarg :failure_segment_index
    :type cl:integer
    :initform 0)
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (segments_results
    :reader segments_results
    :initarg :segments_results
    :type (cl:vector costum_msgs-msg:IndividualSegmentResultsMsg)
   :initform (cl:make-array 0 :element-type 'costum_msgs-msg:IndividualSegmentResultsMsg :initial-element (cl:make-instance 'costum_msgs-msg:IndividualSegmentResultsMsg))))
)

(cl:defclass IndividualIterationResultsMsg (<IndividualIterationResultsMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IndividualIterationResultsMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IndividualIterationResultsMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<IndividualIterationResultsMsg> is deprecated: use costum_msgs-msg:IndividualIterationResultsMsg instead.")))

(cl:ensure-generic-function 'iteration_index-val :lambda-list '(m))
(cl:defmethod iteration_index-val ((m <IndividualIterationResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:iteration_index-val is deprecated.  Use costum_msgs-msg:iteration_index instead.")
  (iteration_index m))

(cl:ensure-generic-function 'failure-val :lambda-list '(m))
(cl:defmethod failure-val ((m <IndividualIterationResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:failure-val is deprecated.  Use costum_msgs-msg:failure instead.")
  (failure m))

(cl:ensure-generic-function 'failure_segment_index-val :lambda-list '(m))
(cl:defmethod failure_segment_index-val ((m <IndividualIterationResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:failure_segment_index-val is deprecated.  Use costum_msgs-msg:failure_segment_index instead.")
  (failure_segment_index m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <IndividualIterationResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:time-val is deprecated.  Use costum_msgs-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <IndividualIterationResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:distance-val is deprecated.  Use costum_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <IndividualIterationResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:speed-val is deprecated.  Use costum_msgs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'segments_results-val :lambda-list '(m))
(cl:defmethod segments_results-val ((m <IndividualIterationResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:segments_results-val is deprecated.  Use costum_msgs-msg:segments_results instead.")
  (segments_results m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IndividualIterationResultsMsg>) ostream)
  "Serializes a message object of type '<IndividualIterationResultsMsg>"
  (cl:let* ((signed (cl:slot-value msg 'iteration_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'failure) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'failure_segment_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segments_results))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segments_results))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IndividualIterationResultsMsg>) istream)
  "Deserializes a message object of type '<IndividualIterationResultsMsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'iteration_index) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:slot-value msg 'failure) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'failure_segment_index) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segments_results) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segments_results)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'costum_msgs-msg:IndividualSegmentResultsMsg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IndividualIterationResultsMsg>)))
  "Returns string type for a message object of type '<IndividualIterationResultsMsg>"
  "costum_msgs/IndividualIterationResultsMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IndividualIterationResultsMsg)))
  "Returns string type for a message object of type 'IndividualIterationResultsMsg"
  "costum_msgs/IndividualIterationResultsMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IndividualIterationResultsMsg>)))
  "Returns md5sum for a message object of type '<IndividualIterationResultsMsg>"
  "823819fb8874f57d0dd2530f62254e3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IndividualIterationResultsMsg)))
  "Returns md5sum for a message object of type 'IndividualIterationResultsMsg"
  "823819fb8874f57d0dd2530f62254e3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IndividualIterationResultsMsg>)))
  "Returns full string definition for message of type '<IndividualIterationResultsMsg>"
  (cl:format cl:nil "int64 iteration_index~%bool failure~%int64 failure_segment_index~%float64 time~%float64 distance~%float64 speed~%IndividualSegmentResultsMsg[] segments_results~%~%================================================================================~%MSG: costum_msgs/IndividualSegmentResultsMsg~%int64 segment_index~%float64 time~%float64 distance~%float64 speed~%bool failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IndividualIterationResultsMsg)))
  "Returns full string definition for message of type 'IndividualIterationResultsMsg"
  (cl:format cl:nil "int64 iteration_index~%bool failure~%int64 failure_segment_index~%float64 time~%float64 distance~%float64 speed~%IndividualSegmentResultsMsg[] segments_results~%~%================================================================================~%MSG: costum_msgs/IndividualSegmentResultsMsg~%int64 segment_index~%float64 time~%float64 distance~%float64 speed~%bool failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IndividualIterationResultsMsg>))
  (cl:+ 0
     8
     1
     8
     8
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segments_results) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IndividualIterationResultsMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'IndividualIterationResultsMsg
    (cl:cons ':iteration_index (iteration_index msg))
    (cl:cons ':failure (failure msg))
    (cl:cons ':failure_segment_index (failure_segment_index msg))
    (cl:cons ':time (time msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':segments_results (segments_results msg))
))
