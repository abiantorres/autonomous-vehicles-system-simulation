;; Auto-generated. Do not edit!


(when (boundp 'costum_msgs::SimulationMsg)
  (if (not (find-package "COSTUM_MSGS"))
    (make-package "COSTUM_MSGS"))
  (shadow 'SimulationMsg (find-package "COSTUM_MSGS")))
(unless (find-package "COSTUM_MSGS::SIMULATIONMSG")
  (make-package "COSTUM_MSGS::SIMULATIONMSG"))

(in-package "ROS")
;;//! \htmlinclude SimulationMsg.msg.html


(defclass costum_msgs::SimulationMsg
  :super ros::object
  :slots (_metadata _global_simulation_results _global_segments_results _individual_iterations_results ))

(defmethod costum_msgs::SimulationMsg
  (:init
   (&key
    ((:metadata __metadata) (instance costum_msgs::SimulationMetadataMsg :init))
    ((:global_simulation_results __global_simulation_results) (instance costum_msgs::GlobalSimulationResultsMsg :init))
    ((:global_segments_results __global_segments_results) (let (r) (dotimes (i 0) (push (instance costum_msgs::GlobalSegmentResultsMsg :init) r)) r))
    ((:individual_iterations_results __individual_iterations_results) (let (r) (dotimes (i 0) (push (instance costum_msgs::IndividualIterationResultsMsg :init) r)) r))
    )
   (send-super :init)
   (setq _metadata __metadata)
   (setq _global_simulation_results __global_simulation_results)
   (setq _global_segments_results __global_segments_results)
   (setq _individual_iterations_results __individual_iterations_results)
   self)
  (:metadata
   (&rest __metadata)
   (if (keywordp (car __metadata))
       (send* _metadata __metadata)
     (progn
       (if __metadata (setq _metadata (car __metadata)))
       _metadata)))
  (:global_simulation_results
   (&rest __global_simulation_results)
   (if (keywordp (car __global_simulation_results))
       (send* _global_simulation_results __global_simulation_results)
     (progn
       (if __global_simulation_results (setq _global_simulation_results (car __global_simulation_results)))
       _global_simulation_results)))
  (:global_segments_results
   (&rest __global_segments_results)
   (if (keywordp (car __global_segments_results))
       (send* _global_segments_results __global_segments_results)
     (progn
       (if __global_segments_results (setq _global_segments_results (car __global_segments_results)))
       _global_segments_results)))
  (:individual_iterations_results
   (&rest __individual_iterations_results)
   (if (keywordp (car __individual_iterations_results))
       (send* _individual_iterations_results __individual_iterations_results)
     (progn
       (if __individual_iterations_results (setq _individual_iterations_results (car __individual_iterations_results)))
       _individual_iterations_results)))
  (:serialization-length
   ()
   (+
    ;; costum_msgs/SimulationMetadataMsg _metadata
    (send _metadata :serialization-length)
    ;; costum_msgs/GlobalSimulationResultsMsg _global_simulation_results
    (send _global_simulation_results :serialization-length)
    ;; costum_msgs/GlobalSegmentResultsMsg[] _global_segments_results
    (apply #'+ (send-all _global_segments_results :serialization-length)) 4
    ;; costum_msgs/IndividualIterationResultsMsg[] _individual_iterations_results
    (apply #'+ (send-all _individual_iterations_results :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; costum_msgs/SimulationMetadataMsg _metadata
       (send _metadata :serialize s)
     ;; costum_msgs/GlobalSimulationResultsMsg _global_simulation_results
       (send _global_simulation_results :serialize s)
     ;; costum_msgs/GlobalSegmentResultsMsg[] _global_segments_results
     (write-long (length _global_segments_results) s)
     (dolist (elem _global_segments_results)
       (send elem :serialize s)
       )
     ;; costum_msgs/IndividualIterationResultsMsg[] _individual_iterations_results
     (write-long (length _individual_iterations_results) s)
     (dolist (elem _individual_iterations_results)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; costum_msgs/SimulationMetadataMsg _metadata
     (send _metadata :deserialize buf ptr-) (incf ptr- (send _metadata :serialization-length))
   ;; costum_msgs/GlobalSimulationResultsMsg _global_simulation_results
     (send _global_simulation_results :deserialize buf ptr-) (incf ptr- (send _global_simulation_results :serialization-length))
   ;; costum_msgs/GlobalSegmentResultsMsg[] _global_segments_results
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _global_segments_results (let (r) (dotimes (i n) (push (instance costum_msgs::GlobalSegmentResultsMsg :init) r)) r))
     (dolist (elem- _global_segments_results)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; costum_msgs/IndividualIterationResultsMsg[] _individual_iterations_results
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _individual_iterations_results (let (r) (dotimes (i n) (push (instance costum_msgs::IndividualIterationResultsMsg :init) r)) r))
     (dolist (elem- _individual_iterations_results)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get costum_msgs::SimulationMsg :md5sum-) "f76726cea71170d43f3772c8670bcc3f")
(setf (get costum_msgs::SimulationMsg :datatype-) "costum_msgs/SimulationMsg")
(setf (get costum_msgs::SimulationMsg :definition-)
      "SimulationMetadataMsg metadata
GlobalSimulationResultsMsg global_simulation_results
GlobalSegmentResultsMsg[] global_segments_results
IndividualIterationResultsMsg[] individual_iterations_results

================================================================================
MSG: costum_msgs/SimulationMetadataMsg
string plan_file
string date
int64 n_segments
SegmentsMetadataMsg segments_metadata
int64 n_iterations
int64 timeout_factor
bool useful_simulation
string local_planner
string global_planner

================================================================================
MSG: costum_msgs/SegmentsMetadataMsg
SegmentMetadataMsg[] segments_metadata

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

================================================================================
MSG: costum_msgs/GlobalSimulationResultsMsg
int64 n_failures
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

================================================================================
MSG: costum_msgs/GlobalSegmentResultsMsg
int64 segment_index
int64 n_failures
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

================================================================================
MSG: costum_msgs/IndividualIterationResultsMsg
int64 iteration_index
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



(provide :costum_msgs/SimulationMsg "f76726cea71170d43f3772c8670bcc3f")


