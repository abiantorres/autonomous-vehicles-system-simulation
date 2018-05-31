; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude IndividualSegmentResultsMsg.msg.html

(cl:defclass <IndividualSegmentResultsMsg> (roslisp-msg-protocol:ros-message)
  ((segment_index
    :reader segment_index
    :initarg :segment_index
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
   (failure
    :reader failure
    :initarg :failure
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass IndividualSegmentResultsMsg (<IndividualSegmentResultsMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IndividualSegmentResultsMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IndividualSegmentResultsMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<IndividualSegmentResultsMsg> is deprecated: use costum_msgs-msg:IndividualSegmentResultsMsg instead.")))

(cl:ensure-generic-function 'segment_index-val :lambda-list '(m))
(cl:defmethod segment_index-val ((m <IndividualSegmentResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:segment_index-val is deprecated.  Use costum_msgs-msg:segment_index instead.")
  (segment_index m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <IndividualSegmentResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:time-val is deprecated.  Use costum_msgs-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <IndividualSegmentResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:distance-val is deprecated.  Use costum_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <IndividualSegmentResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:speed-val is deprecated.  Use costum_msgs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'failure-val :lambda-list '(m))
(cl:defmethod failure-val ((m <IndividualSegmentResultsMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:failure-val is deprecated.  Use costum_msgs-msg:failure instead.")
  (failure m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IndividualSegmentResultsMsg>) ostream)
  "Serializes a message object of type '<IndividualSegmentResultsMsg>"
  (cl:let* ((signed (cl:slot-value msg 'segment_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'failure) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IndividualSegmentResultsMsg>) istream)
  "Deserializes a message object of type '<IndividualSegmentResultsMsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'segment_index) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
    (cl:setf (cl:slot-value msg 'failure) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IndividualSegmentResultsMsg>)))
  "Returns string type for a message object of type '<IndividualSegmentResultsMsg>"
  "costum_msgs/IndividualSegmentResultsMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IndividualSegmentResultsMsg)))
  "Returns string type for a message object of type 'IndividualSegmentResultsMsg"
  "costum_msgs/IndividualSegmentResultsMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IndividualSegmentResultsMsg>)))
  "Returns md5sum for a message object of type '<IndividualSegmentResultsMsg>"
  "8203f1ba3a513f2e426062e0f95d02d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IndividualSegmentResultsMsg)))
  "Returns md5sum for a message object of type 'IndividualSegmentResultsMsg"
  "8203f1ba3a513f2e426062e0f95d02d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IndividualSegmentResultsMsg>)))
  "Returns full string definition for message of type '<IndividualSegmentResultsMsg>"
  (cl:format cl:nil "int64 segment_index~%float64 time~%float64 distance~%float64 speed~%bool failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IndividualSegmentResultsMsg)))
  "Returns full string definition for message of type 'IndividualSegmentResultsMsg"
  (cl:format cl:nil "int64 segment_index~%float64 time~%float64 distance~%float64 speed~%bool failure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IndividualSegmentResultsMsg>))
  (cl:+ 0
     8
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IndividualSegmentResultsMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'IndividualSegmentResultsMsg
    (cl:cons ':segment_index (segment_index msg))
    (cl:cons ':time (time msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':failure (failure msg))
))
