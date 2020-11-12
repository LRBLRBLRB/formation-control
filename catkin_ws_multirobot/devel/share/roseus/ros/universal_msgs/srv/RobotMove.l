;; Auto-generated. Do not edit!


(when (boundp 'universal_msgs::RobotMove)
  (if (not (find-package "UNIVERSAL_MSGS"))
    (make-package "UNIVERSAL_MSGS"))
  (shadow 'RobotMove (find-package "UNIVERSAL_MSGS")))
(unless (find-package "UNIVERSAL_MSGS::ROBOTMOVE")
  (make-package "UNIVERSAL_MSGS::ROBOTMOVE"))
(unless (find-package "UNIVERSAL_MSGS::ROBOTMOVEREQUEST")
  (make-package "UNIVERSAL_MSGS::ROBOTMOVEREQUEST"))
(unless (find-package "UNIVERSAL_MSGS::ROBOTMOVERESPONSE")
  (make-package "UNIVERSAL_MSGS::ROBOTMOVERESPONSE"))

(in-package "ROS")





(defclass universal_msgs::RobotMoveRequest
  :super ros::object
  :slots (_robot_id _move_direction _speed_wheel_left _speed_wheel_right _time_span ))

(defmethod universal_msgs::RobotMoveRequest
  (:init
   (&key
    ((:robot_id __robot_id) 0)
    ((:move_direction __move_direction) 0)
    ((:speed_wheel_left __speed_wheel_left) 0)
    ((:speed_wheel_right __speed_wheel_right) 0)
    ((:time_span __time_span) 0)
    )
   (send-super :init)
   (setq _robot_id (round __robot_id))
   (setq _move_direction (round __move_direction))
   (setq _speed_wheel_left (round __speed_wheel_left))
   (setq _speed_wheel_right (round __speed_wheel_right))
   (setq _time_span (round __time_span))
   self)
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:move_direction
   (&optional __move_direction)
   (if __move_direction (setq _move_direction __move_direction)) _move_direction)
  (:speed_wheel_left
   (&optional __speed_wheel_left)
   (if __speed_wheel_left (setq _speed_wheel_left __speed_wheel_left)) _speed_wheel_left)
  (:speed_wheel_right
   (&optional __speed_wheel_right)
   (if __speed_wheel_right (setq _speed_wheel_right __speed_wheel_right)) _speed_wheel_right)
  (:time_span
   (&optional __time_span)
   (if __time_span (setq _time_span __time_span)) _time_span)
  (:serialization-length
   ()
   (+
    ;; int32 _robot_id
    4
    ;; int32 _move_direction
    4
    ;; int32 _speed_wheel_left
    4
    ;; int32 _speed_wheel_right
    4
    ;; int32 _time_span
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _robot_id
       (write-long _robot_id s)
     ;; int32 _move_direction
       (write-long _move_direction s)
     ;; int32 _speed_wheel_left
       (write-long _speed_wheel_left s)
     ;; int32 _speed_wheel_right
       (write-long _speed_wheel_right s)
     ;; int32 _time_span
       (write-long _time_span s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _robot_id
     (setq _robot_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _move_direction
     (setq _move_direction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _speed_wheel_left
     (setq _speed_wheel_left (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _speed_wheel_right
     (setq _speed_wheel_right (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _time_span
     (setq _time_span (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass universal_msgs::RobotMoveResponse
  :super ros::object
  :slots (_success ))

(defmethod universal_msgs::RobotMoveResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass universal_msgs::RobotMove
  :super ros::object
  :slots ())

(setf (get universal_msgs::RobotMove :md5sum-) "db2af865234800bfae88ce33a9629ae1")
(setf (get universal_msgs::RobotMove :datatype-) "universal_msgs/RobotMove")
(setf (get universal_msgs::RobotMove :request) universal_msgs::RobotMoveRequest)
(setf (get universal_msgs::RobotMove :response) universal_msgs::RobotMoveResponse)

(defmethod universal_msgs::RobotMoveRequest
  (:response () (instance universal_msgs::RobotMoveResponse :init)))

(setf (get universal_msgs::RobotMoveRequest :md5sum-) "db2af865234800bfae88ce33a9629ae1")
(setf (get universal_msgs::RobotMoveRequest :datatype-) "universal_msgs/RobotMoveRequest")
(setf (get universal_msgs::RobotMoveRequest :definition-)
      "
int32 robot_id
int32 move_direction
int32 speed_wheel_left
int32 speed_wheel_right
int32 time_span
---
bool success


")

(setf (get universal_msgs::RobotMoveResponse :md5sum-) "db2af865234800bfae88ce33a9629ae1")
(setf (get universal_msgs::RobotMoveResponse :datatype-) "universal_msgs/RobotMoveResponse")
(setf (get universal_msgs::RobotMoveResponse :definition-)
      "
int32 robot_id
int32 move_direction
int32 speed_wheel_left
int32 speed_wheel_right
int32 time_span
---
bool success


")



(provide :universal_msgs/RobotMove "db2af865234800bfae88ce33a9629ae1")


