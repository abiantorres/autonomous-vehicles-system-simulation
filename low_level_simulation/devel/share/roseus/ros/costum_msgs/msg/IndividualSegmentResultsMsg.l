;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::IndividualSegmentResultsMsg)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'IndividualSegmentResultsMsg (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::INDIVIDUALSEGMENTRESULTSMSG")
  (make-package "COSTUM_MSGS::INDIVIDUALSEGMENTRESULTSMSG"))

(in-package "ROS")
;;//! \htmlinclude IndividualSegmentResultsMsg.msg.html


(defclass costum_msgs::IndividualSegmentResultsMsg
  :super ros::object
  :slots (_segment_index _time _distance _speed _failure ))

(defmethod costum_msgs::IndividualSegmentResultsMsg
  (:init
   (&key
    ((:segment_index __segment_index) 0)
    ((:time __time) 0.0)
    ((:distance __distance) 0.0)
    ((:speed __speed) 0.0)
    ((:failure __failure) nil)
    )
   (send-super :init)
   (setq _segment_index (round __segment_index))
   (setq _time (float __time))
   (setq _distance (float __distance))
   (setq _speed (float __speed))
   (setq _failure __failure)
   self)
  (:segment_index
   (&optional __segment_index)
   (if __segment_index (setq _segment_index __segment_index)) _segment_index)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:failure
   (&optional __failure)
   (if __failure (setq _failure __failure)) _failure)
  (:serialization-length
   ()
   (+
    ;; int64 _segment_index
    8
    ;; float64 _time
    8
    ;; float64 _distance
    8
    ;; float64 _speed
    8
    ;; bool _failure
    1
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
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _failure
       (if _failure (write-byte -1 s) (write-byte 0 s))
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
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _failure
     (setq _failure (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get costum_msgs::IndividualSegmentResultsMsg :md5sum-) "8203f1ba3a513f2e426062e0f95d02d8")
(setf (get costum_msgs::IndividualSegmentResultsMsg :datatype-) "costum_msgs/IndividualSegmentResultsMsg")
(setf (get costum_msgs::IndividualSegmentResultsMsg :definition-)
      "int64 segment_index
float64 time
float64 distance
float64 speed
bool failure

")



(provide :costum_msgs/IndividualSegmentResultsMsg "8203f1ba3a513f2e426062e0f95d02d8")


