// Generated by gencpp from file universal_msgs/RobotMoveRequest.msg
// DO NOT EDIT!


#ifndef UNIVERSAL_MSGS_MESSAGE_ROBOTMOVEREQUEST_H
#define UNIVERSAL_MSGS_MESSAGE_ROBOTMOVEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace universal_msgs
{
template <class ContainerAllocator>
struct RobotMoveRequest_
{
  typedef RobotMoveRequest_<ContainerAllocator> Type;

  RobotMoveRequest_()
    : robot_id(0)
    , move_direction(0)
    , speed_wheel_left(0)
    , speed_wheel_right(0)
    , time_span(0)  {
    }
  RobotMoveRequest_(const ContainerAllocator& _alloc)
    : robot_id(0)
    , move_direction(0)
    , speed_wheel_left(0)
    , speed_wheel_right(0)
    , time_span(0)  {
  (void)_alloc;
    }



   typedef int32_t _robot_id_type;
  _robot_id_type robot_id;

   typedef int32_t _move_direction_type;
  _move_direction_type move_direction;

   typedef int32_t _speed_wheel_left_type;
  _speed_wheel_left_type speed_wheel_left;

   typedef int32_t _speed_wheel_right_type;
  _speed_wheel_right_type speed_wheel_right;

   typedef int32_t _time_span_type;
  _time_span_type time_span;





  typedef boost::shared_ptr< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> const> ConstPtr;

}; // struct RobotMoveRequest_

typedef ::universal_msgs::RobotMoveRequest_<std::allocator<void> > RobotMoveRequest;

typedef boost::shared_ptr< ::universal_msgs::RobotMoveRequest > RobotMoveRequestPtr;
typedef boost::shared_ptr< ::universal_msgs::RobotMoveRequest const> RobotMoveRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::universal_msgs::RobotMoveRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace universal_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c70cf81c30216c50a73059f6bd479874";
  }

  static const char* value(const ::universal_msgs::RobotMoveRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc70cf81c30216c50ULL;
  static const uint64_t static_value2 = 0xa73059f6bd479874ULL;
};

template<class ContainerAllocator>
struct DataType< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "universal_msgs/RobotMoveRequest";
  }

  static const char* value(const ::universal_msgs::RobotMoveRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
int32 robot_id\n\
int32 move_direction\n\
int32 speed_wheel_left\n\
int32 speed_wheel_right\n\
int32 time_span\n\
";
  }

  static const char* value(const ::universal_msgs::RobotMoveRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.robot_id);
      stream.next(m.move_direction);
      stream.next(m.speed_wheel_left);
      stream.next(m.speed_wheel_right);
      stream.next(m.time_span);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotMoveRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::universal_msgs::RobotMoveRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::universal_msgs::RobotMoveRequest_<ContainerAllocator>& v)
  {
    s << indent << "robot_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.robot_id);
    s << indent << "move_direction: ";
    Printer<int32_t>::stream(s, indent + "  ", v.move_direction);
    s << indent << "speed_wheel_left: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed_wheel_left);
    s << indent << "speed_wheel_right: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed_wheel_right);
    s << indent << "time_span: ";
    Printer<int32_t>::stream(s, indent + "  ", v.time_span);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UNIVERSAL_MSGS_MESSAGE_ROBOTMOVEREQUEST_H