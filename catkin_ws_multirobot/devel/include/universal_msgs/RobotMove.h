// Generated by gencpp from file universal_msgs/RobotMove.msg
// DO NOT EDIT!


#ifndef UNIVERSAL_MSGS_MESSAGE_ROBOTMOVE_H
#define UNIVERSAL_MSGS_MESSAGE_ROBOTMOVE_H

#include <ros/service_traits.h>


#include <universal_msgs/RobotMoveRequest.h>
#include <universal_msgs/RobotMoveResponse.h>


namespace universal_msgs
{

struct RobotMove
{

typedef RobotMoveRequest Request;
typedef RobotMoveResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct RobotMove
} // namespace universal_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::universal_msgs::RobotMove > {
  static const char* value()
  {
    return "db2af865234800bfae88ce33a9629ae1";
  }

  static const char* value(const ::universal_msgs::RobotMove&) { return value(); }
};

template<>
struct DataType< ::universal_msgs::RobotMove > {
  static const char* value()
  {
    return "universal_msgs/RobotMove";
  }

  static const char* value(const ::universal_msgs::RobotMove&) { return value(); }
};


// service_traits::MD5Sum< ::universal_msgs::RobotMoveRequest> should match 
// service_traits::MD5Sum< ::universal_msgs::RobotMove > 
template<>
struct MD5Sum< ::universal_msgs::RobotMoveRequest>
{
  static const char* value()
  {
    return MD5Sum< ::universal_msgs::RobotMove >::value();
  }
  static const char* value(const ::universal_msgs::RobotMoveRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::universal_msgs::RobotMoveRequest> should match 
// service_traits::DataType< ::universal_msgs::RobotMove > 
template<>
struct DataType< ::universal_msgs::RobotMoveRequest>
{
  static const char* value()
  {
    return DataType< ::universal_msgs::RobotMove >::value();
  }
  static const char* value(const ::universal_msgs::RobotMoveRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::universal_msgs::RobotMoveResponse> should match 
// service_traits::MD5Sum< ::universal_msgs::RobotMove > 
template<>
struct MD5Sum< ::universal_msgs::RobotMoveResponse>
{
  static const char* value()
  {
    return MD5Sum< ::universal_msgs::RobotMove >::value();
  }
  static const char* value(const ::universal_msgs::RobotMoveResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::universal_msgs::RobotMoveResponse> should match 
// service_traits::DataType< ::universal_msgs::RobotMove > 
template<>
struct DataType< ::universal_msgs::RobotMoveResponse>
{
  static const char* value()
  {
    return DataType< ::universal_msgs::RobotMove >::value();
  }
  static const char* value(const ::universal_msgs::RobotMoveResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // UNIVERSAL_MSGS_MESSAGE_ROBOTMOVE_H