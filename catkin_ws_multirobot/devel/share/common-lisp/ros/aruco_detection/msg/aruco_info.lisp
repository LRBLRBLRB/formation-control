; Auto-generated. Do not edit!


(cl:in-package aruco_detection-msg)


;//! \htmlinclude aruco_info.msg.html

(cl:defclass <aruco_info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (detected
    :reader detected
    :initarg :detected
    :type cl:boolean
    :initform cl:nil)
   (board_rvec
    :reader board_rvec
    :initarg :board_rvec
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (board_tvec
    :reader board_tvec
    :initarg :board_tvec
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (robot_rvec
    :reader robot_rvec
    :initarg :robot_rvec
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (robot_tvec
    :reader robot_tvec
    :initarg :robot_tvec
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (board_marker_corners
    :reader board_marker_corners
    :initarg :board_marker_corners
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (board_marker_ids
    :reader board_marker_ids
    :initarg :board_marker_ids
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (robot_marker_corners
    :reader robot_marker_corners
    :initarg :robot_marker_corners
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 4 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (robot_marker_id
    :reader robot_marker_id
    :initarg :robot_marker_id
    :type cl:integer
    :initform 0))
)

(cl:defclass aruco_info (<aruco_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <aruco_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'aruco_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aruco_detection-msg:<aruco_info> is deprecated: use aruco_detection-msg:aruco_info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:header-val is deprecated.  Use aruco_detection-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'detected-val :lambda-list '(m))
(cl:defmethod detected-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:detected-val is deprecated.  Use aruco_detection-msg:detected instead.")
  (detected m))

(cl:ensure-generic-function 'board_rvec-val :lambda-list '(m))
(cl:defmethod board_rvec-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:board_rvec-val is deprecated.  Use aruco_detection-msg:board_rvec instead.")
  (board_rvec m))

(cl:ensure-generic-function 'board_tvec-val :lambda-list '(m))
(cl:defmethod board_tvec-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:board_tvec-val is deprecated.  Use aruco_detection-msg:board_tvec instead.")
  (board_tvec m))

(cl:ensure-generic-function 'robot_rvec-val :lambda-list '(m))
(cl:defmethod robot_rvec-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:robot_rvec-val is deprecated.  Use aruco_detection-msg:robot_rvec instead.")
  (robot_rvec m))

(cl:ensure-generic-function 'robot_tvec-val :lambda-list '(m))
(cl:defmethod robot_tvec-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:robot_tvec-val is deprecated.  Use aruco_detection-msg:robot_tvec instead.")
  (robot_tvec m))

(cl:ensure-generic-function 'board_marker_corners-val :lambda-list '(m))
(cl:defmethod board_marker_corners-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:board_marker_corners-val is deprecated.  Use aruco_detection-msg:board_marker_corners instead.")
  (board_marker_corners m))

(cl:ensure-generic-function 'board_marker_ids-val :lambda-list '(m))
(cl:defmethod board_marker_ids-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:board_marker_ids-val is deprecated.  Use aruco_detection-msg:board_marker_ids instead.")
  (board_marker_ids m))

(cl:ensure-generic-function 'robot_marker_corners-val :lambda-list '(m))
(cl:defmethod robot_marker_corners-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:robot_marker_corners-val is deprecated.  Use aruco_detection-msg:robot_marker_corners instead.")
  (robot_marker_corners m))

(cl:ensure-generic-function 'robot_marker_id-val :lambda-list '(m))
(cl:defmethod robot_marker_id-val ((m <aruco_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco_detection-msg:robot_marker_id-val is deprecated.  Use aruco_detection-msg:robot_marker_id instead.")
  (robot_marker_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <aruco_info>) ostream)
  "Serializes a message object of type '<aruco_info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'detected) 1 0)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'board_rvec))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'board_tvec))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'robot_rvec))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'robot_tvec))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'board_marker_corners))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'board_marker_corners))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'board_marker_ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'board_marker_ids))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'robot_marker_corners))
  (cl:let* ((signed (cl:slot-value msg 'robot_marker_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <aruco_info>) istream)
  "Deserializes a message object of type '<aruco_info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'detected) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'board_rvec) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'board_rvec)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'board_tvec) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'board_tvec)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'robot_rvec) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'robot_rvec)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'robot_tvec) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'robot_tvec)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'board_marker_corners) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'board_marker_corners)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'board_marker_ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'board_marker_ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:setf (cl:slot-value msg 'robot_marker_corners) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'robot_marker_corners)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_marker_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<aruco_info>)))
  "Returns string type for a message object of type '<aruco_info>"
  "aruco_detection/aruco_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'aruco_info)))
  "Returns string type for a message object of type 'aruco_info"
  "aruco_detection/aruco_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<aruco_info>)))
  "Returns md5sum for a message object of type '<aruco_info>"
  "50078c3e5ce8427d6ec48492011d9975")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'aruco_info)))
  "Returns md5sum for a message object of type 'aruco_info"
  "50078c3e5ce8427d6ec48492011d9975")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<aruco_info>)))
  "Returns full string definition for message of type '<aruco_info>"
  (cl:format cl:nil "std_msgs/Header header~%~%bool detected~%float64[3] board_rvec~%float64[3] board_tvec~%float64[3] robot_rvec~%float64[3] robot_tvec~%~%geometry_msgs/Point[] board_marker_corners~%int32[] board_marker_ids~%~%geometry_msgs/Point[4] robot_marker_corners~%int32 robot_marker_id~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'aruco_info)))
  "Returns full string definition for message of type 'aruco_info"
  (cl:format cl:nil "std_msgs/Header header~%~%bool detected~%float64[3] board_rvec~%float64[3] board_tvec~%float64[3] robot_rvec~%float64[3] robot_tvec~%~%geometry_msgs/Point[] board_marker_corners~%int32[] board_marker_ids~%~%geometry_msgs/Point[4] robot_marker_corners~%int32 robot_marker_id~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <aruco_info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'board_rvec) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'board_tvec) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'robot_rvec) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'robot_tvec) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'board_marker_corners) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'board_marker_ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'robot_marker_corners) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <aruco_info>))
  "Converts a ROS message object to a list"
  (cl:list 'aruco_info
    (cl:cons ':header (header msg))
    (cl:cons ':detected (detected msg))
    (cl:cons ':board_rvec (board_rvec msg))
    (cl:cons ':board_tvec (board_tvec msg))
    (cl:cons ':robot_rvec (robot_rvec msg))
    (cl:cons ':robot_tvec (robot_tvec msg))
    (cl:cons ':board_marker_corners (board_marker_corners msg))
    (cl:cons ':board_marker_ids (board_marker_ids msg))
    (cl:cons ':robot_marker_corners (robot_marker_corners msg))
    (cl:cons ':robot_marker_id (robot_marker_id msg))
))
