// Auto-generated. Do not edit!

// (in-package aruco_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class aruco_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.detected = null;
      this.board_rvec = null;
      this.board_tvec = null;
      this.robot_rvec = null;
      this.robot_tvec = null;
      this.board_marker_corners = null;
      this.board_marker_ids = null;
      this.robot_marker_corners = null;
      this.robot_marker_id = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('detected')) {
        this.detected = initObj.detected
      }
      else {
        this.detected = false;
      }
      if (initObj.hasOwnProperty('board_rvec')) {
        this.board_rvec = initObj.board_rvec
      }
      else {
        this.board_rvec = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('board_tvec')) {
        this.board_tvec = initObj.board_tvec
      }
      else {
        this.board_tvec = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('robot_rvec')) {
        this.robot_rvec = initObj.robot_rvec
      }
      else {
        this.robot_rvec = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('robot_tvec')) {
        this.robot_tvec = initObj.robot_tvec
      }
      else {
        this.robot_tvec = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('board_marker_corners')) {
        this.board_marker_corners = initObj.board_marker_corners
      }
      else {
        this.board_marker_corners = [];
      }
      if (initObj.hasOwnProperty('board_marker_ids')) {
        this.board_marker_ids = initObj.board_marker_ids
      }
      else {
        this.board_marker_ids = [];
      }
      if (initObj.hasOwnProperty('robot_marker_corners')) {
        this.robot_marker_corners = initObj.robot_marker_corners
      }
      else {
        this.robot_marker_corners = new Array(4).fill(new geometry_msgs.msg.Point());
      }
      if (initObj.hasOwnProperty('robot_marker_id')) {
        this.robot_marker_id = initObj.robot_marker_id
      }
      else {
        this.robot_marker_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type aruco_info
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [detected]
    bufferOffset = _serializer.bool(obj.detected, buffer, bufferOffset);
    // Check that the constant length array field [board_rvec] has the right length
    if (obj.board_rvec.length !== 3) {
      throw new Error('Unable to serialize array field board_rvec - length must be 3')
    }
    // Serialize message field [board_rvec]
    bufferOffset = _arraySerializer.float64(obj.board_rvec, buffer, bufferOffset, 3);
    // Check that the constant length array field [board_tvec] has the right length
    if (obj.board_tvec.length !== 3) {
      throw new Error('Unable to serialize array field board_tvec - length must be 3')
    }
    // Serialize message field [board_tvec]
    bufferOffset = _arraySerializer.float64(obj.board_tvec, buffer, bufferOffset, 3);
    // Check that the constant length array field [robot_rvec] has the right length
    if (obj.robot_rvec.length !== 3) {
      throw new Error('Unable to serialize array field robot_rvec - length must be 3')
    }
    // Serialize message field [robot_rvec]
    bufferOffset = _arraySerializer.float64(obj.robot_rvec, buffer, bufferOffset, 3);
    // Check that the constant length array field [robot_tvec] has the right length
    if (obj.robot_tvec.length !== 3) {
      throw new Error('Unable to serialize array field robot_tvec - length must be 3')
    }
    // Serialize message field [robot_tvec]
    bufferOffset = _arraySerializer.float64(obj.robot_tvec, buffer, bufferOffset, 3);
    // Serialize message field [board_marker_corners]
    // Serialize the length for message field [board_marker_corners]
    bufferOffset = _serializer.uint32(obj.board_marker_corners.length, buffer, bufferOffset);
    obj.board_marker_corners.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [board_marker_ids]
    bufferOffset = _arraySerializer.int32(obj.board_marker_ids, buffer, bufferOffset, null);
    // Check that the constant length array field [robot_marker_corners] has the right length
    if (obj.robot_marker_corners.length !== 4) {
      throw new Error('Unable to serialize array field robot_marker_corners - length must be 4')
    }
    // Serialize message field [robot_marker_corners]
    obj.robot_marker_corners.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [robot_marker_id]
    bufferOffset = _serializer.int32(obj.robot_marker_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type aruco_info
    let len;
    let data = new aruco_info(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [detected]
    data.detected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [board_rvec]
    data.board_rvec = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [board_tvec]
    data.board_tvec = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [robot_rvec]
    data.robot_rvec = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [robot_tvec]
    data.robot_tvec = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [board_marker_corners]
    // Deserialize array length for message field [board_marker_corners]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.board_marker_corners = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.board_marker_corners[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [board_marker_ids]
    data.board_marker_ids = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [robot_marker_corners]
    len = 4;
    data.robot_marker_corners = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.robot_marker_corners[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [robot_marker_id]
    data.robot_marker_id = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 24 * object.board_marker_corners.length;
    length += 4 * object.board_marker_ids.length;
    return length + 205;
  }

  static datatype() {
    // Returns string type for a message object
    return 'aruco_detection/aruco_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50078c3e5ce8427d6ec48492011d9975';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new aruco_info(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.detected !== undefined) {
      resolved.detected = msg.detected;
    }
    else {
      resolved.detected = false
    }

    if (msg.board_rvec !== undefined) {
      resolved.board_rvec = msg.board_rvec;
    }
    else {
      resolved.board_rvec = new Array(3).fill(0)
    }

    if (msg.board_tvec !== undefined) {
      resolved.board_tvec = msg.board_tvec;
    }
    else {
      resolved.board_tvec = new Array(3).fill(0)
    }

    if (msg.robot_rvec !== undefined) {
      resolved.robot_rvec = msg.robot_rvec;
    }
    else {
      resolved.robot_rvec = new Array(3).fill(0)
    }

    if (msg.robot_tvec !== undefined) {
      resolved.robot_tvec = msg.robot_tvec;
    }
    else {
      resolved.robot_tvec = new Array(3).fill(0)
    }

    if (msg.board_marker_corners !== undefined) {
      resolved.board_marker_corners = new Array(msg.board_marker_corners.length);
      for (let i = 0; i < resolved.board_marker_corners.length; ++i) {
        resolved.board_marker_corners[i] = geometry_msgs.msg.Point.Resolve(msg.board_marker_corners[i]);
      }
    }
    else {
      resolved.board_marker_corners = []
    }

    if (msg.board_marker_ids !== undefined) {
      resolved.board_marker_ids = msg.board_marker_ids;
    }
    else {
      resolved.board_marker_ids = []
    }

    if (msg.robot_marker_corners !== undefined) {
      resolved.robot_marker_corners = new Array(4)
      for (let i = 0; i < resolved.robot_marker_corners.length; ++i) {
        if (msg.robot_marker_corners.length > i) {
          resolved.robot_marker_corners[i] = geometry_msgs.msg.Point.Resolve(msg.robot_marker_corners[i]);
        }
        else {
          resolved.robot_marker_corners[i] = new geometry_msgs.msg.Point();
        }
      }
    }
    else {
      resolved.robot_marker_corners = new Array(4).fill(new geometry_msgs.msg.Point())
    }

    if (msg.robot_marker_id !== undefined) {
      resolved.robot_marker_id = msg.robot_marker_id;
    }
    else {
      resolved.robot_marker_id = 0
    }

    return resolved;
    }
};

module.exports = aruco_info;
