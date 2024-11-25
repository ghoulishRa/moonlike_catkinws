// Generated by gencpp from file multi_orbbec/SetBool.msg
// DO NOT EDIT!


#ifndef MULTI_ORBBEC_MESSAGE_SETBOOL_H
#define MULTI_ORBBEC_MESSAGE_SETBOOL_H

#include <ros/service_traits.h>


#include <multi_orbbec/SetBoolRequest.h>
#include <multi_orbbec/SetBoolResponse.h>


namespace multi_orbbec
{

struct SetBool
{

typedef SetBoolRequest Request;
typedef SetBoolResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetBool
} // namespace multi_orbbec


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::multi_orbbec::SetBool > {
  static const char* value()
  {
    return "09fb03525b03e7ea1fd3992bafd87e16";
  }

  static const char* value(const ::multi_orbbec::SetBool&) { return value(); }
};

template<>
struct DataType< ::multi_orbbec::SetBool > {
  static const char* value()
  {
    return "multi_orbbec/SetBool";
  }

  static const char* value(const ::multi_orbbec::SetBool&) { return value(); }
};


// service_traits::MD5Sum< ::multi_orbbec::SetBoolRequest> should match
// service_traits::MD5Sum< ::multi_orbbec::SetBool >
template<>
struct MD5Sum< ::multi_orbbec::SetBoolRequest>
{
  static const char* value()
  {
    return MD5Sum< ::multi_orbbec::SetBool >::value();
  }
  static const char* value(const ::multi_orbbec::SetBoolRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_orbbec::SetBoolRequest> should match
// service_traits::DataType< ::multi_orbbec::SetBool >
template<>
struct DataType< ::multi_orbbec::SetBoolRequest>
{
  static const char* value()
  {
    return DataType< ::multi_orbbec::SetBool >::value();
  }
  static const char* value(const ::multi_orbbec::SetBoolRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::multi_orbbec::SetBoolResponse> should match
// service_traits::MD5Sum< ::multi_orbbec::SetBool >
template<>
struct MD5Sum< ::multi_orbbec::SetBoolResponse>
{
  static const char* value()
  {
    return MD5Sum< ::multi_orbbec::SetBool >::value();
  }
  static const char* value(const ::multi_orbbec::SetBoolResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::multi_orbbec::SetBoolResponse> should match
// service_traits::DataType< ::multi_orbbec::SetBool >
template<>
struct DataType< ::multi_orbbec::SetBoolResponse>
{
  static const char* value()
  {
    return DataType< ::multi_orbbec::SetBool >::value();
  }
  static const char* value(const ::multi_orbbec::SetBoolResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MULTI_ORBBEC_MESSAGE_SETBOOL_H