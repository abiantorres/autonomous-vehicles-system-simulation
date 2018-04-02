; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude PathInfo.msg.html

(cl:defclass <PathInfo> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector costum_msgs-msg:GoalInfo)
   :initform (cl:make-array 0 :element-type 'costum_msgs-msg:GoalInfo :initial-element (cl:make-instance 'costum_msgs-msg:GoalInfo))))
)

(cl:defclass PathInfo (<PathInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<PathInfo> is deprecated: use costum_msgs-msg:PathInfo instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:data-val is deprecated.  Use costum_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathInfo>) ostream)
  "Serializes a message object of type '<PathInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathInfo>) istream)
  "Deserializes a message object of type '<PathInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'costum_msgs-msg:GoalInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathInfo>)))
  "Returns string type for a message object of type '<PathInfo>"
  "costum_msgs/PathInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathInfo)))
  "Returns string type for a message object of type 'PathInfo"
  "costum_msgs/PathInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathInfo>)))
  "Returns md5sum for a message object of type '<PathInfo>"
  "787d6ccfed1205277495425c79499d72")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathInfo)))
  "Returns md5sum for a message object of type 'PathInfo"
  "787d6ccfed1205277495425c79499d72")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathInfo>)))
  "Returns full string definition for message of type '<PathInfo>"
  (cl:format cl:nil "GoalInfo[] data~%================================================================================~%MSG: costum_msgs/GoalInfo~%float64 x_position~%float64 y_position~%float64 z_position~%float64 x_orientation~%float64 y_orientation~%float64 z_orientation~%float64 w_orientation~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathInfo)))
  "Returns full string definition for message of type 'PathInfo"
  (cl:format cl:nil "GoalInfo[] data~%================================================================================~%MSG: costum_msgs/GoalInfo~%float64 x_position~%float64 y_position~%float64 z_position~%float64 x_orientation~%float64 y_orientation~%float64 z_orientation~%float64 w_orientation~%float64 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'PathInfo
    (cl:cons ':data (data msg))
))
