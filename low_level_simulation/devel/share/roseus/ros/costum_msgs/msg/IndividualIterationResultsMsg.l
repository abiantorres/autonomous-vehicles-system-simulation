;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::IndividualIterationResultsMsg)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'IndividualIterationResultsMsg (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::INDIVIDUALITERATIONRESULTSMSG")
  (make-package "COSTUM_MSGS::INDIVIDUALITERATIONRESULTSMSG"))

(in-package "ROS")
;;//! \htmlinclude IndividualIterationResultsMsg.msg.html


(defclass costum_msgs::IndividualIterationResultsMsg
  :super ros::object
  :slots (_iteration_index _failure _failure_segment_index _time _distance _speed _segments_results ))

(defmethod costum_msgs::IndividualIterationResultsMsg
  (:init
   (&key
    ((:iteration_index __iteration_index) 0)
    ((:failure __failure) nil)
    ((:failure_segment_index __failure_segment_index) 0)
    ((:time __time) 0.0)
    ((:distance __distance) 0.0)
    ((:speed __speed) 0.0)
    ((:segments_results __segments_results) (let (r) (dotimes (i 0) (push (instance costum_msgs::IndividualSegmentResultsMsg :init) r)) r))
    )
   (send-super :init)
   (setq _iteration_index (round __iteration_index))
   (setq _failure __failure)
   (setq _failure_segment_index (round __failure_segment_index))
   (setq _time (float __time))
   (setq _distance (float __distance))
   (setq _speed (float __speed))
   (setq _segments_results __segments_results)
   self)
  (:iteration_index
   (&optional __iteration_index)
   (if __iteration_index (setq _iteration_index __iteration_index)) _iteration_index)
  (:failure
   (&optional __failure)
   (if __failure (setq _failure __failure)) _failure)
  (:failure_segment_index
   (&optional __failure_segment_index)
   (if __failure_segment_index (setq _failure_segment_index __failure_segment_index)) _failure_segment_index)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:segments_results
   (&rest __segments_results)
   (if (keywordp (car __segments_results))
       (send* _segments_results __segments_results)
     (progn
       (if __segments_results (setq _segments_results (car __segments_results)))
       _segments_results)))
  (:serialization-length
   ()
   (+
    ;; int64 _iteration_index
    8
    ;; bool _failure
    1
    ;; int64 _failure_segment_index
    8
    ;; float64 _time
    8
    ;; float64 _distance
    8
    ;; float64 _speed
    8
    ;; costum_msgs/IndividualSegmentResultsMsg[] _segments_results
    (apply #'+ (send-all _segments_results :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _iteration_index
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _iteration_index (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _iteration_index) (= (length (_iteration_index . bv)) 2)) ;; bignum
              (write-long (ash (elt (_iteration_index . bv) 0) 0) s)
              (write-long (ash (elt (_iteration_index . bv) 1) -1) s))
             ((and (class _iteration_index) (= (length (_iteration_index . bv)) 1)) ;; big1
              (write-long (elt (_iteration_index . bv) 0) s)
              (write-long (if (>= _iteration_index 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _iteration_index s)(write-long (if (>= _iteration_index 0) 0 #xffffffff) s)))
     ;; bool _failure
       (if _failure (write-byte -1 s) (write-byte 0 s))
     ;; int64 _failure_segment_index
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _failure_segment_index (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _failure_segment_index) (= (length (_failure_segment_index . bv)) 2)) ;; bignum
              (write-long (ash (elt (_failure_segment_index . bv) 0) 0) s)
              (write-long (ash (elt (_failure_segment_index . bv) 1) -1) s))
             ((and (class _failure_segment_index) (= (length (_failure_segment_index . bv)) 1)) ;; big1
              (write-long (elt (_failure_segment_index . bv) 0) s)
              (write-long (if (>= _failure_segment_index 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _failure_segment_index s)(write-long (if (>= _failure_segment_index 0) 0 #xffffffff) s)))
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; costum_msgs/IndividualSegmentResultsMsg[] _segments_results
     (write-long (length _segments_results) s)
     (dolist (elem _segments_results)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _iteration_index
#+(or :alpha :irix6 :x86_64)
      (setf _iteration_index (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _iteration_index (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _failure
     (setq _failure (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _failure_segment_index
#+(or :alpha :irix6 :x86_64)
      (setf _failure_segment_index (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _failure_segment_index (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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
   ;; costum_msgs/IndividualSegmentResultsMsg[] _segments_results
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segments_results (let (r) (dotimes (i n) (push (instance costum_msgs::IndividualSegmentResultsMsg :init) r)) r))
     (dolist (elem- _segments_results)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get costum_msgs::IndividualIterationResultsMsg :md5sum-) "823819fb8874f57d0dd2530f62254e3d")
(setf (get costum_msgs::IndividualIterationResultsMsg :datatype-) "costum_msgs/IndividualIterationResultsMsg")
(setf (get costum_msgs::IndividualIterationResultsMsg :definition-)
      "int64 iteration_index
bool failure
int64 failure_segment_index
float64 time
float64 distance
float64 speed
IndividualSegmentResultsMsg[] segments_results

================================================================================
MSG: costum_msgs/IndividualSegmentResultsMsg
int64 segment_index
float64 time
float64 distance
float64 speed
bool failure

")



(provide :costum_msgs/IndividualIterationResultsMsg "823819fb8874f57d0dd2530f62254e3d")


