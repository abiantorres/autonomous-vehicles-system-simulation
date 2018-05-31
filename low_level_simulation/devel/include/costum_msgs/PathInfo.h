// Generated by gencpp from file costum_msgs/PathInfo.msg
// DO NOT EDIT!


#ifndef COSTUM_MSGS_MESSAGE_PATHINFO_H
#define COSTUM_MSGS_MESSAGE_PATHINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <costum_msgs/GoalInfo.h>

namespace costum_msgs
{
template <class ContainerAllocator>
struct PathInfo_
{
  typedef PathInfo_<ContainerAllocator> Type;

  PathInfo_()
    : plan_file()
    , date()
    , simulations(0)
    , global_time_average(0.0)
    , global_distance_average(0.0)
    , global_velocity_average(0.0)
    , global_linear_velocity_average(0.0)
    , global_maximum_linear_velocity(0.0)
    , global_failures(0)
    , global_planner()
    , local_planner()
    , sections()  {
    }
  PathInfo_(const ContainerAllocator& _alloc)
    : plan_file(_alloc)
    , date(_alloc)
    , simulations(0)
    , global_time_average(0.0)
    , global_distance_average(0.0)
    , global_velocity_average(0.0)
    , global_linear_velocity_average(0.0)
    , global_maximum_linear_velocity(0.0)
    , global_failures(0)
    , global_planner(_alloc)
    , local_planner(_alloc)
    , sections(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _plan_file_type;
  _plan_file_type plan_file;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _date_type;
  _date_type date;

   typedef int16_t _simulations_type;
  _simulations_type simulations;

   typedef double _global_time_average_type;
  _global_time_average_type global_time_average;

   typedef double _global_distance_average_type;
  _global_distance_average_type global_distance_average;

   typedef double _global_velocity_average_type;
  _global_velocity_average_type global_velocity_average;

   typedef double _global_linear_velocity_average_type;
  _global_linear_velocity_average_type global_linear_velocity_average;

   typedef double _global_maximum_linear_velocity_type;
  _global_maximum_linear_velocity_type global_maximum_linear_velocity;

   typedef int16_t _global_failures_type;
  _global_failures_type global_failures;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _global_planner_type;
  _global_planner_type global_planner;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _local_planner_type;
  _local_planner_type local_planner;

   typedef std::vector< ::costum_msgs::GoalInfo_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::costum_msgs::GoalInfo_<ContainerAllocator> >::other >  _sections_type;
  _sections_type sections;





  typedef boost::shared_ptr< ::costum_msgs::PathInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::costum_msgs::PathInfo_<ContainerAllocator> const> ConstPtr;

}; // struct PathInfo_

typedef ::costum_msgs::PathInfo_<std::allocator<void> > PathInfo;

typedef boost::shared_ptr< ::costum_msgs::PathInfo > PathInfoPtr;
typedef boost::shared_ptr< ::costum_msgs::PathInfo const> PathInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::costum_msgs::PathInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::costum_msgs::PathInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace costum_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'costum_msgs': ['/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::costum_msgs::PathInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::costum_msgs::PathInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::costum_msgs::PathInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::costum_msgs::PathInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::costum_msgs::PathInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::costum_msgs::PathInfo_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::costum_msgs::PathInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dbed994a4e6abf4aa6e4560c3e7dbb88";
  }

  static const char* value(const ::costum_msgs::PathInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdbed994a4e6abf4aULL;
  static const uint64_t static_value2 = 0xa6e4560c3e7dbb88ULL;
};

template<class ContainerAllocator>
struct DataType< ::costum_msgs::PathInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "costum_msgs/PathInfo";
  }

  static const char* value(const ::costum_msgs::PathInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::costum_msgs::PathInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string plan_file\n\
string date\n\
int16 simulations\n\
float64 global_time_average\n\
float64 global_distance_average\n\
float64 global_velocity_average\n\
float64 global_linear_velocity_average\n\
float64 global_maximum_linear_velocity\n\
int16 global_failures\n\
string global_planner\n\
string local_planner\n\
GoalInfo[] sections\n\
================================================================================\n\
MSG: costum_msgs/GoalInfo\n\
string id\n\
float64 time_average\n\
float64 time_standard_deviation\n\
float64 distance_average\n\
float64 velocity_average\n\
float64 linear_velocity_average\n\
float64 maximum_linear_velocity\n\
float64 density\n\
float64 max_obstacle_shiftment\n\
float64 obstacle_length\n\
int16 failures\n\
";
  }

  static const char* value(const ::costum_msgs::PathInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::costum_msgs::PathInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.plan_file);
      stream.next(m.date);
      stream.next(m.simulations);
      stream.next(m.global_time_average);
      stream.next(m.global_distance_average);
      stream.next(m.global_velocity_average);
      stream.next(m.global_linear_velocity_average);
      stream.next(m.global_maximum_linear_velocity);
      stream.next(m.global_failures);
      stream.next(m.global_planner);
      stream.next(m.local_planner);
      stream.next(m.sections);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PathInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::costum_msgs::PathInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::costum_msgs::PathInfo_<ContainerAllocator>& v)
  {
    s << indent << "plan_file: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.plan_file);
    s << indent << "date: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.date);
    s << indent << "simulations: ";
    Printer<int16_t>::stream(s, indent + "  ", v.simulations);
    s << indent << "global_time_average: ";
    Printer<double>::stream(s, indent + "  ", v.global_time_average);
    s << indent << "global_distance_average: ";
    Printer<double>::stream(s, indent + "  ", v.global_distance_average);
    s << indent << "global_velocity_average: ";
    Printer<double>::stream(s, indent + "  ", v.global_velocity_average);
    s << indent << "global_linear_velocity_average: ";
    Printer<double>::stream(s, indent + "  ", v.global_linear_velocity_average);
    s << indent << "global_maximum_linear_velocity: ";
    Printer<double>::stream(s, indent + "  ", v.global_maximum_linear_velocity);
    s << indent << "global_failures: ";
    Printer<int16_t>::stream(s, indent + "  ", v.global_failures);
    s << indent << "global_planner: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.global_planner);
    s << indent << "local_planner: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.local_planner);
    s << indent << "sections[]" << std::endl;
    for (size_t i = 0; i < v.sections.size(); ++i)
    {
      s << indent << "  sections[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::costum_msgs::GoalInfo_<ContainerAllocator> >::stream(s, indent + "    ", v.sections[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // COSTUM_MSGS_MESSAGE_PATHINFO_H
