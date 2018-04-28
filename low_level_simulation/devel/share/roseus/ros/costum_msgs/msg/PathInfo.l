;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::PathInfo)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'PathInfo (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::PATHINFO")
  (make-package "COSTUM_MSGS::PATHINFO"))

(in-package "ROS")
;;//! \htmlinclude PathInfo.msg.html


(defclass costum_msgs::PathInfo
  :super ros::object
  :slots (_plan_file _date _simulations _global_time_average _global_distance_average _global_velocity_average _global_linear_velocity_average _global_maximum_linear_velocity _global_failures _sections ))

(defmethod costum_msgs::PathInfo
  (:init
   (&key
    ((:plan_file __plan_file) "")
    ((:date __date) "")
    ((:simulations __simulations) 0)
    ((:global_time_average __global_time_average) 0.0)
    ((:global_distance_average __global_distance_average) 0.0)
    ((:global_velocity_average __global_velocity_average) 0.0)
    ((:global_linear_velocity_average __global_linear_velocity_average) 0.0)
    ((:global_maximum_linear_velocity __global_maximum_linear_velocity) 0.0)
    ((:global_failures __global_failures) 0)
    ((:sections __sections) (let (r) (dotimes (i 0) (push (instance costum_msgs::GoalInfo :init) r)) r))
    )
   (send-super :init)
   (setq _plan_file (string __plan_file))
   (setq _date (string __date))
   (setq _simulations (round __simulations))
   (setq _global_time_average (float __global_time_average))
   (setq _global_distance_average (float __global_distance_average))
   (setq _global_velocity_average (float __global_velocity_average))
   (setq _global_linear_velocity_average (float __global_linear_velocity_average))
   (setq _global_maximum_linear_velocity (float __global_maximum_linear_velocity))
   (setq _global_failures (round __global_failures))
   (setq _sections __sections)
   self)
  (:plan_file
   (&optional __plan_file)
   (if __plan_file (setq _plan_file __plan_file)) _plan_file)
  (:date
   (&optional __date)
   (if __date (setq _date __date)) _date)
  (:simulations
   (&optional __simulations)
   (if __simulations (setq _simulations __simulations)) _simulations)
  (:global_time_average
   (&optional __global_time_average)
   (if __global_time_average (setq _global_time_average __global_time_average)) _global_time_average)
  (:global_distance_average
   (&optional __global_distance_average)
   (if __global_distance_average (setq _global_distance_average __global_distance_average)) _global_distance_average)
  (:global_velocity_average
   (&optional __global_velocity_average)
   (if __global_velocity_average (setq _global_velocity_average __global_velocity_average)) _global_velocity_average)
  (:global_linear_velocity_average
   (&optional __global_linear_velocity_average)
   (if __global_linear_velocity_average (setq _global_linear_velocity_average __global_linear_velocity_average)) _global_linear_velocity_average)
  (:global_maximum_linear_velocity
   (&optional __global_maximum_linear_velocity)
   (if __global_maximum_linear_velocity (setq _global_maximum_linear_velocity __global_maximum_linear_velocity)) _global_maximum_linear_velocity)
  (:global_failures
   (&optional __global_failures)
   (if __global_failures (setq _global_failures __global_failures)) _global_failures)
  (:sections
   (&rest __sections)
   (if (keywordp (car __sections))
       (send* _sections __sections)
     (progn
       (if __sections (setq _sections (car __sections)))
       _sections)))
  (:serialization-length
   ()
   (+
    ;; string _plan_file
    4 (length _plan_file)
    ;; string _date
    4 (length _date)
    ;; int16 _simulations
    2
    ;; float64 _global_time_average
    8
    ;; float64 _global_distance_average
    8
    ;; float64 _global_velocity_average
    8
    ;; float64 _global_linear_velocity_average
    8
    ;; float64 _global_maximum_linear_velocity
    8
    ;; int16 _global_failures
    2
    ;; costum_msgs/GoalInfo[] _sections
    (apply #'+ (send-all _sections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _plan_file
       (write-long (length _plan_file) s) (princ _plan_file s)
     ;; string _date
       (write-long (length _date) s) (princ _date s)
     ;; int16 _simulations
       (write-word _simulations s)
     ;; float64 _global_time_average
       (sys::poke _global_time_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _global_distance_average
       (sys::poke _global_distance_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _global_velocity_average
       (sys::poke _global_velocity_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _global_linear_velocity_average
       (sys::poke _global_linear_velocity_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _global_maximum_linear_velocity
       (sys::poke _global_maximum_linear_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _global_failures
       (write-word _global_failures s)
     ;; costum_msgs/GoalInfo[] _sections
     (write-long (length _sections) s)
     (dolist (elem _sections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _plan_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _plan_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _date
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _date (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16 _simulations
     (setq _simulations (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _global_time_average
     (setq _global_time_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _global_distance_average
     (setq _global_distance_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _global_velocity_average
     (setq _global_velocity_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _global_linear_velocity_average
     (setq _global_linear_velocity_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _global_maximum_linear_velocity
     (setq _global_maximum_linear_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _global_failures
     (setq _global_failures (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; costum_msgs/GoalInfo[] _sections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sections (let (r) (dotimes (i n) (push (instance costum_msgs::GoalInfo :init) r)) r))
     (dolist (elem- _sections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get costum_msgs::PathInfo :md5sum-) "406f78da04ae6e0a1419c2646f9bbca9")
(setf (get costum_msgs::PathInfo :datatype-) "costum_msgs/PathInfo")
(setf (get costum_msgs::PathInfo :definition-)
      "string plan_file
string date
int16 simulations
float64 global_time_average
float64 global_distance_average
float64 global_velocity_average
float64 global_linear_velocity_average
float64 global_maximum_linear_velocity
int16 global_failures
GoalInfo[] sections
================================================================================
MSG: costum_msgs/GoalInfo
string id
float64 time_average
float64 distance_average
float64 velocity_average
float64 linear_velocity_average
float64 maximum_linear_velocity
int16 failures

")



(provide :costum_msgs/PathInfo "406f78da04ae6e0a1419c2646f9bbca9")


