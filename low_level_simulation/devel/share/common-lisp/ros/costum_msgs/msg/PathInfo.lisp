; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude PathInfo.msg.html

(cl:defclass <PathInfo> (roslisp-msg-protocol:ros-message)
  ((plan_file
    :reader plan_file
    :initarg :plan_file
    :type cl:string
    :initform "")
   (date
    :reader date
    :initarg :date
    :type cl:string
    :initform "")
   (simulations
    :reader simulations
    :initarg :simulations
    :type cl:fixnum
    :initform 0)
   (global_time_average
    :reader global_time_average
    :initarg :global_time_average
    :type cl:float
    :initform 0.0)
   (global_distance_average
    :reader global_distance_average
    :initarg :global_distance_average
    :type cl:float
    :initform 0.0)
   (global_velocity_average
    :reader global_velocity_average
    :initarg :global_velocity_average
    :type cl:float
    :initform 0.0)
   (global_linear_velocity_average
    :reader global_linear_velocity_average
    :initarg :global_linear_velocity_average
    :type cl:float
    :initform 0.0)
   (global_maximum_linear_velocity
    :reader global_maximum_linear_velocity
    :initarg :global_maximum_linear_velocity
    :type cl:float
    :initform 0.0)
   (global_failures
    :reader global_failures
    :initarg :global_failures
    :type cl:fixnum
    :initform 0)
   (sections
    :reader sections
    :initarg :sections
    :type (cl:vector costum_msgs-msg:GoalInfo)
   :initform (cl:make-array 0 :element-type 'costum_msgs-msg:GoalInfo :initial-element (cl:make-instance 'costum_msgs-msg:GoalInfo))))
)

(cl:defclass PathInfo (<PathInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<PathInfo> is deprecated: use costum_msgs-msg:PathInfo instead.")))

(cl:ensure-generic-function 'plan_file-val :lambda-list '(m))
(cl:defmethod plan_file-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:plan_file-val is deprecated.  Use costum_msgs-msg:plan_file instead.")
  (plan_file m))

(cl:ensure-generic-function 'date-val :lambda-list '(m))
(cl:defmethod date-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:date-val is deprecated.  Use costum_msgs-msg:date instead.")
  (date m))

(cl:ensure-generic-function 'simulations-val :lambda-list '(m))
(cl:defmethod simulations-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:simulations-val is deprecated.  Use costum_msgs-msg:simulations instead.")
  (simulations m))

(cl:ensure-generic-function 'global_time_average-val :lambda-list '(m))
(cl:defmethod global_time_average-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_time_average-val is deprecated.  Use costum_msgs-msg:global_time_average instead.")
  (global_time_average m))

(cl:ensure-generic-function 'global_distance_average-val :lambda-list '(m))
(cl:defmethod global_distance_average-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_distance_average-val is deprecated.  Use costum_msgs-msg:global_distance_average instead.")
  (global_distance_average m))

(cl:ensure-generic-function 'global_velocity_average-val :lambda-list '(m))
(cl:defmethod global_velocity_average-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_velocity_average-val is deprecated.  Use costum_msgs-msg:global_velocity_average instead.")
  (global_velocity_average m))

(cl:ensure-generic-function 'global_linear_velocity_average-val :lambda-list '(m))
(cl:defmethod global_linear_velocity_average-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_linear_velocity_average-val is deprecated.  Use costum_msgs-msg:global_linear_velocity_average instead.")
  (global_linear_velocity_average m))

(cl:ensure-generic-function 'global_maximum_linear_velocity-val :lambda-list '(m))
(cl:defmethod global_maximum_linear_velocity-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_maximum_linear_velocity-val is deprecated.  Use costum_msgs-msg:global_maximum_linear_velocity instead.")
  (global_maximum_linear_velocity m))

(cl:ensure-generic-function 'global_failures-val :lambda-list '(m))
(cl:defmethod global_failures-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_failures-val is deprecated.  Use costum_msgs-msg:global_failures instead.")
  (global_failures m))

(cl:ensure-generic-function 'sections-val :lambda-list '(m))
(cl:defmethod sections-val ((m <PathInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:sections-val is deprecated.  Use costum_msgs-msg:sections instead.")
  (sections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathInfo>) ostream)
  "Serializes a message object of type '<PathInfo>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'plan_file))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'plan_file))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'date))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'date))
  (cl:let* ((signed (cl:slot-value msg 'simulations)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'global_time_average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'global_distance_average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'global_velocity_average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'global_linear_velocity_average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'global_maximum_linear_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'global_failures)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'sections))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathInfo>) istream)
  "Deserializes a message object of type '<PathInfo>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'plan_file) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'plan_file) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'date) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'date) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'simulations) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'global_time_average) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'global_distance_average) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'global_velocity_average) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'global_linear_velocity_average) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'global_maximum_linear_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'global_failures) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sections)))
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
  "7c2655d5b5f75f4be7efb52a24b34d2a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathInfo)))
  "Returns md5sum for a message object of type 'PathInfo"
  "7c2655d5b5f75f4be7efb52a24b34d2a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathInfo>)))
  "Returns full string definition for message of type '<PathInfo>"
  (cl:format cl:nil "string plan_file~%string date~%int16 simulations~%float64 global_time_average~%float64 global_distance_average~%float64 global_velocity_average~%float64 global_linear_velocity_average~%float64 global_maximum_linear_velocity~%int16 global_failures~%GoalInfo[] sections~%================================================================================~%MSG: costum_msgs/GoalInfo~%string id~%float64 time_average~%float64 distance_average~%float64 velocity_average~%float64 linear_velocity_average~%float64 maximum_linear_velocity~%float64 density~%float64 max_obstacle_shiftment~%float64 obstacle_length~%int16 failures~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathInfo)))
  "Returns full string definition for message of type 'PathInfo"
  (cl:format cl:nil "string plan_file~%string date~%int16 simulations~%float64 global_time_average~%float64 global_distance_average~%float64 global_velocity_average~%float64 global_linear_velocity_average~%float64 global_maximum_linear_velocity~%int16 global_failures~%GoalInfo[] sections~%================================================================================~%MSG: costum_msgs/GoalInfo~%string id~%float64 time_average~%float64 distance_average~%float64 velocity_average~%float64 linear_velocity_average~%float64 maximum_linear_velocity~%float64 density~%float64 max_obstacle_shiftment~%float64 obstacle_length~%int16 failures~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathInfo>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'plan_file))
     4 (cl:length (cl:slot-value msg 'date))
     2
     8
     8
     8
     8
     8
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'PathInfo
    (cl:cons ':plan_file (plan_file msg))
    (cl:cons ':date (date msg))
    (cl:cons ':simulations (simulations msg))
    (cl:cons ':global_time_average (global_time_average msg))
    (cl:cons ':global_distance_average (global_distance_average msg))
    (cl:cons ':global_velocity_average (global_velocity_average msg))
    (cl:cons ':global_linear_velocity_average (global_linear_velocity_average msg))
    (cl:cons ':global_maximum_linear_velocity (global_maximum_linear_velocity msg))
    (cl:cons ':global_failures (global_failures msg))
    (cl:cons ':sections (sections msg))
))
