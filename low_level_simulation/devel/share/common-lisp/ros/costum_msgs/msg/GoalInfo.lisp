; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude GoalInfo.msg.html

(cl:defclass <GoalInfo> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (time_average
    :reader time_average
    :initarg :time_average
    :type cl:float
    :initform 0.0)
   (distance_average
    :reader distance_average
    :initarg :distance_average
    :type cl:float
    :initform 0.0)
   (velocity_average
    :reader velocity_average
    :initarg :velocity_average
    :type cl:float
    :initform 0.0)
   (failures
    :reader failures
    :initarg :failures
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GoalInfo (<GoalInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoalInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoalInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<GoalInfo> is deprecated: use costum_msgs-msg:GoalInfo instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <GoalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:id-val is deprecated.  Use costum_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'time_average-val :lambda-list '(m))
(cl:defmethod time_average-val ((m <GoalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:time_average-val is deprecated.  Use costum_msgs-msg:time_average instead.")
  (time_average m))

(cl:ensure-generic-function 'distance_average-val :lambda-list '(m))
(cl:defmethod distance_average-val ((m <GoalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:distance_average-val is deprecated.  Use costum_msgs-msg:distance_average instead.")
  (distance_average m))

(cl:ensure-generic-function 'velocity_average-val :lambda-list '(m))
(cl:defmethod velocity_average-val ((m <GoalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:velocity_average-val is deprecated.  Use costum_msgs-msg:velocity_average instead.")
  (velocity_average m))

(cl:ensure-generic-function 'failures-val :lambda-list '(m))
(cl:defmethod failures-val ((m <GoalInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:failures-val is deprecated.  Use costum_msgs-msg:failures instead.")
  (failures m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoalInfo>) ostream)
  "Serializes a message object of type '<GoalInfo>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time_average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance_average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity_average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'failures)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoalInfo>) istream)
  "Deserializes a message object of type '<GoalInfo>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_average) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_average) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_average) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'failures) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoalInfo>)))
  "Returns string type for a message object of type '<GoalInfo>"
  "costum_msgs/GoalInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalInfo)))
  "Returns string type for a message object of type 'GoalInfo"
  "costum_msgs/GoalInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoalInfo>)))
  "Returns md5sum for a message object of type '<GoalInfo>"
  "8d65c3a28a49ef2e0abb508952cb41a4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoalInfo)))
  "Returns md5sum for a message object of type 'GoalInfo"
  "8d65c3a28a49ef2e0abb508952cb41a4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoalInfo>)))
  "Returns full string definition for message of type '<GoalInfo>"
  (cl:format cl:nil "string id~%float64 time_average~%float64 distance_average~%float64 velocity_average~%int16 failures~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoalInfo)))
  "Returns full string definition for message of type 'GoalInfo"
  (cl:format cl:nil "string id~%float64 time_average~%float64 distance_average~%float64 velocity_average~%int16 failures~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoalInfo>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
     8
     8
     8
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoalInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'GoalInfo
    (cl:cons ':id (id msg))
    (cl:cons ':time_average (time_average msg))
    (cl:cons ':distance_average (distance_average msg))
    (cl:cons ':velocity_average (velocity_average msg))
    (cl:cons ':failures (failures msg))
))
