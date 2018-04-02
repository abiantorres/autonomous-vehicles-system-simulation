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
  :slots (_x_position _y_position _z_position _x_orientation _y_orientation _z_orientation _w_orientation _time ))

(defmethod costum_msgs::GoalInfo
  (:init
   (&key
    ((:x_position __x_position) 0.0)
    ((:y_position __y_position) 0.0)
    ((:z_position __z_position) 0.0)
    ((:x_orientation __x_orientation) 0.0)
    ((:y_orientation __y_orientation) 0.0)
    ((:z_orientation __z_orientation) 0.0)
    ((:w_orientation __w_orientation) 0.0)
    ((:time __time) 0.0)
    )
   (send-super :init)
   (setq _x_position (float __x_position))
   (setq _y_position (float __y_position))
   (setq _z_position (float __z_position))
   (setq _x_orientation (float __x_orientation))
   (setq _y_orientation (float __y_orientation))
   (setq _z_orientation (float __z_orientation))
   (setq _w_orientation (float __w_orientation))
   (setq _time (float __time))
   self)
  (:x_position
   (&optional __x_position)
   (if __x_position (setq _x_position __x_position)) _x_position)
  (:y_position
   (&optional __y_position)
   (if __y_position (setq _y_position __y_position)) _y_position)
  (:z_position
   (&optional __z_position)
   (if __z_position (setq _z_position __z_position)) _z_position)
  (:x_orientation
   (&optional __x_orientation)
   (if __x_orientation (setq _x_orientation __x_orientation)) _x_orientation)
  (:y_orientation
   (&optional __y_orientation)
   (if __y_orientation (setq _y_orientation __y_orientation)) _y_orientation)
  (:z_orientation
   (&optional __z_orientation)
   (if __z_orientation (setq _z_orientation __z_orientation)) _z_orientation)
  (:w_orientation
   (&optional __w_orientation)
   (if __w_orientation (setq _w_orientation __w_orientation)) _w_orientation)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; float64 _x_position
    8
    ;; float64 _y_position
    8
    ;; float64 _z_position
    8
    ;; float64 _x_orientation
    8
    ;; float64 _y_orientation
    8
    ;; float64 _z_orientation
    8
    ;; float64 _w_orientation
    8
    ;; float64 _time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x_position
       (sys::poke _x_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_position
       (sys::poke _y_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z_position
       (sys::poke _z_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x_orientation
       (sys::poke _x_orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_orientation
       (sys::poke _y_orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z_orientation
       (sys::poke _z_orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w_orientation
       (sys::poke _w_orientation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x_position
     (setq _x_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_position
     (setq _y_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z_position
     (setq _z_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x_orientation
     (setq _x_orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_orientation
     (setq _y_orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z_orientation
     (setq _z_orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w_orientation
     (setq _w_orientation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get costum_msgs::GoalInfo :md5sum-) "5c2161efb882ab714cdc912beb12392f")
(setf (get costum_msgs::GoalInfo :datatype-) "costum_msgs/GoalInfo")
(setf (get costum_msgs::GoalInfo :definition-)
      "float64 x_position
float64 y_position
float64 z_position
float64 x_orientation
float64 y_orientation
float64 z_orientation
float64 w_orientation
float64 time

")



(provide :costum_msgs/GoalInfo "5c2161efb882ab714cdc912beb12392f")


