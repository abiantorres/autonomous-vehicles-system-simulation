;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::SimulationMetadataMsg)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'SimulationMetadataMsg (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::SIMULATIONMETADATAMSG")
  (make-package "COSTUM_MSGS::SIMULATIONMETADATAMSG"))

(in-package "ROS")
;;//! \htmlinclude SimulationMetadataMsg.msg.html


(defclass costum_msgs::SimulationMetadataMsg
  :super ros::object
  :slots (_simulation_hash _robot_file _world_file _plan_file _map_file _date _n_segments _segments_metadata _n_iterations _timeout_factor _useful_simulation _local_planner _global_planner ))

(defmethod costum_msgs::SimulationMetadataMsg
  (:init
   (&key
    ((:simulation_hash __simulation_hash) "")
    ((:robot_file __robot_file) "")
    ((:world_file __world_file) "")
    ((:plan_file __plan_file) "")
    ((:map_file __map_file) "")
    ((:date __date) "")
    ((:n_segments __n_segments) 0)
    ((:segments_metadata __segments_metadata) (instance costum_msgs::SegmentsMetadataMsg :init))
    ((:n_iterations __n_iterations) 0)
    ((:timeout_factor __timeout_factor) 0)
    ((:useful_simulation __useful_simulation) nil)
    ((:local_planner __local_planner) "")
    ((:global_planner __global_planner) "")
    )
   (send-super :init)
   (setq _simulation_hash (string __simulation_hash))
   (setq _robot_file (string __robot_file))
   (setq _world_file (string __world_file))
   (setq _plan_file (string __plan_file))
   (setq _map_file (string __map_file))
   (setq _date (string __date))
   (setq _n_segments (round __n_segments))
   (setq _segments_metadata __segments_metadata)
   (setq _n_iterations (round __n_iterations))
   (setq _timeout_factor (round __timeout_factor))
   (setq _useful_simulation __useful_simulation)
   (setq _local_planner (string __local_planner))
   (setq _global_planner (string __global_planner))
   self)
  (:simulation_hash
   (&optional __simulation_hash)
   (if __simulation_hash (setq _simulation_hash __simulation_hash)) _simulation_hash)
  (:robot_file
   (&optional __robot_file)
   (if __robot_file (setq _robot_file __robot_file)) _robot_file)
  (:world_file
   (&optional __world_file)
   (if __world_file (setq _world_file __world_file)) _world_file)
  (:plan_file
   (&optional __plan_file)
   (if __plan_file (setq _plan_file __plan_file)) _plan_file)
  (:map_file
   (&optional __map_file)
   (if __map_file (setq _map_file __map_file)) _map_file)
  (:date
   (&optional __date)
   (if __date (setq _date __date)) _date)
  (:n_segments
   (&optional __n_segments)
   (if __n_segments (setq _n_segments __n_segments)) _n_segments)
  (:segments_metadata
   (&rest __segments_metadata)
   (if (keywordp (car __segments_metadata))
       (send* _segments_metadata __segments_metadata)
     (progn
       (if __segments_metadata (setq _segments_metadata (car __segments_metadata)))
       _segments_metadata)))
  (:n_iterations
   (&optional __n_iterations)
   (if __n_iterations (setq _n_iterations __n_iterations)) _n_iterations)
  (:timeout_factor
   (&optional __timeout_factor)
   (if __timeout_factor (setq _timeout_factor __timeout_factor)) _timeout_factor)
  (:useful_simulation
   (&optional __useful_simulation)
   (if __useful_simulation (setq _useful_simulation __useful_simulation)) _useful_simulation)
  (:local_planner
   (&optional __local_planner)
   (if __local_planner (setq _local_planner __local_planner)) _local_planner)
  (:global_planner
   (&optional __global_planner)
   (if __global_planner (setq _global_planner __global_planner)) _global_planner)
  (:serialization-length
   ()
   (+
    ;; string _simulation_hash
    4 (length _simulation_hash)
    ;; string _robot_file
    4 (length _robot_file)
    ;; string _world_file
    4 (length _world_file)
    ;; string _plan_file
    4 (length _plan_file)
    ;; string _map_file
    4 (length _map_file)
    ;; string _date
    4 (length _date)
    ;; int64 _n_segments
    8
    ;; costum_msgs/SegmentsMetadataMsg _segments_metadata
    (send _segments_metadata :serialization-length)
    ;; int64 _n_iterations
    8
    ;; int64 _timeout_factor
    8
    ;; bool _useful_simulation
    1
    ;; string _local_planner
    4 (length _local_planner)
    ;; string _global_planner
    4 (length _global_planner)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _simulation_hash
       (write-long (length _simulation_hash) s) (princ _simulation_hash s)
     ;; string _robot_file
       (write-long (length _robot_file) s) (princ _robot_file s)
     ;; string _world_file
       (write-long (length _world_file) s) (princ _world_file s)
     ;; string _plan_file
       (write-long (length _plan_file) s) (princ _plan_file s)
     ;; string _map_file
       (write-long (length _map_file) s) (princ _map_file s)
     ;; string _date
       (write-long (length _date) s) (princ _date s)
     ;; int64 _n_segments
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _n_segments (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _n_segments) (= (length (_n_segments . bv)) 2)) ;; bignum
              (write-long (ash (elt (_n_segments . bv) 0) 0) s)
              (write-long (ash (elt (_n_segments . bv) 1) -1) s))
             ((and (class _n_segments) (= (length (_n_segments . bv)) 1)) ;; big1
              (write-long (elt (_n_segments . bv) 0) s)
              (write-long (if (>= _n_segments 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _n_segments s)(write-long (if (>= _n_segments 0) 0 #xffffffff) s)))
     ;; costum_msgs/SegmentsMetadataMsg _segments_metadata
       (send _segments_metadata :serialize s)
     ;; int64 _n_iterations
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _n_iterations (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _n_iterations) (= (length (_n_iterations . bv)) 2)) ;; bignum
              (write-long (ash (elt (_n_iterations . bv) 0) 0) s)
              (write-long (ash (elt (_n_iterations . bv) 1) -1) s))
             ((and (class _n_iterations) (= (length (_n_iterations . bv)) 1)) ;; big1
              (write-long (elt (_n_iterations . bv) 0) s)
              (write-long (if (>= _n_iterations 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _n_iterations s)(write-long (if (>= _n_iterations 0) 0 #xffffffff) s)))
     ;; int64 _timeout_factor
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timeout_factor (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timeout_factor) (= (length (_timeout_factor . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timeout_factor . bv) 0) 0) s)
              (write-long (ash (elt (_timeout_factor . bv) 1) -1) s))
             ((and (class _timeout_factor) (= (length (_timeout_factor . bv)) 1)) ;; big1
              (write-long (elt (_timeout_factor . bv) 0) s)
              (write-long (if (>= _timeout_factor 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timeout_factor s)(write-long (if (>= _timeout_factor 0) 0 #xffffffff) s)))
     ;; bool _useful_simulation
       (if _useful_simulation (write-byte -1 s) (write-byte 0 s))
     ;; string _local_planner
       (write-long (length _local_planner) s) (princ _local_planner s)
     ;; string _global_planner
       (write-long (length _global_planner) s) (princ _global_planner s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _simulation_hash
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _simulation_hash (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _world_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _world_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _plan_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _plan_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _map_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _map_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _date
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _date (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _n_segments
#+(or :alpha :irix6 :x86_64)
      (setf _n_segments (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _n_segments (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; costum_msgs/SegmentsMetadataMsg _segments_metadata
     (send _segments_metadata :deserialize buf ptr-) (incf ptr- (send _segments_metadata :serialization-length))
   ;; int64 _n_iterations
#+(or :alpha :irix6 :x86_64)
      (setf _n_iterations (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _n_iterations (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _timeout_factor
#+(or :alpha :irix6 :x86_64)
      (setf _timeout_factor (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timeout_factor (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _useful_simulation
     (setq _useful_simulation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _local_planner
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _local_planner (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _global_planner
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _global_planner (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get costum_msgs::SimulationMetadataMsg :md5sum-) "b64b7db80c218e4a90f09816c189d51c")
(setf (get costum_msgs::SimulationMetadataMsg :datatype-) "costum_msgs/SimulationMetadataMsg")
(setf (get costum_msgs::SimulationMetadataMsg :definition-)
      "string simulation_hash
string robot_file
string world_file
string plan_file
string map_file
string date
int64 n_segments
SegmentsMetadataMsg segments_metadata
int64 n_iterations
int64 timeout_factor
bool useful_simulation
string local_planner
string global_planner

================================================================================
MSG: costum_msgs/SegmentsMetadataMsg
SegmentMetadataMsg[] segments_metadata

================================================================================
MSG: costum_msgs/SegmentMetadataMsg
int64 segment_index
geometry_msgs/Point initial_point
geometry_msgs/Point end_point
float64 distance_between_obstacles
int64 segment_simulation_timeout

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :costum_msgs/SimulationMetadataMsg "b64b7db80c218e4a90f09816c189d51c")


