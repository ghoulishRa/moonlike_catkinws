// Generated by gencpp from file multi_launch/SetInt32.msg
// DO NOT EDIT!


#ifndef MULTI_LAUNCH_MESSAGE_SETINT32_H
#define MULTI_LAUNCH_MESSAGE_SETINT32_H

#include <ros/service_traits.h>


#include <multi_launch/SetInt32Request.h>
#include <multi_launch/SetInt32Response.h>


namespace multi_launch
{

struct SetInt32
{

typedef SetInt32Request Request;
typedef SetInt32Response Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetInt32
} // namespace multi_launch


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::multi_launch::SetInt32 > {
  static const char* value()
  {
    return "41a6318c88ca9d75d7a585e2aa4ca6ea";
  }

  static const char* value(const ::multi_launch::SetInt32&) { return value(); }
};

template<>
struct DataType< ::multi_launch::SetInt32 > {
  static const char* value()
  {
    return "multi_launch/SetInt32";
  }

  static const char* value(const ::multi_launch::SetInt32&) { return value(); }
};


// service_traits::MD5Sum< ::multi_launch::SetInt32Request> should match
// service_traits::MD5Sum< ::multi_launch::SetInt32 >
template<>
struct MD5Sum< ::multi_launch::SetInt32Request>
{
  static const char* value()
  {
    return MD5Sum< ::multi_launch::SetInt32 >::value();
  }
  static const char* value(const ::multi_launch::SetInt32Request&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_launch::SetInt32Request> should match
// service_traits::DataType< ::multi_launch::SetInt32 >
template<>
struct DataType< ::multi_launch::SetInt32Request>
{
  static const char* value()
  {
    return DataType< ::multi_launch::SetInt32 >::value();
  }
  static const char* value(const ::multi_launch::SetInt32Request&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::multi_launch::SetInt32Response> should match
// service_traits::MD5Sum< ::multi_launch::SetInt32 >
template<>
struct MD5Sum< ::multi_launch::SetInt32Response>
{
  static const char* value()
  {
    return MD5Sum< ::multi_launch::SetInt32 >::value();
  }
  static const char* value(const ::multi_launch::SetInt32Response&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_launch::SetInt32Response> should match
// service_traits::DataType< ::multi_launch::SetInt32 >
template<>
struct DataType< ::multi_launch::SetInt32Response>
{
  static const char* value()
  {
    return DataType< ::multi_launch::SetInt32 >::value();
  }
  static const char* value(const ::multi_launch::SetInt32Response&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MULTI_LAUNCH_MESSAGE_SETINT32_H