
(cl:in-package :asdf)

(defsystem "costum_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GoalInfo" :depends-on ("_package_GoalInfo"))
    (:file "_package_GoalInfo" :depends-on ("_package"))
    (:file "PathInfo" :depends-on ("_package_PathInfo"))
    (:file "_package_PathInfo" :depends-on ("_package"))
  ))