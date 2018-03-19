;; Auto-generated. Do not edit!


(when (boundp 'rosjava_test_msgs::Composite)
  (if (not (find-package "ROSJAVA_TEST_MSGS"))
    (make-package "ROSJAVA_TEST_MSGS"))
  (shadow 'Composite (find-package "ROSJAVA_TEST_MSGS")))
(unless (find-package "ROSJAVA_TEST_MSGS::COMPOSITE")
  (make-package "ROSJAVA_TEST_MSGS::COMPOSITE"))

(in-package "ROS")
;;//! \htmlinclude Composite.msg.html


(defclass rosjava_test_msgs::Composite
  :super ros::object
  :slots (_a _b ))

(defmethod rosjava_test_msgs::Composite
  (:init
   (&key
    ((:a __a) (instance rosjava_test_msgs::CompositeA :init))
    ((:b __b) (instance rosjava_test_msgs::CompositeB :init))
    )
   (send-super :init)
   (setq _a __a)
   (setq _b __b)
   self)
  (:a
   (&rest __a)
   (if (keywordp (car __a))
       (send* _a __a)
     (progn
       (if __a (setq _a (car __a)))
       _a)))
  (:b
   (&rest __b)
   (if (keywordp (car __b))
       (send* _b __b)
     (progn
       (if __b (setq _b (car __b)))
       _b)))
  (:serialization-length
   ()
   (+
    ;; rosjava_test_msgs/CompositeA _a
    (send _a :serialization-length)
    ;; rosjava_test_msgs/CompositeB _b
    (send _b :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; rosjava_test_msgs/CompositeA _a
       (send _a :serialize s)
     ;; rosjava_test_msgs/CompositeB _b
       (send _b :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; rosjava_test_msgs/CompositeA _a
     (send _a :deserialize buf ptr-) (incf ptr- (send _a :serialization-length))
   ;; rosjava_test_msgs/CompositeB _b
     (send _b :deserialize buf ptr-) (incf ptr- (send _b :serialization-length))
   ;;
   self)
  )

(setf (get rosjava_test_msgs::Composite :md5sum-) "d8fb6eb869ad3956b50e8737d96dc9fa")
(setf (get rosjava_test_msgs::Composite :datatype-) "rosjava_test_msgs/Composite")
(setf (get rosjava_test_msgs::Composite :definition-)
      "# composite message. required for testing import calculation in generators
CompositeA a
CompositeB b

================================================================================
MSG: rosjava_test_msgs/CompositeA
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: rosjava_test_msgs/CompositeB
# copy of geometry_msgs/Point for testing
float64 x
float64 y
float64 z

")



(provide :rosjava_test_msgs/Composite "d8fb6eb869ad3956b50e8737d96dc9fa")


