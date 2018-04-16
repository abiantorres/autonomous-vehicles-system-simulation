; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude RouteTimes.msg.html

(cl:defclass <RouteTimes> (roslisp-msg-protocol:ros-message)
  ((times
    :reader times
    :initarg :times
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass RouteTimes (<RouteTimes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RouteTimes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RouteTimes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<RouteTimes> is deprecated: use costum_msgs-msg:RouteTimes instead.")))

(cl:ensure-generic-function 'times-val :lambda-list '(m))
(cl:defmethod times-val ((m <RouteTimes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:times-val is deprecated.  Use costum_msgs-msg:times instead.")
  (times m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RouteTimes>) ostream)
  "Serializes a message object of type '<RouteTimes>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'times))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'times))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RouteTimes>) istream)
  "Deserializes a message object of type '<RouteTimes>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'times) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'times)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RouteTimes>)))
  "Returns string type for a message object of type '<RouteTimes>"
  "costum_msgs/RouteTimes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RouteTimes)))
  "Returns string type for a message object of type 'RouteTimes"
  "costum_msgs/RouteTimes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RouteTimes>)))
  "Returns md5sum for a message object of type '<RouteTimes>"
  "0d394ee177c216ecab30a68521290c92")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RouteTimes)))
  "Returns md5sum for a message object of type 'RouteTimes"
  "0d394ee177c216ecab30a68521290c92")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RouteTimes>)))
  "Returns full string definition for message of type '<RouteTimes>"
  (cl:format cl:nil "float64[] times~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RouteTimes)))
  "Returns full string definition for message of type 'RouteTimes"
  (cl:format cl:nil "float64[] times~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RouteTimes>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'times) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RouteTimes>))
  "Converts a ROS message object to a list"
  (cl:list 'RouteTimes
    (cl:cons ':times (times msg))
))
