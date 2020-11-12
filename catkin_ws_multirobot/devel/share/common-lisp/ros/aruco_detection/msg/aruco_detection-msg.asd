
(cl:in-package :asdf)

(defsystem "aruco_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "aruco_info" :depends-on ("_package_aruco_info"))
    (:file "_package_aruco_info" :depends-on ("_package"))
  ))