// Generated by gencpp from file rosapi/GetActionServersRequest.msg
// DO NOT EDIT!


#ifndef ROSAPI_MESSAGE_GETACTIONSERVERSREQUEST_H
#define ROSAPI_MESSAGE_GETACTIONSERVERSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rosapi
{
template <class ContainerAllocator>
struct GetActionServersRequest_
{
  typedef GetActionServersRequest_<ContainerAllocator> Type;

  GetActionServersRequest_()
    {
    }
  GetActionServersRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::rosapi::GetActionServersRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rosapi::GetActionServersRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetActionServersRequest_

typedef ::rosapi::GetActionServersRequest_<std::allocator<void> > GetActionServersRequest;

typedef boost::shared_ptr< ::rosapi::GetActionServersRequest > GetActionServersRequestPtr;
typedef boost::shared_ptr< ::rosapi::GetActionServersRequest const> GetActionServersRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rosapi::GetActionServersRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rosapi::GetActionServersRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace rosapi

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'rosapi': ['/home/parallels/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/rosapi/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rosapi::GetActionServersRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rosapi::GetActionServersRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rosapi::GetActionServersRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::rosapi::GetActionServersRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rosapi/GetActionServersRequest";
  }

  static const char* value(const ::rosapi::GetActionServersRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::rosapi::GetActionServersRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetActionServersRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rosapi::GetActionServersRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::rosapi::GetActionServersRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // ROSAPI_MESSAGE_GETACTIONSERVERSREQUEST_H
