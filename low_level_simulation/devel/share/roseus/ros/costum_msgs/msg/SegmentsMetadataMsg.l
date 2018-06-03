;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::SegmentsMetadataMsg)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'SegmentsMetadataMsg (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::SEGMENTSMETADATAMSG")
  (make-package "COSTUM_MSGS::SEGMENTSMETADATAMSG"))

(in-package "ROS")
;;//! \htmlinclude SegmentsMetadataMsg.msg.html


(defclass costum_msgs::SegmentsMetadataMsg
  :super ros::object
  :slots (_segments_metadata ))

(defmethod costum_msgs::SegmentsMetadataMsg
  (:init
   (&key
    ((:segments_metadata __segments_metadata) (let (r) (dotimes (i 0) (push (instance costum_msgs::SegmentMetadataMsg :init) r)) r))
    )
   (send-super :init)
   (setq _segments_metadata __segments_metadata)
   self)
  (:segments_metadata
   (&rest __segments_metadata)
   (if (keywordp (car __segments_metadata))
       (send* _segments_metadata __segments_metadata)
     (progn
       (if __segments_metadata (setq _segments_metadata (car __segments_metadata)))
       _segments_metadata)))
  (:serialization-length
   ()
   (+
    ;; costum_msgs/SegmentMetadataMsg[] _segments_metadata
    (apply #'+ (send-all _segments_metadata :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; costum_msgs/SegmentMetadataMsg[] _segments_metadata
     (write-long (length _segments_metadata) s)
     (dolist (elem _segments_metadata)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; costum_msgs/SegmentMetadataMsg[] _segments_metadata
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segments_metadata (let (r) (dotimes (i n) (push (instance costum_msgs::SegmentMetadataMsg :init) r)) r))
     (dolist (elem- _segments_metadata)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get costum_msgs::SegmentsMetadataMsg :md5sum-) "67c0f52ccb2c9e99b2f0c2343335cac1")
(setf (get costum_msgs::SegmentsMetadataMsg :datatype-) "costum_msgs/SegmentsMetadataMsg")
(setf (get costum_msgs::SegmentsMetadataMsg :definition-)
      "SegmentMetadataMsg[] segments_metadata

================================================================================
MSG: costum_msgs/SegmentMetadataMsg
int64 segment_index
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



(provide :costum_msgs/SegmentsMetadataMsg "67c0f52ccb2c9e99b2f0c2343335cac1")


