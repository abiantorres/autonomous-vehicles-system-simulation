;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::GoalInfo)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'GoalInfo (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::GOALINFO")
  (make-package "COSTUM_MSGS::GOALINFO"))

(in-package "ROS")
;;//! \htmlinclude GoalInfo.msg.html


(defclass costum_msgs::GoalInfo
  :super ros::object
  :slots (_id _time_average _time_standard_deviation _distance_average _velocity_average _linear_velocity_average _maximum_linear_velocity _density _max_obstacle_shiftment _obstacle_length _failures ))

(defmethod costum_msgs::GoalInfo
  (:init
   (&key
    ((:id __id) "")
    ((:time_average __time_average) 0.0)
    ((:time_standard_deviation __time_standard_deviation) 0.0)
    ((:distance_average __distance_average) 0.0)
    ((:velocity_average __velocity_average) 0.0)
    ((:linear_velocity_average __linear_velocity_average) 0.0)
    ((:maximum_linear_velocity __maximum_linear_velocity) 0.0)
    ((:density __density) 0.0)
    ((:max_obstacle_shiftment __max_obstacle_shiftment) 0.0)
    ((:obstacle_length __obstacle_length) 0.0)
    ((:failures __failures) 0)
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _time_average (float __time_average))
   (setq _time_standard_deviation (float __time_standard_deviation))
   (setq _distance_average (float __distance_average))
   (setq _velocity_average (float __velocity_average))
   (setq _linear_velocity_average (float __linear_velocity_average))
   (setq _maximum_linear_velocity (float __maximum_linear_velocity))
   (setq _density (float __density))
   (setq _max_obstacle_shiftment (float __max_obstacle_shiftment))
   (setq _obstacle_length (float __obstacle_length))
   (setq _failures (round __failures))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:time_average
   (&optional __time_average)
   (if __time_average (setq _time_average __time_average)) _time_average)
  (:time_standard_deviation
   (&optional __time_standard_deviation)
   (if __time_standard_deviation (setq _time_standard_deviation __time_standard_deviation)) _time_standard_deviation)
  (:distance_average
   (&optional __distance_average)
   (if __distance_average (setq _distance_average __distance_average)) _distance_average)
  (:velocity_average
   (&optional __velocity_average)
   (if __velocity_average (setq _velocity_average __velocity_average)) _velocity_average)
  (:linear_velocity_average
   (&optional __linear_velocity_average)
   (if __linear_velocity_average (setq _linear_velocity_average __linear_velocity_average)) _linear_velocity_average)
  (:maximum_linear_velocity
   (&optional __maximum_linear_velocity)
   (if __maximum_linear_velocity (setq _maximum_linear_velocity __maximum_linear_velocity)) _maximum_linear_velocity)
  (:density
   (&optional __density)
   (if __density (setq _density __density)) _density)
  (:max_obstacle_shiftment
   (&optional __max_obstacle_shiftment)
   (if __max_obstacle_shiftment (setq _max_obstacle_shiftment __max_obstacle_shiftment)) _max_obstacle_shiftment)
  (:obstacle_length
   (&optional __obstacle_length)
   (if __obstacle_length (setq _obstacle_length __obstacle_length)) _obstacle_length)
  (:failures
   (&optional __failures)
   (if __failures (setq _failures __failures)) _failures)
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; float64 _time_average
    8
    ;; float64 _time_standard_deviation
    8
    ;; float64 _distance_average
    8
    ;; float64 _velocity_average
    8
    ;; float64 _linear_velocity_average
    8
    ;; float64 _maximum_linear_velocity
    8
    ;; float64 _density
    8
    ;; float64 _max_obstacle_shiftment
    8
    ;; float64 _obstacle_length
    8
    ;; int16 _failures
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; float64 _time_average
       (sys::poke _time_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time_standard_deviation
       (sys::poke _time_standard_deviation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_average
       (sys::poke _distance_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_average
       (sys::poke _velocity_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _linear_velocity_average
       (sys::poke _linear_velocity_average (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _maximum_linear_velocity
       (sys::poke _maximum_linear_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _density
       (sys::poke _density (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_obstacle_shiftment
       (sys::poke _max_obstacle_shiftment (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _obstacle_length
       (sys::poke _obstacle_length (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _failures
       (write-word _failures s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _time_average
     (setq _time_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time_standard_deviation
     (setq _time_standard_deviation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_average
     (setq _distance_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_average
     (setq _velocity_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _linear_velocity_average
     (setq _linear_velocity_average (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _maximum_linear_velocity
     (setq _maximum_linear_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _density
     (setq _density (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_obstacle_shiftment
     (setq _max_obstacle_shiftment (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _obstacle_length
     (setq _obstacle_length (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _failures
     (setq _failures (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get costum_msgs::GoalInfo :md5sum-) "c5759e1e10a4cf0239c09042d29b09f8")
(setf (get costum_msgs::GoalInfo :datatype-) "costum_msgs/GoalInfo")
(setf (get costum_msgs::GoalInfo :definition-)
      "string id
float64 time_average
float64 time_standard_deviation
float64 distance_average
float64 velocity_average
float64 linear_velocity_average
float64 maximum_linear_velocity
float64 density
float64 max_obstacle_shiftment
float64 obstacle_length
int16 failures
")



(provide :costum_msgs/GoalInfo "c5759e1e10a4cf0239c09042d29b09f8")


