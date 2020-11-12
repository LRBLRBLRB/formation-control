
(cl:in-package :asdf)

(defsystem "universal_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RobotMove" :depends-on ("_package_RobotMove"))
    (:file "_package_RobotMove" :depends-on ("_package"))
  ))