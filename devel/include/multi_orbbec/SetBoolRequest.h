// Generated by gencpp from file multi_orbbec/SetBoolRequest.msg
// DO NOT EDIT!


#ifndef MULTI_ORBBEC_MESSAGE_SETBOOLREQUEST_H
#define MULTI_ORBBEC_MESSAGE_SETBOOLREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace multi_orbbec
{
template <class ContainerAllocator>
struct SetBoolRequest_
{
  typedef SetBoolRequest_<ContainerAllocator> Type;

  SetBoolRequest_()
    : data(false)  {
    }
  SetBoolRequest_(const ContainerAllocator& _alloc)
    : data(false)  {
  (void)_alloc;
    }



   typedef uint8_t _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetBoolRequest_

typedef ::multi_orbbec::SetBoolRequest_<std::allocator<void> > SetBoolRequest;

typedef boost::shared_ptr< ::multi_orbbec::SetBoolRequest > SetBoolRequestPtr;
typedef boost::shared_ptr< ::multi_orbbec::SetBoolRequest const> SetBoolRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::multi_orbbec::SetBoolRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::multi_orbbec::SetBoolRequest_<ContainerAllocator1> & lhs, const ::multi_orbbec::SetBoolRequest_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::multi_orbbec::SetBoolRequest_<ContainerAllocator1> & lhs, const ::multi_orbbec::SetBoolRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace multi_orbbec

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8b94c1b53db61fb6aed406028ad6332a";
  }

  static const char* value(const ::multi_orbbec::SetBoolRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8b94c1b53db61fb6ULL;
  static const uint64_t static_value2 = 0xaed406028ad6332aULL;
};

template<class ContainerAllocator>
struct DataType< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "multi_orbbec/SetBoolRequest";
  }

  static const char* value(const ::multi_orbbec::SetBoolRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool data\n"
;
  }

  static const char* value(const ::multi_orbbec::SetBoolRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetBoolRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::multi_orbbec::SetBoolRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::multi_orbbec::SetBoolRequest_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MULTI_ORBBEC_MESSAGE_SETBOOLREQUEST_H