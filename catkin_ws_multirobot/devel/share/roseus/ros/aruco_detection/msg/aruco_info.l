;; Auto-generated. Do not edit!


(when (boundp 'aruco_detection::aruco_info)
  (if (not (find-package "ARUCO_DETECTION"))
    (make-package "ARUCO_DETECTION"))
  (shadow 'aruco_info (find-package "ARUCO_DETECTION")))
(unless (find-package "ARUCO_DETECTION::ARUCO_INFO")
  (make-package "ARUCO_DETECTION::ARUCO_INFO"))

(in-package "ROS")
;;//! \htmlinclude aruco_info.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass aruco_detection::aruco_info
  :super ros::object
  :slots (_header _detected _board_rvec _board_tvec _robot_rvec _robot_tvec _board_marker_corners _board_marker_ids _robot_marker_corners _robot_marker_id ))

(defmethod aruco_detection::aruco_info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:detected __detected) nil)
    ((:board_rvec __board_rvec) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:board_tvec __board_tvec) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:robot_rvec __robot_rvec) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:robot_tvec __robot_tvec) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:board_marker_corners __board_marker_corners) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:board_marker_ids __board_marker_ids) (make-array 0 :initial-element 0 :element-type :integer))
    ((:robot_marker_corners __robot_marker_corners) (let (r) (dotimes (i 4) (push (instance geometry_msgs::Point :init) r)) r))
    ((:robot_marker_id __robot_marker_id) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _detected __detected)
   (setq _board_rvec __board_rvec)
   (setq _board_tvec __board_tvec)
   (setq _robot_rvec __robot_rvec)
   (setq _robot_tvec __robot_tvec)
   (setq _board_marker_corners __board_marker_corners)
   (setq _board_marker_ids __board_marker_ids)
   (setq _robot_marker_corners __robot_marker_corners)
   (setq _robot_marker_id (round __robot_marker_id))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:detected
   (&optional __detected)
   (if __detected (setq _detected __detected)) _detected)
  (:board_rvec
   (&optional __board_rvec)
   (if __board_rvec (setq _board_rvec __board_rvec)) _board_rvec)
  (:board_tvec
   (&optional __board_tvec)
   (if __board_tvec (setq _board_tvec __board_tvec)) _board_tvec)
  (:robot_rvec
   (&optional __robot_rvec)
   (if __robot_rvec (setq _robot_rvec __robot_rvec)) _robot_rvec)
  (:robot_tvec
   (&optional __robot_tvec)
   (if __robot_tvec (setq _robot_tvec __robot_tvec)) _robot_tvec)
  (:board_marker_corners
   (&rest __board_marker_corners)
   (if (keywordp (car __board_marker_corners))
       (send* _board_marker_corners __board_marker_corners)
     (progn
       (if __board_marker_corners (setq _board_marker_corners (car __board_marker_corners)))
       _board_marker_corners)))
  (:board_marker_ids
   (&optional __board_marker_ids)
   (if __board_marker_ids (setq _board_marker_ids __board_marker_ids)) _board_marker_ids)
  (:robot_marker_corners
   (&rest __robot_marker_corners)
   (if (keywordp (car __robot_marker_corners))
       (send* _robot_marker_corners __robot_marker_corners)
     (progn
       (if __robot_marker_corners (setq _robot_marker_corners (car __robot_marker_corners)))
       _robot_marker_corners)))
  (:robot_marker_id
   (&optional __robot_marker_id)
   (if __robot_marker_id (setq _robot_marker_id __robot_marker_id)) _robot_marker_id)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _detected
    1
    ;; float64[3] _board_rvec
    (* 8    3)
    ;; float64[3] _board_tvec
    (* 8    3)
    ;; float64[3] _robot_rvec
    (* 8    3)
    ;; float64[3] _robot_tvec
    (* 8    3)
    ;; geometry_msgs/Point[] _board_marker_corners
    (apply #'+ (send-all _board_marker_corners :serialization-length)) 4
    ;; int32[] _board_marker_ids
    (* 4    (length _board_marker_ids)) 4
    ;; geometry_msgs/Point[4] _robot_marker_corners
    (apply #'+ (send-all _robot_marker_corners :serialization-length))
    ;; int32 _robot_marker_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _detected
       (if _detected (write-byte -1 s) (write-byte 0 s))
     ;; float64[3] _board_rvec
     (dotimes (i 3)
       (sys::poke (elt _board_rvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _board_tvec
     (dotimes (i 3)
       (sys::poke (elt _board_tvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _robot_rvec
     (dotimes (i 3)
       (sys::poke (elt _robot_rvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _robot_tvec
     (dotimes (i 3)
       (sys::poke (elt _robot_tvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Point[] _board_marker_corners
     (write-long (length _board_marker_corners) s)
     (dolist (elem _board_marker_corners)
       (send elem :serialize s)
       )
     ;; int32[] _board_marker_ids
     (write-long (length _board_marker_ids) s)
     (dotimes (i (length _board_marker_ids))
       (write-long (elt _board_marker_ids i) s)
       )
     ;; geometry_msgs/Point[4] _robot_marker_corners
     (dolist (elem _robot_marker_corners)
       (send elem :serialize s)
       )
     ;; int32 _robot_marker_id
       (write-long _robot_marker_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _detected
     (setq _detected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64[3] _board_rvec
   (dotimes (i (length _board_rvec))
     (setf (elt _board_rvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _board_tvec
   (dotimes (i (length _board_tvec))
     (setf (elt _board_tvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _robot_rvec
   (dotimes (i (length _robot_rvec))
     (setf (elt _robot_rvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _robot_tvec
   (dotimes (i (length _robot_tvec))
     (setf (elt _robot_tvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; geometry_msgs/Point[] _board_marker_corners
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _board_marker_corners (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _board_marker_corners)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32[] _board_marker_ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _board_marker_ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _board_marker_ids i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; geometry_msgs/Point[4] _robot_marker_corners
   (dotimes (i 4)
     (send (elt _robot_marker_corners i) :deserialize buf ptr-) (incf ptr- (send (elt _robot_marker_corners i) :serialization-length))
     )
   ;; int32 _robot_marker_id
     (setq _robot_marker_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get aruco_detection::aruco_info :md5sum-) "50078c3e5ce8427d6ec48492011d9975")
(setf (get aruco_detection::aruco_info :datatype-) "aruco_detection/aruco_info")
(setf (get aruco_detection::aruco_info :definition-)
      "std_msgs/Header header

bool detected
float64[3] board_rvec
float64[3] board_tvec
float64[3] robot_rvec
float64[3] robot_tvec

geometry_msgs/Point[] board_marker_corners
int32[] board_marker_ids

geometry_msgs/Point[4] robot_marker_corners
int32 robot_marker_id
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :aruco_detection/aruco_info "50078c3e5ce8427d6ec48492011d9975")


