; Auto-generated. Do not edit!


(cl:in-package costum_msgs-msg)


;//! \htmlinclude SimulationMetadataMsg.msg.html

(cl:defclass <SimulationMetadataMsg> (roslisp-msg-protocol:ros-message)
  ((simulation_hash
    :reader simulation_hash
    :initarg :simulation_hash
    :type cl:string
    :initform "")
   (robot_file
    :reader robot_file
    :initarg :robot_file
    :type cl:string
    :initform "")
   (world_file
    :reader world_file
    :initarg :world_file
    :type cl:string
    :initform "")
   (plan_file
    :reader plan_file
    :initarg :plan_file
    :type cl:string
    :initform "")
   (map_file
    :reader map_file
    :initarg :map_file
    :type cl:string
    :initform "")
   (date
    :reader date
    :initarg :date
    :type cl:string
    :initform "")
   (n_segments
    :reader n_segments
    :initarg :n_segments
    :type cl:integer
    :initform 0)
   (segments_metadata
    :reader segments_metadata
    :initarg :segments_metadata
    :type costum_msgs-msg:SegmentsMetadataMsg
    :initform (cl:make-instance 'costum_msgs-msg:SegmentsMetadataMsg))
   (n_iterations
    :reader n_iterations
    :initarg :n_iterations
    :type cl:integer
    :initform 0)
   (timeout_factor
    :reader timeout_factor
    :initarg :timeout_factor
    :type cl:integer
    :initform 0)
   (useful_simulation
    :reader useful_simulation
    :initarg :useful_simulation
    :type cl:boolean
    :initform cl:nil)
   (local_planner
    :reader local_planner
    :initarg :local_planner
    :type cl:string
    :initform "")
   (global_planner
    :reader global_planner
    :initarg :global_planner
    :type cl:string
    :initform ""))
)

(cl:defclass SimulationMetadataMsg (<SimulationMetadataMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimulationMetadataMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimulationMetadataMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name costum_msgs-msg:<SimulationMetadataMsg> is deprecated: use costum_msgs-msg:SimulationMetadataMsg instead.")))

(cl:ensure-generic-function 'simulation_hash-val :lambda-list '(m))
(cl:defmethod simulation_hash-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:simulation_hash-val is deprecated.  Use costum_msgs-msg:simulation_hash instead.")
  (simulation_hash m))

(cl:ensure-generic-function 'robot_file-val :lambda-list '(m))
(cl:defmethod robot_file-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:robot_file-val is deprecated.  Use costum_msgs-msg:robot_file instead.")
  (robot_file m))

(cl:ensure-generic-function 'world_file-val :lambda-list '(m))
(cl:defmethod world_file-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:world_file-val is deprecated.  Use costum_msgs-msg:world_file instead.")
  (world_file m))

(cl:ensure-generic-function 'plan_file-val :lambda-list '(m))
(cl:defmethod plan_file-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:plan_file-val is deprecated.  Use costum_msgs-msg:plan_file instead.")
  (plan_file m))

(cl:ensure-generic-function 'map_file-val :lambda-list '(m))
(cl:defmethod map_file-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:map_file-val is deprecated.  Use costum_msgs-msg:map_file instead.")
  (map_file m))

(cl:ensure-generic-function 'date-val :lambda-list '(m))
(cl:defmethod date-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:date-val is deprecated.  Use costum_msgs-msg:date instead.")
  (date m))

(cl:ensure-generic-function 'n_segments-val :lambda-list '(m))
(cl:defmethod n_segments-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:n_segments-val is deprecated.  Use costum_msgs-msg:n_segments instead.")
  (n_segments m))

(cl:ensure-generic-function 'segments_metadata-val :lambda-list '(m))
(cl:defmethod segments_metadata-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:segments_metadata-val is deprecated.  Use costum_msgs-msg:segments_metadata instead.")
  (segments_metadata m))

(cl:ensure-generic-function 'n_iterations-val :lambda-list '(m))
(cl:defmethod n_iterations-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:n_iterations-val is deprecated.  Use costum_msgs-msg:n_iterations instead.")
  (n_iterations m))

(cl:ensure-generic-function 'timeout_factor-val :lambda-list '(m))
(cl:defmethod timeout_factor-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:timeout_factor-val is deprecated.  Use costum_msgs-msg:timeout_factor instead.")
  (timeout_factor m))

(cl:ensure-generic-function 'useful_simulation-val :lambda-list '(m))
(cl:defmethod useful_simulation-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:useful_simulation-val is deprecated.  Use costum_msgs-msg:useful_simulation instead.")
  (useful_simulation m))

(cl:ensure-generic-function 'local_planner-val :lambda-list '(m))
(cl:defmethod local_planner-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:local_planner-val is deprecated.  Use costum_msgs-msg:local_planner instead.")
  (local_planner m))

(cl:ensure-generic-function 'global_planner-val :lambda-list '(m))
(cl:defmethod global_planner-val ((m <SimulationMetadataMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader costum_msgs-msg:global_planner-val is deprecated.  Use costum_msgs-msg:global_planner instead.")
  (global_planner m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimulationMetadataMsg>) ostream)
  "Serializes a message object of type '<SimulationMetadataMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'simulation_hash))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'simulation_hash))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_file))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_file))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'world_file))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'world_file))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'plan_file))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'plan_file))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_file))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_file))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'date))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'date))
  (cl:let* ((signed (cl:slot-value msg 'n_segments)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'segments_metadata) ostream)
  (cl:let* ((signed (cl:slot-value msg 'n_iterations)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'timeout_factor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'useful_simulation) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'local_planner))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'local_planner))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'global_planner))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'global_planner))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimulationMetadataMsg>) istream)
  "Deserializes a message object of type '<SimulationMetadataMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'simulation_hash) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'simulation_hash) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_file) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_file) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'world_file) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'world_file) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'map_file) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'map_file) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'n_segments) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'segments_metadata) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'n_iterations) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeout_factor) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:slot-value msg 'useful_simulation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'local_planner) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'local_planner) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'global_planner) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'global_planner) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimulationMetadataMsg>)))
  "Returns string type for a message object of type '<SimulationMetadataMsg>"
  "costum_msgs/SimulationMetadataMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimulationMetadataMsg)))
  "Returns string type for a message object of type 'SimulationMetadataMsg"
  "costum_msgs/SimulationMetadataMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimulationMetadataMsg>)))
  "Returns md5sum for a message object of type '<SimulationMetadataMsg>"
  "b64b7db80c218e4a90f09816c189d51c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimulationMetadataMsg)))
  "Returns md5sum for a message object of type 'SimulationMetadataMsg"
  "b64b7db80c218e4a90f09816c189d51c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimulationMetadataMsg>)))
  "Returns full string definition for message of type '<SimulationMetadataMsg>"
  (cl:format cl:nil "string simulation_hash~%string robot_file~%string world_file~%string plan_file~%string map_file~%string date~%int64 n_segments~%SegmentsMetadataMsg segments_metadata~%int64 n_iterations~%int64 timeout_factor~%bool useful_simulation~%string local_planner~%string global_planner~%~%================================================================================~%MSG: costum_msgs/SegmentsMetadataMsg~%SegmentMetadataMsg[] segments_metadata~%~%================================================================================~%MSG: costum_msgs/SegmentMetadataMsg~%int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimulationMetadataMsg)))
  "Returns full string definition for message of type 'SimulationMetadataMsg"
  (cl:format cl:nil "string simulation_hash~%string robot_file~%string world_file~%string plan_file~%string map_file~%string date~%int64 n_segments~%SegmentsMetadataMsg segments_metadata~%int64 n_iterations~%int64 timeout_factor~%bool useful_simulation~%string local_planner~%string global_planner~%~%================================================================================~%MSG: costum_msgs/SegmentsMetadataMsg~%SegmentMetadataMsg[] segments_metadata~%~%================================================================================~%MSG: costum_msgs/SegmentMetadataMsg~%int64 segment_index~%geometry_msgs/Point initial_point~%geometry_msgs/Point end_point~%float64 distance_between_obstacles~%int64 segment_simulation_timeout~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimulationMetadataMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'simulation_hash))
     4 (cl:length (cl:slot-value msg 'robot_file))
     4 (cl:length (cl:slot-value msg 'world_file))
     4 (cl:length (cl:slot-value msg 'plan_file))
     4 (cl:length (cl:slot-value msg 'map_file))
     4 (cl:length (cl:slot-value msg 'date))
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'segments_metadata))
     8
     8
     1
     4 (cl:length (cl:slot-value msg 'local_planner))
     4 (cl:length (cl:slot-value msg 'global_planner))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimulationMetadataMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'SimulationMetadataMsg
    (cl:cons ':simulation_hash (simulation_hash msg))
    (cl:cons ':robot_file (robot_file msg))
    (cl:cons ':world_file (world_file msg))
    (cl:cons ':plan_file (plan_file msg))
    (cl:cons ':map_file (map_file msg))
    (cl:cons ':date (date msg))
    (cl:cons ':n_segments (n_segments msg))
    (cl:cons ':segments_metadata (segments_metadata msg))
    (cl:cons ':n_iterations (n_iterations msg))
    (cl:cons ':timeout_factor (timeout_factor msg))
    (cl:cons ':useful_simulation (useful_simulation msg))
    (cl:cons ':local_planner (local_planner msg))
    (cl:cons ':global_planner (global_planner msg))
))
