;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::SegmentMetadataMsg)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'SegmentMetadataMsg (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::SEGMENTMETADATAMSG")
  (make-package "COSTUM_MSGS::SEGMENTMETADATAMSG"))

(in-package "ROS")
;;//! \htmlinclude SegmentMetadataMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass costum_msgs::SegmentMetadataMsg
  :super ros::object
  :slots (_segment_index _initial_point _end_point _distance_between_obstacles _segment_simulation_timeout ))

(defmethod costum_msgs::SegmentMetadataMsg
  (:init
   (&key
    ((:segment_index __segment_index) 0)
    ((:initial_point __initial_point) (instance geometry_msgs::Point :init))
    ((:end_point __end_point) (instance geometry_msgs::Point :init))
    ((:distance_between_obstacles __distance_between_obstacles) 0.0)
    ((:segment_simulation_timeout __segment_simulation_timeout) 0)
    )
   (send-super :init)
   (setq _segment_index (round __segment_index))
   (setq _initial_point __initial_point)
   (setq _end_point __end_point)
   (setq _distance_between_obstacles (float __distance_between_obstacles))
   (setq _segment_simulation_timeout (round __segment_simulation_timeout))
   self)
  (:segment_index
   (&optional __segment_index)
   (if __segment_index (setq _segment_index __segment_index)) _segment_index)
  (:initial_point
   (&rest __initial_point)
   (if (keywordp (car __initial_point))
       (send* _initial_point __initial_point)
     (progn
       (if __initial_point (setq _initial_point (car __initial_point)))
       _initial_point)))
  (:end_point
   (&rest __end_point)
   (if (keywordp (car __end_point))
       (send* _end_point __end_point)
     (progn
       (if __end_point (setq _end_point (car __end_point)))
       _end_point)))
  (:distance_between_obstacles
   (&optional __distance_between_obstacles)
   (if __distance_between_obstacles (setq _distance_between_obstacles __distance_between_obstacles)) _distance_between_obstacles)
  (:segment_simulation_timeout
   (&optional __segment_simulation_timeout)
   (if __segment_simulation_timeout (setq _segment_simulation_timeout __segment_simulation_timeout)) _segment_simulation_timeout)
  (:serialization-length
   ()
   (+
    ;; int64 _segment_index
    8
    ;; geometry_msgs/Point _initial_point
    (send _initial_point :serialization-length)
    ;; geometry_msgs/Point _end_point
    (send _end_point :serialization-length)
    ;; float64 _distance_between_obstacles
    8
    ;; int64 _segment_simulation_timeout
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _segment_index
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _segment_index (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _segment_index) (= (length (_segment_index . bv)) 2)) ;; bignum
              (write-long (ash (elt (_segment_index . bv) 0) 0) s)
              (write-long (ash (elt (_segment_index . bv) 1) -1) s))
             ((and (class _segment_index) (= (length (_segment_index . bv)) 1)) ;; big1
              (write-long (elt (_segment_index . bv) 0) s)
              (write-long (if (>= _segment_index 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _segment_index s)(write-long (if (>= _segment_index 0) 0 #xffffffff) s)))
     ;; geometry_msgs/Point _initial_point
       (send _initial_point :serialize s)
     ;; geometry_msgs/Point _end_point
       (send _end_point :serialize s)
     ;; float64 _distance_between_obstacles
       (sys::poke _distance_between_obstacles (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int64 _segment_simulation_timeout
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _segment_simulation_timeout (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _segment_simulation_timeout) (= (length (_segment_simulation_timeout . bv)) 2)) ;; bignum
              (write-long (ash (elt (_segment_simulation_timeout . bv) 0) 0) s)
              (write-long (ash (elt (_segment_simulation_timeout . bv) 1) -1) s))
             ((and (class _segment_simulation_timeout) (= (length (_segment_simulation_timeout . bv)) 1)) ;; big1
              (write-long (elt (_segment_simulation_timeout . bv) 0) s)
              (write-long (if (>= _segment_simulation_timeout 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _segment_simulation_timeout s)(write-long (if (>= _segment_simulation_timeout 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _segment_index
#+(or :alpha :irix6 :x86_64)
      (setf _segment_index (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _segment_index (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; geometry_msgs/Point _initial_point
     (send _initial_point :deserialize buf ptr-) (incf ptr- (send _initial_point :serialization-length))
   ;; geometry_msgs/Point _end_point
     (send _end_point :deserialize buf ptr-) (incf ptr- (send _end_point :serialization-length))
   ;; float64 _distance_between_obstacles
     (setq _distance_between_obstacles (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int64 _segment_simulation_timeout
#+(or :alpha :irix6 :x86_64)
      (setf _segment_simulation_timeout (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _segment_simulation_timeout (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get costum_msgs::SegmentMetadataMsg :md5sum-) "b238c42fedf53903e2cf5776ff7562f0")
(setf (get costum_msgs::SegmentMetadataMsg :datatype-) "costum_msgs/SegmentMetadataMsg")
(setf (get costum_msgs::SegmentMetadataMsg :definition-)
      "int64 segment_index
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



(provide :costum_msgs/SegmentMetadataMsg "b238c42fedf53903e2cf5776ff7562f0")


