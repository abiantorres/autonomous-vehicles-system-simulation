
(cl:in-package :asdf)

(defsystem "costum_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GlobalSegmentResultsMsg" :depends-on ("_package_GlobalSegmentResultsMsg"))
    (:file "_package_GlobalSegmentResultsMsg" :depends-on ("_package"))
    (:file "GlobalSimulationResultsMsg" :depends-on ("_package_GlobalSimulationResultsMsg"))
    (:file "_package_GlobalSimulationResultsMsg" :depends-on ("_package"))
    (:file "IndividualIterationResultsMsg" :depends-on ("_package_IndividualIterationResultsMsg"))
    (:file "_package_IndividualIterationResultsMsg" :depends-on ("_package"))
    (:file "IndividualSegmentResultsMsg" :depends-on ("_package_IndividualSegmentResultsMsg"))
    (:file "_package_IndividualSegmentResultsMsg" :depends-on ("_package"))
    (:file "SegmentMetadataMsg" :depends-on ("_package_SegmentMetadataMsg"))
    (:file "_package_SegmentMetadataMsg" :depends-on ("_package"))
    (:file "SegmentsMetadataMsg" :depends-on ("_package_SegmentsMetadataMsg"))
    (:file "_package_SegmentsMetadataMsg" :depends-on ("_package"))
    (:file "SimulationMetadataMsg" :depends-on ("_package_SimulationMetadataMsg"))
    (:file "_package_SimulationMetadataMsg" :depends-on ("_package"))
    (:file "SimulationMsg" :depends-on ("_package_SimulationMsg"))
    (:file "_package_SimulationMsg" :depends-on ("_package"))
  ))