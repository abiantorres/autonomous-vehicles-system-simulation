;; Auto-generated. Do not edit!


(when (boundp 'rosjava_test_msgs::CompositeA)
  (if (not (find-package "ROSJAVA_TEST_MSGS"))
    (make-package "ROSJAVA_TEST_MSGS"))
  (shadow 'CompositeA (find-package "ROSJAVA_TEST_MSGS")))
(unless (find-package "ROSJAVA_TEST_MSGS::COMPOSITEA")
  (make-package "ROSJAVA_TEST_MSGS::COMPOSITEA"))

(in-package "ROS")
;;//! \htmlinclude CompositeA.msg.html


(defclass rosjava_test_msgs::CompositeA
  :super ros::object
  :slots (_x _y _z _w ))

(defmethod rosjava_test_msgs::CompositeA
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:w __w) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _w (float __w))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _w
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get rosjava_test_msgs::CompositeA :md5sum-) "a779879fadf0160734f906b8c19c7004")
(setf (get rosjava_test_msgs::CompositeA :datatype-) "rosjava_test_msgs/CompositeA")
(setf (get rosjava_test_msgs::CompositeA :definition-)
      "# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :rosjava_test_msgs/CompositeA "a779879fadf0160734f906b8c19c7004")


