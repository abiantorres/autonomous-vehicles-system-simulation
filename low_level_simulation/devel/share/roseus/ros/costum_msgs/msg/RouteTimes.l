;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::RouteTimes)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'RouteTimes (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::ROUTETIMES")
  (make-package "COSTUM_MSGS::ROUTETIMES"))

(in-package "ROS")
;;//! \htmlinclude RouteTimes.msg.html


(defclass costum_msgs::RouteTimes
  :super ros::object
  :slots (_times ))

(defmethod costum_msgs::RouteTimes
  (:init
   (&key
    ((:times __times) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _times __times)
   self)
  (:times
   (&optional __times)
   (if __times (setq _times __times)) _times)
  (:serialization-length
   ()
   (+
    ;; float64[] _times
    (* 8    (length _times)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _times
     (write-long (length _times) s)
     (dotimes (i (length _times))
       (sys::poke (elt _times i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _times
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _times (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _times i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get costum_msgs::RouteTimes :md5sum-) "0d394ee177c216ecab30a68521290c92")
(setf (get costum_msgs::RouteTimes :datatype-) "costum_msgs/RouteTimes")
(setf (get costum_msgs::RouteTimes :definition-)
      "float64[] times
")



(provide :costum_msgs/RouteTimes "0d394ee177c216ecab30a68521290c92")


