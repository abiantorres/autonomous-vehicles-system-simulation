; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude SegmentMetadataMsg.msg.html

(cl:defclass <SegmentMetadataMsg> (roslisp-msg-protocol:ros-message)
  ((segment_index
    :reader segment_index
    :initarg :segment_index
    :type cl:integer
    :initform 0)
   (initial_point
    :reader initial_point
    :initarg :initial_point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (end_point
    :reader end_point
    :initarg :end_point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (distance_between_obstacles
    :reader distance_between_obstacles
    :initarg :distance_between_obstacles
    :type cl:float
    :initform 0.0)
   (segment_simulation_timeout
    :reader segment_simulation_timeout
    :initarg :segment_simulation_timeout
    :type cl:integer
    :initform 0))
)

(cl:defclass SegmentMetadataMsg (<SegmentMetadataMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegmentMetadataMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegmentMetadataMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<SegmentMetadataMsg> is deprecated: use costum_msgs-msg:SegmentMetadataMsg instead.")))

(cl:ensure-generic-function 'segment_index-val :lambda-list '(m))
(cl:defmethod segment_index-val ((m <SegmentMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:segment_index-val is deprecated.  Use costum_msgs-msg:segment_index instead.")
  (segment_index m))

(cl:ensure-generic-function 'initial_point-val :lambda-list '(m))
(cl:defmethod initial_point-val ((m <SegmentMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:initial_point-val is deprecated.  Use costum_msgs-msg:initial_point instead.")
  (initial_point m))

(cl:ensure-generic-function 'end_point-val :lambda-list '(m))
(cl:defmethod end_point-val ((m <SegmentMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:end_point-val is deprecated.  Use costum_msgs-msg:end_point instead.")
  (end_point m))

(cl:ensure-generic-function 'distance_between_obstacles-val :lambda-list '(m))
(cl:defmethod distance_between_obstacles-val ((m <SegmentMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:distance_between_obstacles-val is deprecated.  Use costum_msgs-msg:distance_between_obstacles instead.")
  (distance_between_obstacles m))

(cl:ensure-generic-function 'segment_simulation_timeout-val :lambda-list '(m))
(cl:defmethod segment_simulation_timeout-val ((m <SegmentMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:segment_simulation_timeout-val is deprecated.  Use costum_msgs-msg:segment_simulation_timeout instead.")
  (segment_simulation_timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegmentMetadataMsg>) ostream)
  "Serializes a message object of type '<SegmentMetadataMsg>"
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
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'initial_point) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'end_point) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance_between_obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'segment_simulation_timeout)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegmentMetadataMsg>) istream)
  "Deserializes a message object of type '<SegmentMetadataMsg>"
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'initial_point) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'end_point) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_between_obstacles) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'segment_simulation_timeout) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegmentMetadataMsg>)))
  "Returns string type for a message object of type '<SegmentMetadataMsg>"
  "costum_msgs/SegmentMetadataMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegmentMetadataMsg)))
  "Returns string type for a message object of type 'SegmentMetadataMsg"
  "costum_msgs/SegmentMetadataMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegmentMetadataMsg>)))
  "Returns md5sum for a message object of type '<SegmentMetadataMsg>"
  "b238c42fedf53903e2cf5776ff7562f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegmentMetadataMsg)))
  "Returns md5sum for a message object of type 'SegmentMetadataMsg"
  "b238c42fedf53903e2cf5776ff7562f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegmentMetadataMsg>)))
  "Returns full string definition for message of type '<SegmentMetadataMsg>"
  (cl:format cl:nil "int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegmentMetadataMsg)))
  "Returns full string definition for message of type 'SegmentMetadataMsg"
  (cl:format cl:nil "int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegmentMetadataMsg>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'initial_point))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'end_point))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegmentMetadataMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'SegmentMetadataMsg
    (cl:cons ':segment_index (segment_index msg))
    (cl:cons ':initial_point (initial_point msg))
    (cl:cons ':end_point (end_point msg))
    (cl:cons ':distance_between_obstacles (distance_between_obstacles msg))
    (cl:cons ':segment_simulation_timeout (segment_simulation_timeout msg))
))
