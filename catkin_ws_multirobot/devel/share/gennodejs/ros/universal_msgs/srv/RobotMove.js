// Auto-generated. Do not edit!

// (in-package universal_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RobotMoveRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_id = null;
      this.move_direction = null;
      this.speed_wheel_left = null;
      this.speed_wheel_right = null;
      this.time_span = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_id')) {
        this.robot_id = initObj.robot_id
      }
      else {
        this.robot_id = 0;
      }
      if (initObj.hasOwnProperty('move_direction')) {
        this.move_direction = initObj.move_direction
      }
      else {
        this.move_direction = 0;
      }
      if (initObj.hasOwnProperty('speed_wheel_left')) {
        this.speed_wheel_left = initObj.speed_wheel_left
      }
      else {
        this.speed_wheel_left = 0;
      }
      if (initObj.hasOwnProperty('speed_wheel_right')) {
        this.speed_wheel_right = initObj.speed_wheel_right
      }
      else {
        this.speed_wheel_right = 0;
      }
      if (initObj.hasOwnProperty('time_span')) {
        this.time_span = initObj.time_span
      }
      else {
        this.time_span = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotMoveRequest
    // Serialize message field [robot_id]
    bufferOffset = _serializer.int32(obj.robot_id, buffer, bufferOffset);
    // Serialize message field [move_direction]
    bufferOffset = _serializer.int32(obj.move_direction, buffer, bufferOffset);
    // Serialize message field [speed_wheel_left]
    bufferOffset = _serializer.int32(obj.speed_wheel_left, buffer, bufferOffset);
    // Serialize message field [speed_wheel_right]
    bufferOffset = _serializer.int32(obj.speed_wheel_right, buffer, bufferOffset);
    // Serialize message field [time_span]
    bufferOffset = _serializer.int32(obj.time_span, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotMoveRequest
    let len;
    let data = new RobotMoveRequest(null);
    // Deserialize message field [robot_id]
    data.robot_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [move_direction]
    data.move_direction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [speed_wheel_left]
    data.speed_wheel_left = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [speed_wheel_right]
    data.speed_wheel_right = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [time_span]
    data.time_span = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'universal_msgs/RobotMoveRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c70cf81c30216c50a73059f6bd479874';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    int32 robot_id
    int32 move_direction
    int32 speed_wheel_left
    int32 speed_wheel_right
    int32 time_span
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotMoveRequest(null);
    if (msg.robot_id !== undefined) {
      resolved.robot_id = msg.robot_id;
    }
    else {
      resolved.robot_id = 0
    }

    if (msg.move_direction !== undefined) {
      resolved.move_direction = msg.move_direction;
    }
    else {
      resolved.move_direction = 0
    }

    if (msg.speed_wheel_left !== undefined) {
      resolved.speed_wheel_left = msg.speed_wheel_left;
    }
    else {
      resolved.speed_wheel_left = 0
    }

    if (msg.speed_wheel_right !== undefined) {
      resolved.speed_wheel_right = msg.speed_wheel_right;
    }
    else {
      resolved.speed_wheel_right = 0
    }

    if (msg.time_span !== undefined) {
      resolved.time_span = msg.time_span;
    }
    else {
      resolved.time_span = 0
    }

    return resolved;
    }
};

class RobotMoveResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotMoveResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotMoveResponse
    let len;
    let data = new RobotMoveResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'universal_msgs/RobotMoveResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotMoveResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: RobotMoveRequest,
  Response: RobotMoveResponse,
  md5sum() { return 'db2af865234800bfae88ce33a9629ae1'; },
  datatype() { return 'universal_msgs/RobotMove'; }
};
