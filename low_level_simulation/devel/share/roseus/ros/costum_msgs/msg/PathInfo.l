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
  :slots (_data ))

(defmethod costum_msgs::PathInfo
  (:init
   (&key
    ((:data __data) (let (r) (dotimes (i 0) (push (instance costum_msgs::GoalInfo :init) r)) r))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; costum_msgs/GoalInfo[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; costum_msgs/GoalInfo[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; costum_msgs/GoalInfo[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance costum_msgs::GoalInfo :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get costum_msgs::PathInfo :md5sum-) "787d6ccfed1205277495425c79499d72")
(setf (get costum_msgs::PathInfo :datatype-) "costum_msgs/PathInfo")
(setf (get costum_msgs::PathInfo :definition-)
      "GoalInfo[] data
================================================================================
MSG: costum_msgs/GoalInfo
float64 x_position
float64 y_position
float64 z_position
float64 x_orientation
float64 y_orientation
float64 z_orientation
float64 w_orientation
float64 time

")



(provide :costum_msgs/PathInfo "787d6ccfed1205277495425c79499d72")


