;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::GlobalSimulationResultsMsg)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'GlobalSimulationResultsMsg (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::GLOBALSIMULATIONRESULTSMSG")
  (make-package "COSTUM_MSGS::GLOBALSIMULATIONRESULTSMSG"))

(in-package "ROS")
;;//! \htmlinclude GlobalSimulationResultsMsg.msg.html


(defclass costum_msgs::GlobalSimulationResultsMsg
  :super ros::object
  :slots (_n_failures _time_mean _time_stdev _time_max _time_min _distance_mean _distance_stdev _distance_max _distance_min _speed_mean _speed_stdev _speed_max _speed_min ))

(defmethod costum_msgs::GlobalSimulationResultsMsg
  (:init
   (&key
    ((:n_failures __n_failures) 0)
    ((:time_mean __time_mean) 0.0)
    ((:time_stdev __time_stdev) 0.0)
    ((:time_max __time_max) 0.0)
    ((:time_min __time_min) 0.0)
    ((:distance_mean __distance_mean) 0.0)
    ((:distance_stdev __distance_stdev) 0.0)
    ((:distance_max __distance_max) 0.0)
    ((:distance_min __distance_min) 0.0)
    ((:speed_mean __speed_mean) 0.0)
    ((:speed_stdev __speed_stdev) 0.0)
    ((:speed_max __speed_max) 0.0)
    ((:speed_min __speed_min) 0.0)
    )
   (send-super :init)
   (setq _n_failures (round __n_failures))
   (setq _time_mean (float __time_mean))
   (setq _time_stdev (float __time_stdev))
   (setq _time_max (float __time_max))
   (setq _time_min (float __time_min))
   (setq _distance_mean (float __distance_mean))
   (setq _distance_stdev (float __distance_stdev))
   (setq _distance_max (float __distance_max))
   (setq _distance_min (float __distance_min))
   (setq _speed_mean (float __speed_mean))
   (setq _speed_stdev (float __speed_stdev))
   (setq _speed_max (float __speed_max))
   (setq _speed_min (float __speed_min))
   self)
  (:n_failures
   (&optional __n_failures)
   (if __n_failures (setq _n_failures __n_failures)) _n_failures)
  (:time_mean
   (&optional __time_mean)
   (if __time_mean (setq _time_mean __time_mean)) _time_mean)
  (:time_stdev
   (&optional __time_stdev)
   (if __time_stdev (setq _time_stdev __time_stdev)) _time_stdev)
  (:time_max
   (&optional __time_max)
   (if __time_max (setq _time_max __time_max)) _time_max)
  (:time_min
   (&optional __time_min)
   (if __time_min (setq _time_min __time_min)) _time_min)
  (:distance_mean
   (&optional __distance_mean)
   (if __distance_mean (setq _distance_mean __distance_mean)) _distance_mean)
  (:distance_stdev
   (&optional __distance_stdev)
   (if __distance_stdev (setq _distance_stdev __distance_stdev)) _distance_stdev)
  (:distance_max
   (&optional __distance_max)
   (if __distance_max (setq _distance_max __distance_max)) _distance_max)
  (:distance_min
   (&optional __distance_min)
   (if __distance_min (setq _distance_min __distance_min)) _distance_min)
  (:speed_mean
   (&optional __speed_mean)
   (if __speed_mean (setq _speed_mean __speed_mean)) _speed_mean)
  (:speed_stdev
   (&optional __speed_stdev)
   (if __speed_stdev (setq _speed_stdev __speed_stdev)) _speed_stdev)
  (:speed_max
   (&optional __speed_max)
   (if __speed_max (setq _speed_max __speed_max)) _speed_max)
  (:speed_min
   (&optional __speed_min)
   (if __speed_min (setq _speed_min __speed_min)) _speed_min)
  (:serialization-length
   ()
   (+
    ;; int64 _n_failures
    8
    ;; float64 _time_mean
    8
    ;; float64 _time_stdev
    8
    ;; float64 _time_max
    8
    ;; float64 _time_min
    8
    ;; float64 _distance_mean
    8
    ;; float64 _distance_stdev
    8
    ;; float64 _distance_max
    8
    ;; float64 _distance_min
    8
    ;; float64 _speed_mean
    8
    ;; float64 _speed_stdev
    8
    ;; float64 _speed_max
    8
    ;; float64 _speed_min
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _n_failures
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _n_failures (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _n_failures) (= (length (_n_failures . bv)) 2)) ;; bignum
              (write-long (ash (elt (_n_failures . bv) 0) 0) s)
              (write-long (ash (elt (_n_failures . bv) 1) -1) s))
             ((and (class _n_failures) (= (length (_n_failures . bv)) 1)) ;; big1
              (write-long (elt (_n_failures . bv) 0) s)
              (write-long (if (>= _n_failures 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _n_failures s)(write-long (if (>= _n_failures 0) 0 #xffffffff) s)))
     ;; float64 _time_mean
       (sys::poke _time_mean (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time_stdev
       (sys::poke _time_stdev (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time_max
       (sys::poke _time_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _time_min
       (sys::poke _time_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_mean
       (sys::poke _distance_mean (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_stdev
       (sys::poke _distance_stdev (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_max
       (sys::poke _distance_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_min
       (sys::poke _distance_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_mean
       (sys::poke _speed_mean (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_stdev
       (sys::poke _speed_stdev (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_max
       (sys::poke _speed_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_min
       (sys::poke _speed_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _n_failures
#+(or :alpha :irix6 :x86_64)
      (setf _n_failures (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _n_failures (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _time_mean
     (setq _time_mean (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time_stdev
     (setq _time_stdev (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time_max
     (setq _time_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _time_min
     (setq _time_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_mean
     (setq _distance_mean (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_stdev
     (setq _distance_stdev (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_max
     (setq _distance_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_min
     (setq _distance_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_mean
     (setq _speed_mean (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_stdev
     (setq _speed_stdev (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_max
     (setq _speed_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_min
     (setq _speed_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get costum_msgs::GlobalSimulationResultsMsg :md5sum-) "6bde56eb7238c5489a8ee01bb10e22b4")
(setf (get costum_msgs::GlobalSimulationResultsMsg :datatype-) "costum_msgs/GlobalSimulationResultsMsg")
(setf (get costum_msgs::GlobalSimulationResultsMsg :definition-)
      "int64 n_failures
float64 time_mean
float64 time_stdev
float64 time_max
float64 time_min
float64 distance_mean
float64 distance_stdev
float64 distance_max
float64 distance_min
float64 speed_mean
float64 speed_stdev
float64 speed_max
float64 speed_min

")



(provide :costum_msgs/GlobalSimulationResultsMsg "6bde56eb7238c5489a8ee01bb10e22b4")


