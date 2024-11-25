// Generated by gencpp from file multi_orbbec/GetStringResponse.msg
// DO NOT EDIT!


#ifndef MULTI_ORBBEC_MESSAGE_GETSTRINGRESPONSE_H
#define MULTI_ORBBEC_MESSAGE_GETSTRINGRESPONSE_H


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
struct GetStringResponse_
{
  typedef GetStringResponse_<ContainerAllocator> Type;

  GetStringResponse_()
    : data()
    , success(false)
    , message()  {
    }
  GetStringResponse_(const ContainerAllocator& _alloc)
    : data(_alloc)
    , success(false)
    , message(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _data_type;
  _data_type data;

   typedef uint8_t _success_type;
  _success_type success;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _message_type;
  _message_type message;





  typedef boost::shared_ptr< ::multi_orbbec::GetStringResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::multi_orbbec::GetStringResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetStringResponse_

typedef ::multi_orbbec::GetStringResponse_<std::allocator<void> > GetStringResponse;

typedef boost::shared_ptr< ::multi_orbbec::GetStringResponse > GetStringResponsePtr;
typedef boost::shared_ptr< ::multi_orbbec::GetStringResponse const> GetStringResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::multi_orbbec::GetStringResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::multi_orbbec::GetStringResponse_<ContainerAllocator1> & lhs, const ::multi_orbbec::GetStringResponse_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data &&
    lhs.success == rhs.success &&
    lhs.message == rhs.message;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::multi_orbbec::GetStringResponse_<ContainerAllocator1> & lhs, const ::multi_orbbec::GetStringResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace multi_orbbec

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::multi_orbbec::GetStringResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::multi_orbbec::GetStringResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::multi_orbbec::GetStringResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "15baad3d82a7b70bfc4eb31d66322293";
  }

  static const char* value(const ::multi_orbbec::GetStringResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x15baad3d82a7b70bULL;
  static const uint64_t static_value2 = 0xfc4eb31d66322293ULL;
};

template<class ContainerAllocator>
struct DataType< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "multi_orbbec/GetStringResponse";
  }

  static const char* value(const ::multi_orbbec::GetStringResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string data\n"
"bool success\n"
"string message\n"
"\n"
;
  }

  static const char* value(const ::multi_orbbec::GetStringResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
      stream.next(m.success);
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetStringResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::multi_orbbec::GetStringResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::multi_orbbec::GetStringResponse_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.data);
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MULTI_ORBBEC_MESSAGE_GETSTRINGRESPONSE_H