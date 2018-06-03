; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude SegmentsMetadataMsg.msg.html

(cl:defclass <SegmentsMetadataMsg> (roslisp-msg-protocol:ros-message)
  ((segments_metadata
    :reader segments_metadata
    :initarg :segments_metadata
    :type (cl:vector costum_msgs-msg:SegmentMetadataMsg)
   :initform (cl:make-array 0 :element-type 'costum_msgs-msg:SegmentMetadataMsg :initial-element (cl:make-instance 'costum_msgs-msg:SegmentMetadataMsg))))
)

(cl:defclass SegmentsMetadataMsg (<SegmentsMetadataMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegmentsMetadataMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegmentsMetadataMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<SegmentsMetadataMsg> is deprecated: use costum_msgs-msg:SegmentsMetadataMsg instead.")))

(cl:ensure-generic-function 'segments_metadata-val :lambda-list '(m))
(cl:defmethod segments_metadata-val ((m <SegmentsMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:segments_metadata-val is deprecated.  Use costum_msgs-msg:segments_metadata instead.")
  (segments_metadata m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegmentsMetadataMsg>) ostream)
  "Serializes a message object of type '<SegmentsMetadataMsg>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segments_metadata))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segments_metadata))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegmentsMetadataMsg>) istream)
  "Deserializes a message object of type '<SegmentsMetadataMsg>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segments_metadata) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segments_metadata)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'costum_msgs-msg:SegmentMetadataMsg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegmentsMetadataMsg>)))
  "Returns string type for a message object of type '<SegmentsMetadataMsg>"
  "costum_msgs/SegmentsMetadataMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegmentsMetadataMsg)))
  "Returns string type for a message object of type 'SegmentsMetadataMsg"
  "costum_msgs/SegmentsMetadataMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegmentsMetadataMsg>)))
  "Returns md5sum for a message object of type '<SegmentsMetadataMsg>"
  "67c0f52ccb2c9e99b2f0c2343335cac1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegmentsMetadataMsg)))
  "Returns md5sum for a message object of type 'SegmentsMetadataMsg"
  "67c0f52ccb2c9e99b2f0c2343335cac1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegmentsMetadataMsg>)))
  "Returns full string definition for message of type '<SegmentsMetadataMsg>"
  (cl:format cl:nil "SegmentMetadataMsg[] segments_metadata~%~%================================================================================~%MSG: costum_msgs/SegmentMetadataMsg~%int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegmentsMetadataMsg)))
  "Returns full string definition for message of type 'SegmentsMetadataMsg"
  (cl:format cl:nil "SegmentMetadataMsg[] segments_metadata~%~%================================================================================~%MSG: costum_msgs/SegmentMetadataMsg~%int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegmentsMetadataMsg>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segments_metadata) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegmentsMetadataMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'SegmentsMetadataMsg
    (cl:cons ':segments_metadata (segments_metadata msg))
))
