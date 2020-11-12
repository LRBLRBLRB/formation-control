; Auto-generated. Do not edit!


(cl:in-package universal_msgs-srv)


;//! \htmlinclude RobotMove-request.msg.html

(cl:defclass <RobotMove-request> (roslisp-msg-protocol:ros-message)
  ((robot_id
    :reader robot_id
    :initarg :robot_id
    :type cl:integer
    :initform 0)
   (move_direction
    :reader move_direction
    :initarg :move_direction
    :type cl:integer
    :initform 0)
   (speed_wheel_left
    :reader speed_wheel_left
    :initarg :speed_wheel_left
    :type cl:integer
    :initform 0)
   (speed_wheel_right
    :reader speed_wheel_right
    :initarg :speed_wheel_right
    :type cl:integer
    :initform 0)
   (time_span
    :reader time_span
    :initarg :time_span
    :type cl:integer
    :initform 0))
)

(cl:defclass RobotMove-request (<RobotMove-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotMove-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotMove-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name universal_msgs-srv:<RobotMove-request> is deprecated: use universal_msgs-srv:RobotMove-request instead.")))

(cl:ensure-generic-function 'robot_id-val :lambda-list '(m))
(cl:defmethod robot_id-val ((m <RobotMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader universal_msgs-srv:robot_id-val is deprecated.  Use universal_msgs-srv:robot_id instead.")
  (robot_id m))

(cl:ensure-generic-function 'move_direction-val :lambda-list '(m))
(cl:defmethod move_direction-val ((m <RobotMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader universal_msgs-srv:move_direction-val is deprecated.  Use universal_msgs-srv:move_direction instead.")
  (move_direction m))

(cl:ensure-generic-function 'speed_wheel_left-val :lambda-list '(m))
(cl:defmethod speed_wheel_left-val ((m <RobotMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader universal_msgs-srv:speed_wheel_left-val is deprecated.  Use universal_msgs-srv:speed_wheel_left instead.")
  (speed_wheel_left m))

(cl:ensure-generic-function 'speed_wheel_right-val :lambda-list '(m))
(cl:defmethod speed_wheel_right-val ((m <RobotMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader universal_msgs-srv:speed_wheel_right-val is deprecated.  Use universal_msgs-srv:speed_wheel_right instead.")
  (speed_wheel_right m))

(cl:ensure-generic-function 'time_span-val :lambda-list '(m))
(cl:defmethod time_span-val ((m <RobotMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader universal_msgs-srv:time_span-val is deprecated.  Use universal_msgs-srv:time_span instead.")
  (time_span m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotMove-request>) ostream)
  "Serializes a message object of type '<RobotMove-request>"
  (cl:let* ((signed (cl:slot-value msg 'robot_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'move_direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed_wheel_left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed_wheel_right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'time_span)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotMove-request>) istream)
  "Deserializes a message object of type '<RobotMove-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'move_direction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed_wheel_left) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed_wheel_right) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_span) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotMove-request>)))
  "Returns string type for a service object of type '<RobotMove-request>"
  "universal_msgs/RobotMoveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMove-request)))
  "Returns string type for a service object of type 'RobotMove-request"
  "universal_msgs/RobotMoveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotMove-request>)))
  "Returns md5sum for a message object of type '<RobotMove-request>"
  "db2af865234800bfae88ce33a9629ae1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotMove-request)))
  "Returns md5sum for a message object of type 'RobotMove-request"
  "db2af865234800bfae88ce33a9629ae1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotMove-request>)))
  "Returns full string definition for message of type '<RobotMove-request>"
  (cl:format cl:nil "~%int32 robot_id~%int32 move_direction~%int32 speed_wheel_left~%int32 speed_wheel_right~%int32 time_span~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotMove-request)))
  "Returns full string definition for message of type 'RobotMove-request"
  (cl:format cl:nil "~%int32 robot_id~%int32 move_direction~%int32 speed_wheel_left~%int32 speed_wheel_right~%int32 time_span~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotMove-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotMove-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotMove-request
    (cl:cons ':robot_id (robot_id msg))
    (cl:cons ':move_direction (move_direction msg))
    (cl:cons ':speed_wheel_left (speed_wheel_left msg))
    (cl:cons ':speed_wheel_right (speed_wheel_right msg))
    (cl:cons ':time_span (time_span msg))
))
;//! \htmlinclude RobotMove-response.msg.html

(cl:defclass <RobotMove-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RobotMove-response (<RobotMove-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotMove-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotMove-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name universal_msgs-srv:<RobotMove-response> is deprecated: use universal_msgs-srv:RobotMove-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <RobotMove-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader universal_msgs-srv:success-val is deprecated.  Use universal_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotMove-response>) ostream)
  "Serializes a message object of type '<RobotMove-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotMove-response>) istream)
  "Deserializes a message object of type '<RobotMove-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotMove-response>)))
  "Returns string type for a service object of type '<RobotMove-response>"
  "universal_msgs/RobotMoveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMove-response)))
  "Returns string type for a service object of type 'RobotMove-response"
  "universal_msgs/RobotMoveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotMove-response>)))
  "Returns md5sum for a message object of type '<RobotMove-response>"
  "db2af865234800bfae88ce33a9629ae1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotMove-response)))
  "Returns md5sum for a message object of type 'RobotMove-response"
  "db2af865234800bfae88ce33a9629ae1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotMove-response>)))
  "Returns full string definition for message of type '<RobotMove-response>"
  (cl:format cl:nil "bool success~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotMove-response)))
  "Returns full string definition for message of type 'RobotMove-response"
  (cl:format cl:nil "bool success~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotMove-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotMove-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotMove-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotMove)))
  'RobotMove-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotMove)))
  'RobotMove-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMove)))
  "Returns string type for a service object of type '<RobotMove>"
  "universal_msgs/RobotMove")