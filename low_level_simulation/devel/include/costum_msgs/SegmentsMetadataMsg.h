// Generated by gencpp from file costum_msgs/SegmentsMetadataMsg.msg
// DO NOT EDIT!


#ifndef COSTUM_MSGS_MESSAGE_SEGMENTSMETADATAMSG_H
#define COSTUM_MSGS_MESSAGE_SEGMENTSMETADATAMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <costum_msgs/SegmentMetadataMsg.h>

namespace costum_msgs
{
template <class ContainerAllocator>
struct SegmentsMetadataMsg_
{
  typedef SegmentsMetadataMsg_<ContainerAllocator> Type;

  SegmentsMetadataMsg_()
    : segments_metadata()  {
    }
  SegmentsMetadataMsg_(const ContainerAllocator& _alloc)
    : segments_metadata(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::costum_msgs::SegmentMetadataMsg_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::costum_msgs::SegmentMetadataMsg_<ContainerAllocator> >::other >  _segments_metadata_type;
  _segments_metadata_type segments_metadata;





  typedef boost::shared_ptr< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> const> ConstPtr;

}; // struct SegmentsMetadataMsg_

typedef ::costum_msgs::SegmentsMetadataMsg_<std::allocator<void> > SegmentsMetadataMsg;

typedef boost::shared_ptr< ::costum_msgs::SegmentsMetadataMsg > SegmentsMetadataMsgPtr;
typedef boost::shared_ptr< ::costum_msgs::SegmentsMetadataMsg const> SegmentsMetadataMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace costum_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'costum_msgs': ['/home/abiantorres/Documentos/tfg/autonomous-vehicles-system-simulation/low_level_simulation/src/costum_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "67c0f52ccb2c9e99b2f0c2343335cac1";
  }

  static const char* value(const ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x67c0f52ccb2c9e99ULL;
  static const uint64_t static_value2 = 0xb2f0c2343335cac1ULL;
};

template<class ContainerAllocator>
struct DataType< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "costum_msgs/SegmentsMetadataMsg";
  }

  static const char* value(const ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "SegmentMetadataMsg[] segments_metadata\n\
\n\
================================================================================\n\
MSG: costum_msgs/SegmentMetadataMsg\n\
int64 segment_index\n\
geometry_msgs/Point initial_point\n\
geometry_msgs/Point end_point\n\
float64 distance_between_obstacles\n\
int64 segment_simulation_timeout\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.segments_metadata);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SegmentsMetadataMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::costum_msgs::SegmentsMetadataMsg_<ContainerAllocator>& v)
  {
    s << indent << "segments_metadata[]" << std::endl;
    for (size_t i = 0; i < v.segments_metadata.size(); ++i)
    {
      s << indent << "  segments_metadata[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::costum_msgs::SegmentMetadataMsg_<ContainerAllocator> >::stream(s, indent + "    ", v.segments_metadata[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // COSTUM_MSGS_MESSAGE_SEGMENTSMETADATAMSG_H
