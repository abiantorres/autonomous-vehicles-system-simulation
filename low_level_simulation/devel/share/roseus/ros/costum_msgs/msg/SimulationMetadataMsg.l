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
  :slots (_plan_file _date _n_segments _n_iterations _simulation_timeout _distance_between_obstacles _useful_simulation _local_planner _global_planner ))

(defmethod costum_msgs::SimulationMetadataMsg
  (:init
   (&key
    ((:plan_file __plan_file) "")
    ((:date __date) "")
    ((:n_segments __n_segments) 0)
    ((:n_iterations __n_iterations) 0)
    ((:simulation_timeout __simulation_timeout) 0)
    ((:distance_between_obstacles __distance_between_obstacles) 0.0)
    ((:useful_simulation __useful_simulation) nil)
    ((:local_planner __local_planner) "")
    ((:global_planner __global_planner) "")
    )
   (send-super :init)
   (setq _plan_file (string __plan_file))
   (setq _date (string __date))
   (setq _n_segments (round __n_segments))
   (setq _n_iterations (round __n_iterations))
   (setq _simulation_timeout (round __simulation_timeout))
   (setq _distance_between_obstacles (float __distance_between_obstacles))
   (setq _useful_simulation __useful_simulation)
   (setq _local_planner (string __local_planner))
   (setq _global_planner (string __global_planner))
   self)
  (:plan_file
   (&optional __plan_file)
   (if __plan_file (setq _plan_file __plan_file)) _plan_file)
  (:date
   (&optional __date)
   (if __date (setq _date __date)) _date)
  (:n_segments
   (&optional __n_segments)
   (if __n_segments (setq _n_segments __n_segments)) _n_segments)
  (:n_iterations
   (&optional __n_iterations)
   (if __n_iterations (setq _n_iterations __n_iterations)) _n_iterations)
  (:simulation_timeout
   (&optional __simulation_timeout)
   (if __simulation_timeout (setq _simulation_timeout __simulation_timeout)) _simulation_timeout)
  (:distance_between_obstacles
   (&optional __distance_between_obstacles)
   (if __distance_between_obstacles (setq _distance_between_obstacles __distance_between_obstacles)) _distance_between_obstacles)
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
    ;; string _plan_file
    4 (length _plan_file)
    ;; string _date
    4 (length _date)
    ;; int64 _n_segments
    8
    ;; int64 _n_iterations
    8
    ;; int64 _simulation_timeout
    8
    ;; float64 _distance_between_obstacles
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
     ;; string _plan_file
       (write-long (length _plan_file) s) (princ _plan_file s)
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
     ;; int64 _simulation_timeout
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _simulation_timeout (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _simulation_timeout) (= (length (_simulation_timeout . bv)) 2)) ;; bignum
              (write-long (ash (elt (_simulation_timeout . bv) 0) 0) s)
              (write-long (ash (elt (_simulation_timeout . bv) 1) -1) s))
             ((and (class _simulation_timeout) (= (length (_simulation_timeout . bv)) 1)) ;; big1
              (write-long (elt (_simulation_timeout . bv) 0) s)
              (write-long (if (>= _simulation_timeout 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _simulation_timeout s)(write-long (if (>= _simulation_timeout 0) 0 #xffffffff) s)))
     ;; float64 _distance_between_obstacles
       (sys::poke _distance_between_obstacles (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; string _plan_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _plan_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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
   ;; int64 _simulation_timeout
#+(or :alpha :irix6 :x86_64)
      (setf _simulation_timeout (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _simulation_timeout (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _distance_between_obstacles
     (setq _distance_between_obstacles (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _useful_simulation
     (setq _useful_simulation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _local_planner
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _local_planner (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _global_planner
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _global_planner (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get costum_msgs::SimulationMetadataMsg :md5sum-) "6204327964663f21015d923ee7818638")
(setf (get costum_msgs::SimulationMetadataMsg :datatype-) "costum_msgs/SimulationMetadataMsg")
(setf (get costum_msgs::SimulationMetadataMsg :definition-)
      "string plan_file
string date
int64 n_segments
int64 n_iterations
int64 simulation_timeout
float64 distance_between_obstacles
bool useful_simulation
string local_planner
string global_planner

")



(provide :costum_msgs/SimulationMetadataMsg "6204327964663f21015d923ee7818638")


